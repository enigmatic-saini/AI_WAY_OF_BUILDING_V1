# release-notes/ — release notes convention

> Where the kit (and consuming projects) keep one RELEASE-NOTES per tagged release.

This folder holds one **RELEASE-NOTES** document per tagged release. The records are committed to git as the **release audit trail** — what was released, when, what changed, what patches were bundled, what the rollback procedure is.

## What lives here

| File pattern | Type | Lifecycle |
|---|---|---|
| `RELEASE-NOTES-v<MAJOR>.<MINOR>.<PATCH>.md` | `release-notes` (per [DASHBOARD.md §2.10](../DASHBOARD.md)) | DRAFT → PUBLISHED → SUPERSEDED → ROLLED-BACK |
| `README.md` (this file) | Convention doc | Updated when the convention evolves |

## File naming

`RELEASE-NOTES-v<MAJOR>.<MINOR>.<PATCH>[-<prerelease>].md`

Examples:
- `RELEASE-NOTES-v1.0.0.md` — initial release
- `RELEASE-NOTES-v1.2.3.md` — patch release
- `RELEASE-NOTES-v2.0.0-rc.1.md` — release candidate
- `RELEASE-NOTES-v2.0.0.md` — major release

The version in the filename **must** match the `version:` field in the frontmatter **and** the git tag that ships the release. The `semver-check` hook blocks malformed git tags; this naming convention extends that discipline to the audit artifact.

## How to write one

Use the `/release` skill — its step 3 drafts the release notes; its step 6 + 7 produce the matching tag + commit. The template at [templates/RELEASE-NOTES.md](../templates/RELEASE-NOTES.md) is the canonical body shape.

The `frontmatter-check` hook will refuse a `Write` to this folder that doesn't have the `type: release-notes` frontmatter.

## Required sections

Per the canonical body shape (see template):

- **Summary** — one paragraph in human terms
- **Added / Changed / Fixed** — what moved
- **Security** — patches bundled (each links to its `patches/PATCH-NNN.md`); *empty section with explicit "No security patches" is the audit trail*, not an omission
- **Breaking changes** — explicit "No breaking changes." if `breaking: false` in frontmatter
- **Migration** — required if `breaking: true`
- **Known issues** — explicit "No known issues." if none
- **Rollback procedure** — **mandatory** per `/release` discipline; even a perfect release needs documented rollback
- **Canary watch** — window, metrics, thresholds, outcome
- **Audit trail** — reviewer(s), release captain, MR list, related incidents/ADRs/patches

The "explicit-absence-is-the-audit-trail" rule applies throughout. Empty sections are written as *"No <section>"*, not omitted. Omission is ambiguous; explicit absence is auditable.

## Governance status

- **Kit-level release-notes/** (this folder): committed to git (release audit trail is the discipline).
- **Project-level release-notes/**: per-project — default committed. A project that publishes release notes externally (e.g., GitHub Releases) may treat this folder as the *internal* audit copy and the external publishing as derivative.

## How release notes relate to the kit's other audit channels

| Question | Channel |
|---|---|
| "What changed in this commit?" | git log |
| "What was decided architecturally?" | `decisions/ADR-NNNN.md` |
| "What incident did we handle?" | `postmortems/INC-NNNN.md` |
| "What patch did we apply?" | `patches/PATCH-NNN.md` |
| "What did this release bundle?" | **`release-notes/RELEASE-NOTES-v<...>.md`** ← this folder |
| "How do we operate this in prod?" | `runbooks/<topic>.md` |
| "Where are we in this session?" | `HANDOVER.md` |
| "What moment surfaced during the work?" | `JOURNEY/<date>T<time>-<slug>.md` |

Each channel has one job. The RELEASE-NOTES's job is *release audit trail*: the contract between what was tagged and what was promised.

## Provenance

Folder convention introduced 2026-05-31 deep-night per [KABIR_GATE.md additions log entry 23](../KABIR_GATE.md) as Phase 2 of the external-AHR ITIL benchmark ([AHR_PASS_2026-05-30_itil-external.md](../AHR_PASS_2026-05-30_itil-external.md)). The skill + template + this folder + the DASHBOARD `release-notes` type + the `semver-check` hook land together as one coherent addition.
