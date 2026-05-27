---
name: incident
description: On-call incident command flow per SDLC §9. Implements the ES (Emergency-Stop) cycle for active P1/P2 incidents — ack → channel → triage → mitigate → restore → watch → postmortem. Use IMMEDIATELY when a P1/P2 alert fires. This is the T_prarabdha skill — MahaKaal's edge made navigable.
---

# /incident — the T_prarabdha skill

7-cycle skill. Co-owned by the on-call human (incident commander), `security` (if SEC-1/2), and the engineer who owns the affected component.

## Procedure

### 1. Acknowledge
- Ack the page within 5 minutes of fire.
- Declare severity: P1 (customer-impacting, ALL hands) | P2 (degraded, on-call only) | P3 (no customer impact, fix in-hours).
- If unsure, **upgrade**, not downgrade.

### 2. Channel
- Open the incident channel (`#inc-<id>`).
- Pin the incident doc (one Google doc / shared note, NOT chat).
- Name: **Incident Commander** (you, until handed off), **Comms Lead**, **Investigator**.

### 3. Triage
- What is broken? (one sentence — the symptom)
- Who is affected? (which customers, % of traffic, regions)
- When did it start? (anchor in metric)
- What changed recently? (deploys, config, feature flags)

### 4. Mitigate (over-fix)
- **Restore service first.** Root cause comes later.
- Acceptable mitigations: rollback, feature-flag-off, traffic-shift, scale-up, restart, isolate.
- "Mitigate within 15 min for P1" is the budget. If you can't, escalate.

### 5. Restore
- Confirm with metrics (not eyeballs).
- Customer-facing comms (if P1): one-sentence acknowledgement + ETA.

### 6. Watch
- Stay on for ≥1 hour after restore.
- Watch for re-fire and downstream effects.
- Do not start the root-cause fix during watch — fatigue causes secondary incidents.

### 7. Postmortem
- Within 5 business days.
- Template:
  ```
  # Postmortem: <one-sentence summary>
  ## Timeline (UTC)
  ## What happened
  ## Why it happened (root cause — 5 whys)
  ## What we did right
  ## What we did wrong
  ## Action items (with owners and dates)
  ```
- **Blameless.** "What was the system that allowed this?" not "Who broke it?"

## Output template

```
INC-ID:        <id>
SEVERITY:      P1 | P2 | P3
ACKED:         YYYY-MM-DD HH:MM (within budget? Y/N)
SYMPTOM:       <one sentence>
IMPACT:        <customers / %traffic / regions>
MITIGATION:    <what was done>
RESTORED:      YYYY-MM-DD HH:MM (TTM: <minutes>)
POSTMORTEM:    <link, due by YYYY-MM-DD>
```
