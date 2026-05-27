---
type: status
project: <name>
stage: <seed | discovery | forge | build | service | sunset | decommission>
updated: YYYY-MM-DDTHH:MM:SSZ
metrics:
  built: 0
  designed: 0
  planned: 0
---

# Status — [Project Name]

> Honest separation of BUILT (compiles, runs, produces output) from DESIGNED (architecture documented, code not written) from PLANNED (in TODO, not yet designed). Anyone reading this file must know in 30 seconds what works, what doesn't, and what's next.

## BUILT (compiles, runs, produces output)

| Component | Lines | Status | Tests |
|---|---|---|---|
| <name> | <count> | <green/yellow/red> | <count> |

## DESIGNED (architecture documented, code NOT written)

| Component | Document | Dependency |
|---|---|---|
| <name> | DESIGN.md §<N> | <blocked-by-X> |

## PLANNED (in TODO, not yet designed)

| Feature | Phase | Priority |
|---|---|---|
| <name> | <e.g., v0.2> | p1/p2/p3 |

## Metrics

| Metric | Value | As of |
|---|---|---|
| Lines of code | 0 | YYYY-MM-DD |
| Test coverage | 0% | YYYY-MM-DD |
| Open MRs | 0 | YYYY-MM-DD |
| Open ADRs (PROPOSED) | 0 | YYYY-MM-DD |
| Open postmortem action items | 0 | YYYY-MM-DD |

## Rules

- The three sections must never be mixed.
- Moving an item from DESIGNED → BUILT requires proof: tests passing, demo working.
- If STATUS.md claims something works that doesn't: run [Refactorer Review (`RR`)](CYCLES.md#5-rr--refactorer-review-shiva-d-profile-12-cycles).
- Update the `metrics.built`, `metrics.designed`, `metrics.planned` in the frontmatter so the viewer can show counts without re-parsing tables.
