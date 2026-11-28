# NetBox v4.7.4 — ReadyStack release `v4.7.4-CE-ubuntu24.04-r6`

Generated 2026-11-28 from this release's build records and strategy. Statements that come from a single record name it in brackets; the others come from this release's strategy and build log.

## Release

- **Image:** `readystack/netbox:v4.7.4-CE-ubuntu24.04-r6` (linux/amd64). Index digest `sha256:65cfe8ec9541d9e0b2b609148eca7733214a650f767590a8186fc18584e0a080` [`docs/provenance/LOCKED_DIGEST.txt`].
- **Image manifest digest:** `sha256:055a7bfb0d5e5180f0d776dd796b2bff0619a866ee345a7e5d4d4b02e84b7dd9` [`TARGET_DIGEST.txt`].
- **Upstream:** NetBox v4.7.4 built from source at `v4.7.4` of https://github.com/netbox-community/netbox — upstream notes: https://github.com/netbox-community/netbox/releases/tag/v4.7.4 [`docs/provenance/BUILD_RECIPE.json`].
- **Base image:** none (`FROM scratch`): a chiselled Ubuntu 24.04 runtime, the files Canonical's chisel cut from Ubuntu's own packages (`vendored/chisel/slices.txt`, `vendored/chisel/packages.tsv`); runtime user `netbox`.
- **Build:** `source-rebuild-python`, compiled offline with `--network=none`.
- **Supersedes:** ReadyStack release `v4.7.4-CE-ubuntu24.04-r5`.

## What changed in this release

- Upstream version unchanged (v4.7.4); ReadyStack rebuild.
- NetBox v4.7.4 is unchanged from the release this supersedes (v4.7.4-CE-ubuntu24.04-r5); this release rebuilds it. Changes: libexpat1 moves from 2.6.1-2ubuntu0.6 to 2.6.1-2ubuntu0.7 (USN-9196-1). Settings, ports and data volumes are those of v4.7.4-CE-ubuntu24.04-r5: replace the container with this image on the same volumes.

## Security status at release (measured 2026-11-27)

- **Docker Scout:** 0 fixable critical/high vulnerabilities; runs as `netbox` (non-root); SBOM + provenance attestations present (SPDX SBOM + SLSA v1) [`docs/provenance/SCOUT_VERDICT.json`].
- **OSV cross-check:** no fixable critical/high vulnerability beyond Docker Scout's findings.
- **Signature:** cosign signature verified by ReadyStack's release gate before publishing; check it yourself with `cosign verify --key https://readystack.dev/keys/cosign.pub readystack/netbox:v4.7.4-CE-ubuntu24.04-r6` (signatures are recorded in the public Sigstore transparency log).
- **ReadyStack release check at release:** passed (ReadyStack's own test, not a Docker Scout grade). Vulnerabilities are disclosed every day and the image never changes, so it is re-checked daily, beside Docker Scout's own dated grade, at https://readystack.dev/queue.

## Reproducibility

Rebuilds offline from this archive to the identical image digest `sha256:055a7bfb0d5e5180f0d776dd796b2bff0619a866ee345a7e5d4d4b02e84b7dd9`: run `./BUILD_OFFLINE.sh`, then `./VERIFY_OFFLINE.sh` (add `--online` to confirm the Docker Hub tag holds the same digest). Before publishing, ReadyStack rebuilt the kit with `./BUILD_OFFLINE.sh` and compared the result with the published digest [`docs/provenance/REPRO_VERIFICATION.json`], then ran `./BUILD_OFFLINE.sh` and `./VERIFY_OFFLINE.sh` from this archive (without `--online`).

## Validation

- 4 of 4 use cases passed (4 authored) against the running image [`docs/validation/test-results.json`].

## Known issues

- None found (reviewed by held semantic review (Claude) on 2026-11-28).

## Verify this archive

```
sha256sum -c CHECKSUMS.sha256
./BUILD_OFFLINE.sh && ./VERIFY_OFFLINE.sh --online
cosign verify --key https://readystack.dev/keys/cosign.pub readystack/netbox:v4.7.4-CE-ubuntu24.04-r6
```

ReadyStack records every signature in the public Sigstore transparency log (Rekor), so the command needs no extra flags.

