---
type: release-notes
version: v0.0.0
date: YYYY-MM-DD
status: DRAFT
commit-range: <previous-tag>..<this-tag>
rollback-tag: <previous-tag>
audit-trail: true
patches: []
incidents: []
breaking: false
---

# Release v<MAJOR>.<MINOR>.<PATCH> — YYYY-MM-DD

> Status: see frontmatter `status:` (DRAFT → PUBLISHED → SUPERSEDED → ROLLED-BACK)
> Commit range: see frontmatter `commit-range:`
> Rollback tag: see frontmatter `rollback-tag:` (the previous release that this one supersedes; the safe-redeploy target)
> Breaking: see frontmatter `breaking:` (true requires a Migration section below)

## Summary

One paragraph: what this release is, who it's for, what changed at a high level. The intent of the release in human terms — not a commit list.

## Added

- <New feature or capability> — link to MR / commit / ADR.

## Changed

- <Existing behaviour modified> — link to MR / commit.

## Fixed

- <Bug fix> — link to MR / commit / incident postmortem (`postmortems/INC-NNNN.md`).

## Security

Patches included in this release. Each entry links to its PATCH-RECORD per [DASHBOARD.md §2.9](../DASHBOARD.md):

- **PATCH-NNN** (`<classification>`) — `<one-line summary>` — [patches/PATCH-NNN-<slug>.md](../patches/PATCH-NNN-<slug>.md)

(If no security patches in this release, write *"No security patches in this release."* — explicit absence is the audit trail. Do not omit the section.)

## Breaking changes

(If `breaking: false`, write *"No breaking changes."* explicitly. If `breaking: true`, the Migration section below is required.)

- <What broke> — what consumers must change.

## Migration

(Required if `breaking: true`. Concrete migration steps for downstream consumers.)

1. <Step>
2. <Step>

## Known issues

- <Issue that ships with this release but is tracked for a future fix> — link to TODO / ADR / GitHub issue.

(If none, write *"No known issues."*)

## Rollback procedure

**This section is mandatory** per the kit's `/release` skill discipline + ITIL release management. Even a perfect release needs a documented rollback for audit + future incidents.

- **Rollback tag**: see frontmatter `rollback-tag:` — redeploy this tag to restore the prior state.
- **Rollback command**: `<exact git/deploy commands to roll back>`
- **Estimated time-to-rollback**: <minutes>
- **Forward-only changes (un-rollbackable)**: <list any data/migration changes that cannot be reversed by re-deploying the prior tag>. If any, name the *manual remediation* required.
- **Rollback verification**: <how we'll know the rollback succeeded>

## Canary watch

- **Window**: <duration — typically ≥1h per `/release` step 5>
- **Metrics watched**: <error rate, latency p95, business metrics — name them concretely>
- **Thresholds**: <what triggers rollback>
- **Outcome**: <PASS — promoted to full traffic | REGRESSED — rolled back at <time>>

## Audit trail

- **Approved by**: <reviewer name(s), per SDLC §5 sensitivity-trigger routing>
- **Released by**: <release captain>
- **MR / PR list**: <links to all merged MRs included in this release>
- **Related incidents** (if any): <postmortems/INC-NNNN.md links>
- **Related ADRs** (if any): <decisions/ADR-NNN.md links>
- **Related patches**: see Security section above + the `patches:` frontmatter list

---

> *Per [/release skill](../.claude/skills/release/SKILL.md) procedure + [DASHBOARD.md §2.10](../DASHBOARD.md) canonical-doc contract + [KABIR_GATE.md additions log entry 23](../KABIR_GATE.md).*
