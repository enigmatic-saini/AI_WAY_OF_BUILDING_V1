---
type: runbook
service: <name>
owner: <team-or-person>
last_verified: YYYY-MM-DD
---

# Runbook: [System / Service Name]

> Owner: see frontmatter `owner:`
> Last verified: see frontmatter `last_verified:` (re-verify quarterly per L9)
> Severity-1 contact: <oncall channel / pager>

## What this system does

One paragraph. Public-facing. No internal jargon.

## Critical dependencies

| Dependency | Purpose | Owner | If down: |
|---|---|---|---|
| ... | ... | ... | ... |

## How to tell it is healthy

- Dashboard: <link>
- Metrics that matter: <list with thresholds>
- Synthetic check: <if any>

## Common failures

### Failure: <symptom>

- **Likely cause:** ...
- **Diagnose:** `<command or query>`
- **Mitigate:** `<command or steps>`
- **Restore confirmation:** <metric that should normalize>
- **Followup:** <ticket to file>

### Failure: <symptom>

...

## Routine operations

### Operation: deploy
- Pre-checks: ...
- Steps: ...
- Post-checks: ...
- Rollback: ...

### Operation: rotate secrets
- ...

### Operation: scale up / down
- ...

## Emergency stops (T_prarabdha exits)

| Switch | What it does | Speed | Side effects | Command |
|---|---|---|---|---|
| feature flag X | turns off feature | seconds | users see fallback | ... |
| circuit breaker Y | isolates dependency | seconds | degraded mode | ... |
| kill switch Z | full shutdown | seconds | full outage | ... |

## Escalation

| Severity | Contact | Within |
|---|---|---|
| P1 | <oncall> | 5 min |
| P2 | <oncall> | 30 min |
| P3 | <queue> | next business day |

## References

- DESIGN.md: §...
- ADR: ...
- Recent postmortems: ...
