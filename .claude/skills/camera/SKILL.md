---
name: camera
description: Capture a single moment to JOURNEY/ in blog style — a mid-task important detail, a decision the founder should know about, a precedent that surfaces, a near-miss. The lightweight companion to /handover. Use when something important has surfaced in prose that would otherwise evaporate between artifacts. Each invocation writes one JOURNEY/<YYYY-MM-DD>T<HH-MM>-<slug>.md entry.
---

# /camera — capture a moment to JOURNEY/

Companion to the [guru role](../../agents/guru.md). Where `/handover` writes an end-of-session synthesis, `/camera` captures a single mid-session moment as it happens. Where CYCLE_SET / *_PASS preserve a *deliberation artifact*, `/camera` preserves a *moment-shaped surfacing* — the kind of insight that lives in prose to the founder and currently evaporates between turns.

## When to use

- A precedent surfaces that a future session will want to refer back to ("recorded so future sessions facing X have a precedent" style sentences).
- A decision is made that the founder should know about.
- A mid-task "important detail" appears in prose — the kind of detail the founder otherwise has to manually ask be saved.
- A near-miss is caught (Sita catches mid-edit, MID vetoes, KBD vetoes, the "I almost did X but then noticed Y" moments).
- An open question is named that wasn't named before.

## When NOT to use

- Trivial moments (typo fix, bug squash without precedent value). Saraswati's `standard` Q is the gate.
- A moment that's about to land in CYCLE_SET / *_PASS / KABIR_GATE additions log / HANDOVER anyway — no duplication.
- The entire session is one structured artifact — HANDOVER suffices.

## Procedure (Q profile, 4 cycles)

### 1. Name the moment
Name it in one sentence. If you cannot name it, it is not yet ripe; wait. The naming is the test of whether the moment has weight.

### 2. Pick the layer
- Kit-level moment (concerns the kit's own discipline / governance / primitives / cross-project conventions) → `AI_WAY_OF_BUILDING_V1/JOURNEY/`
- Project-level moment (concerns a consuming project's specific work) → `<project-root>/JOURNEY/`

If both apply, the moment is kit-level (it teaches the kit something).

### 3. Write the entry

Path: `<layer>/JOURNEY/<YYYY-MM-DD>T<HH-MM>-<slug>.md`

Blog-style format (no frontmatter — the form is part of the discipline):

```markdown
# YYYY-MM-DD HH:MM — <One-line title naming the moment>

> [1-2 sentence lede: what happened, why it matters.]

## The Surfacing

[What surfaced as important. Direct, narrative prose. Tell the moment as a story.]

## The Decision (if any)

[What was decided. If no decision was made, omit this section.]

## The Precedent (if any)

[If this moment names a precedent for future sessions, name it here in one sentence so the precedent can be searched.]

## What I Want You To Notice

[Direct address to the founder: "here is what you should notice / decide / preserve from this moment." This section IS the gap GURU exists to close. Without it the entry is just a log.]

---

*Captured by GURU under Sanjay → Vyasa → Saraswati ; consult Ashtavakra, Narad.*
*Session context: <one-line session description>.*
*Related artifacts: <links to commits, CYCLE_SETs, PASS files, HANDOVER blocks if any>.*
```

### 4. Continue the work
`/camera` does not interrupt the task. Write the entry, then return to the work. Sanjay narrated while the battle continued.

## Output template (the skill's PASS/FAIL surface)

```
JOURNEY ENTRY WRITTEN
=====================
Path:     <relative path>
Title:    <one-line>
Layer:    kit | project
Linked:   <commits / artifacts referenced>
```

## Anti-patterns

- **Writing entries the founder didn't need to see** — Saraswati's `standard` Q. Only the important.
- **Frontmatter / structured table format** — JOURNEY is BLOG style. The form IS the discipline; structured frontmatter belongs to canonical-doc types per [DASHBOARD.md](../../../DASHBOARD.md).
- **Skipping the "What I Want You To Notice" section** — that section IS the gap GURU was created to close. Without it the entry is just a log; with it the entry transmits.
- **Waiting for the founder to ask before writing** — the discipline is autonomous capture. The founder's complaint was *"I keep having to ask"*; the skill exists to remove that ask.
- **Multiple entries collapsed into one file** — each moment gets its own file. Granularity is part of the searchability.

## Worked example — the first entry

Path: `JOURNEY/2026-05-30T21-00-guru-camera-genesis.md`

The genesis moment of the GURU + CAMERA system itself. See it for the canonical form.
