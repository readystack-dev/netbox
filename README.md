# NetBox: ReadyStack build kit

The offline build kit for the Docker image `readystack/netbox:v4.7.4-CE-ubuntu24.04-r5`. It holds what the image is built from (upstream source, base images, toolchain, pinned dependencies) and the documents, so the image can be rebuilt with no network access (`docker build --network=none`).

- Release: [v4.7.4-CE-ubuntu24.04-r5](https://github.com/readystack-dev/netbox/releases/tag/v4.7.4-CE-ubuntu24.04-r5)
- Image: [`docker.io/readystack/netbox:v4.7.4-CE-ubuntu24.04-r5`](https://hub.docker.com/r/readystack/netbox/tags), manifest digest `sha256:e7cebf0061e802ca26618a5d3b17b0139d97e519ec0dfc3a9954fe3aa99dd38d`
- Product page: https://readystack.dev/products/netbox
- Defects: this repository's Issues (defects recorded from 25 November 2026 on) and https://readystack.dev/defects.html?product=netbox

NetBox is distributed under its upstream licence (Apache-2.0); the kit contains upstream's source under that licence, and each vendored component under its own.

## Download

From the [v4.7.4-CE-ubuntu24.04-r5 release](https://github.com/readystack-dev/netbox/releases/tag/v4.7.4-CE-ubuntu24.04-r5): `ReadyStack-netbox-v4.7.4-CE-ubuntu24.04-r5.tar.gz` (676.0 MB), SHA-256 `9bf7618e41ccddf78f91f6b39cf899f99b22da0d49fcc12d724a0a95a1c74e6b`.

```sh
sha256sum --check --ignore-missing SHA256SUMS
```

## Verify and rebuild

The rebuild statement is signed with the ReadyStack release key. Check the signature before you rely on it:

```sh
cosign verify-blob --key https://readystack.dev/keys/cosign.pub \
  --bundle ReadyStack-netbox-v4.7.4-CE-ubuntu24.04-r5.rebuild.json.sigstore ReadyStack-netbox-v4.7.4-CE-ubuntu24.04-r5.rebuild.json
```

Unpack with `-p` so file modes are kept, then follow the kit's own README.md and docs/REBUILD.md:

```sh
tar -xpzf ReadyStack-netbox-v4.7.4-CE-ubuntu24.04-r5.tar.gz
cd v4.7.4-CE-ubuntu24.04-r5
less README.md docs/REBUILD.md
```

The build trail (`ReadyStack-netbox-v4.7.4-CE-ubuntu24.04-r5.trail.json`, signed the same way, and its Markdown copy) records how this release was built and checked.

## This repository

`recipe/` holds the kit's recipe files (Dockerfiles, build scripts, pins) as published at https://readystack.dev/products/netbox/recipe. The complete kit is the release download. Each release is a tag here.
