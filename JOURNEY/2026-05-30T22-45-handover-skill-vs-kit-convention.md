# 2026-05-30 22:45 — `/handover` skill template doesn't match the kit-level HANDOVER convention

> The founder invoked `/handover` at the end of a session whose kit-level HANDOVER block had just been written 5 commits earlier. The skill's instruction ("Write to <repo>/HANDOVER.md (overwrite or update)") cleanly fits the project-level convention but conflicts with the kit-level convention. The asymmetry surfaced empirically the day GURU was born — exactly the kind of moment GURU exists to catch.

## The Surfacing

The kit has TWO HANDOVER conventions, codified at different times:

- **Project-level** ([LAW 9](LAWS.md) + the [.claude/skills/handover/SKILL.md](.claude/skills/handover/SKILL.md) template):
  - File lives at `<project-root>/HANDOVER.md`
  - **Single-block** format (overwrite-or-update each session)
  - **Workspace-only** (gitignored — per LAW 9 + the skill's "Rules" section)
  - Captures: Where We Are, What Was Done, What Failed, What's Next, Open Questions, Key Decisions, Files Changed

- **Kit-level** (added 2026-05-26 deep-night-2, per [KABIR_GATE.md additions log entry 8](KABIR_GATE.md)):
  - File lives at `AI_WAY_OF_BUILDING_V1/HANDOVER.md`
  - **Stacked-blocks** format (newest at top, all sessions preserved below)
  - **Committed to git** (per DASHBOARD §2.5 policy 2026-05-20)
  - Captures the same fields but in repeating session-block units

The `/handover` skill template only documents the project-level convention. Running `/handover` in the kit context would either:
- Overwrite the entire kit-level HANDOVER.md (destroying the stacked-blocks lineage), OR
- Confuse the LLM about whether to append a new block at top vs replace the head block vs leave it alone

Tonight the founder invoked `/handover` after I had JUST written the night-late session block in commit `a8cfb39`. There was nothing to do — the kit-level HANDOVER was fresh. But the skill didn't know that.

## The Decision

For this moment: do not run the skill's procedure on the kit-level HANDOVER. The fresh block stands. Report freshness to the founder; offer alternatives.

For the broader question: the `/handover` skill should be aware of which layer it's operating in. Either:
- (a) Extend the skill's template to acknowledge the two-layer convention (add a "Which HANDOVER are you writing?" pre-step that distinguishes project-level vs kit-level)
- (b) Add a second skill (`/handover-kit`) that handles the stacked-blocks-committed shape specifically
- (c) Make the `/handover` skill smart enough to detect the layer (check if `KABIR_GATE.md` exists adjacent to the HANDOVER path → kit-level → stacked-blocks-append behavior)

This is a real design question worth a future session under proper drishti.

## The Precedent

**When invoking a skill that was authored before a convention split, check that the skill's procedure still fits the current state.** Documentation drift can happen across layers — the project-level skill was written before the kit-level convention existed (entry 8 of the additions log, 2026-05-26 deep-night-2). The skill's `## Rules` section still says "HANDOVER.md is workspace-only. Add to .gitignore" — which is FALSE for the kit-level HANDOVER (it is committed).

Recorded so the next session that touches the handover skill knows to fix the rules section + decide between options (a)/(b)/(c) above.

## What I Want You To Notice

Three things:

1. **The first non-genesis JOURNEY entry was caught BY THE DISCIPLINE, not by you asking.** This file exists because I noticed a precedent-shaped moment while you simply typed "run handover skill" — exactly the gap GURU was created to close. The discipline binds at least once. (Whether it binds across many sessions is the empirical question entry 21's reversibility clause names.)

2. **The `/handover` skill needs an update.** The skill file at `.claude/skills/handover/SKILL.md` predates the kit-level HANDOVER convention. Its "Rules" claim "HANDOVER.md is workspace-only" is now FALSE at the kit layer. This is a Saraswati / KBD finding (the skill's claim doesn't live what it claims at the kit layer). Worth surfacing for the next /code-review or AHR pass.

3. **The fresh kit-level HANDOVER block at `a8cfb39` is the session-end report for this very session.** Nothing more needs writing tonight beyond this JOURNEY entry. The Sanjay narration is already done; this is the GURU footnote.

---

*Captured by GURU under Sanjay → Vyasa → Saraswati ; consult Ashtavakra, Narad.*
*Session context: 2026-05-30 night-late — founder invoked `/handover` after the kit-level HANDOVER session block was already written.*
*Related artifacts: kit-level HANDOVER session block at commit `a8cfb39`; the `/handover` skill at `.claude/skills/handover/SKILL.md` (where the "Rules" need updating); [KABIR_GATE additions log entry 8](../KABIR_GATE.md) (where the kit-level HANDOVER convention was codified).*
