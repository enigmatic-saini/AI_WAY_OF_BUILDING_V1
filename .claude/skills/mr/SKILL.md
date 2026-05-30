---
name: mr
description: Open a Merge Request with the SDLC §4 template auto-populated, ITIL classification (Standard/Normal/Emergency) assigned, the right reviewers requested per the §4.3 routing matrix (classification × sensitivity-trigger), mandatory rollback section populated, and PIR pre-staged for Emergency MRs. Use after the branch's commits are in place; invoke before pushing. Pairs with the `reviewer` role.
---

# /mr — open a Merge Request

5-cycle skill. **Extended 2026-05-31 deep-night per [KABIR_GATE additions log entry 24](../../../KABIR_GATE.md) as Phase 3 of the external-AHR ITIL benchmark — classification + reviewer-routing matrix + mandatory rollback + PIR convention.**

## Procedure

### 1. Classify + Sensitivity scan
**Classify** the change per [SDLC §4.1](../../../SDLC.md):
- **Standard** — low-risk, pre-approved pattern (dependency-bot bumps within policy; doc typo; pre-approved config tweak)
- **Normal** — default class (feature work, refactors, bug fixes)
- **Emergency** — urgent, often during/after incident (security patch Critical/High; incident hotfix; urgent data fix)

If unsure → **Normal**. Standard is only for genuinely pre-approved patterns; Emergency only for genuinely urgent (not "I want to ship fast").

**Sensitivity scan** — diff the branch against base (usually `main`). Flag if any of these are touched:
- `auth/*`, `*auth*` files
- PII paths (user data, profile, contact)
- Payment paths
- Schema files (`migrations/`, `schema.*`)
- Public APIs (`api/`, `*Controller*`, route definitions)
- IaC (`*.tf`, `*.yaml` in `infra/`, `k8s/`, `helm/`)

Classification and sensitivity are **orthogonal** — both apply.

### 2. Reviewer routing (the §4.3 matrix)

The reviewer count is the **max** between classification's floor and sensitivity's floor. Sensitivity adds the `security` reviewer. Sensitivity is NEVER expedited away by Emergency.

| Classification | Sensitivity | Reviewers required | Mandatory PIR |
|---|---|---|---|
| Standard | non-sensitive | 1 (lightweight) | No |
| Standard | sensitive | 2 + `security` | Yes |
| Normal | non-sensitive | 1 (substantive) | Conditional (large diffs) |
| Normal | sensitive | 2 + `security` | Yes |
| Emergency | non-sensitive | 1 (expedited queue) | Yes within 24h |
| Emergency | sensitive | 2 + `security` (expedited queue) | Yes within 24h |

Match reviewers by file paths:
- Backend / data-layer → backend reviewer
- Frontend / UI → frontend reviewer
- IaC / CI → devops reviewer
- Schema / migration → data-engineer reviewer
- Auth / PII / payment → **+ security reviewer (always)**

Also: spawn the `reviewer` role (via `Agent`) for a second-opinion review before the human queue.

### 3. Template fill + PIR pre-stage

Fill the [SDLC §4.4 MR template](../../../SDLC.md):
```
## Classification
- [ ] Standard | Normal | Emergency
- Sensitivity triggers: <none | auth | PII | payment | schema | public-API | IaC>
- Reviewers requested: <list>
- PIR: <not required | conditional | required within 24h>

## Summary
<1-3 bullets>

## Why
<the user-facing reason or the engineering reason>

## M_build context
- Stage: <build | service>
- Transition: <T_loop | T3>
- Cycle profile used: <Q | S | D | 3x4>

## Test plan
- [ ] <bulleted markdown checklist>

## Rollback (mandatory)
- Rollback procedure: <exact git/deploy commands to undo this change>
- Estimated time-to-rollback: <minutes>
- Forward-only changes (un-rollbackable): <list or "none">
- Rollback verification: <how we'll know rollback succeeded>

## Audit trail
- Related ADRs: <decisions/ADR-NNN.md links>
- Related incidents: <postmortems/INC-NNNN.md links>
- Related patches: <patches/PATCH-NNN.md links>
- Related release: <release-notes/RELEASE-NOTES-v<...>.md if applicable>
```

**The Rollback section is mandatory** — even a perfect MR. Same discipline as `/release` step 6.

**For Emergency MRs**: also pre-stage a "PIR for MR #N" subsection in the project's HANDOVER.md to be populated within 24h of merge per [SDLC §4.5](../../../SDLC.md). The PIR is the kit's anti-hypocrisy on Emergency — *"we shipped fast"* must be paired with *"we reviewed what happened after."*

### 4. Push
`git push -u origin feature/<name>`. Refuse force-push to main (the `block-dangerous-bash` hook will block).

### 5. Open MR
Use `gh pr create` (or `glab mr create`) with the filled template as `--body` via HEREDOC. Return the MR URL.

**Merge conditions** (per [SDLC §4.6](../../../SDLC.md)):
- `/pre-commit-8l` PASS on the final commit.
- All requested reviewers approve (per §4.3 matrix).
- Required CI passes.
- For sensitive changes: 2 human approvals + `security` sign-off.
- Rollback section populated (not "TBD").
- For Emergency MRs: the rollback procedure is *tested* before merge.

## Output template

```
CLASSIFICATION: Standard | Normal | Emergency
SENSITIVITY:    [<flags or "none">]
REVIEWERS:      [<list per §4.3 matrix>]
PIR:            Not required | Conditional | Required within 24h
BRANCH:         feature/<name>
COMMITS:        [<sha shortlog>]
ROLLBACK:       <one-line summary; full procedure in MR body>
MR URL:         <https://...>
```

## Anti-patterns

- **Classifying Emergency under pressure to skip review.** Sensitivity-triggers NEVER bypass — Emergency-sensitive is still 2 reviewers + security. Emergency only expedites the *queue*, not the *gates*.
- **Defaulting to Standard for "small" changes.** Standard means *pre-approved pattern*, not *small in scope*. A 3-line bug fix is Normal unless it follows a pre-approved pattern (e.g., dep-bot bump within policy).
- **Leaving Rollback as "TBD" or "n/a".** The Rollback section is mandatory. If a change is genuinely un-rollbackable (e.g., destructive data migration), name it explicitly in "Forward-only changes" and document the manual remediation procedure.
- **Skipping PIR for Emergency MRs.** The PIR is the kit's anti-hypocrisy on Emergency. Within 24h of merge, the HANDOVER session block must include the "PIR for MR #N" subsection.
