---
name: triage
description: Pick the right M_build stage and review cycle when the situation is ambiguous. Use when you don't know what to do next, when stuck, or before any task whose stage/profile is unclear. The witness function — Sannyasa-quality access from any state.
---

# /triage — the witness function

The witness does not enter the FSM; it observes which state is current.

## When to use

- You don't know which M_build stage applies.
- Multiple stages or cycles seem to apply.
- The current stage feels wrong (e.g., you're "building" but the charter is unclear → you're actually in S0).
- You're overwhelmed and need direction.

## Procedure (4 cycles)

### 1. Symptom

State the presenting problem in ONE sentence. No solution-language.
- Wrong: "We need to refactor the auth module."
- Right: "Every request times out for users with more than 50 sessions."

### 2. Survey

Classify the feeling and map it to a stage + cycle.

| Feeling | Likely stage | Start with |
|---|---|---|
| Pain — something hurts now | S3, S4, or T_prarabdha | `RR`, `/incident` |
| Fear — something might break | S2, S3 | `SR`, `RH3` |
| Confusion — don't know what to do | S0, S1 | `AR`, `DOC` |
| Emptiness — something is missing | S0, S1 | `AR`, `RH4` |
| Friction — something resists | S3 | `OE`, `RH2`, `RH6` |
| Doubt — are we doing the right thing? | S0, S3, S4 | `AHR`, `GR` |
| Indecision — multiple paths | any | `SMR` |
| Blocked — wall everywhere | S2, S3 | `UB`, `ER` |

### 3. Plan

Declare:
- **Primary cycle** (the one that addresses the root cause).
- **Follow-ups** (0–2, sequenced).
- **Stage** (which M_build state the work is in).
- **Profile** (Q / S / D / 3x4).
- **Mission** — one sentence tying it all together.

### 4. Begin

Start the primary cycle immediately. No further triage.

## Output template

```
SYMPTOM:    <one sentence, no solution-language>
FEELING:    <pain | fear | confusion | emptiness | friction | doubt | indecision | blocked>
STAGE:      <seed | discovery | forge | build | service | sunset | decommission>
PROFILE:    <Q | S | D | 3x4>
PRIMARY:    <cycle-tag>  e.g., RR, AR, AHR
FOLLOW-UPS: [<cycle-tag>, ...]  (0–2)
MISSION:    <one sentence>
```

Then invoke the primary cycle.
