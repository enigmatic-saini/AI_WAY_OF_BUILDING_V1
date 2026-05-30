---
type: postmortem
id: INC-NNNN
severity: P1
date: YYYY-MM-DD
duration_min: 0
blameless: true
runbook-updates: []  # required for P1/P2 per SDLC §6.3 (KB-feedback loop); list of runbook paths created/amended, OR a single string "no runbook change needed: <one-sentence justification>"
sla-ack-met: true    # was the SLA-ack window met? (per SDLC §6.1)
sla-mitigation-met: true   # was the SLA-mitigation budget met?
sla-restore-met: true      # was the SLA-restore target met?
---

# Postmortem: [one-sentence summary]

> Incident: see frontmatter `id:`
> Severity: see frontmatter `severity:`
> Date: see frontmatter `date:`
> Duration: see frontmatter `duration_min:` (minutes from start to restore)
> Blameless: yes (always)

## Summary

One paragraph: what happened, who was affected, how long, how it was resolved.

## Timeline (UTC)

| Time | Event |
|---|---|
| HH:MM | Alert fired |
| HH:MM | On-call acked |
| HH:MM | Incident channel opened |
| HH:MM | Triage complete |
| HH:MM | Mitigation deployed |
| HH:MM | Service restored |
| HH:MM | Watch ended |

## What happened

The narrative. Causally ordered. No interpretation yet.

## Why it happened (root cause)

5 whys.

1. Why did X happen? Because Y.
2. Why did Y happen? Because Z.
3. ...
4. ...
5. Root: <the systemic cause, not the proximate trigger>

## What we did right

Behaviors / tooling / processes that worked. Reinforce these.

## What we did wrong

Behaviors / tooling / processes that hurt or slowed. **Frame as system-not-person.**

## Action items

| # | Owner | Action | Due | Linked TODO |
|---|---|---|---|---|
| 1 | ... | ... | YYYY-MM-DD | ... |
| 2 | ... | ... | YYYY-MM-DD | ... |

## Runbook updates (mandatory for P1/P2 per [SDLC §6.3](../SDLC.md))

The kit's anti-hypocrisy on incident learning: lessons must flow to where the operator looks during the next incident. A postmortem without runbook propagation is ceremony. Populate **one of two outcomes**:

**Option A — at least one runbook update:**

| Runbook | New / amended | What the operator now knows that they didn't before |
|---|---|---|
| `runbooks/<service>.md` | NEW | <one-sentence summary> |
| `runbooks/<existing>.md` | AMENDED §<N> | <one-sentence summary> |

(Cross-reference each runbook in the frontmatter `runbook-updates:` field as a list of paths.)

**Option B — explicit "no runbook change needed":**

> *"No runbook change needed: <one-sentence justification>."*
>
> Example: *"No runbook change needed: this was a one-off corrupted-data event upstream; no operational pattern survives the postmortem."*

(Set the frontmatter `runbook-updates:` to that exact string, e.g., `runbook-updates: "no runbook change needed: one-off upstream data corruption"`.)

**Do NOT leave this section empty.** An unpopulated runbook-feedback section is the failure mode SDLC §6.3 + KABIR_GATE additions log entry 25 exist to catch.

## Detection

- Was the alert correct?
- Could it have fired sooner?
- Was the alerting noise level acceptable?

## Customer comms

- Status page updates: <link>
- Email sent: yes/no
- Affected customers reached out to: list / N/A

## SLA review (added Phase 4 per [SDLC §6.1](../SDLC.md))

| Window | Target | Actual | Met? |
|---|---|---|---|
| Ack | <per severity> | <YYYY-MM-DD HH:MM> | yes / no |
| Mitigation budget | <per severity> | <minutes> | yes / no |
| Restore target | <per severity> | <minutes> | yes / no |

If any SLA was missed: name the gap honestly. The frontmatter `sla-*-met:` fields are the audit trail; this section is the why.

## Lessons for the laws

If the laws or cycles need updating, propose the change here:
- LAW: <which law> — <amendment>
- CYCLE: <which cycle> — <amendment>
