---
name: mr
description: Open a Merge Request with the SDLC §5 template auto-populated, the right reviewers requested based on the diff's sensitivity triggers (auth/PII/payment/schema/public-API/IaC requires 2 reviewers), and the MR description populated from the branch's commits. Use after the branch's commits are in place; invoke before pushing. Pairs with the `reviewer` role.
---

# /mr — open a Merge Request

5-cycle skill.

## Procedure

### 1. Sensitivity scan
Diff the branch against the base (usually `main`). Flag if any of these are touched:
- `auth/*`, `*auth*` files
- PII paths (user data, profile, contact)
- Payment paths
- Schema files (`migrations/`, `schema.*`)
- Public APIs (`api/`, `*Controller*`, route definitions)
- IaC (`*.tf`, `*.yaml` in `infra/`, `k8s/`, `helm/`)

If any flagged: **2 reviewers required** per SDLC §5. Otherwise: 1 reviewer.

### 2. Reviewer routing
Match reviewers by file paths:
- Backend / data-layer → backend reviewer
- Frontend / UI → frontend reviewer
- IaC / CI → devops reviewer
- Schema / migration → data-engineer reviewer
- Auth / PII / payment → **+ security reviewer (always)**

Also: spawn the `reviewer` role (via `Agent`) for a second-opinion review before the human queue.

### 3. Template fill
Fill the SDLC §5 MR template:
```
## Summary
<1–3 bullets>

## Why
<the user-facing reason or the engineering reason>

## M_build context
- Stage: <build | service>
- Transition: <T_loop | T3>
- Cycle profile used: <Q | S | D | 3x4>

## Test plan
- [ ] <bulleted markdown checklist>

## Sensitivity
- [ ] auth/PII/payment/schema/public-API/IaC: <none | list>
- Reviewers requested: <list>

## Rollback
<one-paragraph plan>
```

### 4. Push
`git push -u origin feature/<name>`. Refuse force-push to main (the hook will block).

### 5. Open MR
Use `gh pr create` (or `glab mr create`) with the filled template as `--body` via HEREDOC. Return the MR URL.

## Output template

```
SENSITIVITY:  [<flags>]
REVIEWERS:    [<list>]
BRANCH:       feature/<name>
COMMITS:      [<sha shortlog>]
MR URL:       <https://...>
```
