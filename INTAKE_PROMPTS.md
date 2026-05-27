# INTAKE_PROMPTS — The Grooming Question-Bank

> The questions the `analyst` asks at pre-T₀ to shape unarticulated human desire into evidence the rubric can score.
>
> **Ground truth this rests on:** [.claude/agents/analyst.md](.claude/agents/analyst.md) (the role), [.claude/skills/intake/SKILL.md](.claude/skills/intake/SKILL.md) (the procedure), [Q_RUBRIC.md](Q_RUBRIC.md) (the stop-condition).
>
> **Form principle:** Questions are prose. Open-ended elicitation. Multi-choice questions close the field of desire prematurely. Reserve binary/choice prompts for genuine stack or tool selections — never for intent.

---

## §1 — What this file is and is not

**Is:**
- The runtime fuel for the `analyst` role and the `/intake` skill.
- A branching question-bank organized in five tiers.
- The Shakti pole of pre-T₀ (active elicitation) — paired with [Q_RUBRIC.md](Q_RUBRIC.md) which is the Shiva pole (witnessed measurement).

**Is not:**
- A script to be read verbatim. The wording adapts; the *tier* and the *target axis* do not.
- A questionnaire to be sent. These questions live in conversation, not in a form.
- An exhaustive list. If a human's words demand a question not listed here, ask it — and propose adding it via Kabir Gate.

---

## §2 — The five tiers

| Tier | Job | When asked | Q-axes it gathers |
|---|---|---|---|
| 0. Reception | Surface raw expression without framing | Always (open of every intake) | `authenticity` |
| 1. Disambiguate | Place the desire on the FiveArrows | Once Tier 0 yields signal | `craft`, branch-specific axes |
| 2. Mirror | Confirm the reflection is correct | Before every classification commit | `authenticity` (the *dharmic confirm* gate) |
| 3. Completeness | Fill rubric axes still under threshold | Rubric-driven; only for axes under floor | The specific axis being filled |
| 4. Readiness | Test whether the season can hold this work | Just before Ready-for-T₀ verdict | (season check, not Q) |

Tier order is not negotiable: each tier presumes the prior one's confirmation. Skipping a tier is exactly the failure the Kabir Gate catches.

---

## §3 — Tier 0: Reception (do not lead)

**Job:** Receive the unstructured expression in the human's own language. The questions here must not project a frame.

- *"Tell me what brought you here, in your own words."*
- *"If nothing changed, what would be missing six months from now?"*
- *"What were you doing right before this thought arrived?"*

**Listening protocol:** Quote the first articulation verbatim. Hold silence when the human pauses. Do not paraphrase. Do not translate into technical terms.

**Evidence gathered:** `authenticity` — the *form* of the answer reveals whether the desire is theirs or borrowed. A borrowed desire arrives in jargon; an authentic one arrives in particulars.

**Anti-pattern:** Offering *"is it X, Y, or Z?"* in Tier 0. This closes the field of desire before it has opened. Multi-choice belongs nowhere near intake.

---

## §4 — Tier 1: Disambiguate the longing (FiveArrows branch)

**Job:** Place the desire on the FiveArrows classification (see [.claude/skills/intake/SKILL.md:50-62](.claude/skills/intake/SKILL.md#L50-L62)). Branch on the signals in Tier 0.

### Branch selection (read the Tier 0 transcript)

| If the human's words contain… | Branch | Opening follow-up |
|---|---|---|
| pain / cost / "we got burned" / "this hurts" | **Ashoka** (removes sorrow) | *"What does it cost you each time this happens? How often does it happen?"* |
| daily-ops blockage / "I can't get past this" / "blocks the team" | **Chuta** (operational urgency) | *"Walk me through the last moment this blocked work. Who else was blocked?"* |
| feel / read / sound / "feels off" / "doesn't sit right" | **Navamalika** (sensory) | *"Show me what feels wrong. What would feel right?"* |
| principle / contract / boundary / "this changes what we are" | **Neelotpala** (foundational) | *"What used to be true that won't be true after this lands?"* |
| curiosity / "what if" / "I wonder if" / opening | **Aravinda** (lotus) | *"What alternatives are you holding open? What would make you abandon this thread?"* |

### Branch-specific deepening

**Ashoka follow-ups:**
- *"When was the last time this didn't happen? What was different then?"*
- *"If we removed the pain but not the cause, would that be enough?"*

**Chuta follow-ups:**
- *"What workarounds exist today? What do they cost?"*
- *"Is the urgency in the system, or in someone's calendar?"* (catches manufactured urgency)

**Navamalika follow-ups:**
- *"Who is the audience for this feeling? Whose experience are we shaping?"*
- *"If you described it to someone outside the team, what word would they use?"*

**Neelotpala follow-ups:**
- *"Which other systems depend on the assumption that's changing?"*
- *"Who needs to know before this lands? Who needs to consent?"*

**Aravinda follow-ups:**
- *"What would make this curiosity a commitment?"*
- *"What are you NOT curious about that this is adjacent to?"*

**Anti-pattern:** Reclassifying a Neelotpala as Chuta under time pressure. *The arrow names what the desire truly is. That truth cannot be changed by the desire itself.* If the human pushes back on the classification, hold the mirror; do not move the arrow. See [.claude/skills/intake/SKILL.md:62](.claude/skills/intake/SKILL.md#L62).

---

## §5 — Tier 2: Mirror confirmation

**Job:** Reflect the desire in the human's own domain language and wait for explicit confirmation.

**The single prompt:**

> *"What I'm hearing is: \<restatement in their language\>. Is that right, or have I missed something?"*

**Rules:**
- The restatement quotes the human's particulars; it does not paraphrase into your frame.
- The mirror is not accepted until the human says *"yes, that's it"* or equivalent — **in writing, not assumed**.
- If they correct you, re-mirror. Repeat until confirmed.

**Anti-pattern:** Drafting `CHARTER.md` before the mirror is confirmed. The analyst is a scribe, not an author. A confirmed mirror is the only signature that authorizes scribing.

---

## §6 — Tier 3: Rubric-driven completeness sweep

**Job:** Fill the Q-axes that the T₀ Q-minima clause requires but the conversation so far has not supplied evidence for.

**Loop:** For each axis where the current rubric score is below the T₀ floor, ask the matching prompt. **Skip axes that are already saturated** — asking saturated axes is theater.

| Axis | Prompt |
|---|---|
| `craft` | *"If a stranger read one sentence about this work, what should it say?"* |
| `endurance` | *"If this takes six weeks longer than you hope, what would you still want?"* |
| `standard` | *"What would 'good enough' look like that you would refuse?"* |
| `patience` | *"What corner are you willing to NOT cut, even under pressure?"* |
| `constraint` | *"What constraints must absolutely hold — even if everything else gives?"* |
| `authenticity` | *"Is this what you want, or what someone else wants through you?"* |
| `precision` | *"If you had one sentence of acceptance criteria, what would it be?"* |
| `fit` | *"Is there something close-enough already in the ecosystem? Why isn't that enough?"* |

**Stop condition:** When all axes required by T₀ Q-minima reach their floor in [Q_RUBRIC.md](Q_RUBRIC.md), Tier 3 is complete. Moving on without saturation is exactly the *Gorakhnath-the-book-reciter* failure the kit's Kabir Gate exists to catch.

---

## §7 — Tier 4: Readiness / Defer

**Job:** Determine whether the season can hold this work, independent of the desire's quality.

- *"What's happening in the wider system that could block this from landing?"*
- *"Is anyone freezing changes in this area?"*
- *"What does success-at-the-wrong-time look like?"*
- *"Who else is doing work that would conflict, and is their work in flight or scheduled?"*

**Verdict logic:**

| State of the system | Verdict | Action |
|---|---|---|
| No incident, no freeze, no S5/S6 conflict | **Ready-for-T₀** | Hand off to `architect` |
| Active incident (T_prarabdha in flight) | **Defer** | Preserve as `CHARTER.draft.md`; revisit when incident clears |
| Merge freeze | **Defer** | Preserve as `CHARTER.draft.md`; revisit when freeze lifts |
| Conflicting S5/S6 work in same module | **Defer** | Preserve as `CHARTER.draft.md`; revisit when deprecation completes |

**Defer is not failure.** It is the Sannyasa-quality recognition that timing is a constraint too. The charter survives; the moment does not.

---

## §8 — How to use this file

1. **Conductor:** [.claude/agents/analyst.md](.claude/agents/analyst.md) — when to invoke each tier.
2. **Procedure:** [.claude/skills/intake/SKILL.md](.claude/skills/intake/SKILL.md) — the four-cycle structure that surrounds the tiers.
3. **Fuel (this file):** The actual prompts, organized by tier and target axis.
4. **Stop-condition:** [Q_RUBRIC.md](Q_RUBRIC.md) — what "complete enough" means in numbers.

The four files compose: conductor + procedure + fuel + stop-condition = `/intake` made honest.

---

## §9 — Anti-patterns (Kabir Gate)

- **Asking out of tier order.** Tier 3 questions arriving before Tier 0 is complete will reshape what Tier 0 surfaces. Order is the discipline.
- **Multi-choice in Tier 0 or 1.** *"Is it X, Y, or Z?"* projects your frame onto unformed desire. Reserve binary/multi-choice for genuine stack/tool/binary picks, never for intent.
- **Skipping Tier 2.** Drafting before the mirror is confirmed produces a charter that documents *your* reading, not the human's intent. The mirror is the only signature that authorizes scribing.
- **Asking saturated axes in Tier 3.** Theater. Read the rubric scores before asking. If the axis is already at floor, do not ask.
- **Treating Defer as failure.** Defer is dharmic. Forcing Ready-for-T₀ during freeze or incident is the failure mode the kit exists to prevent.
- **Inventing scope.** If the human did not say it, it does not enter the charter. The analyst is a scribe. See [.claude/agents/analyst.md:82](.claude/agents/analyst.md#L82).

---

## §10 — What this file does NOT do

- Does not score (Q_RUBRIC.md does that).
- Does not draft CHARTER.md (the analyst does that, using these prompts as input).
- Does not handle post-T₀ work (`architect` / `engineer` roles do that).
- Does not include domain-specific elicitation. Domain-specific intake prompts (e.g. for fintech, healthcare, infra) belong in `shastras/<domain>/INTAKE.md`, not here. This file is tech-agnostic per the kit's vocabulary law.
