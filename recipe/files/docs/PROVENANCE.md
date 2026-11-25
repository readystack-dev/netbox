# Provenance — NetBox (`v4.7.4-CE-ubuntu24.04-r5`)

Every item below is copied from a record in this archive; the record is named in brackets.

## Source

- Upstream repository: https://github.com/netbox-community/netbox
- Revision built: `v4.7.4` (commit `9b9844bdbc226bc0bacff6bfdf65a824a4be0eec`)
- Source tree: `3933fbb22c56782410a06d9ce82cd1c7445aea3db4c3c7ee1ebb0baade1d5e15` over 2306 files [`docs/provenance/SOURCE_TREE_HASH.json`]
- Community Edition only: enterprise code is removed or refused before the build (CE audit at acquire).

## Build

- Method: `source-rebuild-python`; base image `scratch + a chiselled Ubuntu 24.04 runtime (vendored/chisel/slices.txt, packages.tsv)`
- Compiled with `--network=none` from vendored source, dependencies and base images; BuildKit pinned to `moby/buildkit:v0.31.2` (shipped in `toolchain/`).
- SOURCE_DATE_EPOCH: `1795404129` [`SOURCE_DATE_EPOCH.txt`]
- Frozen inputs: [`docs/provenance/FREEZE_MANIFEST.json`], build recipe: [`docs/provenance/BUILD_RECIPE.json`].

## Output

- Published image: `readystack/netbox:v4.7.4-CE-ubuntu24.04-r5` — index digest `sha256:911243fe201b87f998406524b06d245a26a8f4171c4e3effc1209aadbceefe21` [`docs/provenance/LOCKED_DIGEST.txt`]
- linux/amd64 image digest `sha256:e7cebf0061e802ca26618a5d3b17b0139d97e519ec0dfc3a9954fe3aa99dd38d` — reproduced from this archive before publishing [`docs/provenance/REPRO_VERIFICATION.json`].

## Attestations and signature

- SBOM + SLSA provenance attached to the image: attached: an SPDX SBOM and SLSA v1 provenance [`docs/provenance/SCOUT_VERDICT.json`]
- cosign signature by the ReadyStack release key: verified before publishing. Check it: `cosign verify --key https://readystack.dev/keys/cosign.pub readystack/netbox:v4.7.4-CE-ubuntu24.04-r5`

## Pinned inputs, and why

- 24 pinned inputs, each with where it came from, why this one, how it was checked and when it was decided: `docs/PINS.md` [`docs/provenance/PINS.json`] (upstream source 2, base and build images 1, image digests 2, language runtimes and toolchains 1, pins in the kit's dockerfiles 7, readystack's build engine 5, dependencies upstream chose 2, services the release checks run beside 4).

## Build trail

- How this release passed through the ReadyStack harness, record by record (every chain, drive, stage, review round, defect and check, each naming the record it is copied from): `ReadyStack-netbox-v4.7.4-CE-ubuntu24.04-r5.trail.json`, published beside this archive and signed with the release key (`ReadyStack-netbox-v4.7.4-CE-ubuntu24.04-r5.trail.json.sigstore`), and readable at https://readystack.dev/products/netbox/trail/v4.7.4-CE-ubuntu24.04-r5.

