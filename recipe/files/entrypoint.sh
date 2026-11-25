#!/bin/bash
set -e
cd /opt/netbox/netbox
# Wait for PostgreSQL and Redis, but not forever, and show why (audit 2026-09-30: an unbounded
# `until showmigrations` loop printed "waiting for postgres..." for ever when the real problem was a
# short SECRET_KEY or a wrong DB_PASSWORD). Settings errors fail at once; DB_WAIT_TIMEOUT (seconds,
# default 120) bounds the wait for the servers.
limit="${DB_WAIT_TIMEOUT:-120}"; start=$(date +%s)
until err=$(python manage.py showmigrations 2>&1 >/dev/null); do
  if printf '%s' "$err" | grep -q 'ImproperlyConfigured'; then
    printf '%s\n' "$err" | sed -n '/ImproperlyConfigured/,$p' >&2; exit 1
  fi
  if [ $(( $(date +%s) - start )) -ge "$limit" ]; then
    printf '%s\n' "$err" | tail -3 >&2
    echo "netbox: PostgreSQL at ${DB_HOST:-localhost} was not usable after ${limit}s; giving up (see the error above)." >&2; exit 1
  fi
  echo "waiting for postgres... ($(printf '%s' "$err" | tail -1 | cut -c1-160))"
  sleep 2
done
start=$(date +%s)
until err=$(python -c "import redis,os;redis.Redis(host=os.environ.get('REDIS_HOST','localhost'),port=int(os.environ.get('REDIS_PORT','6379')),password=os.environ.get('REDIS_PASSWORD') or None).ping()" 2>&1); do
  if [ $(( $(date +%s) - start )) -ge "$limit" ]; then
    printf '%s\n' "$err" | tail -1 >&2
    echo "netbox: Redis at ${REDIS_HOST:-localhost}:${REDIS_PORT:-6379} was not usable after ${limit}s; giving up." >&2; exit 1
  fi
  echo "waiting for redis... ($(printf '%s' "$err" | tail -1 | cut -c1-160))"
  sleep 2
done
# idempotent first-boot init
python manage.py migrate --no-input
python manage.py trace_paths --no-input || true
python manage.py remove_stale_contenttypes --no-input || true
python manage.py clearsessions || true
python manage.py reindex --lazy || true
# non-interactive superuser bootstrap (idempotent; needs SUPERUSER_PASSWORD)
python manage.py shell --interface python < /opt/netbox/super_user.py || true
exec supervisord -c /etc/supervisor/netbox.conf -n
