# patches/ — patch record convention

> Where the kit (and consuming projects) keep the audit trail of patches.

This folder holds one **PATCH-RECORD** per applied patch. The records are committed to git as the patch audit trail — what was patched, when, why, by whom, with what rollback plan, what test plan, and what verification result.

## What lives here

| File pattern | Type | Lifecycle |
|---|---|---|
| `PATCH-NNN-<slug>.md` | `patch-record` (per [DASHBOARD.md §2](../DASHBOARD.md)) | PROPOSED → TESTING → APPLIED → VERIFIED; or any state → ROLLED-BACK |
| `README.md` (this file) | Convention doc | Updated when the convention evolves |

## File naming

`PATCH-<3-digit-zero-padded-id>-<short-slug>.md`

Examples:
- `PATCH-001-cve-2026-12345-libfoo-rce.md`
- `PATCH-002-bash-version-bump.md`
- `PATCH-003-lint-rule-bypass-vuln.md`

The 3-digit id is **project-local sequential** — `PATCH-001` is each project's first patch, not a global sequence.

## How to write one

Use the `/patch` skill — it walks the 4-cycle Q-profile procedure and emits the PATCH-RECORD per the [templates/PATCH-RECORD.md](../templates/PATCH-RECORD.md) template.

The skill enforces the [DASHBOARD.md §2](../DASHBOARD.md) canonical-doc frontmatter contract. The `frontmatter-check` hook will refuse a `Write` to this folder that doesn't have the `type: patch-record` frontmatter.

## Governance status

- **Kit-level patches/** (this folder): committed to git (audit trail is the discipline).
- **Project-level patches/**: per-project — default committed. A project that prefers external audit storage (e.g., a compliance system of record) may move the records there, but the *discipline* (write a record per patch with the required fields) survives the storage choice.

## How patches relate to the kit's other audit channels

| Question | Channel |
|---|---|
| "What changed in this commit?" | git log |
| "What was decided architecturally?" | `decisions/ADR-NNNN.md` |
| "What incident did we handle?" | `postmortems/INC-NNNN.md` |
| "What patch did we apply?" | **`patches/PATCH-NNN.md`** ← this folder |
| "How do we operate this in prod?" | `runbooks/<topic>.md` |
| "Where are we in this session?" | `HANDOVER.md` |
| "What moment surfaced during the work?" | `JOURNEY/<date>T<time>-<slug>.md` |

Each channel has one job. The PATCH-RECORD's job is *patch audit trail*: what was patched, when, with what plan, with what result.

## Provenance

Folder convention introduced 2026-05-30 night-late per [KABIR_GATE.md additions log entry 22](../KABIR_GATE.md) as Phase 1 of the external-AHR ITIL benchmark ([AHR_PASS_2026-05-30_itil-external.md](../AHR_PASS_2026-05-30_itil-external.md)). The skill + template + this folder + the DASHBOARD `patch-record` type land together as one coherent addition.
