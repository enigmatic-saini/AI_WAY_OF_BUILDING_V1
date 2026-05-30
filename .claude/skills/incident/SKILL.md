---
name: incident
description: On-call incident command flow per SDLC §6. Implements the ES (Emergency-Stop) cycle for active P1/P2/P3/P4 incidents — ack → channel → triage → mitigate → restore → watch → postmortem (with KB-feedback). Use IMMEDIATELY when a P1/P2 alert fires (lower severities can be handled in-hours). This is the T_prarabdha skill — MahaKaal's edge made navigable.
---

# /incident — the T_prarabdha skill

7-cycle skill. Co-owned by the on-call human (incident commander), `security` (if SEC-1/2), and the engineer who owns the affected component. **Extended 2026-05-31 deep-night-4 per [KABIR_GATE additions log entry 25](../../../KABIR_GATE.md) as Phase 4 of the external-AHR ITIL benchmark — P4 severity added; full SLA matrix codified per SDLC §6.1; KB-feedback step (postmortem → runbook) added per SDLC §6.3.**

## Procedure

### 1. Acknowledge
- Ack the page within the SLA-ack window per the severity (see [SDLC §6.1](../../../SDLC.md) — P1: 5 min, P2: 15 min, P3: 1 hour (business hours), P4: 1 business day).
- Declare severity: **P1** (customer-impacting outage, all-hands) | **P2** (degraded service, on-call only) | **P3** (no customer impact, fix in-hours) | **P4** (low impact, tracked but no SLA pressure).
- If unsure, **upgrade**, not downgrade. P3-vs-P4 borderline → P3. P1-vs-P2 borderline → P1.

### 2. Channel
- Open the incident channel (`#inc-<id>`).
- Pin the incident doc (one Google doc / shared note, NOT chat).
- Name: **Incident Commander** (you, until handed off), **Comms Lead**, **Investigator**.
- For P3/P4: a lightweight thread is sufficient; full channel only required for P1/P2.

### 3. Triage
- What is broken? (one sentence — the symptom)
- Who is affected? (which customers, % of traffic, regions)
- When did it start? (anchor in metric)
- What changed recently? (deploys, config, feature flags)

### 4. Mitigate (over-fix)
- **Restore service first.** Root cause comes later.
- Acceptable mitigations: rollback (per the most recent `release-notes/RELEASE-NOTES-v<...>.md` rollback section per Phase 2), feature-flag-off, traffic-shift, scale-up, restart, isolate.
- Mitigation budget per severity (see [SDLC §6.1](../../../SDLC.md)): **P1**: 15 min, **P2**: 1 hour, **P3**: 1 business day, **P4**: 30 days. If you can't, escalate.

### 5. Restore
- Confirm with metrics (not eyeballs).
- Customer-facing comms (if P1): one-sentence acknowledgement + ETA.
- Restore target per severity: **P1**: 1 hour, **P2**: 4 hours, **P3**: 5 business days, **P4**: 90 days.

### 6. Watch
- Stay on for ≥1 hour after restore (P1/P2). For P3/P4: monitoring is sufficient.
- Watch for re-fire and downstream effects.
- Do not start the root-cause fix during watch — fatigue causes secondary incidents.

### 7. Postmortem (with KB-feedback step)

**P1/P2: required within 5 business days.** **P3: recommended if recurring.** **P4: not required (an ADR or TODO entry is sufficient).**

Write to `postmortems/INC-NNNN.md` per the [POSTMORTEM template](../../../templates/POSTMORTEM.md) + [DASHBOARD.md §2.7](../../../DASHBOARD.md) canonical contract. The `frontmatter-check` hook enforces the frontmatter.

**Blameless** — *"What was the system that allowed this?"* not *"Who broke it?"*

**KB-feedback step (Phase 4 — added 2026-05-31 deep-night-4 per SDLC §6.3):** Every P1/P2 postmortem must populate the `runbook-updates:` frontmatter field and the "Runbook updates" body section with **one of two outcomes**:

1. **At least one runbook update** — a NEW `runbooks/<service>.md` (per DASHBOARD §2.8) OR an AMENDMENT to an existing runbook. The runbook must teach the operator what to do if the same incident recurs.
2. **An explicit "no runbook change needed" statement** with one-sentence justification.

This is the kit's anti-hypocrisy on incident learning: lessons must flow to where the operator looks during the next incident. Postmortems that gather dust in `postmortems/` without runbook propagation are ceremony.

## Output template

```
INC-ID:        <id>
SEVERITY:      P1 | P2 | P3 | P4
ACKED:         YYYY-MM-DD HH:MM (within SLA-ack budget? Y/N)
SYMPTOM:       <one sentence>
IMPACT:        <customers / %traffic / regions>
MITIGATION:    <what was done; within SLA-mitigation budget? Y/N>
RESTORED:      YYYY-MM-DD HH:MM (TTM: <minutes>; within SLA-restore target? Y/N)
POSTMORTEM:    <link, due by YYYY-MM-DD> | <"not required for P4"> | <"recommended for P3 if recurring">
RUNBOOK-FEEDBACK: <link to new/amended runbook> | <"no runbook change needed: <one-sentence justification>"> | <"N/A — postmortem not required">
```

## Anti-patterns

- **Downgrading severity to skip discipline.** A P2 mis-classified as P3 loses the on-call SLA; a P1 mis-classified as P2 loses the all-hands response. Upgrade-when-unsure is the discipline.
- **Skipping the postmortem because "we know what happened."** The blameless write-up is the artifact — the act of writing surfaces what the heads-down mitigation missed.
- **Skipping the KB-feedback step ("we'll write the runbook later").** Postmortems without runbook propagation are ceremony. Either propose the runbook update during the postmortem week, or explicitly name "no runbook change needed" with justification. Do not leave the field empty.
- **Treating P4 as "not real incidents."** P4 exists so the discipline of *recording and classifying* applies to everything — cosmetic and hygiene issues get tracked, not ignored. The bar for "actually run the incident channel" is lower for P4, not the bar for *recording*.
