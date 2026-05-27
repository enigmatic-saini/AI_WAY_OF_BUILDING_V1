---
type: postmortem
id: INC-NNNN
severity: P1
date: YYYY-MM-DD
duration_min: 0
blameless: true
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

## Detection

- Was the alert correct?
- Could it have fired sooner?
- Was the alerting noise level acceptable?

## Customer comms

- Status page updates: <link>
- Email sent: yes/no
- Affected customers reached out to: list / N/A

## Lessons for the laws

If the laws or cycles need updating, propose the change here:
- LAW: <which law> — <amendment>
- CYCLE: <which cycle> — <amendment>
