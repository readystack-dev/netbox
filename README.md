[![ReadyStack](https://readystack.dev/logo.svg)](https://readystack.dev)

**Stable, Open-source Releases, Automated** · [readystack.dev](https://readystack.dev)

[![Docker Hub](https://img.shields.io/badge/Docker%20Hub-readystack%2Fnetbox-2496ED?logo=docker&logoColor=white)](https://hub.docker.com/r/readystack/netbox) [![Docker pulls](https://img.shields.io/docker/pulls/readystack/netbox)](https://hub.docker.com/r/readystack/netbox) [![Grade at release](https://img.shields.io/badge/grade%20at%20release-A%20%2894%25%29-2ea44f)](https://readystack.dev/products/netbox) [![Signed: cosign](https://img.shields.io/badge/signed-cosign-2ea44f)](https://readystack.dev/keys/cosign.pub) ![SBOM: SPDX](https://img.shields.io/badge/SBOM-SPDX-2ea44f) ![Provenance: SLSA v1](https://img.shields.io/badge/provenance-SLSA%20v1-2ea44f) ![Offline rebuild: verified](https://img.shields.io/badge/offline%20rebuild-verified-2ea44f)

# NetBox: ReadyStack build kit

The offline build kit for the Docker image `readystack/netbox:v4.7.4-CE-ubuntu24.04-r6`. It holds what the image is built from (upstream source, base images, toolchain, pinned dependencies) and the documents, so the image can be rebuilt with no network access (`docker build --network=none`).

- Release: [v4.7.4-CE-ubuntu24.04-r6](https://github.com/readystack-dev/netbox/releases/tag/v4.7.4-CE-ubuntu24.04-r6)
- Image: [`docker.io/readystack/netbox:v4.7.4-CE-ubuntu24.04-r6`](https://hub.docker.com/r/readystack/netbox/tags), manifest digest `sha256:055a7bfb0d5e5180f0d776dd796b2bff0619a866ee345a7e5d4d4b02e84b7dd9`
- Product page: https://readystack.dev/products/netbox
- Source and build recipe: https://readystack.dev/products/netbox/recipe
- Build trail: https://readystack.dev/products/netbox/trail/v4.7.4-CE-ubuntu24.04-r6
- Defects: this repository's Issues (defects recorded from 25 November 2026 on) and https://readystack.dev/defects.html?product=netbox

## The image

ONE product container (supervisord runs the gunicorn web server [:8080] + an RQ worker, which also runs NetBox's scheduled system jobs such as daily housekeeping) PLUS two required datastore sidecars the customer provides: a PostgreSQL server (15 or later — NetBox 4.7 drops PostgreSQL 14 support and needs the trusted `ltree` extension, installed automatically on first migrate) and a Redis instance (6.0 or later; used for both the task queue and caching). NOT a single self-contained image — NetBox is multi-service.

## Who uses NetBox and why

Network engineers and data centre operators who need an accurate record of their network infrastructure.

NetBox is a source of truth for network infrastructure. It models sites, racks, devices, cables, IP addresses, VLANs and circuits, and makes that data available through APIs to automation and monitoring tools.

A typical use: A network team tracks IP addresses in a spreadsheet and rack layouts in diagrams that drift out of date. In NetBox they record every site, rack, device, cable and prefix in one place, and their automation scripts read the intended state through the API instead of guessing it.

From the upstream project's own description: https://github.com/netbox-community/netbox, https://netboxlabs.com/docs/netbox/.

## This release

- Docker Scout policy grade at release: **A** (94%), graded 2026-11-28 with `docker scout policy` (CLI 1.26.0, docker-default configuration).
  - Docker Scout counts 48 packages with copyleft licences (GPL, LGPL, MPL), 44 of them operating-system packages (it counts only packages whose licence it can read; the SBOM lists every component).
- Signed with ReadyStack's release key (fingerprint `04daa92344a52dbc`): https://readystack.dev/keys/cosign.pub.
- Runs as a non-root user (`netbox`).
- Attestations on the image: an SPDX SBOM and SLSA provenance v1.
- Rebuilt from this kit with network egress blocked on 2026-11-28; the rebuilt image digest is the published one.
- Base: Ubuntu 24.04.

The current grade, measured again every day, is on https://readystack.dev/products/netbox.

NetBox is distributed under its upstream licence (Apache-2.0); the kit contains upstream's source under that licence, and each vendored component under its own.

## Download

From the [v4.7.4-CE-ubuntu24.04-r6 release](https://github.com/readystack-dev/netbox/releases/tag/v4.7.4-CE-ubuntu24.04-r6): `ReadyStack-netbox-v4.7.4-CE-ubuntu24.04-r6.tar.gz` (676.1 MB), SHA-256 `d7850eac1461db4fd6d3a0dcc89170813876f56dfd5aee92c240e1c631751d9b`.

```sh
sha256sum --check --ignore-missing SHA256SUMS
```

## Verify and rebuild

The rebuild statement is signed with the ReadyStack release key. Check the signature before you rely on it:

```sh
cosign verify-blob --key https://readystack.dev/keys/cosign.pub \
  --bundle ReadyStack-netbox-v4.7.4-CE-ubuntu24.04-r6.rebuild.json.sigstore ReadyStack-netbox-v4.7.4-CE-ubuntu24.04-r6.rebuild.json
```

Unpack with `-p` so file modes are kept, then follow the kit's own README.md and docs/REBUILD.md:

```sh
tar -xpzf ReadyStack-netbox-v4.7.4-CE-ubuntu24.04-r6.tar.gz
cd v4.7.4-CE-ubuntu24.04-r6
less README.md docs/REBUILD.md
```

The build trail (`ReadyStack-netbox-v4.7.4-CE-ubuntu24.04-r6.trail.json`, signed the same way, and its Markdown copy) records how this release was built and checked.

## This repository

`recipe/` holds the kit's recipe files (Dockerfiles, build scripts, pins) as published at https://readystack.dev/products/netbox/recipe. The complete kit is the release download. Each release is a tag here. How to report a vulnerability: [SECURITY.md](SECURITY.md).

## About ReadyStack

**Stable, Open-source Releases, Automated.** ReadyStack releases popular open-source apps every week with every available critical and high security fix applied, plus full documentation, reference data, tests and a build recipe that recreates each release bit-for-bit. Each release is rebuilt from its pinned inputs with the network off, checked against its published digest, signed, and scanned and graded again every day. The images and build kits are free, and ReadyStack is soon to be a nonprofit.

[readystack.dev](https://readystack.dev) · [All products](https://readystack.dev/products.html) · [Build kits on GitHub](https://github.com/readystack-dev) · [Defect log](https://readystack.dev/defects.html) · contact@readystack.dev

— ReadyStack · https://readystack.dev
