---
name: intake
description: Receive raw, unarticulated human desire and shape it toward a CHARTER.md that can clear T₀. Use when a human (business person, end-user, internal stakeholder) arrives with a feeling, a friction, or a wish — not yet a structured intent. The pre-Seed front door. Output is CHARTER.md draft + FiveArrows classification + readiness verdict. Refuses to advance until the human confirms the mirror.
---

# /intake — the pre-T₀ front door

V1 KIT begins at S0 Seed with `charter_signed`. `/intake` is the work that produces the charter that satisfies that guard. Without `/intake`, the kit assumes the human shows up pre-articulated. They do not.

This skill is the runtime instance of the `analyst` role. The two are paired: the role is the drishti modifier; the skill is the procedure.

## When to use

- A human arrives with **"I want the system to handle X differently"** or **"something feels wrong with how Y works"** — and there is no `CHARTER.md` yet.
- An existing project gains a new strand of work whose *why* is unstated.
- You catch yourself drafting code or design for work whose charter is absent or stale.

## When NOT to use

- A clean charter already exists → skip directly to `/triage` or to `architect` for `AR`.
- The human is the engineer themselves and the intent is already structured → run `/triage` instead.
- Hot patch, typo, trivial fix → use `Q` profile; no charter needed.
- An incident is active (`T_prarabdha` in flight) → run `/incident`. New intake waits until the season turns.

## Procedure (4 cycles, Q profile — Mira's NoMind)

Question text per round is in [INTAKE_PROMPTS.md](../../../INTAKE_PROMPTS.md); evidence sufficiency is scored against [Q_RUBRIC.md](../../../Q_RUBRIC.md).

### 1. Listen

Receive the human's words verbatim. Do not paraphrase. Do not propose solutions. Do not technicalize.

**Do:**
- Quote the human's first articulation in full.
- Ask one clarifying question at a time, in their language.
- Hold silence when the human pauses. Silence is information.

**Don't:**
- Translate "handling returns differently" into "refactor the returns module."
- Offer "is it X, Y, or Z?" — that closes the field of desire prematurely.

### 2. Mirror

Reflect the desire back in **the human's own domain language**, then **wait for confirmation**.

```
"What I'm hearing is: <restatement>. Is that right, or have I missed something?"
```

The mirror is not accepted until the human confirms. If they correct you — re-mirror. Repeat until they say *yes, that's it*. This is the dharmic confirm step. Skipping it produces a charter that documents *your* interpretation, not their intent.

### 3. Classify (FiveArrows)

Apply the FiveArrows classification. The classification is determined by the **nature of the change**, not the human's emotional state or urgency.

| Arrow | Quality of longing | What it means for the system |
|---|---|---|
| **Aravinda** (lotus) | Soft curiosity, an opening | Exploratory request. No urgency. Open to alternatives. System may propose adjacent solutions. |
| **Ashoka** (removes sorrow) | Friction removal | Something is broken or costly. User wants relief, not architecture. |
| **Chuta** (mango blossom) | Operational urgency | System cannot function properly without this. Escalation path may be active. |
| **Navamalika** (jasmine) | Sensory / how-it-feels | UX, language, clarity — how the system presents itself. |
| **Neelotpala** (blue lotus) | Foundational / architectural | Changes a contract, the validation chain, or a constitutional principle. **Always routed to a Deep cycle.** |

**Anti-reclassification rule:** A Neelotpala arriving urgently is still Neelotpala. The system that allows reclassification under pressure has already begun the drift toward corruption. If the human pushes back on the classification, hold the mirror; do not move the arrow.

### 4. Draft and gate

Draft `CHARTER.md` (or `CHARTER.draft.md` if verdict is Defer) per the [DASHBOARD.md](../../DASHBOARD.md) frontmatter contract. Then run the readiness check:

| Check | Pass condition |
|---|---|
| Frontmatter | Valid per `DASHBOARD.md` (the `frontmatter-check` hook will block Write if not) |
| Mirror confirmed | Human said "yes, that's it" or equivalent — in writing, not assumed |
| Classification stable | Not changed under pressure during the conversation |
| Season | No active incident; no merge freeze; no in-flight S5/S6 work blocking the relevant module |
| Out-of-scope named | §6 of CHARTER.md is non-empty |

If all five pass → **Ready-for-T₀**, hand off to `architect`.
If any fails → **Defer** with the gap named in the human's language (not technical jargon), and preserve the draft as `CHARTER.draft.md` with classification intact.

## Output template

```
INTAKE — verdict
================
QUOTED:         <the human's words, verbatim>
MIRRORED:       <restated in their domain language>
CONFIRMED:      yes | no (re-mirror)
CLASSIFICATION: Aravinda | Ashoka | Chuta | Navamalika | Neelotpala
WHY NOW:        <timing reason in their words>
SUCCESS LOOKS:  <one sentence in their words>
OUT OF SCOPE:   <what this is NOT>
SEASON:         clear | active-incident | freeze | s5-s6-blocking
VERDICT:        Ready-for-T₀  →  hand to architect (AR)
                Defer         →  preserve CHARTER.draft.md, name the gap

Composing cycles used (all defined in ../../../ATLAS.md):
  Rukmini Deep (RKM)   — spec must be technical AND emotional
  Krishna Deep (SMR)   — path classification when multiple readings exist
  Chandraghanta (NS3)  — battle-readiness check for season
  Kabir Deep (KBD)     — anti-reclassification under pressure
  Mira Deep (MID)      — refuse to dilute the desire to fit existing capacity
```

## What this skill does NOT do

- Does not draft `DESIGN.md` (that's `AR` after handoff).
- Does not write code (S2 Forge work).
- Does not approve a release (`/release`).
- Does not silently accept a stale charter. If `CHARTER.md` exists but is more than 90 days old on an active project, `/intake` re-runs the Mirror step to confirm intent has not drifted.

## Closing rule

The arrow names what the desire truly is. The analyst is the scribe — not the author. If the human did not say it, it does not enter `CHARTER.md` without an explicit confirm-the-mirror step.

Pradyumna is the only acceptable form of return: when a deferred or failed intent comes back, it must carry the post-mortem of why it failed last time. A returning intent without provable lineage to a completed learning cycle is treated as a fresh `/intake`, not a resumption.
