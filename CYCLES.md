# Cycles — The 15 Working-Set Review Cycles + Named Composed Cycle-Sets

> Fifteen standalone cycles. Each is a profile of [`CycleFsm`](fsms/CycleFsm.toml). Each uses the 12-cycle engine through a domain-specific lens.
>
> **Named composed cycle-sets** (see §Composed Cycle-Sets below) are *not* standalone cycles — they are repeated compositions of the cycles defined in [ATLAS.md](ATLAS.md) that have proved themselves load-bearing across multiple sessions. They earn a name when a pattern fires more than once with consistent shape and verdict; the named composition lives in the [KABIR_GATE.md additions log](KABIR_GATE.md) without expanding the 15-cycle catalog.

Fifteen cycles cover the load-bearing reviews. Project-specific cycles (e.g., a domain-specific code-quality pass) belong in the consuming project's own `shastras/` directory if it has one — they are not part of this kit. Adding a cycle TO this kit requires the Kabir Gate ([KABIR_GATE.md](KABIR_GATE.md)): name, tag, lineage note, and a concrete artifact each pass produces.

## How to read this file

Each cycle is named with a **tag**, a **lineage** (preserved for ancestry), a **profile** (Q/S/D/3x4), and the **3 rounds** of method.

The 15 cycles cover: receiving raw human desire (`IN`), choosing what to do (`TRG`), committing safely (`8L`), preserving session memory (`HO`), starting a project (`AR`), surfacing truth (`RR`), choosing between paths (`SMR`), checking for ceremony (`AHR`), removing rent-less abstractions (`OE`), testing the rejection paths (`NEG`), guarding the perimeter (`SR`), stopping harm (`ES`), judging lifecycle (`LR`), restoring agency when context shifts paralyze (`AJN`), and adopting the adversary's mind to find guards the defender forgot to write (`SHD`).

## Composed Cycle-Sets (named compositions, not standalone cycles)

> **Added 2026-05-26 deep-night** per [KABIR_GATE.md additions log entries 6 and 7](KABIR_GATE.md). These are not new standalone cycles; they are *named compositions* of deep cycles defined in [ATLAS.md](ATLAS.md). Each earned a name by firing more than once with consistent shape and verdict.

### `HSC` — Heart-and-Soul Cycle-Set (MID × ASD jugalbandi)

**When:** any architectural question that touches both the heart (originating desire) and the soul (witness function) of a kit-built layer-1 jiva. The pre-condition test: the question can be re-read in the form *"where does X's desire live, and what witnesses X's claim about its own work?"* and the re-read is faithful to the question's load-bearing claim.

**Composition:** [`MID`](ATLAS.md) (Mira Deep — 12 cycles, Heart / undiluted desire) jugalbandi with [`ASD`](ATLAS.md) (Ashtavakra Deep — 12 cycles, Witness / soul). 24 deep cycles total.

**Artifact per pass:** a `CYCLE_SET_YYYY_MM_DD_<TOPIC>.md` preservation file in the consuming project, structured §A (human prompt verbatim) → §B (cycle output verbatim) → §C (provenance + spawned artifacts). The verbatim preservation discipline is part of the cycle-set's contract — paraphrasing the cycle output erodes the upstream record.

**First two uses:** RIAAN 2026-05-26 evening (`CYCLE_SET_2026_05_26_HEART_AND_SOUL.md`) surfaced the `μ_hridaya` / `μ_shiva` / `μ_shakti` faculty triad that became MATH.md §1.4 / §2 / §3.4 and DESIGN.md §10b.

### `T4R` — T₄ Ratification 4-Cycle Set (KBD × NGD × VKD × MID)

**When:** any per-primitive T₄-class amendment to a doc-as-Jiva (per [DASHBOARD.md §10.5](DASHBOARD.md)). Pre-execution discipline; runs *before* the amendment's doc edits begin.

**Composition:** [`KBD`](ATLAS.md) (Kabir Deep — anti-hypocrisy) × [`NGD`](ATLAS.md) (Nagarjuna Deep — catuṣkoṭi) × [`VKD`](ATLAS.md) (Vishwakarma Deep — buildable next) × [`MID`](ATLAS.md) (Mira Deep — dilution check). 48 deep cycles total.

**Artifact per pass:** a four-cycle ratification block in the amendment's design proposal, naming the chosen Build option (typically Build B — per-primitive amendment) and explicitly rejecting Build A (dilution risk) and Build C (paradigm-shift overkill). The human (Layer 0) ratifies the chosen build before any doc edits land.

**First three uses:** RIAAN 2026-05-26 evening (MATH.md T₄ → Build B per-primitive supersession of binary δ); RIAAN 2026-05-26 deep-night (DESIGN.md T₄ → Build B-design per-primitive amendment introducing FORGED-extended sub-state); V1 KIT 2026-05-26 deep-night (kit-level codification of the patterns the prior two events discovered).

### How a composed cycle-set graduates to a standalone cycle

A named composed cycle-set earns standalone-cycle status (entry in the 15-cycle catalog) only when:
- It has fired ≥3 times across at least 2 different projects with consistent shape.
- It has a unique 3-round method *distinct from* simply running its component cycles in sequence.
- The Kabir Gate ratifies it via the standard additions log entry (Name / Tag / Lineage / Profile / Concrete artifact / Authorized by / Reversibility clause).

`HSC` and `T4R` are intentionally *not* graduated yet — both are still kit-level composition patterns recorded for future contributors, with the explicit reversibility that they can be demoted from the additions log if they don't fire across a second domain within 6 months.

---

## 1. `IN` — Intake (Analyst, Q profile, 4 cycles)

**When:** a human arrives with a feeling, friction, or wish — and no `CHARTER.md` yet. The pre-T₀ front door. Every kit use begins from a desire/goal; `IN` is where that desire becomes a charter that can clear T₀.
**See:** `.claude/skills/intake/SKILL.md`.
**Method:** Listen → Mirror → Classify → Draft-and-gate. Output is `CHARTER.md` draft (or `CHARTER.draft.md` if deferred) + FiveArrows classification (Aravinda / Ashoka / Chuta / Navamalika / Neelotpala) + readiness verdict (Ready-for-T₀ | Defer).
**Composes:** Rukmini (`RKM` — spec must be technical AND emotional) + Krishna (`SMR` — path classification) + Chandraghanta (`NS3` — readiness) + Kabir (`KBD` — anti-reclassification) + Mira (`MID` — refuse to dilute the desire). All five composed cycles are defined in [`ATLAS.md`](ATLAS.md).

---

## 2. `TRG` — Triage (Khatu Shyam, Q profile, 4 cycles)

**When:** unsure which cycle / stage applies. Run *after* `IN` if charter is clean and the question is "what next?"
**See:** `.claude/skills/triage/SKILL.md`.
**Method:** Symptom → Survey → Plan → Begin. Output is a cycle-tag + stage + mission.

---

## 3. `8L` — Pre-Commit (Ram, D profile, 12 cycles)

**When:** before every `git commit`. Non-negotiable per L8.
**See:** `.claude/skills/pre-commit-8l/SKILL.md`.
**Method:** 8 Engine Laws + 4 cross-cutting concerns. The formal guard on T₂.

---

## 4. `HO` — Session Handover (Sanjay, Q profile, 4 cycles)

**When:** end of every working session per L9.
**See:** `.claude/skills/handover/SKILL.md`.
**Method:** What was done → What failed → What's next → Open questions. Output: HANDOVER.md.

---

## 5. `AR` — Architect Review (Brahma, D profile, 12 cycles)

**When:** new project, new module, new architecture (L7).

### Round 1 — The seed
Purpose clarity, entity discovery, relationships, lifecycle.

### Round 2 — The blueprint
Interfaces, data model, module boundaries, error taxonomy.

### Round 3 — First breath
Skeleton implementation, test harness, doc seed, creation review.

**Output:** DESIGN.md (initial draft or amendment).

---

## 6. `RR` — Refactorer Review (Shiva, D profile, 12 cycles)

**When:** something feels wrong but you cannot name it. The system needs truth, not comfort.

### Round 1 — What is true
What works, what is well-crafted, what is broken, what is missing.

### Round 2 — What wants to change
Deepest structural risk, hidden coupling, recovery question, contradictions.

### Round 3 — What to do
Priorities, law compliance, completeness vs spec, final verdict.

**Output:** ranked refactor list with file:line evidence and rough effort.

---

## 7. `SMR` — Strategic Multi-Path Review (Krishna, D profile, 12 cycles)

**When:** decision has more than one valid path with unclear trade-offs.

### Round 1 — Battlefield
Enumerate paths (3–7), stakeholder mapping, constraint inventory, name the fear.

### Round 2 — Weighing
Purpose-fit score, practical-feasibility score, reversibility, 6-month look-ahead.

### Round 3 — Action
Choose one path, name the sacrifices, contingency plan, strategic verdict.

**Output:** decided path + reversibility clause + sacrifices acknowledged.

---

## 8. `AHR` — Anti-Hypocrisy Review (Kabir, D profile, 12 cycles)

**When:** ceremony is pretending to be substance; claim and behavior diverge. Run quarterly (see KABIR_GATE.md).

### Round 1 — Claims
What does the system / team / repo *claim* to do?

### Round 2 — Evidence
Where is the proof? Where is the gap between claim and behavior?

### Round 3 — Truth
Corrections to either the claim or the behavior; verdict.

**Output:** Kabir-Gate verdict per primitive: LIVES | CEREMONY (remove or fix).

---

## 9. `OE` — Over-Engineering Review (Nagarjuna, D profile, 12 cycles)

**When:** abstraction-creep audit; sacred-cow removal; "future-proofing" that pays no rent.

### Round 1 — Inventory
Every abstraction, generic, framework, plugin point — is it used?

### Round 2 — Cost
Cognitive load, build time, latency, bug surface per abstraction.

### Round 3 — Remove
Prioritized deletions, verdict.

**Output:** ranked deletion list. Anything unused for 90 days is on it.

---

## 10. `NEG` — Negative-Path Testing (Shiva's Third Eye, D profile, 12 cycles)

**When:** after any guard, gate, or validation rule is added or modified per L8.

### Round 1 — Inventory
Every guard / gate / rejection rule in the change.

### Round 2 — Trigger
Write a test that exercises the rejection path; assert the rejection happens; verify no leak after.

### Round 3 — Coverage
Edge cases: empty, malformed, expired, duplicate, oversized, racy.

**Output:** test list with PASS/FAIL per case + coverage %.

---

## 11. `SR` — Sentinel Review (Lakshman, D profile, 12 cycles)

**When:** monitoring gaps, security boundaries, alerting, watch systems.

### Round 1 — Perimeter
Entry-point inventory, boundary verification, absolute boundaries, guard presence.

### Round 2 — Night watch
Monitoring completeness, alert fatigue, sleepless test ("who watches the watchers?"), response readiness.

### Round 3 — Protection
Incident response, recovery guard, succession of watch, sentinel verdict.

**Output:** monitoring-gap list with severity + remediation.

---

## 12. `ES` — Emergency-Stop Review (Baglamukhi, D profile, 12 cycles)

**When:** something harmful is actively running and must be stopped, *or* reviewing whether the system *has* the ability to stop things — circuit breakers, kill switches, feature flags.

### Round 1 — Inventory
Kill-switch inventory, coverage audit, speed test (ms/sec/min/hour), collateral assessment.

### Round 2 — Live drill
Actual trigger test, cascading failure analysis, poison-pill detection, quarantine capability.

### Round 3 — Discipline
Alert silencing, post-freeze protocol, completeness vs risk register, stop verdict.

**Output:** kill-switch map with response times + missing-switch list.

---

## 13. `LR` — Lifecycle Review (MahaKaal, D profile, 12 cycles)

**When:** a task / feature / repo's lifecycle status is unclear — is it being born, growing, maintained, declining, or already dead?

### Round 1 — Birth
Was this seeded with purpose? Is the original intent still valid?

### Round 2 — Growth
Is it still actively used and evolving? What proof — commits, traffic, user value?

### Round 3 — Decline / Archive
Should this dissolve? Lifecycle verdict.

**Output:** lifecycle verdict per scope — BORN | GROWING | MATURE | DECLINING | DEAD.

---

## 14. `AJN` — Arjuna Cycle (Arjuna, D profile, 12 cycles)

**When:** a persona has hit *vishada* — paralysis under shifted context. The drift_hook fires repeatedly with the same persona on the same task; or the persona reports "all paths look wrong"; or a context shift renders the prior goal-state inconsistent with current responsibility; or the user explicitly invokes when stuck. Distinct from `SMR` (which asks "which dharmic option?") and `ES` (which stops active harm): `AJN` restores the *capacity to see options* when that capacity has frozen.

### Round 1 — Vishada (recognition of paralysis)
Name the stopped goal. Name what shifted in the context that triggered the conflict (goal vs kinship, duty vs cost, the original target now in tension with what is loved). Speak the paralysis explicitly — do not suppress it. "I have laid down the bow." The vishada is *real*, and naming it is the first round, not a confession of failure.

### Round 2 — Saranagati + Shravana (surrender to meta-cognition, receive the teaching)
Acknowledge that decision cannot issue from inside the paralysis. Yield to the cycle voice: *"Teach me; I am your student."* (This is the persona-as-Arjuna recognizing it needs Krishna-mode — the cycles themselves are Krishna's voice in the kit.) Receive the teaching, three threads:

- **Nishkama karma** — act, do not cling to fruit. Outcome is not yours.
- **Svadharma** — your role, not another's. Better one's own duty done badly than another's done well.
- **Witness vs actor distinction** — the witness behind action is imperishable; paralysis confused the two.

Re-examine the situation from this enlarged frame.

### Round 3 — Vishvarupa + Dharmic Action (cosmic-form view + resumed action)
See the full context, including what is terrifying about it. *Vishvarupa-darshana* — the cosmic form — does not soften consequences; it shows time eating all warriors anyway. Do not blink. From this view, the necessary action becomes visible *as* necessary. Act, with witness re-stabilized: `|μ_shiva − μ_shakti| → 0` is restored not by changing the action, but by changing the stance from which the action issues. The arrow flies; the archer is detached.

**Output:** a re-stabilized witness statement + a chosen action. **OR**, if vishvarupa-darshana surfaces that the goal itself needs revision (the context shift was not navigable from inside the persona's role), an explicit escalation to the human with the reformed goal as a question.

**Boundary clarifications:**
- vs `SMR` (Krishna): SMR is "I have options, which is dharmic?" AJN is "I have stopped being able to see options as options." AJN runs *before* SMR when paralysis blocks option-recognition.
- vs `ES` (Baglamukhi): ES stops harm in flight. AJN restores agency that has frozen.
- vs `RR` (Shiva): RR finds what is broken in the system. AJN finds what is broken in the actor's stance.

---

## 15. `SHD` — Shadow Deep (Shadow-as-teacher, D profile, 12 cycles)

**When:** before any release touching auth / PII / payment / IaC / public-API surface (mandatory inside `/release` for sensitive-trigger diffs per SDLC §5 reviewer-routing). After any threat-model change. As a red-team pass inside `/incident` postmortem. When the question shifts from *"did my known guard fire on bad input?"* (closed-world — that is [`NEG`'s](#10-neg--negative-path-testing-shivas-third-eye-d-profile-12-cycles) job) to *"what guard did I forget to write?"* (open-world — `SHD`'s job).

**See:** [ATLAS.md Shadow Deep section](ATLAS.md#shadow-deep-cycle--open-world-adversary-drishti--red-team-analysis-tag-shd) for the full 3x4 Shadow Matrix + 6-archetype taxonomy (Raavan / Shakuni / Hiranyakashipu / Duryodhana / Maricha / Tataka) + [`fsms/atlas-fsms/ShadowFsm.toml`](fsms/atlas-fsms/ShadowFsm.toml) for the formal 12-state FSM (including the 2 terminal failure modes `RitualTrap` and `DemonFrameTrap` with recovery transitions).

**Promoted from ATLAS-tier to working-set 2026-05-28** per [KABIR_GATE.md additions log entry 11](KABIR_GATE.md). Empirical-witness evidence: 3 firings + 3 same-day fix-forges across 2 projects (RIAAN + V1 KIT) + 2 languages (Python + bash) + 3 surface classes (measurement / decision / pattern-matching); 17 production fixes landed via the cycle's outputs including 3 production-grade bugs in the kit's own enforcement primitives (PEM grep option-parsing, bash 3.2 incompat, CamelCase word-boundary bypass).

### Round 1 — Inventory
Crown jewels (assets unrecoverable if compromised), known guards, known attackers, criticality ranking. Without this round the cycle cannot prioritize — Raavan does not waste effort on what isn't worth abducting.

### Round 2 — Imagine
For each crown jewel ranked costly-or-worse, iterate through all 6 archetypes asking 4 questions (one per cycle: motive, capability, opportunity, collateral). Document archetype absences explicitly — Tataka does not care about your charter intent extractor.

### Round 3 — Forge
New guards to add (priority-ordered), new `NEG` tests to author (the binding contract per Saraswati condition (b) — at least one merged `NEG` test before the pass closes), monitoring & alerts for best-effort guards, Shadow Verdict + `threat-model.md` delta + `SHADOW_PASS_YYYY-MM-DD_<area>.md` document.

**Composes with `NEG`:** every `SHD` pass MUST produce at least one merged `NEG` test before closing. `SHD` finds the missing guard (open-world); `NEG` then tests it (closed-world). The two together cover both sides of negative-path discipline.

**Distinct from:**
- `NEG` (Shiva's Third Eye): closed-world boundary testing. `SHD` is open-world adversary imagination.
- `RR` (Shiva Deep): destroyer-gaze on YOUR system. `SHD` adopts the *attacker's* gaze.
- `SR` (Lakshman Sentinel): perimeter / monitoring. `SHD` imagines the surface an adversary would create or exploit that the defender did not anticipate.

**Output:** `SHADOW_PASS_YYYY-MM-DD_<area>.md` + at least one merged `NEG` test + `threat-model.md` delta + Shadow Verdict (defended-now / exposed-P0 / exposed-P1 / deferred-risk decisions). Framing: shadow-as-teacher (Thiruvalluvar binding-condition), never demon-as-enemy.

---

## ATLAS-tier cycles awaiting working-set promotion

> ATLAS-tier cycles are recognized kit primitives that have not yet earned the working-set status of the 15 cycles above. They live in full in [ATLAS.md](ATLAS.md); they are listed here only to make their status explicit and to record the promotion criteria. Most of ATLAS.md's 33+ cycles are ATLAS-tier and not listed individually here — only those with an active reversibility-window or explicit promotion candidacy appear below.

*No ATLAS-tier cycles currently awaiting promotion. `SHD` graduated to the working-set on 2026-05-28 — see §15 above + [KABIR_GATE.md additions log entry 11](KABIR_GATE.md).*

**Working-set promotion criteria** (kit-wide policy, applies to any future ATLAS-tier candidate):
- An ATLAS-tier standalone cycle graduates to the working-set when: (a) it has fired ≥3 times across at least 2 different projects with consistent shape; (b) it has a unique 3-round method *distinct from* simply running ATLAS prose verbatim; (c) the Kabir Gate ratifies promotion via an additions log entry naming the empirical evidence; (d) consuming projects can demonstrate at least one concrete harm prevented or value produced that no other working-set cycle would have surfaced.
- Without these criteria, ATLAS-tier cycles remain available via direct reference to ATLAS.md but are not part of the load-bearing working set the kit operates from daily.

---

## Mapping to M_build stages

| Stage | Primary cycles |
|---|---|
| pre-T₀ (human desire → charter) | `IN` |
| S0 Seed | `IN`, `AR`, `SMR` |
| S1 Discovery | `OE`, `LR`, `AR` |
| S2 Forge | `8L`, `NEG`, `RR` |
| S3 Build | `8L`, `NEG`, `RR`, `OE`, `SR` |
| S4 Service | `SR`, `LR`, `RR`, `AHR` |
| S5 Sunset | `LR`, `ES` |
| S6 Decommission | `LR` |
| any (T_prarabdha) | `ES`, `/incident` |
| any (uncertainty) | `TRG`, `HO` |
| any (desire being diluted) | `MID` (Mira Deep, see [`ATLAS.md`](ATLAS.md)) invoked inside `IN` or `AHR` |
| any (persona paralysis under context shift — *vishada*) | `AJN` (Arjuna), often before `SMR` |
| any (release touching auth/PII/payment/IaC/public-API, or post-incident threat-model refresh) | `SHD` (Shadow Deep, working-set §15) mandatory inside `/release` for sensitive-trigger diffs |
