"""ReadyStack NetBox WSGI entry point: NetBox's own application, with its static files served by WhiteNoise.

NetBox does not serve /static/ itself when DEBUG is off; upstream's deployments put a web server in front (nginx,
or NGINX Unit in netbox-docker). This image is one container, so gunicorn would answer every /static/ request with
404 and a browser would land on NetBox's "Static Media Failure" page (held chain 545, 2026-10-13). WhiteNoise serves
the files collectstatic put in STATIC_ROOT at build time, under STATIC_URL (which follows BASE_PATH), with their
content types and cache headers; every other request goes to NetBox unchanged.
"""
from django.conf import settings

from netbox.wsgi import application as netbox_application
from whitenoise import WhiteNoise

application = WhiteNoise(netbox_application, root=settings.STATIC_ROOT, prefix=settings.STATIC_URL)
