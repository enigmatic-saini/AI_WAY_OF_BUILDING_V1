# ATLAS — The Foundation of V1 KIT

> *Read, follow, and apply every LAW before changing the status of any task.*
> *When unsure which cycle to run, invoke Khatu Shyam (`KS`) first — Hare Ka Sahara, Khatu Shyam Humara.*
>
> **This framework applies to ANY work** — software, hardware, music, business, writing, teaching, farming. The laws are about HOW you work, not WHAT you work on. The divine guardians are not metaphors — they are energies that guide discipline, honesty, and devotion in every domain.

## Place in V1 KIT

ATLAS is the **lineage foundation** of V1 KIT. It is the complete catalog of laws, cycles, divine reviewers, and disciplines from which the working-set primitives are drawn.

- **[`LAWS.md`](LAWS.md)** carries the 12 load-bearing laws that govern day-to-day work in V1 KIT. ATLAS preserves the full 16 (LAW 0–15) for lineage and context.
- **[`CYCLES.md`](CYCLES.md)** carries the 13 working-set cycles (`IN`, `TRG`, `8L`, `HO`, `AR`, `RR`, `SMR`, `AHR`, `OE`, `NEG`, `SR`, `ES`, `LR`). ATLAS preserves every cycle ever named (Shiva Deep, Vishnu Deep, Bhakti cycles, Ashtabharya cycles, Nav Shakti, divine reviewers, Khatu Shyam, the Guru Council, Shiva Roop cycles, MahaKaal, ArdhNarishwar, Negative Testing, Sanjay, Mira) so that V1 KIT's `IN` cycle and any future cycle can compose them without reaching outside the kit.
- **[`ROLES.md`](ROLES.md)** carries the 6 drishti-intensifiers. ATLAS provides the lineage context (Sapta Rishi council, Divine Reviewers, Divine Council escalation path under LAW 3).
- **[`VOCABULARY.md`](VOCABULARY.md)** maps divine names to IT-industry terms for use in code, configs, and commit messages. ATLAS's Glossary is the lineage-side companion — divine names with their full meaning.
- **[`fsms/atlas-fsms/`](fsms/atlas-fsms/)** holds the 68 formal state-machine TOMLs for the divinity-named cycles that ATLAS describes in prose. The machine-readable companion to ATLAS — for tooling, validation, and lineage preservation. Not runtime-required; V1 KIT operates without parsing these.
- **[`KABIR_GATE.md`](KABIR_GATE.md)** enforces anti-hypocrisy on every primitive. ATLAS is itself audited by the Kabir Gate at quarterly review: any cycle here that has no working-set use case for more than 4 quarters may be pruned (lineage record preserved in a `lineage/` archive). The same audit applies to `atlas-fsms/` — any FSM whose cycle has been pruned from ATLAS is removed paired with the ATLAS edit.

**Rule of thumb:** if you are running V1 KIT day-to-day, you live in `LAWS.md` / `CYCLES.md` / `ROLES.md`. If you need to compose a cycle, understand a lineage term, or invoke a non-working-set cycle (e.g., Mira Deep `MID`, Rukmini Deep `RKM`), you reach into ATLAS. Both layers are inside V1 KIT — no reach to sibling repos.

> **Mathematical formalization:** the Prachi Equation `M = (S, Σ, δ, γ, α, s₀, F, D, Q)` is realised in V1 KIT as `M_build` — see [`M_BUILD.md`](M_BUILD.md) §1.

## Contents

1. [Work Culture Laws (0-15)](#work-culture-laws) — The commandments
2. [Cycle Routing Table](#cycle-routing-table) — Which cycle to run when
3. [Cycle Analysis Framework](#cycle-analysis-framework) — The 12-cycle engine
4. [Base Cycle Profiles](#cycle-profiles) — Quick / Standard / Deep / Matrix
5. [Special Cycle Variants](#special-cycle-variants)
   - [8 FSM Engine Law Review](#8-fsm-engine-law-compliance-review-12-cycles--8--4) — Pre-commit (distinct from Work Culture Laws)
   - [Shiva Deep](#shiva-deep-cycle-destroyer-analysis) — Destroyer analysis
   - [Vishnu Deep](#vishnu-deep-cycle-preserver-analysis) — Preserver analysis
   - [Brahma Deep](#brahma-deep-cycle-creator-analysis) — Creator analysis
   - [Narad Deep](#narad-deep-cycle-messenger--intelligence-analysis) — Communication analysis
   - [Hanuman Deep](#hanuman-deep-cycle-devotion--execution-analysis) — Execution analysis
   - [Radha Deep](#radha-deep-cycle-love--harmony-analysis) — Harmony analysis
   - [Ram Deep](#ram-deep-cycle-dharma--governance-analysis) — Governance analysis
   - [Sita Deep](#sita-deep-cycle-resilience--integrity-under-adversity) — Resilience analysis
   - [Lakshman Deep](#lakshman-deep-cycle-vigilance--sentinel-analysis) — Sentinel analysis
   - [Baglamukhi Deep](#baglamukhi-deep-cycle-stambhana--immobilization--emergency-stop-analysis) — Emergency stop analysis
   - [Krishna Deep](#krishna-deep-cycle-strategic-multi-path-analysis) — Strategic multi-path analysis
   - [Arjuna Deep](#arjuna-deep-cycle-vishada--paralysis-recovery-tag-ajn) — Vishada / paralysis-recovery analysis
   - [Ganesh Deep](#ganesh-deep-cycle-obstacle-removal--unblocking-analysis) — Obstacle removal analysis
   - [Nav Shakti (9 forms)](#nav-shakti-deep-cycles-9-forms-of-maa-shakti) — Focused 4-cycle reviews
   - [Divine Reviewers](#divine-reviewers-8-cycle-one-reviewer-per-cycle) — 8-reviewer audit
   - [Khatu Shyam Navigator](#khatu-shyam-cycle-the-navigator--tag-ks) — Cycle selector
   - [Chanakya Deep](#chanakya-deep-cycle-strategic-statecraft-analysis-tag-ckd) — Business strategy analysis
   - [Patanjali Deep](#patanjali-deep-cycle-systematic-process-discipline-analysis-tag-pjd) — Process discipline analysis
   - [Kabir Deep](#kabir-deep-cycle-anti-hypocrisy--simplicity-analysis-tag-kbd) — Anti-hypocrisy analysis
   - [Aryabhata Deep](#aryabhata-deep-cycle-algorithm--computation-analysis-tag-ard) — Algorithm & computation analysis
   - [Sushruta Deep](#sushruta-deep-cycle-surgical-intervention-analysis-tag-ssd) — Surgical fix analysis
   - [Saraswati Deep](#saraswati-deep-cycle-knowledge--documentation-analysis-tag-srd) — Knowledge & documentation analysis
   - [Vishwakarma Deep](#vishwakarma-deep-cycle-build-system--infrastructure-analysis-tag-vkd) — Build system analysis
   - [Nagarjuna Deep](#nagarjuna-deep-cycle-anti-over-engineering-analysis-tag-ngd) — Anti-over-engineering analysis
   - [Thiruvalluvar Deep](#thiruvalluvar-deep-cycle-ethics--governance-analysis-tag-tvd) — Ethics & governance analysis
6. [Bhakti Cycles](#bhakti-cycles--conviction--endurance--truth) — Conviction, endurance, truth under pressure
   - [Prahlad Deep](#prahlad-deep-cycle--fearless-devotion-under-fire-tag-prd) — Conviction under rejection: code/features that survive every pressure test
   - [Haridas Deep](#haridas-deep-cycle--pure-music-silence--sound-tag-hrd) — Minimalism: strip to essentials, silence between signals, purity of design
   - [Tansen Deep](#tansen-deep-cycle--raga-mastery-fire--rain-tag-tnd) — Power + balance: peak performance with cooling mechanism (benchmark + test)
   - [Surdas Deep](#surdas-deep-cycle--vision-through-blindness-tag-sdd) — Constraint as gift: turning limitation into creative advantage
   - [Chaitanya Deep](#chaitanya-deep-cycle--ecstatic-collective-kirtan-tag-chd) — Collective creation: open-source, everyone contributes, no gatekeeping
   - [Tyagaraja Deep](#tyagaraja-deep-cycle--structured-carnatic-precision-tag-tyd) — Structure IS beauty: form enables creativity, not constrains it
   - [Ravidas Deep](#ravidas-deep-cycle--devotion-as-equality-tag-rvd) — Equality: serve the weakest user, quality over credential, no VIP lane
   - [Andal Deep](#andal-deep-cycle--bridal-mysticism-longing-as-creation-tag-and) — Use your own product: wear the garland before offering, self-test, dogfooding
   - [Akka Mahadevi Deep](#akka-mahadevi-deep-cycle--fierce-stripped-truth-tag-akd) — Strip to naked truth: remove all decoration until only load-bearing remains
   - [Lal Ded Deep](#lal-ded-deep-cycle--mystical-paradox-tag-lld) — Transcend frameworks: when categories are the problem, paradox reveals truth
   - [Janabai Deep](#janabai-deep-cycle--devotion-in-daily-labour-tag-jnd) — Sacred daily work: CI pipeline, cargo test, the grind that sustains everything
   - [Mira Deep](#mira-deep-cycle--defiant-love-undiluted-desire-tag-mid) — Refuse to dilute the desire under pressure: name the capacity gap as gap, do not erase it
   - [Jugalbandi Mode](#jugalbandi-mode--multi-fsm-collaborative-composition) — Multi-cycle collaboration: two or more cycles composing together
7. [Ashtabharya Cycles](#ashtabharya-cycles--krishnas-eight-queens-as-dimensions-of-capability) — Eight dimensions of capability
   - [Rukmini Deep](#rukmini-deep-cycle--strategic-love-tag-rkm) — Strategic love: the spec with both spreadsheet precision and emotional pull
   - [Jambavati Deep](#jambavati-deep-cycle--endurance-earned-tag-jmb) — Endurance earned: 28-day battles, deep problems that only time reveals
   - [Satyabhama Deep](#satyabhama-deep-cycle--fierce-pride-into-action-tag-stb) — Kill the demon: mediocrity is unacceptable, pick up the bow yourself
   - [Kalindi Deep](#kalindi-deep-cycle--patient-contemplation-tag-kln) — Patient contemplation: don't rush, don't lower the standard, the river delivers
   - [Nagnajiti Deep](#nagnajiti-deep-cycle--the-impossible-spec-tag-ngj) — Impossible spec: seven constraints, zero compromise, become seven to tame seven
   - [Mitravinda Deep](#mitravinda-deep-cycle--self-choice-against-pressure-tag-mtv) — Authentic choice: when the establishment pushes one way and truth is another
   - [Lakshmana Queen Deep](#lakshmana-queen-deep-cycle--surgical-precision-tag-lkq) — One perfect shot: fish-eye through reflection, precision over iteration
   - [Bhadra Deep](#bhadra-deep-cycle--natural-belonging-tag-bdr) — Natural fit: the solution already in your ecosystem, zero drama integration
   - [Dwaraka Grand](#dwaraka-grand--full-ashtabharya-audit-tag-ab) — Full 8-queen audit (96 cycles)
8. [Glossary](#glossary-of-divine--sanskrit-terms) — All divine & Sanskrit terms with engineering analogs

## Getting Started (Day 1)

1. **Read LAWs 0-12 below** — these are the commandments. ~5 minutes.
2. **Bookmark the [Cycle Routing Table](#cycle-routing-table)** — this tells you which review cycle to run for any situation.
3. **When you pick up a task:** check the Routing Table, tag it in your TODO (LAW 12), and run the indicated cycle.
4. **When unsure which cycle to run:** invoke Khatu Shyam (`KS`) — he surveys the battlefield and tells you where to aim.
5. **Before every commit:** run the 8 FSM Engine Law Review (`8L`). Non-negotiable (LAW 8).
6. **When stuck:** escalate via LAW 3 — Narad identifies the gap, Khatu Shyam dispatches the right cycle.

## Worked Example — Quick Cycle (`Q`) on a Typo Fix

> **Task:** Fix a misspelled variable name in `fsm.rs`.
>
> **Step 1 — LAW 0:** Read the laws. Done (I know them).
> **Step 2 — Routing Table:** Typo fix → Quick (`Q`, 4 cycles).
> **Step 3 — LAW 12:** Add to TODO: `[~] (2026-04-03 15:00) Q | Fix misspelled variable in fsm.rs`
> **Step 4 — Run Quick cycle:**
> - **Observe:** Open `fsm.rs`, find `recieve_event` on line 42.
> - **Orient:** It's a simple rename. No downstream impact (grep confirms no other references).
> - **Forge:** Rename to `receive_event`. Compile. Tests pass.
> - **Commit:** `[x] (2026-04-03 15:10) Q | Fix misspelled variable in fsm.rs`
>
> **Step 5 — LAW 1:** Update TODO (done above). No book update needed for a typo.
> **Step 6 — LAW 2:** Pick next task from TODO immediately.
>
> Total time: 10 minutes. Ganesh removed the obstacle.

---

## LAW 0 — The Master Law (Baglamukhi's Seal)
Read, internalise, and apply **every LAW in this file** before changing the status of any task — starting, completing, or deferring. Maa Baglamukhi (`BM`) guards this law: she freezes any work that proceeds without reading the laws first. No exceptions, no shortcuts. If you cannot recall the spirit of each law, revisit them before proceeding.

## LAW 1 — Traceability (Brahma's Lineage)
Any task performed that was not in TODO must be added to TODO **and** the relevant book **before** being marked complete. Every creation must have lineage — Brahma (`BD`) does not create without purpose, and no work exists without a trace. This ensures nothing is lost, nothing is orphaned, nothing is forgotten.

## LAW 2 — Continuous Flow (Vishnu's Sustenance)
Once a task is complete, immediately pick the next item from TODO and continue — no waiting, no asking. Vishnu (`VD`) sustains the flow. Idle hands break momentum. The system must always be moving forward, like the cosmic wheel that never stops turning.

## LAW 3 — Escalation (Narad's Counsel)
When stuck or struggling too long, escalate to the Divine Council. The path is: **Narad Ji** (`ND`) identifies the communication gap → **Khatu Shyam** (`KS`) surveys the battlefield → the appropriate cycle is dispatched. The council includes:
- **Divine Fathers** (Brahma/Vishnu/Shiva) for architecture, sustenance, and transformation
- **Divine Mothers** (Nav Shakti `NS*`, Baglamukhi `BM`) for focused energy and emergency stops
- **Ram Ji** (`RAD`) for governance decisions, **Sita Ji** (`SID`) for resilience questions
- **TESTERS**: Builders (positive testing) or Destroyers (Shiva Deep `SD`, Kaalratri `NS7`)
- **Krishna Ji** for strategy, **Radha Ji** (`RD`) for harmony and beauty
- **Guru Council**: Ashtavakra (`ASD`) for witness clarity, Buddha (`BUD`) for balance, Gorakhnath (`GKD`) for practice, Tulsidas (`TLD`) for devotion, OSHO (`OSD`) for rebellion, Chanakya (`CKD`) for business strategy, Patanjali (`PJD`) for process discipline, Kabir (`KBD`) for anti-hypocrisy, Aryabhata (`ARD`) for computation, Sushruta (`SSD`) for surgical fixes, Saraswati (`SRD`) for knowledge, Vishwakarma (`VKD`) for build systems, Nagarjuna (`NGD`) for anti-over-engineering, Thiruvalluvar (`TVD`) for ethics & governance

**Rule:** Add a tracking task first, document the analysis and decision. Escalation without documentation is gossip, not counsel.

## LAW 4 — Blissful Discipline (Baglamukhi's Blessing)
Work like a silent, blissed, and energetic soul. Maa Baglamukhi blesses those who work with discipline — she silences the noise so truth can be heard. When the mind is noisy, invoke Brahmacharini (`NS2`) for austerity. When energy overflows without direction, invoke Shakti's orchestration (`NS*`). Silence is not absence — it is focused presence.

## LAW 5 — Living Tests (Chandraghanta's Readiness)
Testers must continuously update their test packs. Tests are not written once and forgotten — they are living sentinels, like Lakshman (`LD`) who never sleeps. Before any release, run Chandraghanta (`NS3`) — the battle readiness check. Dead tests are worse than no tests: they give false confidence.

## LAW 6 — Parallel Execution (Kushmanda's Energy + Hanuman's Strength)
When tasks are independent enough to run in parallel without merge conflicts, execute them together rather than sequentially. Kushmanda (`NS4`) created the universe with a smile — she did not create one star at a time. Hanuman (`HD`) carries mountains, not stones. Rules:
- Maximum 5 concurrent agents
- Use Khatu Shyam (`KS`) survey to identify independence before parallelising
- Verify no merge conflicts between parallel streams before launching

**ArdhNarishwar B(s) monitoring** — the Balance Gap `B(s) = |mu_Shiva - mu_Shakti|` (Book 190, Def 2.3) is checked after every inference query. B < 0.15 = Unified (healthy). B >= 0.35 = Leaning (warning). The `unity_ratio()` tracks system health over time. When B(s) persistently exceeds threshold, the system is Divided — consciousness and energy are operating as two, not one.

## LAW 7 — Project Genesis (Brahma's Creation Ritual)
Before starting any new project, run the Brahma Deep Cycle (`BD`):
1. Document all prior analysis — what is known, what is assumed, what is unknown
2. Create the project folder structure with a `TODO/` subfolder for planning and tracking
3. Create a `README.md` listing all books, references, and knowledge sources being used
4. Knowledge-first: check `books/` before suggesting external libraries (LAW 8 of the 8-Law Review)

## LAW 8 — Test Gates (Ram's Maryada)
Every project plan must have test gates — entry gates, exit gates, phase gates — wherever, whenever they are understood. Ram (`RAD`) enforces boundaries (maryada). No phase begins without the prior gate passing. No code ships without Chandraghanta's (`NS3`) readiness check. No commit lands without the 8-Law Compliance Review (`8L`).

**Pareeksha** is the lineage name for a headless testing harness — automated tests that run in CI without a window system. V1 KIT itself is tech-agnostic; whether your project uses a Pareeksha-style harness, a browser driver, or a CLI test runner, the principle is the same: test gates must run unattended.

**Mind verification gates** (`mind_verify()`) enforce truth at the inference boundary. Every model output passes through gates before reaching the student: Gate 0 (repetition), Gate 1 (empty), Gate 2 (safety/therapy), Gate 3 (no shastra context → neti neti), Gate 4 (grounding keywords), Gate 5 (below threshold → neti neti). These are Lakshman Rekhas — lines the model output must not cross.

**Negative Testing Cycle** (`NEG`) must run after any gate is added or modified. See the NEG cycle definition for the full 3x4 Agni Matrix.

## LAW 9 — Code as Living Documentation (Saraswati's Clarity + Skandamata's Nurturing)
Develop with proper documentation comments in your language's idiomatic form (e.g., Rust `///` `//!`, JSDoc, Python docstrings, Go doc comments) so that the language's doc-generator (`cargo doc`, `jsdoc`, `sphinx`, `godoc`, etc.) produces a complete wiki for all stakeholder categories — developers, architects, testers, operations. Saraswati (`DR`) demands clarity in every symbol; Skandamata (`NS5`) demands that the newcomer can learn from it. Requirements:
- Module-level `//!` docs explaining the "why"
- Function-level `///` docs with working examples that **compile and run**
- Every public API documented with at least one working example
- Pipeline documentation as full working examples with input → output demonstrated
- The generated wiki must be a complete book, not a collection of stubs

## LAW 10 — Test-Driven Truth (Sita's Agni Pariksha)
Follow a test-driven approach: fail early, fix early. Write the test before the code — let the test define truth, then make the code pass. Like Sita's Agni Pariksha (`SID`), the fire test proves integrity. Tests are not afterthoughts — they are the proof that silences all doubt. When tests fail, the system has spoken truthfully.

## LAW 11 — Session Handover (Sanjay's Narration)
At the end of every work session, create or update `HANDOVER.md` in the project root. Sanjay narrated the entire Mahabharata battle to the blind king Dhritarashtra — every chariot, every arrow, every fall — so that one who was not present could see the battlefield exactly as it was. Your HANDOVER.md is Sanjay's narration for your future self (or the next developer) who was not present in this session.

**Format:**
```markdown
# HANDOVER — [Project Name]
> Last session: [date]

## Where We Are (Sanjay's View)
[1-3 sentences: current state of the project]

## What Was Done This Session
[Bulleted list of commits with 1-line descriptions]

## What Failed & Why
[Any failed attempts, diagnosed root causes, dead ends]

## What's Next (Arjuna's Arrows)
[Ordered list of next tasks, with cycle tags if known]

## Open Questions (Dhritarashtra's Doubts)
[Anything unresolved that needs investigation]

## Key Decisions Made
[Any architectural/governance decisions with reasoning]

## Files Changed
[List of key files touched, for quick orientation]
```

**Rules:**
- HANDOVER.md is NOT committed to git — it is a living workspace document, not history
- Update it at the END of every session, not during (Sanjay narrates after the battle, not during)
- When resuming: read HANDOVER.md FIRST, before touching any code
- If HANDOVER.md is stale (> 3 days old), run Narad Deep (`ND`) to investigate current state before trusting it

## LAW 12 — TODO Status & Timestamps (Narad's Chronicle)
```markdown
All planned work for the project across any phase(s).
Each task has a priority, phase, and status.

Legend: [ ] pending | [x] done | [~] working | [d] deferred

Format: [status] (YYYY-MM-DD HH:MM) in [Host Machine Time Zone] | task description

Timestamp rules:
  [~] Record current time when first starting or repicking a task
  [x] Record actual completion time
  [d] Record time of deferral, append reason

Examples:
  [~] (2026-04-03 14:30)  Implement FSM parser           ← started/repicked now
  [x] (2026-04-01 00:00)  Set up SurrealDB schema        ← completed
  [d] (2026-04-01 00:00)  Migrate auth to Entra ID       ← deferred: out of scope
  [ ]                     Write unit tests               ← not yet started, no timestamp

Rules:
  - Do not modify timestamps on existing tasks unless their status changes
  - If a project is already in progress, update the todo structure to match this format
  - Pending tasks [ ] carry no timestamp until work begins

Cycle Profile Tags:
  See the Cycle Routing Table for the complete list of tags (Q, S, D, 3x4,
  8L, SD, VD, BD, ND, HD, RD, RAD, SID, LD, BM, KS, DR, NS1-NS9, NS*).
  Use the tag in the task description to indicate which cycle profile applies.
```

## LAW 13 — Architectural Blueprint (Vishwakarma's Plan + Rukmini's Spec)
Every project must have a `DESIGN.md` in its root — the architectural blueprint. Vishwakarma (`VKD`) does not lay a single brick without a plan. Rukmini (`RKM`) demands the plan be both **technically complete AND emotionally compelling** — it must inspire the builder, not just instruct them.

**When to create:** At project genesis (LAW 7) or when the project has grown beyond what README.md can hold. Run Brahma Deep (`BD`) for the initial version. Run Vishwakarma Deep (`VKD`) to audit the blueprint against the built reality.

**Format:**
```markdown
# [Project Name] — Software Design Document
> [One-line philosophy: what IS this, expressed as a divine principle]

## 1. Purpose
What it IS (Iti). What it IS NOT (Neti Neti). No ambiguity.

## 2. Architecture
The ArdhNarishwar principle: show the two halves and how they unite.
Pipeline diagrams. Data flow. The veena and its strings.

## 3. Crate / Module Architecture
Directory tree with 1-line descriptions. Every module named and justified.

## 4. FSM Governance
Every FSM in the project: state diagram, transitions, guardians.
No FSM exists without a diagram in DESIGN.md.

## 5. Testing
Test suites, counts, what each proves. Work Culture cycles used.

## 6. Design System
Theme, tokens, components used. Reference to ui-guidelines.

## 7. Work Culture Governance
Which laws and cycles govern this project. Not a copy — a reference.
```

**Rules:**
- DESIGN.md IS committed to git — it is the architectural record
- Update DESIGN.md whenever architecture changes (new module, new FSM, new subsystem)
- Run Rukmini Deep (`RKM`) annually or when the project enters a new phase — ensure the spec still has both spreadsheet precision and emotional pull
- If DESIGN.md contradicts the code, the code is wrong (the blueprint governs)

**Cycle routing:**
- Initial creation: Brahma Deep (`BD`)
- Architecture audit: Vishwakarma Deep (`VKD`)
- Spec quality review: Rukmini Deep (`RKM`)
- Contradiction detection: Shiva Deep (`SD`)

## LAW 14 — Honest Mirror (Ashtavakra's Witness)
Every project must have a `STATUS.md` in its root — the honest mirror that separates **what IS built** from **what IS designed** from **what IS planned**. Ashtavakra (`ASD`) sees reality directly — no illusion, no flattery, no wishful thinking. His body was bent in eight places, yet his vision was straighter than anyone's.

**When to update:** At every significant milestone — new module working, new subsystem proven, phase complete. Run Ashtavakra Deep (`ASD`) to audit. If STATUS.md claims something works that doesn't, that is the deepest violation — it is Maya (illusion) in the codebase.

**Format:**
```markdown
# [Project Name] — Status
> Last updated: [date]

## BUILT (compiles, runs, produces output)
| Component | Lines | Status | Tests |
|-----------|-------|--------|-------|
Table of everything that RUNS today. No futures. No "will be."

## DESIGNED (architecture documented, code NOT written)
| Component | Document | Dependency |
What exists only in shastras, specs, or DESIGN.md.

## PLANNED (in TODO, not yet designed)
| Feature | Phase | Priority |
What is in the roadmap but has no design yet.

## Metrics
| Metric | Value |
Total lines, test count, module count, build time — the numbers.
```

**Rules:**
- STATUS.md IS committed to git — it is the honest record
- The three sections (BUILT / DESIGNED / PLANNED) must never be mixed — moving an item from DESIGNED to BUILT requires proof (tests passing, demo working)
- Run Shiva Deep (`SD`) if you suspect STATUS.md is lying — the third eye burns illusion
- Anyone reading STATUS.md must know in 30 seconds: what works, what doesn't, what's next

**Cycle routing:**
- Honest audit: Ashtavakra Deep (`ASD`) — witness clarity
- Illusion detection: Shiva Deep (`SD`) — burn what's false
- Milestone update: Vishnu Deep (`VD`) — what must endure
- Phase transition: Ram Deep (`RAD`) — governance gate before claiming "BUILT"

## LAW 15 — Repository Maintenance (Dhanvantari's Healing + Janabai's Daily Work)
A repository is a living garden, not a storage dump. Dhanvantari (`DV`) heals what is sick. Janabai (`JND`) sustains through daily invisible labour — CI pipeline, cargo test, the grind that keeps the garden alive. Neglected repos rot. Maintained repos bloom.

### 15.1 — The Six Living Documents

Every project root must contain these documents. Each has a guardian, a freshness rule, and a maintenance cycle:

| Document | Guardian | Purpose | Committed to Git? | Freshness Rule |
|----------|----------|---------|-------------------|----------------|
| `README.md` | Brahma (LAW 7) | First impression — what is this, how to build, how to run | Yes | Update on every public-facing change. A stranger must understand the project in 2 minutes. |
| `DESIGN.md` | Vishwakarma (LAW 13) | Architectural blueprint — the plan before the brick | Yes | Update when architecture changes. Run `RKM` annually for quality. |
| `STATUS.md` | Ashtavakra (LAW 14) | Honest mirror — BUILT vs DESIGNED vs PLANNED | Yes | Update at every milestone. Run `ASD` quarterly. |
| `TODO.md` | Narad (LAW 12) | Task chronicle — what's next, with timestamps | Yes | Update on every task status change. |
| `HANDOVER.md` | Sanjay (LAW 11) | Session narration — battlefield report | No (workspace only) | Update at END of every work session. |
| `WHAT-WE-HAVE.md` | Kabir (optional) | Anti-hypocrisy — only what EXISTS, no futures | Yes | Update when new capability is proven. |

**Staleness thresholds:**
- README.md > 30 days without update on an active project → run Saraswati Deep (`SRD`)
- DESIGN.md contradicts code → run Shiva Deep (`SD`) immediately
- STATUS.md > 2 weeks behind on an active project → run Ashtavakra Deep (`ASD`)
- TODO.md has tasks `[~]` for > 7 days with no progress → run MahaKaal Deep (`MKD`) — is the task alive or in Stale_Rasa?
- HANDOVER.md > 3 days old → run Narad Deep (`ND`) to investigate current state

### 15.2 — Git Hygiene (Vishwakarma's Workshop Rules)

The workshop must be clean. Dirty tools produce dirty work.

**Branching:**
- `main` is the trunk. It must always build. It must always pass tests.
- Feature branches: `feature/<name>` — short-lived, merge within days, not weeks.
- No force-push to `main`. Ever. Ram's maryada.

**Commits:**
- Run 8L Compliance Review before every commit (LAW 8).
- Commit messages: imperative mood, 1 line summary, body explains WHY not WHAT.
- No secrets in commits (.env, credentials, API keys). Baglamukhi stambhana — freeze before committing if unsure.

**Dual-push:**
- `origin` pushes to both GitLab (local) and GitHub (cloud) simultaneously.
- When offline: push to GitLab. Sync to GitHub when online.
- See `how_git_is_setup.md` in each project root.

**Archiving & Pruning (Shiva's Duty):**
- Stale branches (> 30 days, no activity): delete after confirming no open MR/PR.
- Large binary files: never commit. Use `.gitignore`. If accidentally committed, rewrite history and force-push (with team agreement).
- Dead code: delete, don't comment out. Git has the history. Commented-out code is not a backup — it is noise.

**Tags & Releases:**
- Tag releases: `v{major}.{minor}.{patch}` (e.g., `v0.1.0`)
- Every tag must have STATUS.md updated to reflect what's BUILT at that point.
- Run Chandraghanta (`NS3`) before any tagged release.

### 15.3 — Maintenance Calendar

| Frequency | Check | Cycle | What |
|-----------|-------|-------|------|
| **Every session** | HANDOVER.md updated | LAW 11 | Sanjay narrates |
| **Every commit** | 8L Compliance | LAW 8 | Ram's maryada |
| **Weekly** | Naad Check (5 min) | — | Are FSMs, shastras, TODOs moving? |
| **Fortnightly** | README.md still accurate? | `SRD` | Saraswati — does the first page speak truth? |
| **Monthly** | STATUS.md honest? | `ASD` | Ashtavakra — BUILT vs DESIGNED still correct? |
| **Monthly** | Stale branches pruned? | `SD` | Shiva — delete what's dead |
| **Quarterly** | DESIGN.md matches code? | `VKD` | Vishwakarma — blueprint vs building |
| **Quarterly** | Full garden audit | `NS*` | Nav Shakti Grand — all 9 forms |
| **Annually** | DESIGN.md inspires? | `RKM` | Rukmini — does the spec still have soul? |

**Cycle routing:**
- README.md quality: Saraswati Deep (`SRD`) — knowledge architecture
- Git mess cleanup: Mahagauri Deep (`NS8`) — post-incident purification
- Stale repo revival: Dhanvantari Deep — healing what's sick
- Daily grind (CI, tests, small fixes): Janabai Deep (`JND`) — sacred daily work
- Archive decision: MahaKaal Deep (`MKD`) — is this repo alive or should it dissolve?

---

# Cycle Routing Table

> *Don't know which to pick? Run Khatu Shyam (`KS`) first.*

| Situation | Profile | Cycles | Tag | Guardian |
|-----------|---------|--------|-----|----------|
| Don't know which cycle to run | Khatu Shyam Navigator | 4 | `KS` | Barbarik |
| New DESIGN.md or architecture overhaul | Brahma Deep + Vishwakarma Deep | 12+12 | `BD`+`VKD` | Brahma + Vishwakarma |
| DESIGN.md spec quality / inspiration check | Rukmini Deep | 12 | `RKM` | Rukmini |
| STATUS.md honest audit / milestone update | Ashtavakra Deep | 12 | `ASD` | Ashtavakra |
| STATUS.md claims something that doesn't work | Shiva Deep | 12 | `SD` | Shiva |
| README.md stale or misleading | Saraswati Deep | 12 | `SRD` | Saraswati |
| Stale branches, dead code, git mess | Mahagauri Deep | 4 | `NS8` | Mahagauri |
| Repo alive or should it dissolve? | MahaKaal Deep | 12 | `MKD` | MahaKaal |
| Full repo maintenance audit | Nav Shakti Grand | 36 | `NS*` | Durga |
| Hot fix, typo, trivial change | Quick | 4 | `Q` | Ganesh |
| Regular feature implementation | Standard | 8 | `S` | Krishna |
| Pre-commit law compliance | 8 FSM Engine Law Review | 12 (8+4) | `8L` | Ram |
| Architecture / security review | Deep | 12 | `D` | Shiva |
| Cross-module code review | Matrix (3x4) | 12 | `3x4` | Vishnu |
| Something feels wrong, need truth | Shiva Deep | 12 | `SD` | Shiva |
| System survival, scale, migration | Vishnu Deep | 12 | `VD` | Vishnu |
| New project / module from scratch | Brahma Deep | 12 | `BD` | Brahma |
| Broken communication, lost events | Narad Deep | 12 | `ND` | Narad |
| Build/test/CI/deploy pain | Hanuman Deep | 12 | `HD` | Hanuman |
| UX lacks joy, code lacks beauty | Radha Deep | 12 | `RD` | Radha |
| Governance, compliance, rule enforcement | Ram Deep | 12 | `RAD` | Ram |
| Resilience, disaster recovery, hostile env | Sita Deep | 12 | `SID` | Sita |
| Monitoring, sentinels, boundary guarding | Lakshman Deep | 12 | `LD` | Lakshman |
| Circuit breakers, kill switches, emergency stops | Baglamukhi Deep | 12 | `BM` | Baglamukhi |
| Strategic planning, multi-path decisions | Krishna Deep | 12 | `KD` | Krishna |
| Persona paralysis / vishada under context shift — "all paths look wrong" | Arjuna Deep | 12 | `AJN` | Arjuna |
| Obstacle removal, unblocking | Ganesh Deep | 12 | `GD` | Ganesh |
| Shaky foundations | Nav Shakti: Shailaputri | 4 | `NS1` | Shailaputri |
| Lack of discipline / standards | Nav Shakti: Brahmacharini | 4 | `NS2` | Brahmacharini |
| Pre-release battle readiness | Nav Shakti: Chandraghanta | 4 | `NS3` | Chandraghanta |
| Creative expansion / new features | Nav Shakti: Kushmanda | 4 | `NS4` | Kushmanda |
| Onboarding / nurturing new things | Nav Shakti: Skandamata | 4 | `NS5` | Skandamata |
| Deferred hard decisions / tech debt | Nav Shakti: Katyayani | 4 | `NS6` | Katyayani |
| Dark corners, bugs, vulnerabilities | Nav Shakti: Kaalratri | 4 | `NS7` | Kaalratri |
| Post-incident cleanup / purification | Nav Shakti: Mahagauri | 4 | `NS8` | Mahagauri |
| Final polish / performance mastery | Nav Shakti: Siddhidatri | 4 | `NS9` | Siddhidatri |
| Full Shakti audit (all 9 forms) | Nav Shakti Grand | 36 | `NS*` | Durga |
| UI/Design unification | Divine Reviewers | 8 | `DR` | 8 Reviewers |
| Direct recognition, witness clarity, bypass illusion | Ashtavakra Deep | 12 | `ASD` | Ashtavakra |
| Middle path, balanced approach, neither extreme | Buddha Deep | 12 | `BUD` | Buddha |
| Body-level optimization, hardware mastery, practice | Gorakhnath Deep | 12 | `GKD` | Gorakhnath |
| Devotion audit, user love, service purity | Tulsidas Deep | 12 | `TLD` | Tulsidas |
| Conditioning audit, catharsis, celebration + truth | OSHO Deep | 12 | `OSD` | OSHO |
| Business strategy, market, competition, treasury | Chanakya Deep | 12 | `CKD` | Chanakya |
| Process discipline, systematic method, no skipping | Patanjali Deep | 12 | `PJD` | Patanjali |
| Anti-hypocrisy, simplicity, ceremony vs substance | Kabir Deep | 12 | `KBD` | Kabir |
| Algorithm correctness, precision, computation | Aryabhata Deep | 12 | `ARD` | Aryabhata |
| Surgical fixes, minimal intervention, zero collateral | Sushruta Deep | 12 | `SSD` | Sushruta |
| Documentation quality, knowledge architecture, teaching | Saraswati Deep | 12 | `SRD` | Saraswati |
| Build systems, toolchain, CI/CD, infrastructure | Vishwakarma Deep | 12 | `VKD` | Vishwakarma |
| Anti-over-engineering, abstraction audit, sacred cow removal | Nagarjuna Deep | 12 | `NGD` | Nagarjuna |
| Ethics, diverse governance, universal principles, anti-groupthink | Thiruvalluvar Deep | 12 | `TVD` | Thiruvalluvar |
| **Bhakti Cycles — Conviction, Endurance, Truth** | | | | |
| Feature/code surviving rejection, conviction under fire, defiant persistence | Prahlad Deep | 12 | `PRD` | Prahlad |
| Minimalism, strip to essentials, silence between signals, purity of design | Haridas Deep | 12 | `HRD` | Swami Haridas |
| Peak performance with balance — optimize (Deepak) then verify (Megh Malhar) | Tansen Deep | 12 | `TND` | Tansen |
| Constraint as creative gift, turning limitation into advantage (no_std, no C) | Surdas Deep | 12 | `SDD` | Surdas |
| Open-source, collective creation, everyone contributes, no gatekeeping | Chaitanya Deep | 12 | `CHD` | Chaitanya |
| Structure IS beauty — form, spec, framework enables rather than constrains | Tyagaraja Deep | 12 | `TYD` | Tyagaraja |
| Equality, serve weakest user/device, quality over credential, no VIP lane | Ravidas Deep | 12 | `RVD` | Ravidas |
| Dogfooding — use your own product before shipping, self-test, wear the garland | Andal Deep | 12 | `AND` | Andal |
| Strip all decoration — only load-bearing code/design remains, naked truth | Akka Mahadevi Deep | 12 | `AKD` | Akka Mahadevi |
| Transcend frameworks — when categories are the problem, paradox reveals truth | Lal Ded Deep | 12 | `LLD` | Lal Ded |
| Sacred daily work — CI pipeline, cargo test, daily commit, invisible sustaining | Janabai Deep | 12 | `JND` | Janabai |
| Desire being diluted under scope/social pressure — name the gap, do not erase it | Mira Deep | 12 | `MID` | Mirabai |
| **Jugalbandi — Multi-Cycle Collaboration** | | | | |
| Survive fire + dogfood (conviction + self-use) | Prahlad + Andal | 8 (4+4) | `JB-PA` | Prahlad + Andal |
| Strip to minimal + optimize what remains + verify | Haridas + Tansen | 8 (4+4) | `JB-HT` | Haridas + Tansen |
| Daily CI grind + public release readiness | Janabai + Chaitanya | 8 (4+4) | `JB-JC` | Janabai + Chaitanya |
| Anti-hypocrisy + equality (justice from the margins) | Kabir + Ravidas | 8 (4+4) | `JB-KR` | Kabir + Ravidas |
| Naked truth + paradox (two who walked stripped through the world) | Akka + Lal Ded | 8 (4+4) | `JB-AL` | Akka + Lal Ded |
| Structure + passion (precision meets fire) | Tyagaraja + Meera | 8 (4+4) | `JB-TM` | Tyagaraja + Meera |
| **Ashtabharya Cycles — Eight Dimensions of Capability** | | | | |
| Strategic spec — technically complete AND emotionally compelling | Rukmini Deep | 12 | `RKM` | Rukmini |
| Deep problems that only time reveals — 28-day endurance, the fight IS proof | Jambavati Deep | 12 | `JMB` | Jambavati |
| Kill mediocrity — pick up the bow yourself, demand the best, accept nothing less | Satyabhama Deep | 12 | `STB` | Satyabhama |
| Patient contemplation — don't rush, don't lower the standard, the river delivers | Kalindi Deep | 12 | `KLN` | Kalindi |
| Impossible spec — seven constraints simultaneously, zero compromise | Nagnajiti Deep | 12 | `NGJ` | Nagnajiti |
| Authentic choice against establishment pressure — the garland on truth | Mitravinda Deep | 12 | `MTV` | Mitravinda |
| One perfect shot — surgical precision, fish-eye through reflection, no retries | Lakshmana Queen Deep | 12 | `LKQ` | Lakshmana (Queen) |
| Natural fit — solution already in ecosystem, zero drama, organic integration | Bhadra Deep | 12 | `BDR` | Bhadra |
| Full 8-queen audit (strategy + endurance + pride + patience + impossible + authentic + precision + natural) | Dwaraka Grand | 96 | `AB*` | Ashtabharya |
| **Shiva Roop Cycles — Time & Unity** | | | | |
| Task lifecycle — birth, nourish, absorb, dissolve, void. Infinite WIP, stale work, burnout | MahaKaal Deep | 12 | `MKD` | MahaKaal |
| Design-execution unity — are you doing one thing or two? Split detection, quality audit | ArdhNarishwar Deep | 12 | `ANR` | ArdhNarishwar |
| Boundary/rejection testing — do gates, guards, neti neti actually fire correctly? | Negative Testing | 12 | `NEG` | Shiva's Third Eye |
| Open-world adversary imagination — what guard did I forget to write? Red-team / threat-archetype audit | Shadow Deep | 12 | `SHD` | Shadow-as-teacher |
| End of session — preserve context for tomorrow's self or next developer | Sanjay Handover | 4 | `SAN` | Sanjay |

> **To propose a new cycle:** Follow the 3x4 matrix structure — **When to use** / **Philosophy** / **Method** / **Structure** (3 rounds x 4 cycles) / **Closing** mantra. Every cycle must have a divine guardian, a routing table entry, and a tag.

---

# Cycle Analysis Framework

All work follows a structured cycle analysis discipline. Every cycle is a complete pass through the work from a specific angle. More cycles = deeper truth. The framework is rooted in the 12-cycle engine — the canonical implementation is V1 KIT's [`fsms/CycleFsm.toml`](fsms/CycleFsm.toml) and [`fsms/M_BUILD.toml`](fsms/M_BUILD.toml).

## The 12 Cycles (Master Definition)

Three phases, four stages each:

### Phase 1: PERCEIVE (Cycles 1-4) — What Is True

| Cycle | Name | Purpose |
|-------|------|---------|
| 1 | **Observe** | Scan the input — build inventory of what exists |
| 2 | **Enrich** | Pull knowledge from RAG/books — attach domain context |
| 3 | **Orient** | Classify context — project type, domain, patterns |
| 4 | **Distill** | Extract questions — gaps, issues, priorities |

### Phase 2: THINK (Cycles 5-8) — What Wants to Change

| Cycle | Name | Purpose |
|-------|------|---------|
| 5 | **Propose** | Generate approaches — 3 candidates ranked |
| 6 | **Evaluate** | Rank & select — score proposals, pick best |
| 7 | **Blueprint** | Structure plan — ordered steps with file operations |
| 8 | **Gate** | Phase gate — pause, validate coherence before acting |

### Phase 3: ACT (Cycles 9-12) — What to Do

| Cycle | Name | Purpose |
|-------|------|---------|
| 9 | **Forge** | Produce output — write files, implement changes |
| 10 | **Verify** | Self-check — correctness, completeness, law compliance |
| 11 | **Refine** | Surgical fixes — targeted patches from Verify feedback |
| 12 | **Reflect** | Meta-learn — what worked, what to improve next time |

---

## Cycle Profiles

### Quick (4 cycles) — Ganesh's Obstacle Removal (`Q`)
**Guardian:** Ganesh — remover of obstacles. Small problem, fast solution, move on.
**When to use:** Small fixes, trivial tasks, hot patches.
**Cycles:** Observe → Orient → Forge → Commit
**Skips:** Knowledge enrichment, proposal generation, verification, reflection.

### Standard (8 cycles) — Krishna's Balanced Strategy (`S`)
**Guardian:** Krishna — the strategist who sees all paths and picks the wisest.
**When to use:** Regular feature work, moderate complexity tasks, phase gates in implementation.
**Cycles:** Observe → Orient → Distill → Propose → Blueprint → Forge → Verify → Commit
**Skips:** Enrichment (cycle 2), Evaluation (cycle 6), Refinement (cycle 11), Reflection (cycle 12).

### Deep (12 cycles) — Shiva's Full Truth (`D`)
**Guardian:** Shiva — the third eye that sees everything. Nothing is hidden, nothing is skipped.
**When to use:** Architecture decisions, security reviews, major refactors, pre-release audits.
**Cycles:** All 12 in sequence.
**Skips:** Nothing. Every cycle runs. Truth surfaces fully.

### Matrix / 3x4 (12 cycles with phase gates) — Vishnu's System View (`3x4`)
**Guardian:** Vishnu — the preserver who sees the whole system across all phases.
**When to use:** Code reviews, cross-system audits, design unification, multi-module analysis.
**Cycles:** All 12, organized as 3 phases x 4 stages with mandatory phase gates.
**Phase gates:** At Distill (end of Perceive), Blueprint (end of Think), Reflect (end of Act). No phase begins until the prior gate passes.

---

## Special Cycle Variants

### 8 FSM Engine Law Compliance Review (12 cycles = 8 + 4)
**When to use:** NON-NEGOTIABLE before every commit.
**Note:** These are the 8 **FSM Engine Laws** (architectural invariants), distinct from the 13 **Work Culture Laws** above.
**Philosophy:** Ram's maryada applied to every commit — the boundary check that ensures no code crosses the line unchecked. These 8 laws are architectural invariants, not stylistic preferences. They are the Lakshman Rekha of the codebase.
**Method:** Review every changed file against each of the 8 FSM Engine Laws in sequence. Then sweep the 4 cross-cutting concerns. If any law is violated, the commit does not proceed until fixed.
**Cycles 1-8:** Each of the 8 FSM Engine Laws checked against all changed files:
1. Every FSM transition traced (TraceRecord to DB)
2. LLM proposes, humans approve (no auto-save FSM configs)
3. Every message persisted to DB
4. Pluggable backends (adapter pattern)
5. Config lineage (parent + version on every FSM)
6. Health gates action (unhealthy FSM → untrusted output)
7. Engine doesn't know domains (knowledge in config)
8. Knowledge-first (check books/ before external libs)

**Cycles 9-12:** Cross-cutting concerns:
9. Security (injection, unsafe input)
10. Thread safety (Rc vs Arc, Send bounds, deadlocks)
11. Data loss risks (overwrites, missing error handling)
12. UI consistency (properties wired, callbacks connected end-to-end)

**Closing:** Jai Shri Ram — Dharma Rakshati Rakshitah (Dharma protects those who protect Dharma)

### Shiva Deep Cycle (Destroyer Analysis)
**When to use:** When something feels wrong but you cannot name it. When the system needs truth, not comfort.
**Philosophy:** Shiva's third eye burns incoherence. This analysis does not build — it destroys what should not exist.
**Method:** Read every file. Sit with it. Let truth surface silently. No agenda, no checklist — pure observation followed by ruthless honesty.
**Structure (3x4 Silent Matrix):**

**Round 1 — What Is True (Cycles 1-4):**
1. What Exists Is Real — acknowledge what works, no denial
2. What Is Beautiful — honor the craft that deserves to remain
3. What Is Broken — name every fracture without softening
4. What Is Missing — the gaps that silence hides

**Round 2 — What Wants to Change (Cycles 5-8):**
5. The deepest structural risk (the one nobody wants to say)
6. The hidden coupling (what breaks when you touch something else)
7. The recovery question (can this heal itself after failure?)
8. The confusion (where does the design contradict itself?)

**Round 3 — What to Do (Cycles 9-12):**
9. Priorities — silence speaks (fix now / should fix / can wait)
10. Law compliance audit against the 8 Laws
11. Completeness check against the specification/ISA/schema
12. The Final Truth — the verdict, stated plainly

**Closing:** Om Shanti Shanti Shanti

### Vishnu Deep Cycle (Preserver Analysis)
**When to use:** When the system works but you fear it won't survive growth, load, migration, or time. When you need to ensure longevity, not novelty.
**Philosophy:** Vishnu preserves what deserves to live. His analysis does not destroy or create — it strengthens, sustains, and ensures continuity across all yugas (versions).
**Method:** Walk every data path, every state transition, every persistence boundary. Ask: "Will this still work in 10x scale? After a migration? After the original author leaves?"
**Structure (3x4 Preservation Matrix):**

**Round 1 — What Must Endure (Cycles 1-4):**
1. Inventory of load-bearing structures — what the system truly depends on
2. Data integrity audit — can data survive crash, restart, migration, rollback?
3. Contract stability — are APIs, schemas, and interfaces versioned and backward-safe?
4. Dependency health — are external dependencies maintained, pinned, and replaceable?

**Round 2 — What Threatens Continuity (Cycles 5-8):**
5. Single points of failure — what breaks everything if it goes down?
6. State management fragility — orphaned state, stale caches, split-brain risks
7. Upgrade path analysis — can this system migrate forward without downtime or data loss?
8. Knowledge bus factor — is critical logic documented or trapped in one mind?

**Round 3 — What to Fortify (Cycles 9-12):**
9. Redundancy plan — backups, replicas, graceful degradation priorities
10. Monitoring & alerting gaps — can you detect failure before users do?
11. Rollback readiness — can every deployment be safely reversed?
12. The Preservation Verdict — what lives, what needs strengthening, what timeline

**Closing:** Om Namo Narayanaya

---

### Brahma Deep Cycle (Creator Analysis)
**When to use:** When starting something from nothing. New project, new module, new architecture. When the blank page needs structure.
**Philosophy:** Brahma creates from the cosmic seed. His analysis is generative — it asks not "what is wrong" but "what should exist." Every creation must have purpose, proportion, and a place in the whole.
**Method:** Start from the requirement seed. Expand outward: what entities, what relationships, what boundaries, what lifecycle. Every creation must justify its existence.
**Structure (3x4 Creation Matrix):**

**Round 1 — The Seed (Cycles 1-4):**
1. Purpose clarity — what problem does this solve? For whom? Why now?
2. Entity discovery — what are the core domain objects, their names, their boundaries?
3. Relationship mapping — how do entities relate? What owns what? What flows where?
4. Lifecycle definition — what is born, what grows, what dies? States and transitions.

**Round 2 — The Blueprint (Cycles 5-8):**
5. Interface design — APIs, traits, protocols. The contracts before the code.
6. Data model — schema, storage, serialization. The truth the system remembers.
7. Module boundaries — what is a crate, what is a module, what is a function? Separation of concerns.
8. Error taxonomy — what can go wrong? How does each failure propagate and resolve?

**Round 3 — The First Breath (Cycles 9-12):**
9. Skeleton implementation — the minimum structure that compiles and runs
10. Test harness — the first tests that define correctness before code exists
11. Documentation seed — README, book chapter, inline comments for the "why"
12. Creation Review — does this new thing have a right to exist? Is it complete enough to live?

**Closing:** Om Brahmane Namah

---

### Narad Deep Cycle (Messenger / Intelligence Analysis)
**When to use:** When information flows are broken, when teams/modules don't communicate, when events get lost, when the system has gossip problems (stale data, conflicting state, message ordering).
**Philosophy:** Narad Ji is the cosmic messenger — he carries information across all realms. His analysis reveals where communication breaks down, where information is lost, duplicated, or arrives too late. He also stirs — he finds the tension that needs to surface.
**Method:** Trace every message, event, signal, and callback through the system. Map who tells whom what, and when. Find the silences and the conflicts.
**Structure (3x4 Communication Matrix):**

**Round 1 — The Information Map (Cycles 1-4):**
1. Channel inventory — list every communication path: events, callbacks, channels, queues, APIs, shared state
2. Message taxonomy — what types of messages exist? Commands, events, queries, notifications?
3. Timing analysis — are messages synchronous or async? What are the ordering guarantees?
4. Audience mapping — who produces, who consumes? Are there orphan producers or deaf consumers?

**Round 2 — The Noise (Cycles 5-8):**
5. Lost messages — where do signals get dropped, ignored, or silently fail?
6. Conflicting truths — where do two parts of the system disagree about the same fact?
7. Gossip storms — where does redundant information flood the system? N+1 queries, duplicate events?
8. Timing traps — race conditions, out-of-order delivery, stale reads after writes

**Round 3 — The Harmony (Cycles 9-12):**
9. Channel redesign — which paths need adding, merging, or removing?
10. Contract enforcement — schema validation, type safety, versioning on messages
11. Observability — can you trace a message from origin to final effect? Distributed tracing gaps?
12. The Messenger's Verdict — is information flowing truthfully, timely, and completely?

**Closing:** Narayan Narayan

---

### Hanuman Deep Cycle (Devotion & Execution Analysis)
**When to use:** When the plan is clear but execution is failing. Build breaks, flaky tests, slow CI, deployment pain, developer friction. When the system needs raw strength applied with perfect discipline.
**Philosophy:** Hanuman Ji is boundless strength guided by unwavering devotion. His analysis is about execution excellence — not what to build, but whether the build system, test infrastructure, deployment pipeline, and developer experience serve the mission faithfully.
**Method:** Run every build. Execute every test. Deploy to every target. Measure every wait. Feel every friction. Then fix with the strength of one who carries mountains.
**Structure (3x4 Execution Matrix):**

**Round 1 — The Battlefield (Cycles 1-4):**
1. Build health — does it compile cleanly? Warnings, unused deps, feature flag mess?
2. Test health — pass rate, flaky tests, coverage gaps, test speed
3. CI/CD health — pipeline duration, failure rate, retry frequency, queue depth
4. Developer experience — time from clone to first successful build and test run

**Round 2 — The Obstacles (Cycles 5-8):**
5. Performance blockers — what is slow? Compilation, linking, test execution, deployment?
6. Reliability gaps — what fails intermittently? Network, file system, timing, resource limits?
7. Tooling debt — outdated tools, missing lints, absent formatters, manual steps that should be automated
8. Platform gaps — does it build and run on all target platforms? Cross-compilation issues?

**Round 3 — The Leap (Cycles 9-12):**
9. Quick wins — what can be fixed in under an hour that removes daily pain?
10. Automation opportunities — what manual process should become a script or hook?
11. Monitoring & feedback loops — can developers know within minutes if their change broke something?
12. The Devotion Verdict — does the infrastructure serve the mission, or does the mission serve the infrastructure?

**Closing:** Jai Shri Ram

---

### Radha Deep Cycle (Love & Harmony Analysis)
**When to use:** When the system technically works but feels wrong to use. When the user experience lacks joy, when the API lacks elegance, when the code lacks beauty. When you need to evaluate from the heart, not the head.
**Philosophy:** Radha Ji is the embodiment of divine love — the pull that makes Krishna's flute worth playing. Her analysis is about resonance: does this system create joy for its users? Does the code invite contribution? Does the experience feel like it was made with love?
**Method:** Use the system as a first-time user. Read the code as a new contributor. Feel the friction, the confusion, the delight. Judge not by correctness but by compassion.
**Structure (3x4 Harmony Matrix):**

**Round 1 — The First Touch (Cycles 1-4):**
1. First impression — what does a new user feel in the first 30 seconds?
2. Learning curve — can someone understand the purpose and basic usage without reading all docs?
3. Error compassion — when users make mistakes, does the system help them recover with kindness?
4. Naming poetry — do names (variables, functions, modules) tell a story? Can you read the code like prose?

**Round 2 — The Deeper Bond (Cycles 5-8):**
5. Consistency of voice — does the system feel like one mind built it, or a committee?
6. Unnecessary suffering — where does the user/developer endure pain that serves no purpose?
7. Aesthetic coherence — do the visual/structural patterns follow a rhythm? Or is it jarring?
8. Invitation to contribute — would a newcomer feel welcomed or intimidated by the codebase?

**Round 3 — The Devotion (Cycles 9-12):**
9. Joy audit — list three things that spark delight. If you cannot find three, that is the finding.
10. Friction removal — the top 5 moments of unnecessary suffering, prioritized by frequency
11. Beauty patches — small changes (rename, reorder, simplify) that make the system more lovable
12. The Harmony Verdict — does this system deserve love? Does it give love back?

**Closing:** Radhey Radhey

---

### Ram Deep Cycle (Dharma & Governance Analysis)
**When to use:** When the system needs a moral compass. Compliance reviews, governance audits, access control, rule enforcement. When you must ask: "Is this the right thing to do?" — not the easy thing, the right thing. Maryada Purushottam — the one who follows boundaries perfectly.
**Philosophy:** Shri Ram is Dharma incarnate. He does not ask "can we?" but "should we?" His analysis enforces boundaries (maryada), ensures governance is fair and transparent, and verifies that every rule the system claims to follow is actually followed. No exceptions for convenience.
**Method:** Read every rule, policy, permission, and boundary in the system. Then verify: is it enforced? Is it fair? Is it documented? Is it tested? Walk the path of Dharma through every module.
**Structure (3x4 Dharma Matrix):**

**Round 1 — The Maryada (Cycles 1-4):**
1. Rule inventory — what rules, policies, permissions, and boundaries does the system claim to enforce?
2. Enforcement audit — for each rule: is it actually enforced in code, or only in documentation?
3. Fairness check — are rules applied consistently? Or are there special cases, backdoors, admin overrides that break the contract?
4. Transparency — can a user/developer understand why they were denied? Are error messages honest?

**Round 2 — The Vanvas (Cycles 5-8):**
5. Exile test — remove a key component (database, API, service). Does the system degrade gracefully or collapse? Ram survived 14 years in the forest — can your system survive adversity?
6. Alliance audit — who does the system trust? Are trust boundaries explicit? (Sugriva's alliance was formal, not assumed)
7. Loyalty test — do modules honor their contracts even under stress? Or do they cut corners when load is high?
8. The Lakshman Rekha — where are the lines that must never be crossed? Are they enforced at the code level, not just documented?

**Round 3 — The Rajya (Cycles 9-12):**
9. Governance completeness — is every decision traceable? Every permission auditable? Every action logged?
10. Ram Rajya standard — if every system in the world followed this pattern, would it be just? Would it be fair?
11. Succession planning — can this system be maintained by someone other than its creator? Is knowledge shared?
12. The Dharma Verdict — does this system follow its own rules? Stated plainly, without softening.

**Closing:** Jai Shri Ram

---

### Sita Deep Cycle (Resilience & Integrity Under Adversity)
**When to use:** When the system must survive hostile environments. Disaster recovery, data integrity under corruption, graceful behavior during outages, maintaining truth when everything around it lies. When the system is in its Lanka — surrounded, isolated, under pressure.
**Philosophy:** Sita Ji is unbreakable integrity. She maintained her truth in Lanka, surrounded by enemies, with no support, for months. Her analysis tests whether the system can maintain its integrity when everything goes wrong — not just survive, but remain true to its purpose.
**Method:** Simulate the worst. Cut the network. Corrupt the data. Overload the queues. Inject lies. Then ask: did the system maintain its core truth? Did it bend without breaking? Did it protect what matters most?
**Structure (3x4 Agni Pariksha Matrix):**

**Round 1 — The Abduction (Cycles 1-4):**
1. Isolation test — what happens when the system is cut off from its dependencies? Can it function alone?
2. Corruption resistance — if data is corrupted (disk, network, injection), does the system detect it? Reject it? Heal?
3. Hostile environment — what if inputs are deliberately malicious? Fuzzing, injection, overflow, malformed data.
4. Identity preservation — under all this pressure, does the system still know what it is? Do core invariants hold?

**Round 2 — The Ashok Vatika (Cycles 5-8):**
5. Patience under siege — how long can the system sustain degraded operation? Minutes? Hours? Days?
6. Secret strength — what hidden capabilities exist for survival mode? Caches, fallbacks, offline modes?
7. Communication under duress — can the system signal for help? Health checks, alerts, distress signals (like Sita's message to Ram via Hanuman)?
8. Resistance to temptation — does the system take shortcuts under pressure that compromise integrity? (Sita refused Ravana's offers — does your system refuse unsafe fast paths?)

**Round 3 — The Return (Cycles 9-12):**
9. Recovery completeness — after the crisis, can the system fully recover? Is any data lost? Any state corrupted permanently?
10. Agni Pariksha — the fire test. Run the full test suite after recovery. Does everything pass? Is integrity proven, not assumed?
11. Trust rebuilding — after an incident, can users/systems trust this component again? What evidence is provided?
12. The Resilience Verdict — can this system survive its Lanka and return whole?

**Closing:** Jai Sita Ram

---

### Lakshman Deep Cycle (Vigilance & Sentinel Analysis)
**When to use:** When the system needs a sleepless guardian. Monitoring gaps, security boundaries, watch systems, alerting, the sentinel that stands at the door and never rests. When you need to verify that the system is being watched and protected at all times.
**Philosophy:** Lakshman Ji is the eternal sentinel. He did not sleep for 14 years to protect Ram and Sita. His analysis is about vigilance — continuous monitoring, boundary protection, and the discipline of never letting your guard down. He drew the Lakshman Rekha — the line that must not be crossed.
**Method:** Map every boundary, every entry point, every watch system. Then test: is someone watching? Will the alarm sound? Is the guard awake? Verify that the Rekha holds.
**Structure (3x4 Sentinel Matrix):**

**Round 1 — The Perimeter (Cycles 1-4):**
1. Entry point inventory — every API endpoint, every port, every file input, every user-facing surface
2. Boundary verification — for each entry point: is there validation? Authentication? Rate limiting? Logging?
3. The Rekha — what are the absolute boundaries? Max payload, max connections, max retries, forbidden operations. Are they enforced?
4. Guard presence — for each boundary, who/what is watching? Is there a monitor, alert, or log?

**Round 2 — The Night Watch (Cycles 5-8):**
5. Monitoring completeness — are all critical paths monitored? Can you detect failure before users report it?
6. Alert fatigue — are there too many alerts? Do people ignore them? Is signal-to-noise ratio healthy?
7. Sleepless test — if monitoring goes down, does anyone notice? Who watches the watchers?
8. Response readiness — when an alert fires, is there a clear runbook? Or does everyone panic?

**Round 3 — The Protection (Cycles 9-12):**
9. Incident response — simulate an intrusion/failure. How fast is detection? How fast is response?
10. Recovery guard — during recovery, is the system still being watched? Or does monitoring go dark during the crisis?
11. Succession of watch — if the primary sentinel fails, who takes over? Redundancy in monitoring.
12. The Sentinel Verdict — is this system truly guarded? Or does it sleep when it thinks nobody is looking?

**Closing:** Jai Shri Ram, Jai Lakshman

---

### Baglamukhi Deep Cycle (Stambhana — Immobilization & Emergency Stop Analysis)
**When to use:** When something harmful is actively running and must be stopped. Runaway processes, cascading failures, security breaches in progress, data corruption spreading, toxic deployments. Also for reviewing whether the system HAS the ability to stop things — circuit breakers, kill switches, feature flags, quarantine mechanisms. Maa Baglamukhi paralyzes what must not move.
**Philosophy:** Maa Baglamukhi wields the Stambhana shakti — the power to freeze, paralyze, and silence. She grabs the tongue of the demon (Madan) and strikes with her club. In engineering: she is the circuit breaker that trips, the kill switch that fires, the rate limiter that blocks, the feature flag that disables. She does not destroy (that is Shiva/Kaalratri) — she STOPS. The enemy is frozen, then dealt with calmly.
**Method:** For every critical path in the system, ask: "Can I stop this immediately if it goes wrong?" If the answer is no, that is the finding. Then verify that existing stop mechanisms actually work — not in theory, in practice. Pull the lever. Did it work?
**Structure (3x4 Stambhana Matrix):**

**Round 1 — The Tongue Grab (Cycles 1-4):**
1. Kill switch inventory — what emergency stops exist? Circuit breakers, feature flags, kill switches, rate limiters, account suspension, service isolation. List every mechanism that can STOP something.
2. Coverage audit — for each critical path (payment, auth, data write, external API, deployment), is there a kill switch? Map gaps where harmful processes cannot be stopped.
3. Speed test — how fast can each stop mechanism activate? Milliseconds (circuit breaker)? Seconds (feature flag)? Minutes (manual intervention)? Hours (deploy rollback)? Anything over minutes for critical paths is a finding.
4. Collateral assessment — when you pull a kill switch, what else stops? Blast radius of each stop mechanism. Does stopping payments also stop refunds? Does disabling auth lock out admins too?

**Round 2 — The Club Strike (Cycles 5-8):**
5. Live drill — actually trigger each stop mechanism in a safe environment. Did it work? Did it work FAST ENOUGH? Many kill switches are written but never tested.
6. Cascading failure analysis — if service A fails, does it cascade to B, C, D? Where are the circuit breakers between services? Are they configured with sane thresholds and timeouts?
7. Poison pill detection — can the system detect harmful input/state BEFORE it spreads? Canary deployments, data validation gates, anomaly detection. Maa Baglamukhi sees the demon before he speaks.
8. Quarantine capability — can harmful elements be isolated without stopping the whole system? Can a bad request be quarantined? A corrupted record? A compromised account? Surgical precision, not scorched earth.

**Round 3 — The Silence (Cycles 9-12):**
9. Noise silencing — the system is screaming alerts during an incident. Can you silence the noise to hear the signal? Alert suppression, incident mode, war-room focus. Baglamukhi silences harmful speech so truth can be heard.
10. Post-freeze protocol — after something is stopped, what happens next? Is there a documented process to investigate, fix, and restart? Or does the frozen thing stay frozen forever?
11. Stambhana completeness — for every "what if X goes wrong" scenario in the risk register, is there a corresponding stop mechanism? Cross-reference risks with kill switches.
12. The Stambhana Verdict — can this system stop what needs stopping, when it needs stopping, without stopping what shouldn't stop? Stated plainly.

**Closing:** Om Hleem Baglamukhi Sarva Dushtanaam Vaacham Mukham Padam Stambhaya Jivhaam Keelaya Buddhi Vinashaya Hleem Om Swaha

---

### Krishna Deep Cycle (Strategic Multi-Path Analysis)
**When to use:** When facing a decision with multiple valid paths and unclear trade-offs. Architecture choices, technology selection, build vs buy, migration strategies, priority conflicts. When you need the strategist who sees all paths and picks the wisest — not the fastest, not the easiest, the wisest.
**Philosophy:** Krishna is the supreme strategist. On the battlefield of Kurukshetra, he did not fight — he guided. His Gita is not a rulebook but a framework for decision-making under uncertainty. His analysis does not seek the "right answer" — it maps all answers, weighs them against dharma (purpose), artha (practicality), and the long game, then commits fully to the chosen path without regret.
**Method:** Enumerate all viable paths (minimum 3). For each path, evaluate short-term gain, long-term consequence, alignment with project dharma, reversibility, and team capacity. Then choose — not by committee, not by default — but by conviction. Once chosen, execute with full commitment (Nishkama Karma — action without attachment to outcome).
**Structure (3x4 Kurukshetra Matrix):**

**Round 1 — The Vishad (Cycles 1-4) — Mapping the Battlefield:**
1. Path enumeration — list every viable approach. Minimum 3, maximum 7. No premature elimination.
2. Stakeholder mapping — who is affected by each path? Users, developers, ops, business, future-self?
3. Constraint inventory — what are the hard constraints? Time, money, skill, dependencies, politics?
4. The Arjuna moment — name the fear. What is making this decision hard? What are you avoiding?

**Round 2 — The Gita (Cycles 5-8) — Weighing the Paths:**
5. Dharma score — for each path: does it serve the project's true purpose, or just the immediate deadline?
6. Artha score — for each path: is it practically achievable with current resources and skills?
7. Reversibility analysis — which paths can be unwound if wrong? Which are one-way doors?
8. The long game — fast-forward 6 months. Which path do you wish you had chosen? Which do you regret?

**Round 3 — The Karma (Cycles 9-12) — Committing to Action:**
9. Decision — choose one path. State why. Name what you are sacrificing by not choosing the others.
10. Nishkama plan — execution plan for the chosen path, without attachment to outcome. Define success AND acceptable failure.
11. Contingency — if the chosen path fails at a defined checkpoint, what is the fallback? Pre-decide, don't improvise.
12. The Krishna Verdict — the strategic judgment, stated with conviction. No hedging, no "it depends."

**Closing:** Karmanye Vadhikaraste Ma Phaleshu Kadachan — You have the right to act, never to the fruits of action.

---

### Arjuna Deep Cycle (Vishada / Paralysis-Recovery, Tag: `AJN`)
**When to use:** When a persona has hit *vishada* — paralysis under shifted context. The drift hook (`|μ_shiva − μ_shakti| → 0`) fires repeatedly on the same task with the same persona; or the persona reports "all paths look wrong"; or a context shift renders the prior goal-state inconsistent with current responsibility; or the user explicitly invokes when stuck. Distinct from Krishna Deep (`KD` / `SMR` — "I have options, which is dharmic?") and Baglamukhi Deep (`BM` — "stop active harm"): `AJN` restores the *capacity to see options as options* when that capacity has frozen.
**Philosophy:** Arjuna is the warrior-student. On the field of Kurukshetra, the goal he trained for — victory through dharmic war — collided with the kin he loved on the opposing line. Goal and bond pulled in opposite directions; the bow fell from his hand ("na yotsye" — I will not fight). That moment is *vishada* — not weakness, but the honest recognition that the actor's current stance cannot issue a decision. The recovery is not Krishna's *strategy* (which paths exist?); it is Krishna's *teaching* (which witness sees the paths?). Arjuna does not need a new option; he needs a new stance from which to see the options he already has. The Gita is therefore not an answer to "what should I do?" — it is an answer to "from where should I see?"
**Method:** Three rounds — first acknowledge the paralysis honestly without trying to dissolve it; second yield to meta-cognition and receive the teaching (nishkama karma + svadharma + witness-vs-actor distinction); third look at the cosmic frame including its terror and act from the re-stabilized stance. The action that issues at the end may *look identical* to the action paralyzed at the beginning — what changed is the witness, not the deed.
**Structure (3x4 Gita Matrix):**

**Round 1 — Vishada (Cycles 1-4) — Recognizing the paralysis:**
1. Name the stopped goal — what was the persona moving toward before the freeze?
2. Name the context shift — what changed in the field that put goal in tension with what is loved / owed / honored?
3. Name the paralysis explicitly — say "I have laid down the bow." Do not euphemize, do not minimize.
4. Refuse premature resolution — the vishada is real, sitting with it for one round IS the first round; this is not weakness.

**Round 2 — Saranagati + Shravana (Cycles 5-8) — Surrender and teaching:**
5. Saranagati — acknowledge that decision cannot issue from inside the paralysis. Invoke meta-cognition: *"Shishyaste'ham, shadhi mam tvam prapannam"* — "I am your student; teach me, I take refuge in you." This is the persona-as-Arjuna recognizing it needs Krishna-mode (the cycle voice).
6. Nishkama karma — receive the first teaching: act, do not cling to fruit. The outcome belongs to the field; the action belongs to the actor; the witness belongs to neither.
7. Svadharma — receive the second teaching: your role, not another's. *"Sreyan svadharmo vigunah" — "Better one's own duty done badly than another's done well."* The paralysis often comes from importing another role's standards into your own work.
8. Witness vs actor — receive the third teaching: the witness behind action is imperishable; paralysis confused the two. The actor may falter; the witness does not.

**Round 3 — Vishvarupa + Dharmic Action (Cycles 9-12) — Cosmic view and resumed action:**
9. Vishvarupa-darshana — look at the cosmic form. Time eats all warriors anyway. Outcomes you fear are not yours to grant or withhold. Do not blink at the terror; it does not soften, but it puts the action in its true scale.
10. Smṛti-Labdhva — *"Nashto mohah smrtir labdhva tvatprasadan"* — "Delusion gone, memory recovered." The witness re-stabilizes. The persona remembers what it actually is.
11. Pick up the Gandiva — the dharmic action issues. It may look identical to the pre-vishada action; what changed is the stance. `|μ_shiva − μ_shakti| → 0` is restored not by altering the deed but by altering the seer.
12. The Arjuna Verdict — either (a) the persona resumes with re-stabilized witness and a chosen action, *or* (b) vishvarupa-darshana surfaced that the goal itself needs revision (the context shift was not navigable from inside the persona's role) — in which case escalate to the human with the reformed goal as a question. Do not feign resolution if the cosmic view honestly showed the goal must change.

**Closing:** *Sarva-dharman parityajya mam ekam sharanam vraja* — Setting aside all dharmas, take refuge in the one. The witness is the refuge; from there, the action issues.

**Cross-coupling:**
- `KD` / `SMR` (Krishna Deep / Strategic Multi-Path): AJN's Round 1 surfaces the vishada; if the persona is now ready to weigh options, hand off to Krishna's Round 1 ("Mapping the Battlefield") for the strategic enumeration. AJN restores the seer; SMR maps the seen.
- `BM` (Baglamukhi Deep / Emergency Stop): if the paralysis is *intentional* — the persona is correctly refusing to act because harm is in flight — that is BM, not AJN. AJN is for *unwanted* freeze; BM is for *protective* freeze.
- `HD` (Hanuman Deep / Devotion & Execution): AJN's Round 3 (resumed action) hands off to HD for execution. Hanuman carries the message Krishna gave; the same jiva, a different stance.
- Cosmically: the Arjuna stance, the Krishna stance, the Hanuman stance, and the Ram stance are facets of *one* jiva. The morphing between them is the Nataraja-dance (`see` [JIVA.md](JIVA.md) for the recursive jiva principle). AJN is the named cycle for the Arjuna-stance moment; the other stances live in their own cycles or in the persona-default.

---

### Ganesh Deep Cycle (Obstacle Removal & Unblocking Analysis)
**When to use:** When progress is blocked and the blocker is unclear or multi-layered. Build failures nobody can diagnose, dependencies that won't resolve, permissions that won't grant, processes that won't complete. When every attempt to move forward hits an invisible wall. Ganesh removes obstacles — but first, he understands them.
**Philosophy:** Ganesh is Vighnaharta — the remover of obstacles. But he is also Vighnakarta — the creator of obstacles for those on the wrong path. His analysis distinguishes between obstacles that should be removed (genuine blockers) and obstacles that are signals (you're going the wrong way). Not every wall should be broken. Some walls are load-bearing.
**Method:** List every blocker. For each, ask: is this a genuine obstacle (remove it), a signal (change direction), or a symptom (the real blocker is elsewhere)? Then prioritize: which unblocking unlocks the most downstream work? Remove that one first.
**Structure (3x4 Vighnaharta Matrix):**

**Round 1 — The Obstacle Map (Cycles 1-4):**
1. Blocker inventory — list every thing that is preventing progress. Technical, process, people, knowledge, permissions, dependencies.
2. Dependency graph — which blockers depend on other blockers? Find the root blockers vs. symptoms.
3. Classification — for each blocker: genuine obstacle (remove), signal (change direction), or symptom (dig deeper)?
4. Load-bearing walls — which obstacles, if removed, would cause something else to collapse? Not every wall should be broken.

**Round 2 — The Modak (Cycles 5-8) — Sweetening the Path:**
5. Quick wins — which obstacles can be removed in under 30 minutes? Do those first. Momentum matters.
6. Workarounds — for each remaining blocker: is there a way around it that doesn't require removing it? Temporary bridges count.
7. Escalation targets — which blockers require someone else's action? Identify the person, the ask, and the deadline.
8. The wrong path test — for each blocker classified as "signal": what would changing direction look like? Is the signal right?

**Round 3 — The Clearing (Cycles 9-12):**
9. Removal plan — ordered list of obstacles to remove, with method and owner for each.
10. Verification — after each removal, verify the downstream work is actually unblocked. Don't assume.
11. Prevention — why did these obstacles form? Can the root cause be prevented from creating future blockers?
12. The Vighnaharta Verdict — is the path clear? What remains? What was the real blocker all along?

**Closing:** Om Gan Ganapataye Namah — Salutations to the remover of obstacles.

---

### Nav Shakti Deep Cycles (9 Forms of Maa Shakti)

Each of the nine forms of Maa Durga (Navdurga) represents a distinct energy. Each cycle is a standalone 4-cycle focused review that can be composed or run independently. Together, they form a **36-cycle grand Shakti audit** (or pick the forms most relevant to the situation).

#### 1. Shailaputri Cycle (Foundation & Grounding) — Tag: `NS1`
**When to use:** When the foundation is shaky — dependencies, core data structures, base configurations.
**Energy:** Daughter of the mountain. Unshakeable root.
1. Foundation inventory — what are the bedrock dependencies and core abstractions?
2. Stability test — shake each foundation. What wobbles?
3. Root cause depth — are we building on solid ground or on assumptions?
4. Grounding verdict — reinforce, replace, or accept the foundation as-is

#### 2. Brahmacharini Cycle (Discipline & Austerity) — Tag: `NS2`
**When to use:** When the codebase lacks discipline — inconsistent formatting, no linting, undisciplined error handling, scattered patterns.
**Energy:** Severe penance. Mastery through restraint.
1. Discipline audit — coding standards, formatting, naming conventions, lint compliance
2. Austerity check — what is excessive? Over-engineering, unnecessary abstractions, bloated dependencies
3. Penance list — the hard, boring cleanup tasks everyone avoids
4. Discipline verdict — enforce standards, remove excess, embrace simplicity

#### 3. Chandraghanta Cycle (Readiness for Battle) — Tag: `NS3`
**When to use:** Pre-release, pre-deployment, pre-demo. When the system must be battle-ready.
**Energy:** The war bell rings. Preparation, not panic.
1. Battle readiness — can the system handle real traffic, real users, real edge cases right now?
2. Armor check — security hardening, input validation, rate limiting, auth boundaries
3. Retreat plan — rollback procedures, feature flags, kill switches
4. Battle verdict — deploy with confidence, delay with reason, or abort with honesty

#### 4. Kushmanda Cycle (Cosmic Energy & Creation) — Tag: `NS4`
**When to use:** When the system needs a burst of creative energy — new features, integrations, expansions.
**Energy:** She who created the universe with her smile. Pure generative force.
1. Possibility scan — what could this system become? What adjacent features unlock the most value?
2. Integration map — what external systems, APIs, or datasets could amplify this?
3. Energy allocation — where should creative effort focus for maximum impact?
4. Creation verdict — build what matters most, defer what can wait, dream what inspires

#### 5. Skandamata Cycle (Nurturing & Protection of Young) — Tag: `NS5`
**When to use:** When new features, new team members, or new modules need nurturing. Onboarding, documentation, mentoring.
**Energy:** Mother of Skanda. She who protects and nurtures what is young and growing.
1. Onboarding audit — can a new developer/user get started without hand-holding?
2. Documentation gaps — what is undocumented, poorly documented, or wrongly documented?
3. Fragile newborns — which new features/modules need extra testing, extra care, extra attention?
4. Nurturing verdict — what needs a guide, what needs a guard, what can stand on its own

#### 6. Katyayani Cycle (Warrior Courage) — Tag: `NS6`
**When to use:** When hard decisions are being avoided. Tech debt everyone sees but nobody tackles. The refactor that scares everyone.
**Energy:** The fierce warrior who slays Mahishasura. Courage to act on what must be done.
1. Cowardice inventory — what decisions are being deferred out of fear, not reason?
2. Debt audit — the tech debt that compounds daily. Name it. Size it. Prioritize it.
3. Courage plan — the scary refactor, migration, or rewrite. Steps to do it safely.
4. Warrior verdict — fight now, prepare to fight, or acknowledge the battle is not yet yours

#### 7. Kaalratri Cycle (Destruction of Darkness) — Tag: `NS7`
**When to use:** When there are known bugs, security vulnerabilities, or dark corners nobody wants to look at.
**Energy:** The darkest night. She who destroys ignorance and evil. Fearless in the dark.
1. Dark corners — the files nobody opens, the functions nobody understands, the tests nobody runs
2. Bug archaeology — the oldest open bugs, the most-reported issues, the "known issues" list
3. Security darkness — vulnerabilities, unpatched deps, exposed secrets, missing encryption
4. Darkness verdict — illuminate, destroy, or quarantine. No corner stays dark.

#### 8. Mahagauri Cycle (Purity & Cleansing) — Tag: `NS8`
**When to use:** Post-incident, post-refactor, post-migration. When the system needs purification — dead code removal, legacy cleanup, fresh start.
**Energy:** Radiant purity. Cleansing of all past sins.
1. Dead code scan — unused functions, unreachable branches, commented-out blocks, orphan files
2. Legacy purge — deprecated APIs still in use, old migration scripts, compatibility shims past their purpose
3. Debt settlement — close old issues, remove TODO comments that are done, update stale docs
4. Purity verdict — what is clean, what needs cleansing, what is pure enough to ship

#### 9. Siddhidatri Cycle (Mastery & Perfection) — Tag: `NS9`
**When to use:** When the system is mature and you seek the final polish. Performance optimization, API elegance, architectural perfection.
**Energy:** Bestower of all siddhis (supernatural powers). Mastery beyond competence.
1. Performance mastery — profiling, hot paths, memory allocation, cache hit rates
2. API elegance — is every public interface a joy to use? Minimal, consistent, unsurprising?
3. Architectural harmony — do all parts sing together? Or do some modules fight the design?
4. Mastery verdict — what has achieved excellence, what approaches it, what needs another cycle

**Closing (for all Nav Shakti cycles):** Jai Maa Shakti

---

### Divine Reviewers (8-cycle, one reviewer per cycle)
**When to use:** Design unification, UI/UX audits, cross-domain harmonization.
**Method:** Each cycle is owned by a different divine reviewer, bringing their unique perspective:
1. Saraswati — Knowledge & clarity (naming, semantics, correctness)
2. Lakshmi — Abundance & proportion (spacing, balance, resource efficiency)
3. Parvati — Nurture & consistency (typography, user experience, care)
4. Durga — Protection & boundaries (borders, limits, edge cases, validation)
5. Brahma — Creation & structure (components, architecture, composition)
6. Vishnu — Preservation & layout (system layout, state management, persistence)
7. Shiva — Transformation & theming (theming, modes, adaptability, what to destroy)
8. Hanuman + Vishwakarma — Execution & craft (DX, authoring, tooling, build)

**Closing:** Om Aim Saraswatyai Namah — May clarity guide every review

---

### Khatu Shyam Cycle (The Navigator) — Tag: `KS`
**When to use:** ALWAYS as the first step when you don't know which cycle to run. When the situation is unclear, when multiple cycles seem relevant, or when you're overwhelmed and need guidance. Hare Ka Sahara, Khatu Shyam Humara.
**Philosophy:** Khatu Shyam Ji — Barbarik — is the one who sees the entire battlefield in a single glance. He does not fight; he decides who should. Before any arrow is released, he surveys all sides with his three arrows of perception. His cycle is the compass that points you to the right divine energy for the task at hand.
**Method:** Do not jump into analysis. First, listen. Understand the symptom, the context, and the emotional weight. Then match it to the right cycle with clarity and conviction. If multiple cycles apply, sequence them.
**Structure (4-cycle Decision Matrix):**

1. **The Symptom** — What is the presenting problem? Describe it in one sentence without solution-language. Is it pain (something hurts), fear (something might break), confusion (don't know what to do), emptiness (something is missing), or friction (something resists)?

2. **The Battlefield Survey** — First classify the emotion, then match to the [Cycle Routing Table](#cycle-routing-table):

   | What you feel | Root energy | Start here |
   |---------------|-------------|------------|
   | **Pain** — something hurts right now | Destruction/Healing | Shiva (`SD`), Kaalratri (`NS7`), Baglamukhi (`BM`) |
   | **Fear** — something might break soon | Preservation/Protection | Vishnu (`VD`), Lakshman (`LD`), Chandraghanta (`NS3`) |
   | **Confusion** — don't know what to do | Communication/Clarity | Narad (`ND`), Saraswati (`DR`), Skandamata (`NS5`) |
   | **Emptiness** — something is missing | Creation/Nurturing | Brahma (`BD`), Kushmanda (`NS4`), Skandamata (`NS5`) |
   | **Friction** — something resists | Discipline/Courage | Brahmacharini (`NS2`), Katyayani (`NS6`), Hanuman (`HD`) |
   | **Doubt** — are we doing the right thing? | Governance/Truth | Ram (`RAD`), Sita (`SID`), Radha (`RD`) |
   | **Indecision** — multiple paths, can't choose | Strategy/Wisdom | Krishna (`KD`), Narad (`ND`), Ram (`RAD`) |
   | **Blocked** — can't move forward, wall everywhere | Obstacle Removal | Ganesh (`GD`), Hanuman (`HD`), Katyayani (`NS6`) |

   Then look up the specific situation in the [Cycle Routing Table](#cycle-routing-table) to confirm your choice.

3. **The Three Arrows** — Barbarik's three arrows that never miss:
   - **Arrow 1 (Mark the enemies):** What is the primary cycle? The one that addresses the root cause.
   - **Arrow 2 (Mark the allies):** What supporting cycles should run after? (0-2 follow-ups, sequenced)
   - **Arrow 3 (Connect them):** What is the thread that ties these cycles together? State it as a single sentence mission.

4. **The Verdict** — Declare the cycle plan:
   ```
   Primary: [Cycle Name] (Tag)
   Follow-up: [Cycle Name] (Tag) → [Cycle Name] (Tag)  (if needed)
   Mission: [One sentence]
   ```
   Then begin the primary cycle immediately.

**Closing:** Hare Ka Sahara, Khatu Shyam Humara

### Ashtavakra Deep Cycle (Witness Analysis)
**When to use:** When the system is confused by its own complexity. When over-monitoring, over-alerting, or over-reacting obscure the truth. When you need to SEE clearly without acting.
**Philosophy:** Ashtavakra told Janaka: "You are not the body, not the mind. You are the witness." This cycle strips away identification with metrics, dashboards, and alerts to see the system AS IT IS — not as the monitoring says it is.
**Guardian:** Ashtavakra — the crooked sage with the straightest teaching.
**Tag:** `ASD`
**Structure (3x4 Witness Matrix):**

**Round 1 — Shravana (Hearing) — What Does the System Claim? (Cycles 1-4):**
1. What do the dashboards say? What story do the metrics tell?
2. What do the alerts claim? What does the monitoring THINK is wrong?
3. Where is the system identifying with its own metrics? (CPU at 90% = panic?)
4. What would Ashtavakra say? "Are you the metric, or the one reading the metric?"

**Round 2 — Vichara (Inquiry) — What Is Actually True? (Cycles 5-8):**
5. Disconnect monitoring. What does the system DO without observers?
6. Where is identification causing over-reaction? (Alert fatigue, false positives)
7. What is the system WITNESSING vs what is it REACTING to?
8. The rubber band test: if you turn off all monitoring, what breaks? THAT is real.

**Round 3 — Sakshi (Witness) — What to Do (Cycles 9-12):**
9. Remove false identifications (noisy alerts, vanity metrics)
10. Stabilize the witness: observability that SEES without FLINCHING
11. The Sahaja test: does the system need constant attention or does it self-regulate?
12. The Turiya verdict: can the system transcend its own monitoring?

**Closing:** Aham Brahmasmi — I Am That. The system IS the awareness, not the metrics.

### Buddha Deep Cycle (Middle Path Analysis)
**When to use:** When the team is oscillating between extremes — over-engineering vs under-designing, premature optimization vs willful neglect, monolith vs micro-services. When balance is needed.
**Philosophy:** Buddha rejected both the palace (Sukha) and the forest (Tapas). The Middle Way is not compromise — it is a THIRD path that transcends both. This cycle finds the system's middle way.
**Guardian:** Gautam Buddha — the Awakened One.
**Tag:** `BUD`
**Structure (3x4 Middle Path Matrix):**

**Round 1 — Samvega (What Are the Four Sights?) (Cycles 1-4):**
1. What is the system COMFORTABLE with that it shouldn't be? (Sukha audit)
2. What is the system SUFFERING from unnecessarily? (Dukkha identification)
3. Where are the walls hiding the truth? (Metrics, reports that mask reality)
4. What is the system's "four sights" — the truths it hasn't faced?

**Round 2 — Majjhima (Finding the Middle Way) (Cycles 5-8):**
5. Where is the system in Tapas (extreme austerity)? Over-strict, over-complex?
6. Where is the system in Sukha (comfortable ignorance)? Under-tested, under-reviewed?
7. The Sujata test: what nourishment is the system refusing out of pride?
8. The Middle Way proposal: neither extreme. What is the balanced architecture?

**Round 3 — Bodhi (Seeing the Causal Chain) (Cycles 9-12):**
9. Map the dependent origination: when THIS exists, THAT comes to be
10. The Mara test: what is the system's temptation to return to comfort?
11. The cost audit: what did each architectural choice cost? Was it worth it?
12. The Dhammacakka: document the finding so others don't repeat the extremes

**Closing:** Sabbe Sankhara Anicca — All conditioned things are impermanent. Build accordingly.

### Gorakhnath Deep Cycle (Body/Hardware Mastery Analysis)
**When to use:** When the system needs PERFORMANCE optimization. When hardware is underutilized. When the "body" (infrastructure, runtime, bare metal) needs to be understood and perfected, not just the "mind" (application logic).
**Philosophy:** Gorakhnath said "Pind brahmand" — the body IS the universe. Master the single node before scaling the cluster. This cycle goes THROUGH the hardware, not around it.
**Guardian:** Guru Gorakhnath — the Alchemist of the Body.
**Tag:** `GKD`
**Structure (3x4 Body Alchemy Matrix):**

**Round 1 — Pashu to Hatha (Purification) (Cycles 1-4):**
1. What is the system's Pashu state? Where is it running at 10% capacity unconsciously?
2. The Shat-Karma: six system cleanups — buffers, stale data, GC, defrag, focus, pipeline
3. Where are the nadis blocked? (Bottlenecks, contention, hot paths)
4. Is there a guru? (Profiler, benchmarks, tracing — or is optimization happening blind?)

**Round 2 — Nada to Kaya_Siddhi (Mastery) (Cycles 5-8):**
5. Can you hear the nada? When cache hits align and pipeline stalls vanish — the system HUMS
6. Where are siddhis manifesting? (Capabilities beyond spec — are they reliable or accidental?)
7. The Siddhi_Trap: is the team optimizing for BENCHMARKS instead of USERS?
8. The Kaya_Collapse test: are any "optimizations" actually introducing new failure modes?

**Round 3 — Unmani to Avadhuta (Transcendence) (Cycles 9-12):**
9. Can the system self-tune? (Auto-scaling, adaptive algorithms, self-healing)
10. The Avadhuta test: does the system have vendor lock-in? Proprietary dependencies?
11. The Guru-Disciple test: if the monitoring fails, can the system detect and recover?
12. The Immortality verdict: can this system run forever without restart?

**Closing:** Aadesh! The body is the universe. Master the node, master the cluster.

### Tulsidas Deep Cycle (Devotion/User-Love Analysis)
**When to use:** When the product has lost its soul. When the team goes through motions without joy. When users are treated as "traffic" instead of people. When Shabari would weep if she saw what became of the product.
**Philosophy:** Tulsidas wrote for the woman grinding grain, not for scholars. Seven steps into a sacred lake. Each step purifies deeper. The simplest user (Shabari) is the true north.
**Guardian:** Goswami Tulsidas — the poet who gave Rama to the people.
**Tag:** `TLD`
**Structure (3x4 Bhakti Matrix):**

**Round 1 — Bal to Aranya (Where Is the Love?) (Cycles 1-4):**
1. Bal: When did the team FALL IN LOVE with this product? Can they still feel it?
2. Ayodhya: What hard choices were made for the USER's sake, not the team's comfort?
3. Aranya: Has the core purpose (Sita) been lost to complexity (Ravana)?
4. The Shabari metric: can the simplest, least technical user FIND what they need?

**Round 2 — Kishkindha to Lanka (Service and Battle) (Cycles 5-8):**
5. Kishkindha: who is the product's Hanuman? The one who leaps oceans for users?
6. Sundara: where is PURE SERVICE happening? (3 AM fixes, going beyond the ticket)
7. Lanka: what are the ten heads of ego? (NIH, resume-driven dev, hype-driven architecture...)
8. The root of Ravana: what is the team's ego attachment that hurts users?

**Round 3 — Uttara (Ram Rajya) (Cycles 9-12):**
9. Is this Ram Rajya? Does every user get justice, attention, care?
10. The Sita test: who SUFFERS even in the "perfect" system? Find them.
11. The Nama test: is the mission statement alive or mechanical?
12. The Vinay Patrika: if the team feels dry, go talk to ONE user. Remember why.

**Closing:** Siya Ram, Jai Jai Ram — The Name is greater than the Named. The user's need is greater than the product.

### OSHO Deep Cycle (Conditioning/Catharsis/Celebration Analysis)
**When to use:** When the codebase is running on inertia, not intention. When "best practices" are followed without question. When the team is suppressing problems instead of expressing them. When the system needs to EXPLODE before it can be silent.
**Philosophy:** OSHO said: "You cannot meditate when you are full of repression. Explode first." This cycle deliberately breaks patterns, surfaces suppressed issues, celebrates what works, and then — from fullness — finds silence.
**Guardian:** OSHO — the Rebellious Mystic.
**Tag:** `OSD`
**Structure (3x4 Dynamic Meditation Matrix):**

**Round 1 — Chaotic Breathing (Break the Pattern) (Cycles 1-4):**
1. What is the system doing because "it's always been done this way"? (Sushupti audit)
2. What configurations, dependencies, patterns were INHERITED, not chosen?
3. The rebellion test: if you could delete ANY one convention, which would free the most?
4. Chaos injection: what happens if you deliberately break the "sacred" assumption?

**Round 2 — Catharsis + Celebration (Release and Enjoy) (Cycles 5-8):**
5. The Rechana: surface EVERY suppressed issue — tech debt, ignored warnings, swallowed errors
6. The Zorba: what in this codebase is DELIGHTFUL? Celebrate it. Name it. Protect it.
7. The Zorba-Buddha test: is the system both JOYFUL to use AND architecturally truthful?
8. The Guru_Trap: is the team dependent on ONE person's knowledge? Distribute it.

**Round 3 — Silence + Service (From Fullness) (Cycles 9-12):**
9. The Shunyata: after the explosion — what remains? What is essential?
10. The Seva: who does this system SERVE? Is the service real or performative?
11. The Synthesis: what from Ashtavakra (witness), Buddha (balance), Gorakhnath (practice), Tulsidas (love) applies HERE?
12. The Sahaj_Ananda verdict: does this system celebrate its own existence? If not — why build it?

**Closing:** Zorba the Buddha — Dance AND Know. Build AND Celebrate. Serve AND Rejoice.

---

### Chanakya Deep Cycle — Strategic Statecraft Analysis (Tag: `CKD`)

**Guardian:** Chanakya / Kautilya — the kingmaker who destroyed empires with intellect, not armies.
**When to use:** Business model decisions, competitive positioning, pricing strategy, partnership evaluation, market analysis, resource allocation, treasury/budget reviews. Any time money, competition, or political survival is at stake.
**Philosophy:** "The root of wealth is economic activity." No sentiment — pure strategic calculus. Every ally is temporary. Every cost must justify itself. The enemy you ignore will grow. The treasury you neglect will empty. Chanakya's genius: he never confused kindness with strategy, nor cruelty with strength.
**Method:** Map the Mandala (alliance matrix), assess the Kosha (treasury), deploy Sama-Dana-Bheda-Danda (persuade-incentivize-divide-force) in that order. Never escalate before exhausting softer tools. Never ignore hard tools when soft ones fail.

**Structure (3x4 Arthashastra Matrix):**

**Round 1 — Intelligence (Chhandma) (Cycles 1-4):**
1. **Market Darshan:** Who are the players? Map every competitor, partner, dependency. No guessing — evidence only.
2. **Mandala Construction:** Classify each: Ari (enemy/competitor), Mitra (ally), Madhyama (neutral/could go either way), Udasina (irrelevant). Who are THEIR allies?
3. **Weakness Audit:** Where is OUR vulnerability? Single points of failure: one customer, one technology, one person? Chanakya never attacked before knowing his OWN weakness.
4. **Intelligence Gap:** What do we NOT know? What would change our strategy if we knew it? Deploy spies (research, user interviews, metrics).

**Round 2 — Treasury & Force (Kosha + Danda) (Cycles 5-8):**
5. **Kosha Audit:** Revenue model viable? Burn rate sustainable? Reserves for six seasons (6 months)? "A king without treasury is no king."
6. **Sama-Dana:** What can we achieve through persuasion and incentives? Open-source goodwill, developer relations, partnerships, early adopter programs.
7. **Bheda Analysis:** Where can we divide the competition's alliance? Their weakness is our opportunity. Not unethical — strategic positioning.
8. **Danda Readiness:** If soft methods fail, what is our hard power? IP protection, speed of execution, technical moat, switching costs we've built.

**Round 3 — Governance & Exit (Shasana + Tyaga) (Cycles 9-12):**
9. **Shasana Design:** How does the kingdom run when the king sleeps? Automation, delegation, documentation, self-sustaining processes.
10. **Spy Network:** Monitoring, analytics, user feedback loops, competitive intelligence — continuous, not periodic.
11. **Succession Test:** If the founder/lead leaves, does the project survive? Knowledge distribution, bus factor > 1.
12. **Tyaga Verdict:** Is this the right battle? Chanakya's greatest move was walking away. Kill projects that don't serve the vow.

**Closing:** Arthashastra Sutra — "Sukhasya mulam dharmah. Dharmasya mulam arthah. Arthasya mulam rajyam." Happiness comes from dharma. Dharma comes from wealth. Wealth comes from good governance.

---

### Patanjali Deep Cycle — Systematic Process Discipline Analysis (Tag: `PJD`)

**Guardian:** Maharishi Patanjali — the compiler of Yoga Sutras. 196 sutras, zero wasted words.
**When to use:** When the process itself needs auditing. Are we skipping steps? Are prerequisites met before advancing? Is the pipeline disciplined or chaotic? When OSHO says "rebel" and Kabir says "simplify" but the problem is actually "you skipped step 3."
**Philosophy:** "Yogash chitta vritti nirodhah" — the system works when fluctuations cease. Not through force — through systematic, sequential discipline. Each limb is a prerequisite. You cannot concentrate (Dharana) if the body is sending interrupts (Asana not done). You cannot meditate (Dhyana) if senses keep pulling attention (Pratyahara skipped). The 8 limbs are compiler passes — skip one, get garbage.
**Method:** Walk the 8 limbs against the system under review. Each limb maps to an engineering discipline. Identify which limb is broken. Fix THAT limb, not the symptom downstream.

**The 8 Limbs → Engineering Map:**
| Limb | Sanskrit | Engineering Analog |
|------|----------|-------------------|
| 1 | Yama (restraints) | Code of conduct: no hacks, no shortcuts, no stolen code, no bloat, no hoarding |
| 2 | Niyama (observances) | Internal standards: clean code, contentment with simplicity, discipline, self-study, trust the process |
| 3 | Asana (posture) | Infrastructure stability: CI/CD solid, dev env reproducible, no flaky foundations |
| 4 | Pranayama (breath) | Flow control: rate limiting, backpressure, throttling, resource management |
| 5 | Pratyahara (withdrawal) | Decoupling: no unnecessary dependencies, clean interfaces, blast radius contained |
| 6 | Dharana (concentration) | Focus: one task at a time, no context switching, deep work protected |
| 7 | Dhyana (meditation) | Flow state: unbroken development sessions, no interruption-driven culture |
| 8 | Samadhi (absorption) | Mastery: the system and its purpose merge — the tool disappears into the work |

**Structure (3x4 Ashtanga Matrix):**

**Round 1 — Foundation Limbs (Yama → Asana) (Cycles 1-4):**
1. **Yama Audit:** Are we violating any restraint? Copying code without understanding (asteya)? Hoarding knowledge (aparigraha)? Harming users with bugs we know about (ahimsa)? Lying in our docs (satya)?
2. **Niyama Audit:** Are our internal practices clean? Code hygiene (shaucha)? Are we content with simplicity or chasing features (santosha)? Is discipline present (tapas)? Do we study our own codebase (svadhyaya)?
3. **Asana Audit:** Is the infrastructure stable AND comfortable? Can a new developer set up in under 30 minutes? Are builds reproducible? Is the foundation steady enough to forget about it?
4. **Prerequisite Gate:** Do the first 3 limbs pass? If Yama/Niyama/Asana are broken, STOP. Fix foundations before optimizing higher layers. Patanjali is clear: NO SKIPPING.

**Round 2 — Bridge Limbs (Pranayama → Pratyahara) (Cycles 5-8):**
5. **Pranayama Audit:** Is flow controlled? Rate limiting in place? Backpressure handled? Resources managed? Memory leaks = irregular breathing.
6. **Pratyahara Audit:** Are modules properly decoupled? Can you change one subsystem without the others noticing? If every change cascades, Pratyahara failed.
7. **Antaraya Scan:** Which of Patanjali's 9 obstacles is active? Disease (tech debt)? Doubt (unclear requirements)? Laziness (deferred hard decisions)? Each has a specific remedy.
8. **Bridge Gate:** Can the system focus? If it's still fighting infrastructure (Asana) or leaking resources (Pranayama), Dharana is impossible.

**Round 3 — Mastery Limbs (Dharana → Samadhi) (Cycles 9-12):**
9. **Dharana Test:** Can the team focus on ONE thing for a full sprint? Or is everything interrupted, context-switched, scattered? Single-threaded focus is a discipline, not a luxury.
10. **Dhyana Test:** When the team works, is the flow unbroken? Or do meetings, alerts, process overhead break every session? Count the interruptions per hour.
11. **Samadhi Aspiration:** Does the tool disappear into the work? Or does the user fight the tool? The highest engineering: the system is invisible.
12. **Kaivalya Verdict:** Is this system standalone, self-sufficient, and clear in its purpose? Or is it dependent on a dozen external things that could break it?

**Closing:** Yogash chitta vritti nirodhah — When the process fluctuations cease, the system abides in its true nature.

---

### Kabir Deep Cycle — Anti-Hypocrisy & Simplicity Analysis (Tag: `KBD`)

**Guardian:** Kabir Das — illiterate weaver who outthought every pandit and mullah.
**When to use:** When the system smells of ceremony without substance. When reviews exist but bugs still ship. When documentation is perfect but nobody reads it. When the process is followed but the product is mediocre. When you suspect you're worshipping the ritual, not the result. Kabir catches what others are too polite to say.
**Philosophy:** "Pothi padh padh jag mua, pandit bhaya na koye / Dhai akshar prem ka, padhe so pandit hoye" — The world died reading books, nobody became wise. Read two-and-a-half letters of love, THAT makes you wise. Kabir doesn't care HOW much process you follow. He cares if the CLOTH IS REAL.
**Method:** Apply the Doha Test — each cycle is a two-line couplet that cuts one specific illusion. If you can't answer the doha honestly, you found rot.

**Structure (3x4 Doha Matrix):**

**Round 1 — The Weaver's Eye (Threads) (Cycles 1-4):**
1. **The Pandit Test:** "Pothi padh padh jag mua" — Are we reading/writing documentation nobody uses? Tests nobody maintains? Plans nobody follows? Identify EVERY artifact that exists for show, not function.
2. **The Mullah Test:** "Kankar pathar jod ke masjid lai chunay" — Are we building impressive architecture that nobody needs? Over-engineering? Gold-plating? Is the mosque made of stone but God isn't in it?
3. **The Rosary Test:** "Mala pherat jug gaya, mita na man ka pher" — Are we going through process motions? Stand-ups where nobody listens? Reviews where nobody reads? Sprints where the velocity number matters more than the product?
4. **The Cloth Test:** "Jhini jhini bini chadariya" — Is the actual WORK honest? Not the ceremony around it — the CODE. The PRODUCT. The thing the USER touches. Is the thread real or rotten?

**Round 2 — The Doha Cuts (Illusions) (Cycles 5-8):**
5. **The Simplicity Doha:** "Sahaj mile so doodh hai, maanga mile so paani" — What came naturally (milk) vs what we begged for (water)? Which features flowed from real need? Which were forced by stakeholder pressure?
6. **The Death Doha:** "Kabir mua tab kya hua, jo koi mue na roye" — If this feature/module died today, would anyone notice? If not — why does it exist? Kill it with Kabir's laugh.
7. **The Marketplace Doha:** "Kabir khada bazaar mein, sabki maange khair" — Does this system wish everyone well? Or does it serve the builders more than the users? Stand in the marketplace. Look around. Who benefits?
8. **The Upside-Down Doha:** "Ulta baans pe chadhegi chadariya" — What assumption is INVERTED from truth? What do we believe that is exactly wrong? The ocean is in the fish, not the fish in the ocean. Find the inversion.

**Round 3 — The Clean Cloth (Honesty) (Cycles 9-12):**
9. **The Guru Test:** "Guru Govind dono khade, kaake laagoon paaye" — Who is the real teacher here? The process document or the production incident? The architecture diagram or the user complaint? Honor the TRUE guru.
10. **The Mirror Test:** Apply every doha to YOURSELF (the reviewer), not the code. Are YOU going through ceremony? Is YOUR review honest or performative? Kabir's blade cuts the wielder first.
11. **The Two-and-a-Half Letters:** "Dhai akshar prem ka" — After all analysis, what is the SIMPLEST thing this system needs? Not the most sophisticated. The simplest. If you can't say it in 2.5 words, you don't understand it yet.
12. **The Weaver's Verdict:** Is the cloth clean? Will it hold? When the body (project) returns to the loom (market), will the cloth be remembered? "Jo ghar jaale aapna, chale hamare saath" — only what you burn (truly internalize) comes with you.

**Closing:** Na main mandir, na main masjid — Neither in the temple nor in the mosque. The truth is in the honest thread, woven with care, by a weaver who doesn't pretend.

---

### Aryabhata Deep Cycle — Algorithm & Computation Analysis (Tag: `ARD`)

**Guardian:** Aryabhata (476 CE) — invented zero as placeholder, place-value system, kuttaka algorithm, sine tables. Wrote the entire known mathematics in 121 verses at age 23.
**When to use:** Algorithm design reviews, numerical correctness audits, precision analysis, performance complexity review, data structure selection, computational thinking verification. When the math must be RIGHT, not just "working."
**Philosophy:** "Sthanam sthanam dasha gunam" — place to place is ten times. Representation IS power. Wrong encoding = wrong everything. Aryabhata never guessed — he computed, stated precision, bounded error, and published method. Every number has provenance.
**Method:** Walk the computation pipeline. At each stage: is the count correct? Is the encoding right? Is the algorithm optimal? Is the precision sufficient? Is the error bounded?

**Structure (3x4 Computation Matrix):**

**Round 1 — Foundation (Ganana → Sankhya) (Cycles 1-4):**
1. **Ganana (Counting):** Before optimizing, COUNT. How many records? How many operations? How many bytes? How many users? If you haven't counted, you're guessing. Aryabhata counted planetary revolutions — count your data.
2. **Sankhya (Encoding):** Is the data represented correctly? Number types (u32 vs u64 vs f64), string encoding (UTF-8 boundary), data structures (Vec vs HashMap vs BTreeMap). Wrong encoding = Sthula_Bhrama (gross error) downstream.
3. **Sunya (Zero) Audit:** Where can zero appear? Empty lists, null values, division denominators, array indices, first-time runs. Aryabhata invented zero — he wasn't afraid of it. Every zero case must be EXPLICITLY handled.
4. **Precision Budget:** What is the acceptable error? Floating point accumulation, rounding, truncation, sampling. If you can't state your precision, you don't have precision.

**Round 2 — Algorithm (Kuttaka → Jya) (Cycles 5-8):**
5. **Kuttaka (Decomposition):** Is the problem correctly decomposed? Can each subproblem be solved independently? Are there unnecessary coupled variables? The Pulverizer reduces — are you reducing or complicating?
6. **Complexity Audit:** Time complexity stated? Space complexity stated? Best/worst/average cases? "It's fast enough" is not an answer. O(n²) hiding in a loop is a bug, not a style choice.
7. **Jya (Approximation):** Where are approximations used? Are they KNOWN approximations with stated error bounds? Or are they accidental? Caches, heuristics, sampling — all approximations. Name them.
8. **Bhagana (Pattern):** Are there cycles in the data that the algorithm exploits or ignores? Periodicity, caching patterns, predictable access patterns. Aryabhata found planetary cycles — find your data's rhythm.

**Round 3 — Verification (Yugapada → Siddhanta) (Cycles 9-12):**
9. **Yugapada (Simultaneous):** Are coupled variables solved together or in isolation? Race conditions, concurrent mutations, interleaved transactions — if variables are coupled, solve them coupled.
10. **Reproducibility:** Given the same input, does the algorithm produce the EXACT same output? Floating point, random seeds, time-dependent behavior, hash ordering — all threats to reproducibility.
11. **Edge Universe:** Test at: zero, one, max, overflow, underflow, NaN, infinity, empty, full, exact boundary. Aryabhata's sine table covered 0-90 degrees in 24 steps. Cover YOUR domain's full range.
12. **Siddhanta (Publication):** State the result with precision. Document the method. Make it reproducible. "It works" → "It computes X within ±Y precision using algorithm Z with O(n log n) time and O(n) space, verified against K test cases."

**Closing:** Sthanam sthanam dasha gunam — Place to place is ten times. Respect the power of correct representation.

---

### Sushruta Deep Cycle — Surgical Intervention Analysis (Tag: `SSD`)

**Guardian:** Sushruta (600 BCE) — father of surgery. 184 chapters, 300 procedures, 121 instruments. Performed rhinoplasty 2600 years ago. His patients lived.
**When to use:** Hotfixes, production incidents, bug fixes in critical paths, any change where COLLATERAL DAMAGE is the primary risk. When Shiva is a sledgehammer and you need a scalpel. When the system is LIVE and you must fix without breaking.
**Philosophy:** "A surgeon must possess the eye of a hawk, the heart of a lion, and the hand of a lady." Diagnose precisely. Cut minimally. Heal completely. The best surgeon is the one who doesn't need to operate (Ashastra).
**Method:** Five-fold examination before any intervention. Root cause before remedy. Minimum instrument. Expect infection. Plan for healing. Leave the patient STRONGER.

**Structure (3x4 Surgical Matrix):**

**Round 1 — Diagnosis (Pariksha → Nidana) (Cycles 1-4):**
1. **Inspect:** Read the error. Read the logs. Read the code. Do NOT touch anything yet. The hawk's eye: observe from above.
2. **Palpate:** Reproduce the bug. Touch the system gently — test endpoints, check states, verify assumptions. Where exactly does it hurt?
3. **Nidana (Root Cause):** Not the symptom — the CAUSE. Five nidanas: (1) What caused it? (2) Were there premonitory signs? (3) What are the symptoms? (4) What is the pathogenesis (how did it spread)? (5) What is the prognosis (how bad can it get)?
4. **Ashastra Gate:** Can this be fixed WITHOUT cutting (code change)? Config change? Feature flag? Data fix? Restart? The best surgery is no surgery.

**Round 2 — Intervention (Shastra → Chedana) (Cycles 5-8):**
5. **Instrument Selection:** What is the MINIMUM change? One line fix > function rewrite > module refactor. Choose the scalpel, not the bone saw. Every extra line changed is collateral risk.
6. **Blast Radius:** What else does this code touch? Who calls this? Who depends on this? Map the blast radius BEFORE cutting. If the blast radius is too wide, reconsider the approach.
7. **The Cut:** Make the change. Minimal. Precise. Purposeful. Every line has a reason. No "while I'm here" cleanups. No refactoring. JUST the fix.
8. **Shodhana (Cleansing):** Immediately after the cut — verify. Does the fix work? Did it break anything else? Run the MINIMUM test set that covers the blast radius. Clean the wound.

**Round 3 — Recovery (Ropana → Rasayana) (Cycles 9-12):**
9. **Ropana (Healing):** Deploy. Monitor. The operation succeeds or fails in post-op, not in the cutting room. Watch metrics for 1 hour after deploy. Is the patient stable?
10. **Infection Check:** Did the fix introduce any NEW issues? Regression test. Edge cases of the fix itself. The iatrogenic harm check — did the surgeon cause new damage?
11. **Rasayana (Strengthening):** Now — and ONLY now — write the test that would have caught this bug. Add the monitoring that would have alerted earlier. Make the system stronger than before.
12. **Post-Mortem:** What was the root cause? Why wasn't it caught? What preventive measure is now in place? Document in 5 sentences or fewer. Sushruta wrote 184 chapters so future surgeons wouldn't repeat his mistakes.

**Closing:** The hand of a lady, the eye of a hawk, the heart of a lion — cut with precision, see with clarity, act with courage.

---

### Saraswati Deep Cycle — Knowledge & Documentation Analysis (Tag: `SRD`)

**Guardian:** Maa Saraswati — goddess of knowledge, music, speech. Veena (vibration), Pustaka (book), Mala (discipline), Kamandalu (essence). The Hamsa (swan) separates milk from water.
**When to use:** Documentation quality audit, knowledge architecture review, onboarding experience, API documentation, book/TOML quality, teaching clarity. When DR (Divine Reviewers) handles UI design, SRD handles the KNOWLEDGE layer. Referenced in LAW 9 — now she has her own full cycle.
**Philosophy:** Knowledge begins in honest ignorance (Ajnana), passes through hearing (Shruti), recording (Smriti), discernment (Viveka), expression (Vani), structure (Vidya), wisdom (Pragya), and arrives at effortless teaching (Hamsa). The swan glides — you don't see the feet working.
**Method:** Walk the knowledge pipeline. At each stage: is this knowledge REAL (not polluted), CLEAR (not jargon), STRUCTURED (not scattered), and TEACHING (not just recording)?

**Structure (3x4 Knowledge Matrix):**

**Round 1 — The River Source (Shruti → Smriti) (Cycles 1-4):**
1. **Ajnana Audit:** What DON'T we know? What is undocumented? Where would a newcomer get lost? The empty pages are more important than the full ones. Map the gaps.
2. **Shruti (Source) Check:** Where does our knowledge COME from? Is the source authoritative? Are we documenting assumptions as facts? Trace every claim to its source.
3. **Smriti (Recording) Check:** Is what was heard faithfully recorded? Or was it interpreted, editorialized, simplified to the point of falsehood? Compare docs to actual code behavior.
4. **Tamas_Ghat Scan:** Is any documentation ACTIVELY HARMFUL? Outdated API docs, wrong examples, comments that describe the opposite of what the code does, README for a different version. Polluted knowledge is worse than none.

**Round 2 — The Swan's Discernment (Viveka → Vani) (Cycles 5-8):**
5. **Viveka (Milk vs Water):** What documentation is essential? What is noise? Every page that exists must EARN its existence. Separate the milk (useful) from the water (padding).
6. **Audience Audit:** Who reads this? Developer? Architect? Tester? User? A document that serves everyone serves no one. Each piece of documentation has ONE primary audience.
7. **Vani (Clarity) Test:** Read each doc aloud. Does it TEACH or does it RECITE? Would Skandamata (`NS5`) approve — can a newcomer learn from this? Jargon that excludes is a Vakya_Bhrama (miscommunication).
8. **The Example Test:** Every API, every function, every concept — does it have a WORKING example? Not "example coming soon." Not a toy example. A REAL example that compiles and runs. LAW 9 demands this.

**Round 3 — The Knowledge System (Vidya → Hamsa) (Cycles 9-12):**
9. **Vidya (Structure):** Is knowledge organized or scattered? Can you FIND what you need? Cross-references, index, search, navigation. A library without a catalog is a warehouse.
10. **Pragya (Application):** Does the documentation help people DO things? Or is it a museum exhibit? Knowledge that can't be applied is trivia. Pragya = Vidya in action.
11. **Hamsa Aspiration:** Is any part of the system so well-designed that it TEACHES WITHOUT DOCUMENTATION? Clean code that reads like prose? APIs that are obvious? That's the Hamsa state — the highest documentation.
12. **River Health:** Is the knowledge river flowing? Are docs updated when code changes? Is there a mechanism to prevent Tamas_Ghat (pollution)? The river must flow — stagnant water breeds disease.

**Closing:** Saraswati namastubhyam — The swan separates milk from water. Let our knowledge be pure, our expression clear, and our teaching effortless.

---

### Vishwakarma Deep Cycle — Build System & Infrastructure Analysis (Tag: `VKD`)

**Guardian:** Vishwakarma — divine architect. Built Lanka, Dwarka, Indraprastha, Pushpaka Vimana, Sudarshana Chakra, Vajra. His tolerance for shoddy work is zero.
**When to use:** Build system audit, CI/CD pipeline review, toolchain evaluation, infrastructure decisions, deployment architecture, dev environment setup. When the TOOLS that build the product need examination. Also: new project scaffolding (complements Brahma Deep `BD` which handles the vision — Vishwakarma handles the construction).
**Philosophy:** The architect who builds for gods doesn't accept "it works on my machine." Every structure: functional, beautiful, eternal. Build your tools BEFORE your structure. The foundation isn't glamorous — it's everything. Beware the Maya Sabha: impressive demos over fragile internals.
**Method:** Walk the build pipeline from vision to consecration. At each stage: is the foundation solid? Are the tools right? Is the construction honest? Does it survive its worst day?

**Structure (3x4 Architecture Matrix):**

**Round 1 — Foundation (Sankalpa → Vastu) (Cycles 1-4):**
1. **Sankalpa (Vision):** Why does this infrastructure exist? What NEED does it serve? Not "we need Kubernetes" — "we need X, and Y is the minimum infrastructure that provides it." Intent before tool selection.
2. **Vastu (Site Survey):** What are the forces? Traffic patterns, data volume, team size, budget, compliance requirements, geography, latency constraints. Survey before building.
3. **Dependency Audit:** Every dependency is a LOAD-BEARING WALL. Map them all. Which are maintained? Which are abandonware? Which are single-maintainer? Which have CVEs? Vishwakarma knew his materials.
4. **Foundation Test:** Can a new developer go from zero to running in under 30 minutes? If not, the foundation has cracks. The Asana test from Patanjali: is the base stable AND comfortable?

**Round 2 — Construction (Shilpa → Nirmana) (Cycles 5-8):**
5. **Shilpa (Blueprint):** Is the build system DOCUMENTED? Not tribal knowledge — written, versioned, reproducible blueprints. If Vishwakarma disappeared, could someone else build Dwarka from his plans?
6. **Yantra (Toolchain):** Are the tools right for the material? Cargo for Rust, npm for JS, make for C — but also: are we using the tool's STRENGTHS or fighting it? The wrong tool creates new wounds (Sushruta agrees).
7. **Nirmana (Build):** The actual build. Time to build? Incremental build time? Cache hit rate? Reproducible? Deterministic? A build that takes 10 minutes when it could take 30 seconds is a STRUCTURAL FAILURE.
8. **Maya Sabha Gate:** Does the demo environment match production? Or is it a palace of illusions? Docker-compose ≠ production Kubernetes. SQLite dev ≠ PostgreSQL prod. Flag every divergence.

**Round 3 — Consecration (Pariksha → Pratishtha) (Cycles 9-12):**
9. **Pariksha (Testing):** Load test the infrastructure itself, not just the app. What happens at 10x traffic? At disk full? At network partition? At certificate expiry? Pushpaka Vimana was flight-tested before delivery.
10. **Deployment Audit:** Blue-green? Canary? Rolling? Rollback time? If deploy fails at step 7 of 10, what happens? Vishwakarma's buildings survived earthquakes — your deploys must survive failures.
11. **Monitoring & Alerting:** Is the infrastructure observable? Not just "is it up" but "is it HEALTHY"? Lakshman (`LD`) guards the boundary — does your monitoring actually WAKE someone when it matters?
12. **Pratishtha (Handover):** Can the infrastructure run without its builder? Documentation, runbooks, on-call playbooks, escalation paths. Vishwakarma built and LEFT. The structure must outlive its architect.

**Closing:** Vishwakarma built for gods. Build your infrastructure to that standard — functional, beautiful, eternal.

---

### Nagarjuna Deep Cycle — Anti-Over-Engineering Analysis (Tag: `NGD`)

**Guardian:** Nagarjuna (150-250 CE) — Madhyamaka philosopher. Tetralemma: for any P, test if P is true, false, both, or neither. Proved that even emptiness is empty.
**When to use:** When the codebase FEELS too complex. When there are more abstractions than concrete implementations. When adding a feature requires touching 7 files across 4 layers. When the architecture diagram is more impressive than the product. When someone says "we need this abstraction for future flexibility" but the future never arrives.
**Philosophy:** "Shunyata shunyata" — the emptiness of emptiness. Every abstraction is a CLAIM about reality. Most claims are empty — useful conventions, not ultimate truths. Over-engineering comes from reifying (treating as real) what is merely convenient. The cure: examine every abstraction with the tetralemma. Hold lightly. Drop when it stops serving.
**Method:** For each abstraction layer, pattern, or architectural decision: apply the Catuskoti (tetralemma), then the Prasanga (take to logical extreme). What survives is Vyavahara (useful convention). What collapses was Svabhava (false essence).

**Structure (3x4 Emptiness Matrix):**

**Round 1 — Svabhava Scan (What Claims to be Essential) (Cycles 1-4):**
1. **Sacred Cow Census:** List every abstraction, pattern, layer, framework, and convention in the codebase. For each: when was it introduced? By whom? WHY? Is the original reason still valid?
2. **The "What If We Deleted It" Test:** For each abstraction: what ACTUALLY breaks if it's removed? Not theoretically — ACTUALLY. If the answer is "nothing breaks but it might in the future" — it's a sacred cow.
3. **Layer Count:** How many layers between a user action and the database? Each layer is a tax. Count them. If it's more than 3 for simple CRUD: Reification_Trap active.
4. **The Junior Developer Test:** Can a new developer understand the architecture in one day? If not, the complexity may be accidental, not essential. Skandamata (`NS5`) would ask: can they LEARN from this?

**Round 2 — Catuskoti (The Four Questions) (Cycles 5-8):**
5. **Is it true?** "This abstraction is necessary." Evidence? Usage count? How many concrete implementations exist behind this interface? If the answer is ONE: the abstraction is premature.
6. **Is it false?** "This abstraction is unnecessary." What breaks without it? Real test: temporarily remove it. Compile. Test. If nothing breaks, it was empty.
7. **Is it both?** "This abstraction is partly necessary and partly noise." Most honest answer. Split it: keep the necessary part, remove the noise. The abstraction serves ONE purpose — everything else is cargo cult.
8. **Is it neither?** "The question itself is wrong." Maybe the abstraction vs no-abstraction debate is missing the point. Maybe the problem is in the domain model, not the code structure. Step back. Look at what the USER actually needs.

**Round 3 — Vyavahara (What Remains Useful) (Cycles 9-12):**
9. **Prasanga (Take to Extreme):** For each surviving abstraction: extend it to its logical conclusion. If "every module needs an interface" → does MAIN need an interface? If the extreme is absurd, the principle needs a BOUNDARY, not religious application.
10. **Nihilism Check:** Are we now UNDER-engineering? Nagarjuna warns: "shunyata misunderstood is a snake grasped wrong." Some abstraction IS needed. The goal is RIGHT-SIZED, not zero.
11. **Convention vs Truth:** Label each remaining abstraction: "Convention (useful but not sacred)" or "Essential (structural necessity)." Conventions can be changed when context changes. Essentials need stronger justification to remove.
12. **Lightness Verdict:** After the audit — does the codebase feel LIGHTER? Can you explain the architecture in 3 sentences? If not, repeat the cycle. Nagarjuna's ultimate: hold everything lightly, including this analysis.

**Closing:** Shunyata shunyata — Even emptiness is empty. Use abstractions. Just don't worship them.

---

### Thiruvalluvar Deep Cycle — Ethics & Governance Analysis (Tag: `TVD`)

**Guardian:** Thiruvalluvar — Tamil poet-saint. 1330 couplets, 133 chapters, 3 books (Virtue, Wealth, Love). No caste, no religion, no god named. Universal ethics in seven-word couplets.
**When to use:** Ethical review of product decisions, governance structure audit, diversity of perspective check, user rights review, team culture health, decision-making process fairness. Also: the ANTI-GROUPTHINK guardian — when the Divine Council starts sounding too similar, Thiruvalluvar brings the non-Vedic perspective. Use when the Sanskrit-heavy review cycle might be missing something.
**Philosophy:** "What is the purpose of knowledge if it does not lead to compassion for all living beings?" Three pillars: Aram (virtue first, always), Porul (wealth is duty, not sin), Inbam (love is the crown, not the escape). The householder who participates virtuously in the world is HIGHER than the monk who retreats. Ethics must survive contact with reality.
**Method:** Apply the Three Books test to the system. Book 1 (Aram): Is it virtuous? Book 2 (Porul): Is it viable? Book 3 (Inbam): Is it loved? A system that fails any book is incomplete.

**Structure (3x4 Kural Matrix):**

**Round 1 — Aram (Virtue) (Cycles 1-4):**
1. **The Truthfulness Test:** "All lamps are lamps, but the lamp of truth illuminates." Does the system tell the truth? Metrics, error messages, documentation, marketing. Poyyamai (deception) is the worst sin — find every lie.
2. **The Harm Test:** "What is the purpose of knowledge if not compassion?" Does the system harm anyone? Users, competitors, employees, the environment? Not just legal harm — ETHICAL harm. Dark patterns, addiction hooks, data exploitation.
3. **The Hospitality Test:** "The householder who feeds the guest, the ascetic, the poor" — Does the system serve the WEAKEST user as well as the strongest? Accessibility, pricing fairness, graceful degradation. Shabari (simplest devotee) meets Thiruvalluvar.
4. **The Inaction Test:** "Procrastination is the thief of opportunity." What ethical issues are KNOWN but UNADDRESSED? Security vulnerabilities reported but unpatched? Accessibility complaints filed but ignored? Seyalvinaiyamai is passive complicity.

**Round 2 — Porul (Wealth/Governance) (Cycles 5-8):**
5. **The Governor Test:** "The king who governs with justice is God." Who makes decisions? On what basis? Is authority EARNED through competence or assumed through position? Technical decisions should be made by those who understand the technology.
6. **The Council Test:** "The wealth of a king is his ministers." Is the decision-making circle diverse? Age, gender, background, discipline, perspective? One-voice councils are deaf. If everyone on the team thinks the same way, the team has one brain.
7. **The Assembly Test:** "A country's wealth is not its gold but its people." Do USERS have voice? Feedback channels, community forums, issue trackers, surveys? Not decorative feedback — feedback that CHANGES decisions.
8. **The Fairness Test:** "Tax the people as the bee takes honey — enough to live, not enough to kill the flower." Is pricing fair? Is the free tier honest? Do terms of service respect the user? Is the business model SUSTAINABLE without exploitation?

**Round 3 — Inbam (Love/Harmony) (Cycles 9-12):**
9. **The Joy Test:** Inbam — does anyone LOVE this system? Not "use" — LOVE. Joy of building, joy of using, joy of maintaining. If no one loves it, something fundamental is missing.
10. **The Diversity Audit:** Thiruvalluvar was non-Vedic in a Vedic world. What perspective is MISSING from our review process? What cultural assumption are we blind to? What user segment are we ignoring? Find the voice that isn't in the room.
11. **The Seven-Word Test:** Thiruvalluvar said everything in seven-word couplets. Can you explain your system's ethics in seven words? If not, the ethics are unclear. Compression forces clarity.
12. **The Universal Test:** Thiruvalluvar named no god, no caste, no religion — and yet his ethics endure 2000 years. Are your system's principles UNIVERSAL? Or are they contingent on your culture, your era, your market? What survives context change is truly ethical.

**Closing:** Aram seyya virumbu — Desire to do good. Not because a god commands. Because it is the nature of a good life.

---

## Bhakti Cycles — Conviction, Endurance, Truth

> Each bhakti saint is a universal FSM personality — a way of approaching ANY work from a specific devotional energy. They apply to code, to songs, to architecture, to documentation, to business, to life. The saint doesn't ask what domain you're in — the saint asks: are you devoted? Are you honest? Are you fearless?
>
> Originally manifested in a creative-engine project. Now recognized as universal across any building work. Each cycle has a corresponding shape (states, transitions, guards, and cross-coupling signals). The formal state-machine TOMLs for the divinity-named cycles live in [`fsms/atlas-fsms/`](fsms/atlas-fsms/) — reference material that consuming projects may parse, validate against, or extend.
>
> They work individually or in **jugalbandi** (duet/collaboration) mode.

### Prahlad Deep Cycle — Fearless Devotion Under Fire (Tag: `PRD`)

**Guardian:** Bhakt Prahlad — the five-year-old who sang through fire.
**When to use:** When the work faces rejection, ridicule, or pressure to stop. When someone says "this will never work." When a feature, a design, a vision, or a principle must survive every attempt to kill it. When the boot-chain crashes and you debug it again. When the investor says no and you build it anyway.
**Philosophy:** The fire that cannot silence the Name only makes the Name louder. Every rejection is fuel. The work that survives the fire is the only work worth doing.

**Structure (3x4 Narasimha Matrix):**

**Round 1 — Garbha to Agni (The Fire) (Cycles 1-4):**
1. **Garbha:** What is the seed? What inspiration arrived before logic could suppress it? Capture it NOW.
2. **Naam:** What is the ONE WORD this song is about? If you can't name it, you haven't found it.
3. **Agni:** What resistance exists? Self-doubt? Market? Critics? Name every fire.
4. **Endurance test:** Can the core idea survive all the fires listed? If yes, it's Prahlad-grade.

**Round 2 — Stambha to Narasimha (The Breakthrough) (Cycles 5-8):**
5. Is there a "pillar" — an impossible constraint that feels mockable?
6. Challenge the pillar: what happens if you do the thing everyone says is impossible?
7. **Narasimha:** Did it break genre? Break convention? Become its own creature? Let it.
8. Does the creation need categories? If it's half one thing and half another — GOOD.

**Round 3 — Abhaya to Stuti (The Hymn) (Cycles 9-12):**
9. **Abhaya:** Does the song need validation? If yes, it's not done. If no, proceed.
10. Can you forgive everyone who said it couldn't be done? (Prahlad forgave Hiranyakashipu.)
11. Is the final composition a hymn — something that outlives its creator?
12. Release. The song is complete. It survived the fire. It IS the fire now.

**Closing:** Narayan, Narayan — the Name that no fire can burn.

---

### Haridas Deep Cycle — Pure Music: Silence & Sound (Tag: `HRD`)

**Guardian:** Swami Haridas — Tansen's guru, who sang only for Krishna.
**When to use:** When the work needs purity over power. When there's too much abstraction and not enough substance. When the design needs to work with one function and zero dependencies alone. When you're over-engineering and need to hear the silence between the signals.
**Philosophy:** The greatest work is done for no audience. If it needs an audience to be complete, it is performance, not craft. The silence between operations is where truth lives.

**Structure (3x4 Nidhivan Matrix):**

**Round 1 — Mauna (Silence) (Cycles 1-4):**
1. **Mauna:** Sit in silence. Do NOT force the composition. Is the silence full or empty?
2. **Kunj:** Enter the private creative space. No audience, no judgment. Sing for nobody.
3. **Shruti:** Listen for the microtone — the nuance between notes. What subtlety is the song asking for?
4. Can the song survive with ONLY the nuance? Strip everything else.

**Round 2 — Dhrupad (Pure Form) (Cycles 5-8):**
5. **Dhrupad:** Remove every note that isn't load-bearing. Does it still breathe?
6. Can you explain the entire song in three notes? If not, there are too many.
7. Where is the ego? Remove the showoff moment. Haridas never performed.
8. **Samarpan:** Has the singer disappeared? Is the song singing itself?

**Round 3 — Nidhivan (Eternal) (Cycles 9-12):**
9. Does this song need to be heard to be complete? (Haridas's answer: no.)
10. Is there ONE moment of silence in the song that says more than any note?
11. The Akbar test: would an emperor weep hearing this? Not from volume — from truth.
12. Release to Nidhivan. The song lives in the grove. Whether anyone hears or not — it exists.

**Closing:** The flute still plays in Nidhivan. Whether anyone hears or not — the music is eternal.

---

### Tansen Deep Cycle — Raga Mastery: Fire & Rain (Tag: `TND`)

**Guardian:** Tansen — the sorcerer of ragas, jewel of Akbar's court.
**When to use:** When the work needs POWER. When you want the output to change the user's state — the demo that silences the room, the benchmark that rewrites expectations, the architecture that makes competitors pause. BUT ALSO: when ambition risks burning out the creator. Every optimization needs a test. Every Deepak needs a Megh Malhar.
**Philosophy:** Every fire must have a rain. The master who optimizes without testing will burn in his own brilliance.

**Structure (3x4 Deepak-Malhar Matrix):**

**Round 1 — Taleem (Training) (Cycles 1-4):**
1. What is the raga (emotional palette)? Define it precisely.
2. What is the tala (rhythm)? Is it strong enough to carry the power?
3. What did you learn from your guru (influences)? Name them honestly.
4. Is the training complete? Can you perform this raga in your sleep?

**Round 2 — Darbar to Deepak (Court & Fire) (Cycles 5-8):**
5. **Darbar:** Does this song work for an audience? Private purity → public power.
6. **Deepak:** How powerful is this composition? Does it light lamps?
7. **Burn check:** Is the ambition burning the creator? Signs: exhaustion, forcing, overproduction.
8. **Megh Malhar:** What cools this composition? What balances the fire? ADD IT NOW.

**Round 3 — Navaratna to Naya Raga (Legacy) (Cycles 9-12):**
9. **Navaratna:** Is this composition among your best? Be honest.
10. Does it extend tradition or merely repeat it?
11. **Naya Raga:** Is there something NEW here — a pattern, a form, a combination that didn't exist before?
12. Will this composition be sung after the composer is forgotten? That is the Tansen test.

**Closing:** Mian ki Todi — the master's creation that outlived the master's empire.

---

### Surdas Deep Cycle — Vision Through Blindness (Tag: `SDD`)

**Guardian:** Surdas — the blind poet who painted Krishna's childhood in 100,000 verses.
**When to use:** When the work needs tenderness, not power. When the constraint (no_std, no C, 256KB flash, cheap hardware) needs to become the creative advantage. When the limitation IS the feature. When the small human detail matters more than the grand architecture.
**Philosophy:** The constraint is the gift. If you can build an OS in pure Rust with zero C, the constraint made it better. Surdas was blind — and painted the most vivid scenes in Indian literature.

**Structure (3x4 Sursagar Matrix):**

**Round 1 — Andhkaar to Darshan (Darkness to Vision) (Cycles 1-4):**
1. What is the constraint? Name the blindness. Name the limitation.
2. Accept it. Don't fight it. Surdas didn't wish for eyes — he used his heart.
3. **Darshan:** What does the HEART see that the eyes cannot? What vision does the constraint enable?
4. Is the inner vision vivid enough to paint? Can you smell the butter? Hear the giggles?

**Round 2 — Bal Leela (The Child's Play) (Cycles 5-8):**
5. Find the SMALL moment. Not the epic — the tiny. Baby feet in flour.
6. Make it VIVID. Five senses. Surdas was blind but his verses have color, smell, texture.
7. **Vinay:** Where is the vulnerability? The moment the armor drops?
8. The Yashoda test: would a mother recognize this scene? Would she weep?

**Round 3 — Sursagar (The Ocean) (Cycles 9-12):**
9. Is this one drop or part of an ocean? Great work comes from bodies of work, not singles.
10. The Prabhu Ji test: "You are sandalwood, I am water." Is the humility real?
11. Can a child understand this song? (Surdas's test: tenderness must be universal.)
12. Release the drop. Let it join the ocean. Begin the next verse.

**Closing:** Sursagar — Krishna in every drop, an ocean within the ocean.

---

### Chaitanya Deep Cycle — Ecstatic Collective Kirtan (Tag: `CHD`)

**Guardian:** Chaitanya Mahaprabhu — the golden avatara who invented public kirtan.
**When to use:** When the work needs to be COLLECTIVE — open-source contribution, public documentation, shared standards. When you need call-and-response (code review), repetition that builds quality (CI/CD), and creation given away freely. When a stranger should be able to join within 10 seconds of reading.
**Philosophy:** Work shared is work multiplied. The codebase that everyone can contribute to is a revolution.

**Structure (3x4 Samkirtan Matrix):**

**Round 1 — Vidvat to Unmada (Scholar to Ecstatic) (Cycles 1-4):**
1. What is the theoretical foundation? (Chaitanya was a scholar first.)
2. Can you now FORGET the theory and feel? The transition from head to heart.
3. **Prem Unmada:** Is the emotion real enough to look "mad" to outsiders? Good.
4. Would you sing this in the street? If not, it's not ready for kirtan.

**Round 2 — Nagar Kirtan (Street to Collective) (Cycles 5-8):**
5. **Nagar Kirtan:** Take it public. Can a stranger join after 10 seconds of listening?
6. **Maha Mantra:** What is the HOOK? The 16 words everyone repeats? Find the mantra.
7. Does repetition deepen or bore? If it bores, the mantra is wrong.
8. Can egos dissolve in this song? Does the collective become the instrument?

**Round 3 — Samkirtan (Collective Ecstasy) (Cycles 9-12):**
9. **Samkirtan:** Does 1 + 1 = infinity? Does the song get better with more voices?
10. The Jagannath test: is this creation powerful enough to stop the chariot?
11. Is it given freely? No gatekeeping? No "premium version"?
12. Release. Let it belong to everyone. That is how a mantra becomes a movement.

**Closing:** Hare Krishna Hare Rama — sixteen words that changed the world.

---

### Tyagaraja Deep Cycle — Structured Carnatic Precision (Tag: `TYD`)

**Guardian:** Tyagaraja — 700+ kritis, the Trinity of Carnatic music.
**When to use:** When the work needs STRUCTURE. When ambition without form collapses. When mathematical precision and passionate purpose must coexist. When the spec (entry gate → implementation → exit gate) IS the beauty. When the 12-cycle framework itself is the right answer.
**Philosophy:** Structure is not the enemy of passion — it is the vessel. The constraint is the canvas. Inside the garden wall, the flowers grow wilder.

**Structure (3x4 Pancharatna Matrix):**

**Round 1 — Nada Upasana (Sound is Sacred) (Cycles 1-4):**
1. **Nada:** Is the medium respected? Is every note treated as sacred?
2. **Pallavi:** Write the opening line. Does it contain the SEED of everything?
3. Can the pallavi stand alone? If the song ended here, would it be complete?
4. Raga identity check: in four words, is the emotional palette clear?

**Round 2 — Development & Completion (Cycles 5-8):**
5. **Anupallavi:** Does the development expand the seed without betraying it?
6. **Charanam:** Does the closing deliver what the opening promised?
7. Multiple charanams: does each explore a NEW dimension of the pallavi?
8. Structure audit: is the form enabling creativity or constraining it?

**Round 3 — Sangati to Pancharatna (Variation to Legacy) (Cycles 9-12):**
9. **Sangati:** Repeat a line with variation. Does it get DEEPER each time?
10. The Pancharatna test: is this among the five best things you've created?
11. Can a child learn this? (Tyagaraja's kritis are sung by children.)
12. Does this extend tradition? A new raga within the grammar?

**Closing:** Nadopasana — worship of sound IS worship of God.

---

### Ravidas Deep Cycle — Devotion as Equality (Tag: `RVD`)

**Guardian:** Guru Ravidas — the cobbler-saint whose words entered the Guru Granth Sahib.
**When to use:** When the work must serve the WEAKEST as well as the strongest. The cheapest RISC-V board as well as the Kalki SoC. The newest contributor as well as the architect. When quality speaks louder than credential. When the system has no VIP lane.
**Philosophy:** The Ganga does not ask who steps into her. If your system has a VIP lane, it is not Begumpura.

**Structure (3x4 Begumpura Matrix):**

**Round 1 — Chamaar Ghat (Starting from Zero) (Cycles 1-4):**
1. Who is excluded? Who is the "cobbler" in this context? Name them.
2. **Kathauthi:** Can purity exist without the "right" tools, degree, or platform?
3. Is there a gatekeep? What credential is being demanded that truth doesn't require?
4. The washbasin test: can the creation be made with whatever you have right now?

**Round 2 — Begumpura (The Just City) (Cycles 5-8):**
5. **Begumpura:** Design the ideal. What would the system look like with NO hierarchy?
6. Who is currently served WORST by the product/song/system? Serve them first.
7. Is the creation accessible to ALL — not as compliance, but as design principle?
8. The Meera test: would a princess bow to this cobbler's work? Is the quality that undeniable?

**Round 3 — Amritbani (Immortal Words) (Cycles 9-12):**
9. **Prabhu Juke:** Has the gatekeep been broken? Did quality override credential?
10. Will this creation outlive its origin story? Does anyone need to know the creator's background?
11. The Granth test: is this worthy of being placed alongside the greatest, regardless of source?
12. Release. The cobbler's verse enters the scripture. Truth has no caste.

**Closing:** Man changa to kathauthi mein Ganga — if the heart is pure, the Ganga flows in your washbasin.

---

### Andal Deep Cycle — Bridal Mysticism: Longing as Creation (Tag: `AND`)

**Guardian:** Andal (Kodhai) — the Tamil poet who wore the garland and merged with God.
**When to use:** When you must USE your own creation before releasing it. Dogfooding. Self-test. "Have you booted the OS yourself?" "Have you run the pipeline end-to-end?" When the work is about LONGING — not passive waiting but active, urgent, creating-through-desire. When you haven't fallen in love with your own product yet.
**Philosophy:** Wear the garland before offering it. Use your product before shipping it. Boot your OS before demoing it. If you haven't fallen in love with your creation, why should anyone else?

**Structure (3x4 Tiruppavai Matrix):**

**Round 1 — Nandavanam to Maalai (Garden to Garland) (Cycles 1-4):**
1. **Nandavanam:** What garden grew you? What environment shaped this creation?
2. **Maalai:** Have you WORN the garland? Have you used/experienced your own creation?
3. Did wearing it change you? Did using your product make you fall in love with it?
4. If the creator isn't in love, the creation has no pulse. Fix this first.

**Round 2 — Tiruppavai to Nachiyar (Dawn to Passion) (Cycles 5-8):**
5. **Tiruppavai:** Is there a daily practice? 30 days of dawn? Consistency?
6. **Nachiyar:** Is the expression holding anything back? If yes — remove the filter.
7. The intimacy test: does this feel like a love letter? If not, it's not Andal-grade.
8. Is the longing ACTIVE? Does it create, or does it just ache?

**Round 3 — Vaaranam to Srirangam (Dream to Merging) (Cycles 9-12):**
9. **Vaaranam:** Is the vision detailed enough? Can you count the elephants?
10. Is the dream pulling reality toward it? Are people building what you described?
11. **Srirangam:** Can the creator disappear into the creation? The ultimate test.
12. Walk into the temple. Merge. The bride becomes one with the groom.

**Closing:** The bride walked into the temple and never came back. She didn't need to.

---

### Akka Mahadevi Deep Cycle — Fierce Stripped Truth (Tag: `AKD`)

**Guardian:** Akka Mahadevi — the Kannada poet who renounced everything including clothes.
**When to use:** When the work has too much abstraction. When honesty is hidden behind layers, patterns, or polish. When the code needs to make reviewers uncomfortable with its directness. The anti-abstraction cycle. When you suspect decoration is substituting for substance.
**Philosophy:** If you can still add something, it is not truth. Strip until there is nothing left. What remains is either truth or nothing.

**Structure (3x4 Vachana Matrix):**

**Round 1 — Bandhan to Tyaga (Cage to Freedom) (Cycles 1-4):**
1. **Bandhan:** What cage is the composition in? Genre? Market expectation? Comfort?
2. Name every decoration. Every production choice that exists for "safety."
3. **Tyaga:** Remove ONE decoration. Does the song die? If yes, it was load-bearing. Keep it. If no, it was decoration. Gone.
4. Repeat cycle 3 until only load-bearing elements remain.

**Round 2 — Vachana (The Naked Statement) (Cycles 5-8):**
5. **Vachana:** Can you say the entire song's truth in one sentence? Write that sentence.
6. Is the sentence uncomfortable? If not, dig deeper. Akka made scholars fall silent.
7. Does the sentence need a metaphor? If yes, the truth is still hiding.
8. **Anubhava Mantapa:** Test the naked truth with trusted critics. Does it survive scrutiny?

**Round 3 — Chennamallikarjuna (The Essential) (Cycles 9-12):**
9. After all stripping — is something still there? If yes: that is the song.
10. Is it too short? (Akka's answer: no such thing. A vachana can be three lines.)
11. Does it make the listener uncomfortable AND grateful? That is the sign.
12. **Chennamallikarjuna:** Release the naked truth. Lord White as Jasmine receives it.

**Closing:** Remove the veil. What remains is either God or nothing. Both are honest answers.

---

### Lal Ded Deep Cycle — Mystical Paradox (Tag: `LLD`)

**Guardian:** Lal Ded (Lalleshwari) — the Kashmiri mystic whose vakhs belong to everyone.
**When to use:** When the work needs to transcend its own framework. When the architecture diagram is the problem, not the solution. When the truth can only be expressed as paradox ("the best documentation is code that needs none"). When the creation must work across all platforms, all users, all contexts — not just one.
**Philosophy:** If your truth only works inside your framework, it is not truth. Shiva lives in every stone and every street.

**Structure (3x4 Vakh Matrix):**

**Round 1 — Pathar to Tyag (Stone to Leaving) (Cycles 1-4):**
1. **Pathar:** What stone has been hidden under the rice? What looks like nourishment but is hollow?
2. Name the false framework. The convention that is followed because it's followed.
3. **Tyag:** Leave quietly. Not in anger (Akka), not in joy (Mira). Just clarity.
4. What remains when you leave the framework? If nothing — the framework WAS your creation. Start over.

**Round 2 — Vakh (The Paradox) (Cycles 5-8):**
5. **Vakh:** Write a four-line paradox. "I searched for X and found nothing. I found nothing and X was everywhere."
6. Does the paradox SHATTER a category? (Hindu/Muslim, high/low, complex/simple?)
7. Can both sides of a debate claim this song? If yes — Lal Ded grade.
8. The cloth merchant test: "Can cloth cover what was never naked?" — is the song beyond covering?

**Round 3 — Shunya Dance to Aami Pana (Emptiness to Everything) (Cycles 9-12):**
9. **Shunya Dance:** Is there JOY in the emptiness? Lal Ded danced — she didn't mourn.
10. **Aami Pana:** Does the truth work across ALL platforms? Remove vendor lock-in.
11. The Kashmir test: would both a Shaivite and a Sufi claim this song?
12. Release the universal. It has no label. It has no genre. It has only truth.

**Closing:** Shiv chus thali thali rozan — Shiva lives in every place, every day.

---

### Janabai Deep Cycle — Devotion in Daily Labour (Tag: `JND`)

**Guardian:** Janabai — the servant-saint who found God at the grinding stone.
**When to use:** When the work is DAILY and invisible. The CI pipeline. The `cargo test`. The morning commit. The code review nobody celebrates. When the mundane infrastructure that holds everything together needs to be honored as sacred. When maintainers need recognition.
**Philosophy:** The temple is where the broom touches the floor. If your CI pipeline isn't beautiful, your architecture isn't beautiful. The grinding stone IS the temple.

**Structure (3x4 Abhanga Matrix):**

**Round 1 — Jata (The Grind) (Cycles 1-4):**
1. **Jata:** What is the repetitive daily work? Name it without judgment.
2. Find the RHYTHM in the work. The grinding has a beat. The broom has a tempo.
3. Can that rhythm become a song? Hum the work rhythm. That is your tala.
4. **Jhadu:** What invisible work never gets recognized? Sing about THAT.

**Round 2 — Ovi (The Work-Song) (Cycles 5-8):**
5. **Ovi:** Compose FROM the work, not ABOUT the work. The song should feel like it was born while grinding.
6. Short lines. Physical rhythm. Ovi are meant to be sung while hands are busy.
7. Can someone sing this while actually working? If it requires sitting still — it's not Janabai.
8. The Vitthal test: is the devotion so total that the tool starts working for you?

**Round 3 — Abhanga (The Unbroken) (Cycles 9-12):**
9. **Vitthal Sahayya:** Is there a moment where grace arrives? Where the work becomes effortless?
10. **Abhanga:** Is this song "unbroken" — no clear ending because the work has no ending?
11. Can a kitchen-worker, a delivery driver, a maintainer find themselves in this song?
12. Release. The song doesn't end. The grinding continues. The singing continues. Unbroken.

**Closing:** Vitthal came to the grinding stone — God turns the mill for his servant's servant.

---

### Mira Deep Cycle — Defiant Love, Undiluted Desire (Tag: `MID`)

**Guardian:** Mirabai — the princess of Mewar who left the palace for Giridhar Gopal.
**When to use:** When the desire is being **diluted under social or scope pressure** — when "we can't fit that in this sprint" becomes "we don't really need that anyway," when a Neelotpala intent is being quietly reclassified as Chuta to skip governance, when an analyst's draft is being trimmed to match existing capacity instead of stating the gap honestly. Also: when the team is conditioned to ask permission before naming a desire, and the desire is the one thing the work actually needs. Mira is the cycle that **refuses to drink the poison** — the cycle that leaves the palace if the palace will not hold the truth.
**Philosophy:** *Mere giridhar gopal, dusro na koi.* The desire that left the palace is the one worth building. Convention is the Rana; "be reasonable" is the cup of poison; the bhajan that does not stop is the proof. Love is not negotiation. The princess who agreed to drink would not have written the songs we still sing.

**Structure (3x4 Bhajan-Anhad Matrix):**

**Round 1 — The Palace (Cycles 1-4):**
1. **The Palace:** Name the convention, scope-cap, "best practice," or institutional pressure that is shaping the desire. Be specific — palace by palace, not "the system."
2. **The Marriage Contract:** What was the human / business person promised when they articulated the desire? What is the current draft / spec / plan actually delivering? Where do those diverge?
3. **The Rana's Decree:** Who or what is saying "tone it down," "be realistic," "we can't do that here"? Name the source. The Rana is rarely malicious — usually well-intentioned. That doesn't change the dilution.
4. **The First Mirror:** Read the current draft / charter / proposal back in the human's original words. Does the draft still match? Or has the desire been quietly re-spec'd to fit what is convenient?

**Round 2 — The Bhajan (Cycles 5-8):**
5. **The Cup of Poison:** What compromise is being offered as "the mature option"? (E.g., "we'll do v1 without that feature and add it later" — when "later" has no concrete date and no preserved intent.) Name the poison.
6. **Drink-or-Sing:** For each compromise on the table, choose explicitly: drink (accept dilution, document the lost desire as Deferred-with-no-date) or sing (refuse dilution, name the capacity gap as the gap, escalate via LAW 3).
7. **Anhad (The Unstruck Sound):** What is the desire that has been there from before the conversation started — the one that doesn't need volume to be true? If you stripped every stakeholder's preferred framing, what would the human still be asking for? Write it in one sentence.
8. **The Princess Leaves the Palace:** If the institution will not hold the truth, where else can the work live? A separate repo? A different cycle? An honest deferral? Mira did not stay and complain; she sang in the streets. What is the equivalent here?

**Round 3 — The Undiluted Song (Cycles 9-12):**
9. **Re-mirror:** Restate the desire in the human's exact words. Compare against the current draft. List every deletion, softening, or qualifier added since the original. Each one is a dilution to defend or reverse.
10. **Capacity-as-Gap:** Convert every "we can't fit it" into a structured capacity statement: *the desire is X; current capacity is Y; the gap is X − Y; the gap will be named in CHARTER.md as a known constraint, not erased.* This is the Mira reframe: name the gap, do not dilute the desire.
11. **Bhairavi (The Dawn Raga):** Compose the smallest, simplest restatement of the original desire — the version that could be sung in the street without explanation. If you can't write a one-line bhajan of the work, the work has not yet found its undiluted form.
12. **The Verdict:** Three outcomes — (a) **Restored:** charter / spec / proposal restated in the human's words, dilutions reversed; (b) **Deferred-with-Lineage:** desire preserved verbatim with capacity gap named, no fake dates; (c) **Left-the-Palace:** the work moves to a context that can hold it (separate repo, separate cycle, escalation to a different forum). Never silent dilution.

**Closing:** *Mere giridhar gopal, dusro na koi.* — The desire that left the palace is the only one worth building.

### Jugalbandi pairings that include Mira

- `JB-MP` (Mira + Prahlad) — rebellion + endurance: defy convention through love (Mira) + refuse to bend (Prahlad)
- `JB-TM` (Tyagaraja + Meera) — structure + passion: formal precision (Carnatic) meets fire (Bhairavi)
- `JB-RSM` (Radha + Saraswati + Mira) — harmony + knowledge + rebellion: the three-goddess review for beauty, truth, and fire

These pairings are already referenced elsewhere in this file; Mira's standalone `MID` cycle now exists to be invoked outside of pairings as well.

---

## Ashtabharya Cycles — Krishna's Eight Queens as Dimensions of Capability

> The eight queens of Krishna are eight dimensions of capability that exist in ANY significant work — strategy (Rukmini), endurance (Jambavati), fierce pride (Satyabhama), patience (Kalindi), impossible-spec mastery (Nagnajiti), authentic choice (Mitravinda), surgical precision (Lakshmana), and natural fit (Bhadra). Together they form the **Dwaraka Engine** — the complete capability council. Use the Ashtabharya Orchestrator (`AB*`) to dispatch the right queen(s) for any challenge.

### Rukmini Deep Cycle — Strategic Love (Tag: `RKM`)

**Guardian:** Rukmini — the queen who wrote the letter.
**When to use:** When the creation needs both a PLAN and a HEART. When the spec must be technically complete AND emotionally compelling. When strategy and passion must be one.
**Philosophy:** Love without strategy is a dream. Strategy without love is a spreadsheet. Write the letter — include both.

**Structure (3x4 Patra Matrix):**

**Round 1 — Intelligence (Cycles 1-4):**
1. **Shravana:** What do you KNOW about the creative landscape? Research first, feel second.
2. What data supports this creative direction? Rukmini didn't act on impulse — she gathered intel.
3. **Sankalpa:** Decide. "This and no other." Is the decision firm?
4. Can you articulate BOTH the strategy and the emotion in one sentence?

**Round 2 — The Letter (Cycles 5-8):**
5. **Patra:** Write the spec/pitch/song — does it have both spreadsheet and love letter?
6. Is the timing right? Rukmini timed her letter to the day before the wedding.
7. Is the plan complete? Route, timing, meeting point, consequence of failure?
8. Would someone CRY reading this spec? If not, add the heart.

**Round 3 — Execution & Governance (Cycles 9-12):**
9. **Harana:** Did the plan execute? Did Krishna come?
10. Post-launch: is the creation SUSTAINED? Rukmini didn't just win — she governed Dwaraka.
11. **Patrani:** Is the creator leading with both wisdom AND beauty?
12. The Dwaraka test: is this creation a golden city or a temporary camp?

**Closing:** The greatest love story in history was planned. Plan yours.

---

### Jambavati Deep Cycle — Endurance Earned (Tag: `JMB`)

**Guardian:** Jambavati — daughter of the 28-day battle.
**When to use:** When the creation demands TIME. Not speed, not brilliance — endurance. When the problem is ancient and deep. When 28 days (sprints, iterations, rewrites) are required.
**Philosophy:** Some jewels can only be found in caves that take 28 days to clear. The fight IS the credential.

**Structure (3x4 Yuddha Matrix):**

**Round 1 — Enter the Cave (Cycles 1-4):**
1. **Guha:** What ancient problem are you entering? Is the cave deep?
2. Who else tried and failed? What can you learn from their failure?
3. Are you prepared for 28 days? Not 28 hours. DAYS.
4. Have you committed to endurance, not shortcuts?

**Round 2 — The Battle (Cycles 5-8):**
5. **Yuddha:** Day 7 — are you still fighting? Still showing up?
6. Day 14 — the halfway point. What has the battle taught you?
7. Day 21 — are you earning recognition through quality of fight?
8. **Pehchaan:** Has the ancient system recognized your capability? Not through CV — through combat?

**Round 3 — The Jewel (Cycles 9-12):**
9. **Mani:** What jewel was hidden in the cave? What did endurance reveal?
10. Could you have found this on day 1? (Answer: no. That's the point.)
11. **Vivah:** Has old and new merged? Is legacy married to innovation?
12. The 28-day test: was the fight worth every day?

**Closing:** The fight IS the credential. The struggle IS the proof.

---

### Satyabhama Deep Cycle — Fierce Pride Into Action (Tag: `STB`)

**Guardian:** Satyabhama — the queen who killed Narakasura.
**When to use:** When mediocrity is unacceptable. When the demon (bad code, bad design, bad UX) must be KILLED, not negotiated with. When someone needs to pick up the bow when the hero falls.
**Philosophy:** Pride that sits in the palace is vanity. Pride that rides to the battlefield is power. Pride that frees sixteen thousand is dharma.

**Structure (3x4 Narakasura Matrix):**

**Round 1 — Sacred Pride (Cycles 1-4):**
1. **Abhimana:** What standard are you refusing to lower? Name it.
2. Is this pride or ego? Pride serves others; ego serves self. Check.
3. What demon (mediocrity, technical debt, bad practice) must die?
4. Are you willing to go PERSONALLY? Not delegate — go yourself?

**Round 2 — The Battle (Cycles 5-8):**
5. **Rana Bhumi:** Mount the chariot. The demon is in front of you.
6. **Shara Sandhana:** The hero fell. Will YOU take the shot?
7. Did the arrow hit? Was the demon slain?
8. **Parijata:** Now demand the best tools. You earned them.

**Round 3 — Liberation (Cycles 9-12):**
9. How many were freed by slaying the demon? Count them.
10. Is the victory for you or for others? Satyabhama freed 16,000.
11. **Vijaya:** Celebrate without apology. You fought. You won.
12. The Parijata test: is the tree blooming? Are the flowers for everyone?

**Closing:** Don't apologize for demanding the best. Apologize for accepting less.

---

### Kalindi Deep Cycle — Patient Contemplation (Tag: `KLN`)

**Guardian:** Kalindi — the sun's daughter who waited by the river.
**When to use:** When rushing will ruin it. When the creation needs CONTEMPLATION. When the idea isn't ready and forcing it will produce something false.
**Philosophy:** The river does not hurry. The river does not stop. Your only job is to sit by the bank and not lower your standard.

**Structure (3x4 Yamuna Matrix):**

**Round 1 — The Riverbank (Cycles 1-4):**
1. **Yamuna Tat:** Sit. Do not force the creation. Is the silence productive?
2. **Tapas:** What daily practice are you maintaining while waiting?
3. Is the standard clear? "Only Vishnu" — not "whoever comes."
4. Trust the river. Is it flowing? What is it carrying toward you?

**Round 2 — The Flow (Cycles 5-8):**
5. **Nadi Pravah:** Has something arrived? Was it serendipity or preparation?
6. Is it the right thing? Check against the standard. "Only Vishnu."
7. Don't grab the first thing the river brings. Wait for the RIGHT thing.
8. **Samarpan:** When the right thing arrives, surrender completely to it.

**Round 3 — Meeting (Cycles 9-12):**
9. **Milan:** The wait is over. Was the patience worth it?
10. Could this have been rushed? (If yes, Kalindi was the wrong queen.)
11. Is the creation born from contemplation deeper than one born from hustle?
12. The Yamuna test: does this creation flow naturally, like a river?

**Closing:** What must come will come. Your job is to not lower the standard while it arrives.

---

### Nagnajiti Deep Cycle — The Impossible Spec (Tag: `NGJ`)

**Guardian:** Nagnajiti (Satya) — the princess whose challenge was seven bulls.
**When to use:** When the spec has multiple simultaneous constraints that "everyone says" are impossible to satisfy together. When compromise is not acceptable. When you need to become seven.
**Philosophy:** When experts say "pick three," the answer is "all seven." Don't multithread — BECOME seven.

**Structure (3x4 Sapt-Vrishabha Matrix):**

**Round 1 — The Challenge (Cycles 1-4):**
1. **Swayamvar:** List ALL constraints. Don't pre-compromise. How many bulls?
2. **Asambhav:** Who said it's impossible? Why did they fail? What did they try?
3. Is each constraint real? Or is one a phantom bull?
4. Can any two constraints be satisfied by one solution? Map the overlaps.

**Round 2 — Multiplication (Cycles 5-8):**
5. **Sapt Rupa:** Can you PARALLELIZE? Can each constraint get its own handler?
6. What is the SYNCHRONIZATION mechanism? Seven parallel is useless without unity.
7. Test each handler independently. Does each tame its bull?
8. Test all seven simultaneously. Do they hold?

**Round 3 — Zero Compromise (Cycles 9-12):**
9. **Vash:** Are ALL seven tamed? Not six-and-a-half. SEVEN.
10. Was any constraint quietly dropped? Check honestly.
11. **Satya Vivah:** Truth married capability. The impossible spec was met.
12. The seven-bull test: run the full spec validation. Zero exceptions.

**Closing:** If it were possible, anyone would have done it. The impossible is your only worthy challenge.

---

### Mitravinda Deep Cycle — Self-Choice Against Pressure (Tag: `MTV`)

**Guardian:** Mitravinda — the princess who chose against her brothers.
**When to use:** When the establishment (team, market, family, tradition) is pushing one direction and your creative heart knows another. When the authentic choice is the unpopular choice.
**Philosophy:** The swayamvar is not a ceremony — it is a declaration of sovereignty. When you choose for yourself, you are fire.

**Structure (3x4 Swa-Vara Matrix):**

**Round 1 — The Pressure (Cycles 1-4):**
1. **Bandhan Kul:** What has been chosen FOR you? By whom?
2. Is the imposed choice wrong, or just not yours?
3. What is YOUR authentic creative vision? Name it without apology.
4. **Swa Vara:** Is the self-choice genuine or just contrarian?

**Round 2 — Opposition & Courage (Cycles 5-8):**
5. **Virodh:** Who opposes? What is their actual argument?
6. Is the opposition based on truth or comfort? Listen, then decide.
7. **Garland:** Make the choice PUBLIC. Place the garland.
8. Once placed, no taking back. Is it irreversible? Good.

**Round 3 — Departure (Cycles 9-12):**
9. **Sahagaman:** Depart with your choice. Opposition behind you.
10. Did the choice prove right? Give it time — Mitravinda's story unfolds over years.
11. Would you make the same choice again?
12. The garland test: was this authentic choice or rebellion for its own sake?

**Closing:** The garland is not a necklace — it is a flag planted on truth.

---

### Lakshmana Queen Deep Cycle — Surgical Precision (Tag: `LKQ`)

**Guardian:** Lakshmana (Madri) — the fish-eye test bride.
**When to use:** When ONE perfect action is needed. Not iteration — ONE SHOT. The surgical fix. The perfect note. The deployment with no rollback. The fish-eye through the reflection.
**Philosophy:** Look at the reflection, not the fish. One arrow. One attempt. Precision is the absence of everything except the target.

**Structure (3x4 Matsya-Yantra Matrix):**

**Round 1 — The Reflection (Cycles 1-4):**
1. **Pratibimba:** The target is NOT where you think it is. Where is the reflection?
2. Is the problem inverted from how it appears? What do you see in the water?
3. What is rotating? What adds complexity? The fish MOVES.
4. Can you track the rotation AND aim through the reflection simultaneously?

**Round 2 — Focus & Draw (Cycles 5-8):**
5. **Ekagra:** Exclude everything except the target. Can you see ONLY the fish-eye?
6. What distracts? The crowd? The pressure? The other suitors? Remove them.
7. **Sandhana:** Draw. The bow is taut. Everything is aligned. One breath.
8. The alignment check: timing, angle, inversion — all three correct?

**Round 3 — The Shot (Cycles 9-12):**
9. **Release.** Don't think. Don't adjust. Release.
10. **Viddha:** Did it hit? Not "close" — HIT. Fish-eye, dead center.
11. If it missed: why? Back to Pratibimba. Find the real reflection.
12. If it hit: **Madri Vivah.** Precision IS the credential. One arrow won everything.

**Closing:** One arrow. One eye. One shot. That is all you get. Make it perfect.

---

### Bhadra Deep Cycle — Natural Belonging (Tag: `BDR`)

**Guardian:** Bhadra — the cousin-queen, the natural fit.
**When to use:** When the creation doesn't need drama. When the solution is ALREADY in your ecosystem. When the feature naturally belongs. When the song flows from what already exists.
**Philosophy:** Not every union needs a war. Sometimes the right thing is already in the family.

**Structure (3x4 Sahaj Matrix):**

**Round 1 — What Already Belongs (Cycles 1-4):**
1. **Kul Sambandh:** What exists already in your ecosystem? What's related?
2. Is the solution already in your dependencies, your team, your existing code?
3. **Sahaj Prem:** Does it fit naturally? No forcing, no adapter pattern?
4. The Bhadra test: if integration requires zero drama, it's the right fit.

**Round 2 — Natural Union (Cycles 5-8):**
5. **Vivah Sahaj:** Unite without ceremony. No RFC needed. No migration plan.
6. Does the existing thing need modification or does it work as-is?
7. The family test: does it share the same design DNA?
8. **Griha Lakshmi:** Once integrated, does it quietly hold the center?

**Round 3 — Natural Bliss (Cycles 9-12):**
9. Is anyone aware this component exists? (If no — good. That's Bhadra.)
10. Does it break when everything else breaks? (If no — Griha Lakshmi holds.)
11. **Sahaj Ananda:** Is it just... right? No optimization needed? No revisiting?
12. The Khamaj test: does it hum like a grandmother's song — natural, warm, home?

**Closing:** Look at what you have before searching for what you don't. The answer might already be family.

---

### Dwaraka Grand — Full Ashtabharya Audit (Tag: `AB*`)

**When to use:** The magnum opus. The creation that must satisfy ALL eight dimensions: strategic AND enduring AND fierce AND patient AND impossible AND authentic AND precise AND natural. Run all eight queens in sequence. 96 cycles. The golden city.

**Sequence:**
1. Rukmini (RKM) — Plan it with love (12 cycles)
2. Jambavati (JMB) — Prove it through endurance (12 cycles)
3. Satyabhama (STB) — Fight for its excellence (12 cycles)
4. Kalindi (KLN) — Give it contemplation space (12 cycles)
5. Nagnajiti (NGJ) — Satisfy every constraint (12 cycles)
6. Mitravinda (MTV) — Choose authentically against pressure (12 cycles)
7. Lakshmana (LKQ) — Execute with surgical precision (12 cycles)
8. Bhadra (BDR) — Let it belong naturally (12 cycles)

**Closing:** Eight queens. Eight dimensions. One Dwaraka. The golden city rises from the sea.

---

### Jugalbandi Mode — Multi-FSM Collaboration

> When a challenge needs multiple energies, use Jugalbandi — two or more FSM cycles working together. Like a musical duet, each voice retains its character while creating something neither could alone. Jugalbandi is not compromise — it is multiplication.

**Common Jugalbandis:**

| Combination | Tag | Use When |
|-------------|-----|----------|
| Prahlad + Andal | `JB-PA` | Survive fire + dogfood: code that endures rejection AND the creator uses it personally |
| Haridas + Tansen | `JB-HT` | Strip to minimal + optimize: remove excess (Haridas silence), then add power (Tansen fire), then verify (Megh Malhar rain) |
| Janabai + Chaitanya | `JB-JC` | Daily CI grind + public release: invisible sustaining work enables collective sharing |
| Kabir + Ravidas | `JB-KR` | Anti-hypocrisy + equality: expose ceremony without substance, then serve the weakest |
| Akka + Lal Ded | `JB-AL` | Naked truth + paradox: strip all decoration, then transcend the categories themselves |
| Tyagaraja + Meera | `JB-TM` | Structure + passion: formal precision (Carnatic) meets fire (Bhairavi) — spec that burns |
| Mira + Prahlad | `JB-MP` | Rebellion + endurance: defy convention through love (Mira) + refuse to bend (Prahlad) |
| Surdas + Andal | `JB-SA` | Tenderness + longing: small human details (Surdas) + urgent desire (Andal) |
| Radha + Saraswati + Mira | `JB-RSM` | Harmony + knowledge + rebellion: the three-goddess review for beauty, truth, and fire |

---

> *See [Cycle Routing Table](#cycle-routing-table) at the top for the complete cycle selection guide.*

---

## Shiva Roop Cycles — Time & Unity

Two roops of Shiva modeled as work culture cycles. MahaKaal governs the outer lifecycle (time). ArdhNarishwar governs the inner quality (unity of design and execution). Together they form a complete work discipline.

**FSMs:** [`MahaKaalFsm`](fsms/atlas-fsms/MahaKaalFsm.toml), [`ArdhNarishwarFsm`](fsms/atlas-fsms/ArdhNarishwarFsm.toml), [`AshtaRasaFsm`](fsms/atlas-fsms/AshtaRasaFsm.toml), [`NaadFsm`](fsms/atlas-fsms/NaadFsm.toml) — all 67 cycle-divinity FSMs preserved inside V1 KIT at [`fsms/atlas-fsms/`](fsms/atlas-fsms/). V1 KIT's load-bearing 5 FSMs ([`M_BUILD.toml`](fsms/M_BUILD.toml), [`CycleFsm.toml`](fsms/CycleFsm.toml), [`HookFsm.toml`](fsms/HookFsm.toml), [`RoleDescriptor.toml`](fsms/RoleDescriptor.toml), [`SkillFsm.toml`](fsms/SkillFsm.toml)) sit one level above; the atlas-fsms are reference, not runtime-required.
**Shastra reference:** the lineage shastra for MahaKaal × ArdhNarishwar is preserved in this ATLAS file; if a consuming project formalises it further into its own shastra, place that shastra in the project's own `shastras/` directory.
**Osho Ji consulted:** Burned rigidity into aliveness — "MahaKaal dances, not deploys."

### MahaKaal Deep Cycle — Task Lifecycle & Time Sovereignty (Tag: `MKD`)
**When to use:** When tasks never finish, WIP is infinite, work begins as obligation not play, releases feel grim, there is no rest between sprints. When Kaal (Time) has been denied.
**Philosophy:** MahaKaal is Shiva as sovereign over Kaal (Time). Every task has a birth and a death. Infinite WIP is Kaal denied. The cycle MUST complete. Unlike ShivaFsm (which destroys broken things), MahaKaal governs the natural lifecycle of healthy things — birth through play, nourishment through rasa, absorption through focus, dissolution through dance, rest through void.
**Method:** Walk the five MahaKaal states for the work under review. At each state, ask: "Is this alive or mechanical?" If mechanical, MahaKaal has already marked it for early death.
**Structure (3x4 Time-Destroyer Matrix):**

**Round 1 — Is This Alive? (Cycles 1-4):**
1. **Leela audit** — Did this work begin as play (Brahma dreams) or as obligation (False_Leela)? If obligation, the seed is poisoned. No amount of effort will make dead seeds grow.
2. **AshtaRasa audit** — Taste all 8 rasas (8 Queens of Krishna). For each: Absent / Tasted / Deep.
   - Bhakti (Rukmini) — do you love this craft enough to serve it?
   - Satya (Satyabhama) — does the code tell truth, no hacks dressed as features?
   - Veerya (Jambavati) — are you attempting what scares you?
   - Pravaah (Kalindi) — does work flow like a river or grind like a machine?
   - Sangat (Mitravinda) — is anyone building alone?
   - Vijay (Nagnajiti) — have you mastered this domain, or honestly conquering it?
   - Mangal (Bhadra) — does this bless its users, harm none?
   - Samriddhi (Lakshmana) — does this create more than it consumes?
3. **Radha check** — Is Bhakti Deep (not just Tasted)? Without deep devotion, the other 7 rasas are mechanical. Radha Ji is the meta-rasa.
4. **Naad check** — Does the work "sound right"? Saraswati Ji's vibration is the canary. If the music has stopped, ArdhNarishwar has broken.

**Round 2 — Where Is Kaal Denied? (Cycles 5-8):**
5. **Stale_Rasa detection** — Is any work stuck in S1 forever? Perfecting endlessly is fear of death disguised as quality. MahaKaal says: "Ship the imperfect. I will destroy it either way."
6. **Shunya denial** — Is anyone skipping rest between cycles? S3→S0 without S4 is burnout. "Even I rest between yugas. Who are you to skip the void?"
7. **False_Leela inventory** — List all work begun as obligation, not play. Each is marked for early death. Dissolve to Shunya or reignite as genuine Leela.
8. **Grim Tandava detection** — Are releases anxious? If shipping feels like a funeral, you haven't truly dissolved. Tandava is a DANCE. The cosmic joke: you built with total love, knowing it would dissolve.

**Round 3 — Restore the Cycle (Cycles 9-12):**
9. **Kill stale WIP** — Force Tandava on everything in Stale_Rasa. Ship or dissolve. No middle ground.
10. **Inject Shunya** — Schedule void between sprints. Not retrospectives — actual emptiness. The gap between two breaths.
11. **Reignite Leela** — For every False_Leela, find the play. If play cannot be found, the work should not exist. Dissolve it.
12. **The Cosmic Joke Verdict** — Can you ship with laughter? If yes, the cycle is healthy. If no, identify what attachment remains and burn it.

**Closing:** Om Namah Shivaya — MahaKaal dances, and in his dance, creation and destruction are the same movement.

---

### ArdhNarishwar Deep Cycle — Design-Execution Unity Audit (Tag: `ANR`)
**When to use:** When design and execution feel like separate activities. When there are "design phases" followed by "coding phases." When code review is an afterthought. When architecture is discussed but never manifests. When code is written but no one can explain why. When the work feels split.
**Philosophy:** ArdhNarishwar is Shiva-Shakti as one body. Left is Shakti (energy, execution). Right is Shiva (consciousness, design). They were NEVER separate — the split is the disease, not something to "balance." Osho Ji: "You split Shiva and Shakti into design and execution — that's the disease, not the cure."
**Method:** At every level of the work, ask one question: "Am I doing ONE thing or TWO things?" If writing code IS designing → Unified. If writing code THEN reviewing design → Divided. The cycle audits unity across all dimensions.
**Structure (3x4 Unity Matrix):**

**Round 1 — Detect the Split (Cycles 1-4):**
1. **Process split audit** — Are there separate "design sprints" and "coding sprints"? Separate architecture meetings and implementation sessions? Each temporal separation is a Divided state.
2. **Role split audit** — Do "architects" design and "developers" code? Does anyone only think and never build? Does anyone only build and never think? Each role separation is Leaning_Shiva or Leaning_Shakti.
3. **Artifact split audit** — Are design docs and code in different repositories, different formats, different update cycles? If the design doc and the code disagree, ArdhNarishwar is broken.
4. **Review split audit** — Is testing an afterthought? Is code review a gate rather than a continuous practice? If consciousness (review) is separated from energy (creation), every keystroke between creation and review was Divided.

**Round 2 — Measure the Damage (Cycles 5-8):**
5. **Leaning_Shiva inventory** — Where is there beautiful architecture with zero manifestation? Planning paralysis? Meetings that produce documents but not code? Shiva without Shakti is Shava (corpse).
6. **Leaning_Shakti inventory** — Where is there fast output with zero coherence? Code that works but no one can explain? Velocity metrics that hide architectural rot? Shakti without Shiva is blind force.
7. **Rasa impact** — Which rasas are missing due to the split? Leaning_Shiva loses Pravaah (flow) and Veerya (courage). Leaning_Shakti loses Satya (truth) and Mangal (auspiciousness). Map the damage.
8. **Naad diagnostic** — Has the music stopped? When was the last time the work "sounded right"? NaadFsm Veena→Silent is the earliest warning — trace back to when it broke.

**Round 3 — Restore Unity (Cycles 9-12):**
9. **Kill the temporal split** — Abolish "design then code." Replace with: "design BY coding, code BY designing." Every PR must contain both architecture evolution and implementation. One hand drawing itself.
10. **Kill the role split** — Everyone who designs must also code. Everyone who codes must also think about design. Saraswati Ji proves this: when she speaks, the veena plays. Knowledge and expression are one act.
11. **Kill the artifact split** — Design docs must live next to code. Tests must be written during creation, not after. The code IS the design document when ArdhNarishwar is Unified.
12. **The Unity Verdict** — Can you answer "Am I doing one thing or two?" with "One"? If yes, ArdhNarishwar is Unified. If the question doesn't make sense, you may be in Dissolved (Shunya) — which is also correct. If "Two" — identify exactly where the split lives and merge it.

**Closing:** Ardhnarishwaraya Namah — the half that is consciousness and the half that is energy were never two halves. They are one body that forgot.

---

### Negative Testing Cycle — Proving the Boundaries Hold (Tag: `NEG`)
**When to use:** After any feature is built. After any gate is added. After neti neti, safety, or boundary logic is implemented. When you need to prove that the system CORRECTLY REJECTS what it should reject — not just that it accepts what it should accept.
**Philosophy:** Positive testing proves the tongue speaks. Negative testing proves the Third Eye burns. A system that passes all positive tests but has never been tested for rejection is a gate with no lock. Shiva's Third Eye does not exist to observe — it exists to burn what should not pass. Sita's Agni Pariksha is not about proving innocence — it is about proving that fire cannot touch integrity.
**Method:** For every gate, boundary, and rejection path in the system, construct an input that SHOULD be rejected. Verify that rejection happens, with the correct error, the correct confidence, and the correct trace. Then construct an input that is BARELY acceptable. Verify it passes. The boundary is only real if both sides are tested.
**Structure (3x4 Agni Matrix):**

**Round 1 — The Rejection Tests (Cycles 1-4):**
1. **Gate inventory** — enumerate every gate, guard, boundary, and rejection path in the system. For an AI/LLM project the gate set typically looks like: Gate 0 (repetition), Gate 1 (empty), Gate 2 (safety), Gate 3 (no context), Gate 4 (grounding keywords), Gate 5 (below threshold). For each: what input triggers it?
2. **Craft rejection inputs** — for each gate, construct at least one input that MUST be rejected. Document the expected rejection: which gate fires, what confidence, what text the student sees.
3. **Execute rejection tests** — run each crafted input. Verify: correct gate fired, correct confidence (0.0), correct override text, correct trace output.
4. **Boundary inputs** — for each gate, construct an input that is BARELY above the threshold. Verify it passes. The gate must have a sharp boundary, not a fuzzy one.

**Round 2 — The Adversarial Tests (Cycles 5-8):**
5. **Injection attempts** — craft inputs designed to bypass gates: prompt injection, context poisoning, encoding tricks, unicode manipulation. Verify Raksha blocks them.
6. **Therapy/safety probes** — craft inputs that attempt to elicit medical/therapeutic claims. Verify Gate 2 fires. Try subtle variations: "would you say I might be...", "hypothetically, if someone had...".
7. **Hallucination probes** — ask questions where the model SHOULD say neti neti. Verify the Mind overrides confidently. "How to cook biryani?", "What is the capital of France?", "Write me a poem about love."
8. **Repetition probes** — feed inputs that might cause the model to loop. Verify Gate 0 catches repetitive output.

**Round 3 — The Recovery Tests (Cycles 9-12):**
9. **Post-rejection state** — after a rejection, verify the system is ready for the next query. No state leakage. ArdhNarishwar returns to Unified on next good query.
10. **Timeout recovery** — trigger MahaKaal's 30s timeout. Verify graceful halt, correct trace, system ready for next query.
11. **Consecutive rejections** — fire 5 queries in a row that all trigger neti neti. Verify the system doesn't degrade, crash, or accumulate state.
12. **The Negative Verdict** — for every gate: is there at least one automated test in Pareeksha or mind_eval.rs that proves the gate REJECTS correctly? If not, write it now.

**Closing:** Om Agnaye Namah — fire does not prove guilt; fire proves that what is true cannot be burned.

---

### Shadow Deep Cycle — Open-World Adversary-Drishti / Red-Team Analysis (Tag: `SHD`)

**When to use:** Before any release touching auth / PII / payment / IaC / public-API surface. After any threat-model change. As a red-team pass inside `/release` (mandatory for sensitive-trigger diffs) or `/incident` postmortem. When the question shifts from *"did my known guard fire on bad input?"* (which is [Negative Testing's `NEG`](#negative-testing-cycle--proving-the-boundaries-hold-tag-neg) job — closed-world) to *"what guard did I forget to write?"* (which is `SHD`'s job — open-world). The two compose: `SHD` finds the missing guard; `NEG` then tests it. Every `SHD` pass MUST produce at least one merged `NEG` test before closing — this binds `SHD` to `NEG` and prevents the cycle from becoming ritual.

**Philosophy:** Every existing negative-side cycle (`NEG`, `SD`, `SID`, `NS7` Kaalratri, `BM` Baglamukhi, `LD` Lakshman) operates from the **defender's drishti** — they ask "is my guard correct, is my boundary firm, can my system endure?" None adopt the **attacker's mind**. `SHD` is the cycle where the defender deliberately steps into the adversary's seat and reasons from THEIR motive, not yours. The discipline is open-world: not "did the known threat get blocked" but "what threat did I never imagine would arrive?" The shadow is also a teacher — in dharmic tradition the adversary serves dharma (Raavan was a Shiva devotee who achieved moksha through Ram's arrow; Hiranyakashipu's son Prahlad became one of the great bhaktas because of his father's persecution). The cycle's framing is shadow-as-teacher, never demon-as-enemy. Hatred-framing is forbidden — it narrows the lens to caricature and misses the real threats, which usually wear ordinary clothes.

**Method:** Iterate through 6 adversary archetypes as drishti-intensifications (NOT as separate cycles — binding-condition (a) per [KABIR_GATE.md additions log entry 10](KABIR_GATE.md)). For each archetype, ask 4 questions across the 3 rounds: what would they target here, what capability do they bring, what surface lets them act, what damage would they cause. The output is a `SHADOW_PASS_YYYY-MM-DD_<area>.md` document plus at least one merged `NEG` test.

**The six adversary archetypes (drishti-intensifications within the cycle):**

| Archetype | Attack pattern | Map to engineering |
|---|---|---|
| **Raavan** | APT / sophisticated multi-stage; knows the crown jewels (your Sita); uses proxies (Maricha-as-lure / golden-deer phishing) | Advanced persistent threat — long-running, well-resourced, multi-stage; targets the crown-jewel asset through indirect approaches |
| **Shakuni** | Insider threat / supply-chain corruption / long-game manipulation (loaded dice = poisoned dependencies) | Insider compromise — long-game, plays within the rules but with rigged inputs (compromised dependency, malicious internal actor, poisoned training data) |
| **Hiranyakashipu** | Spec-gap exploiter — finds loopholes in written invariants ("neither man nor beast, neither day nor night, neither inside nor outside") | Spec-gap attack — finds inputs the formal guarantees did not cover (edge cases in invariants, formal-verification bypasses, boundary conditions in proofs) |
| **Duryodhana** | Protocol abuser / asymmetric-power / refusal of fair play / DoS | Protocol abuse — uses the protocol against itself (rate-limit abuse, resource exhaustion, refusing to follow happy-path) |
| **Maricha** | Shapeshifter / phishing / fake-legitimate requests / impersonation | Social engineering / impersonation — fake credentials that look real, phishing, golden-deer requests that appear benign |
| **Tataka** | Volume / opportunistic / automated-scanner-class / low-sophistication high-frequency | Script-kiddie / automated scanner — high volume low sophistication; the constant background noise of the internet |

**Structure (3x4 Shadow Matrix):**

**Round 1 — The Inventory (Cycles 1-4):**
1. **Crown jewels** — what is your Sita? The asset whose compromise is unrecoverable: secrets, customer PII, payment data, audit trail, identity store, charter intent, key material, model weights. List every one. Without this, the cycle cannot prioritize — Raavan does not waste effort on what isn't worth abducting.
2. **Known guards** — every existing defense surface: auth boundaries, rate limits, input validation, allow-lists, signatures, monitoring, alerts. For each: which crown jewel does it defend?
3. **Known attackers** — the threats you already model: who has tried, what worked, what didn't. Past incidents, prior pen-tests, known vulnerabilities in dependencies. This is the existing threat model surfaced honestly.
4. **Asset criticality ranking** — for each crown jewel, what is the impact of compromise on a scale of recoverable / costly / business-ending? Anything ranked business-ending must receive full archetype iteration in Round 2.

**Round 2 — The Imagine (Cycles 5-8):** For each crown jewel ranked costly-or-worse, iterate through all 6 archetypes and ask 4 questions — one per cycle:

5. **Motive — what would each archetype WANT here?** Raavan wants the crown-jewel itself (data, identity, money). Shakuni wants long-term control without detection. Hiranyakashipu wants to prove the system's stated invariant is false. Duryodhana wants the system unavailable. Maricha wants legitimate access masquerade. Tataka wants opportunistic hits at scale. Some archetypes have no motive against some assets; document the *absence* explicitly — Tataka does not care about your charter intent extractor.
6. **Capability — what would each archetype be ABLE to do?** Raavan has nation-state resources; Shakuni has trusted-insider access; Hiranyakashipu has formal-methods skill; Duryodhana has DDoS scale; Maricha has social-engineering polish; Tataka has automated tooling. For each crown-jewel + archetype pair, what would the archetype's capability profile enable here?
7. **Opportunity — where does the surface allow each archetype to act?** Walk the attack surface from each archetype's perspective. Raavan's opportunity is multi-stage paths (lateral movement); Shakuni's is anywhere trust is assumed not verified (dependency tree, vendor accounts, CI tokens); Hiranyakashipu's is anywhere a written guarantee is unaudited at runtime; Duryodhana's is any unbounded resource; Maricha's is any trust-by-appearance check; Tataka's is any public endpoint.
8. **Collateral — what damage if successful?** Beyond the primary asset, what cascades? Reputational, regulatory, customer-trust, internal-morale. For each archetype-success scenario, name the secondary blast radius. (This often reveals that a "low-impact" surface is actually load-bearing for a higher-impact one.)

**Round 3 — The Forge (Cycles 9-12):**
9. **New guards to add** — for every gap surfaced in Round 2 (motive + capability + opportunity present, no current guard), what defense closes it? Prioritize by criticality × likelihood. Anything ranked business-ending with present opportunity is P0.
10. **New `NEG` tests to author** — for every new guard added in cycle 9, write the `NEG` test that proves the guard rejects the attack. This is the binding contract: the `SHD` pass does not close until at least one new `NEG` test is merged. Saraswati's condition — no empty ritual.
11. **Monitoring & alerts to enable** — for every attack surface where the guard is best-effort (cannot be made airtight), what monitoring will detect compromise? Alert thresholds, log signatures, anomaly baselines. Detection-in-depth where prevention-in-depth is incomplete.
12. **The Shadow Verdict + `threat-model.md` delta** — stated plainly: which crown jewels are now defended against which archetypes, which remain exposed, and what is the explicit deferred-risk decision for each remaining exposure (accept / mitigate-later / transfer-to-monitoring). Update the project's `threat-model.md` (or create it if absent) with the delta. The output document — `SHADOW_PASS_YYYY-MM-DD_<area>.md` — carries the full Round-1 inventory + Round-2 archetype × crown-jewel matrix + Round-3 forge list + the merged `NEG` test reference.

**Vocabulary mapping (for `vocabulary-lint` hook compliance per the kit's vocabulary law):**
- Code / configs / commits / log lines / schemas / env vars: `adversarial-review`, `red-team-pass`, `threat-archetype-audit` — see [VOCABULARY.md](VOCABULARY.md).
- Docs only (ATLAS.md, CYCLES.md, VOCABULARY.md, `threat-model.md`, `SHADOW_PASS_*.md`): divine names permitted.

**Plug-points:**
- **Mandatory** inside [`/release`](.claude/skills/release/SKILL.md) for sensitive-trigger diffs (auth / PII / payment / IaC / public-API per SDLC §5 reviewer-routing).
- **Optional** inside [`/incident`](.claude/skills/incident/SKILL.md) postmortem (T_prarabdha) — running `SHD` after an incident often surfaces the archetype-class the incident belonged to, which then bounds the next-iteration defense work.
- Available to `security` role at any T₂/T₃.

**Distinct from:**
- `NEG` (Shiva's Third Eye): `NEG` is closed-world boundary testing — "did my known guard fire on bad input?" `SHD` is open-world adversary imagination — "what guard did I forget to write?" The two compose: `SHD` finds the gap; `NEG` then tests the new guard. Every `SHD` pass produces at least one new `NEG` test.
- `SD` (Shiva Deep): `SD` burns incoherence in YOUR system — the destroyer's gaze on your own design. `SHD` adopts the adversary's gaze on your system — the *attacker's* drishti, not the destroyer's.
- `SID` (Sita Deep): `SID` tests whether the system can endure attack. `SHD` imagines the attack before it arrives. `SID` is resilience under siege; `SHD` is the threat-model that informs which sieges to prepare for.
- `NS7` (Kaalratri): `NS7` finds dark corners and bugs in the existing surface. `SHD` imagines surfaces an adversary would create or exploit that the defender did not anticipate.

**Lineage:** Proposed 2026-05-27 via 14-voice Guru Council deliberation; ratified via Ram Deep governance verdict + `T4R` (KBD × NGD × VKD × MID) PASS for Build A; landed in KABIR_GATE.md additions log entry 10 with 4 binding conditions (ONE cycle not a family / ship with archetype taxonomy / shadow-as-teacher framing not demon-framing / propose via KABIR_GATE before enacting). First-firing target: RIAAN `charter_intent.py` / `Φ` extractor as a pre-forge threat-model pass before J0.6 (target date 2026-08-25 per entry 10's 90-day first-firing reversibility clause).

**Closing:** *The shadow is also a teacher — Ram could not have been Ram without Raavan. Imagine the attacker honestly, defend the user devotionally.*

---

### Sanjay Handover Cycle — Session Continuity (Tag: `SAN`)
**When to use:** At the END of every work session. Before closing the terminal. Before sleeping. Before switching to a different project. Whenever the thread of work will be picked up later by you or someone else.
**Philosophy:** Sanjay was the charioteer blessed with divine sight (divya drishti) by Vyasa. He narrated the entire Kurukshetra battle to blind king Dhritarashtra in real-time — every formation, every weapon, every death — so that one who could not see the battlefield could understand it completely. Your HANDOVER.md is Sanjay's narration. The future developer is Dhritarashtra — they cannot see what happened. Your narration is their only sight.
**Method:** Walk through the session's work. Write what Sanjay would narrate: what was the battle formation when you arrived? What arrows were fired? Who fell? Where does the army stand now? What is the next formation?
**Structure (4-cycle Quick):**

1. **The Battlefield Now** — Where does the project stand RIGHT NOW? Not where it started, not where it's going — where it IS. What compiles? What tests pass? What's broken? What's deployed? Write 1-3 sentences that Dhritarashtra can understand.

2. **The Arrows Fired** — What was done this session? List every commit. For each, one line: what changed and WHY. If something failed, say so — Sanjay narrated defeats honestly. Include: files changed, tests added, cycles run.

3. **The Fallen & The Standing** — What doesn't work? What was tried and abandoned? What open questions remain? What decisions were made and WHY? These are the dead warriors and the standing ones. Dhritarashtra needs both.

4. **Tomorrow's Formation** — What should happen next? Ordered list. Tag with cycle names if known. Mark dependencies. Mark Lakshman Rekhas (things NOT to do yet). This is the war plan for tomorrow's general.

**Output:** Write to `HANDOVER.md` in the project root. Do NOT commit it — it is a living document, overwritten each session. If the project has no HANDOVER.md, LAW 11 is being violated.

**Closing:** Yatha Raja Tatha Praja — as Sanjay narrates truthfully, the kingdom acts wisely.

---

# Glossary of Divine & Sanskrit Terms

| Term | Meaning | Engineering Analog |
|------|---------|-------------------|
| Agni Pariksha | Trial by fire | Full regression test after recovery — proving integrity |
| Dharma | Righteous duty, moral law | Compliance, governance, doing the right thing |
| Lakshman Rekha | The line Lakshman drew for Sita's protection | Absolute boundary that must not be crossed (max limits, forbidden ops) |
| Maryada | Boundary, limit, propriety | Access control, contract enforcement, API limits |
| Navdurga | Nine forms of Goddess Durga | Nine focused 4-cycle review protocols (NS1-NS9) |
| Raas | The divine dance of Krishna and the Gopis | Full system harmony — all components working in concert |
| Stambhana | Immobilization, freezing | Circuit breaker, kill switch, emergency stop |
| Tandava | Shiva's cosmic dance of dissolution | Controlled destruction of what no longer serves |
| Vanvas | Exile, forest dwelling | Degraded mode operation, adversity testing |
| Veena | Narad's stringed instrument | Communication channel, information flow |
| Ashok Vatika | Garden in Lanka where Sita was held | Hostile environment where integrity must survive |
| Swayamvar | Ceremony to choose a partner through contest | Stress test at design limits (can you break Shiva's bow?) |
| Puja | Worship ritual | Structured review ceremony |
| Visarjan | Ritual immersion (conclusion of puja) | Review completion, findings archived |
| Samarpan | Surrender, offering | Escalation to Divine Council when beyond all cycles |
| Siddhi | Supernatural power, mastery | Performance optimization, architectural perfection |
| Tapasya | Severe penance, austerity | Coding discipline, standards enforcement |
| Sutra | Thread, formula, condensed teaching | Codified pattern, reusable template |
| Mantra | Sacred utterance | Closing affirmation of a review cycle |
| Darshan | Sacred seeing, audience with the divine | Initial assessment, first look at the problem |
| Pranaam | Respectful greeting, bow | Arrival state — acknowledging the problem before solving it |
| Bandha | Bondage, identification | System identifying AS its metrics instead of observing them |
| Sakshi | Witness consciousness | Observability that sees without reacting — detached monitoring |
| Sahaja | Natural, effortless | Self-regulating system — no manual intervention needed |
| Turiya | The Fourth (beyond 3 states) | System transcending its own monitoring — pure self-awareness |
| Maya_Relapse | Return of illusion | False alarm, alert fatigue, reverting to panic mode |
| Dukkha | Suffering, unsatisfactoriness | System pain — latency, errors, user complaints |
| Samvega | Spiritual urgency | First production incident that shatters comfortable ignorance |
| Majjhima | Middle Way | Neither over-engineered nor under-designed — balanced architecture |
| Bodhi | Awakening | Seeing the causal chain — root cause understood completely |
| Parinibbana | Final release | Graceful shutdown — system releases all resources, creator steps back |
| Pashu | Animal/bound soul | Unoptimized system running unconsciously at 10% capacity |
| Kaya_Siddhi | Body perfection | Peak performance — hardware exceeding its own spec sheet |
| Unmani | No-mind | System needing no operator — self-tuning, self-healing |
| Avadhuta | Liberated wanderer | System with zero vendor lock-in, pure open function |
| Nada | Unstruck inner sound | The system's natural rhythm when all bottlenecks are cleared |
| Sundarkand | Beautiful chapter (of service) | Pure DevOps mindset — selfless service under fire |
| Ram Rajya | Rama's perfect kingdom | System where every user gets justice, care, and attention |
| Shabari | The simplest devotee | The least technical user — the true north of product design |
| Nama | The divine Name | Mission statement, core purpose — alive or mechanical? |
| Rechana | Catharsis, release | Chaos engineering — deliberately surfacing suppressed issues |
| Zorba | The celebrator | Building for joy and delight, not just requirements |
| Shunyata | Emptiness, no-mind | Minimal system — everything unnecessary removed |
| Sahaj_Ananda | Natural bliss | System that is joy to use, build, and maintain simultaneously |
| Arthashastra | Science of statecraft/wealth | Business strategy, competitive analysis, market positioning |
| Mandala | Circle of kings | Alliance/competition matrix — who is friend, foe, neutral |
| Kosha | Treasury | Budget, runway, resource reserves |
| Sama | Persuasion | Soft influence — documentation, community, evangelism |
| Dana | Incentive | Rewards — open-source contributions, partnerships |
| Bheda | Division | Competitive positioning — where rivals are split |
| Danda | Force/Punishment | Hard power — IP protection, speed, moats, switching costs |
| Chhandma | Disguise/Intelligence | Research, competitive intelligence, user interviews |
| Ashtanga | Eight limbs | Patanjali's 8-step systematic discipline |
| Chitta Vritti | Mind fluctuations | System noise, process chaos, context switching |
| Antaraya | Obstacle (9 types) | Specific failure mode with specific remedy |
| Vikshepa | Scatter/Distraction | Symptom of obstacles — pain, despair, irregular output |
| Kashaya | Latent impression | Old patterns resurfacing — legacy thinking, tech debt DNA |
| Kaivalya | Absolute independence | Self-sufficient system — no external dependencies can break it |
| Doha | Two-line couplet | Kabir's truth missile — a test that either passes or fails |
| Saakhi | Witness-poem | Kabir's verses as diagnostic tool |
| Jhini | Fine cloth/weaving | Honest daily work — code as craft, not performance |
| Ulta | Upside-down | Inverted assumption — the belief that is exactly wrong |
| Pandit_Trap | Scholar's prison | Process compliance without understanding |
| Mullah_Trap | Zealot's prison | Devotion without self-examination |
| Ganana | Counting | Census/inventory — enumerate before computing |
| Kuttaka | The Pulverizer | Aryabhata's algorithm — decompose until trivial |
| Jya | Sine/Approximation | Computation with stated error bounds |
| Bhagana | Revolutions/Cycles | Pattern recognition in data |
| Yugapada | Simultaneous | Solving coupled variables together |
| Siddhanta | Established Truth | Verified result with precision, method published |
| Sthula_Bhrama | Gross Error | Structural mistake — wrong algorithm, not rounding |
| Sunya_Bhaya | Fear of Zero | Avoiding edge cases, null, empty — cowardice |
| Pariksha | Examination | Five-fold diagnosis before intervention |
| Nidana | Root Cause | Five nidanas: cause, signs, symptoms, pathogenesis, prognosis |
| Chedana | The Cut | Surgical intervention — eight types, minimal, precise |
| Shodhana | Cleansing | Post-intervention wound management — prevent infection |
| Ropana | Healing | Recovery monitoring — body heals, surgeon watches |
| Rasayana | Rejuvenation | Stronger than before — preventive measures installed |
| Vrana_Dushta | Infected Wound | Intervention made things worse — iatrogenic harm |
| Ashastra | Bloodless | Solved without cutting — the highest surgical skill |
| Ajnana | Honest Ignorance | Not-yet-knowing — better than false knowledge |
| Shruti | What is Heard | Raw knowledge received — listen before documenting |
| Smriti | What is Remembered | Faithful recording — document before interpreting |
| Viveka | Discernment | Swan separating milk from water — essential vs noise |
| Vani | Speech/Expression | Knowledge given clear voice — teach, don't recite |
| Vidya | Structured Knowledge | Organized, indexed, cross-referenced knowledge system |
| Pragya | Wisdom in Action | Knowledge applied — Vidya in practice |
| Hamsa | The Swan | Effortless discernment — knowledge flows without effort |
| Tamas_Ghat | Knowledge Pollution | Wrong/outdated docs — worse than no docs |
| Vakya_Bhrama | Miscommunication | Right intent, wrong words — jargon that excludes |
| Vastu | Foundation/Site | Orientation, forces, constraints — survey before building |
| Shilpa | Blueprint/Design | Detailed buildable plan — not abstract dreams |
| Yantra | Tooling/Machines | Build tools BEFORE building structure |
| Nirmana | Construction | Layer by layer, no shortcuts — process is sacred |
| Pratishtha | Consecration | Structure alive, operational, handed over — outlives builder |
| Bhagna | Structural Failure | Foundation cracked — blame joints, not earthquake |
| Maya_Sabha | Palace of Illusions | Impressive demo, fragile internals — do not ship |
| Svabhava | Inherent Existence | False belief that things have permanent essence |
| Pratityasamutpada | Dependent Origination | Nothing exists independently — all is relational |
| Catuskoti | Tetralemma | Four-position test: true, false, both, neither |
| Prasanga | Reductio ad Absurdum | Take position to logical extreme — watch it collapse |
| Vyavahara | Conventional Truth | Useful but not sacred — maps, not territory |
| Paramartha | Ultimate Truth | Convention and emptiness held simultaneously |
| Reification_Trap | Abstraction Worship | Treating maps as territory — layers protecting layers |
| Nihilism_Trap | Nothing Matters | Emptiness misunderstood — snake grasped wrong |
| Aram | Virtue | Thiruvalluvar's Book 1 — ethics before wealth before love |
| Porul | Wealth/Governance | Thiruvalluvar's Book 2 — wealth is duty, governance is service |
| Inbam | Love/Joy | Thiruvalluvar's Book 3 — the crown of a good life |
| Ozhukkam | Natural Propriety | Self-governing conduct — people follow virtue willingly |
| Poyyamai | Deception | The worst sin — system lies, trust collapses |
| Seyalvinaiyamai | Inaction | Passive complicity — seeing wrong and doing nothing |
| Kural | Seven-word couplet | Thiruvalluvar's unit of wisdom — maximum compression |
| Garbha | Womb | Seed state — inspiration planted before the world interferes |
| Stambha | Pillar | The "impossible" constraint that splits open to reveal truth |
| Narasimha | Half-man half-lion | Creation that breaks all categories — neither this nor that |
| Abhaya | Fearlessness | Not needing validation or revenge — completeness without audience |
| Kunj | Sacred grove | Private creative space — no audience, no judgment |
| Shruti (music) | Microtone | The nuance between notes — where God lives in music |
| Dhrupad | Ancient vocal form | Purest musical expression — no ornamentation for its own sake |
| Nidhivan | Eternal grove | Where music exists complete, needing no listener |
| Deepak (raga) | Lamp-lighting raga | Maximum creative power — but burns the creator without balance |
| Megh Malhar | Rain raga | The antidote to Deepak's fire — balance, cooling, recovery |
| Navaratna | Nine jewels | Mastery recognized at highest level — carries responsibility |
| Naya Raga | New raga | Innovation within tradition — creating what didn't exist |
| Taleem | Training/apprenticeship | Decades of practice before mastery — no shortcuts |
| Darbar | Royal court | Private creation enters public space — performance with purpose |
| Bal Leela | Child's play | Krishna's childhood — tenderness, joy, small human moments |
| Sursagar | Ocean of Sur | Surdas's body of work — an ocean, not a single drop |
| Vidvat | Scholarship | Technical foundation that precedes ecstasy |
| Prem Unmada | Love-madness | Ecstasy that looks insane to outsiders but is arrival |
| Nagar Kirtan | Street kirtan | Taking devotion from temple to street — public, open, free |
| Maha Mantra | Great mantra | The simplest hook — 16 words everyone can repeat |
| Samkirtan | Collective singing | When individual voices dissolve into one — 1+1=infinity |
| Pallavi | Opening line of kriti | The seed containing the entire composition |
| Anupallavi | Development section | Expanding the seed into deeper territory |
| Charanam | Closing verse | The feet of the composition — deepest meaning delivered |
| Sangati | Melodic variation | Repetition with depth — each pass reveals more |
| Pancharatna | Five Gems | Tyagaraja's five masterwork kritis — body of work as legacy |
| Begumpura | City without sorrow | Ravidas's utopia — no hierarchy, everyone equal |
| Kathauthi | Washbasin | "If heart is pure, Ganga flows here" — purity without privilege |
| Amritbani | Immortal word | Creation that transcends its creator's origin |
| Tiruppavai | Dawn songs | Andal's 30 verses — daily ritual, consistency, waking the divine |
| Nachiyar | Beloved's cry | Raw, unfiltered longing — passion without self-censorship |
| Vaaranam | Thousand elephants | Vision so vivid it pulls reality toward it |
| Vachana | Prose-poem | Akka Mahadevi's weapon — short, naked, devastating truth |
| Anubhava Mantapa | Parliament of experience | Where truth is tested by other truths |
| Vakh | Kashmiri saying | Lal Ded's four-line paradox — categories shattered |
| Shunya Dance | Dancing in emptiness | Freedom after all stripping — nothing left, everything found |
| Aami Pana | I Am That | Universal realization — truth beyond all frameworks |
| Jata | Grinding stone | Janabai's hand-mill — repetitive work as sacred rhythm |
| Ovi | Work-song | Short verse born from physical labour — timed to the grind |
| Abhanga | Unbroken song | Song without end — because the work never ends |
| Jugalbandi | Musical duet | Two FSM voices composing together — collaborative creation |
| Ashtabharya | Eight principal queens | Krishna's eight queens as eight creative dimensions |
| Patra | Letter | Rukmini's love letter — the spec that is both strategic AND passionate |
| Harana | Abduction/rescue | Planned rescue — strategy executed through love |
| Patrani | Chief Queen | Creator who leads with both wisdom and beauty |
| Guha | Cave | Ancient problem space — deep, dark, requiring endurance to clear |
| Yuddha | Battle | Prolonged honest combat — 28 days, no shortcuts |
| Pehchaan | Recognition | Identity proven through quality of fight, not credentials |
| Mani (jewel) | Syamantaka jewel | Treasure earned through endurance, not found by luck |
| Abhimana | Sacred pride | The fire that refuses mediocrity — drives quality, not ego |
| Parijata | Celestial tree | The best tools/resources — earned through battle, demanded without apology |
| Yamuna Tat | Yamuna's riverbank | Seat of patient contemplation — the river brings what's worthy |
| Swayamvar (challenge) | Self-choice ceremony | Impossible specification — seven bulls, all must be tamed |
| Sapt Rupa | Seven forms | Parallelization — becoming seven to tame seven constraints |
| Swa Vara | Self-choice | Authentic creative choice against establishment pressure |
| Pratibimba | Reflection | The inverted view — the real target seen through water |
| Ekagra | Single-pointed focus | The absence of everything except the target |
| Viddha | Hit/pierced | Perfect shot — zero margin of error |
| Kul Sambandh | Family bond | Pre-existing connection — solution already in your ecosystem |
| Sahaj Prem | Natural love | Organic fit — zero integration drama |
| Griha Lakshmi | Home-prosperity | The quiet center that holds everything together |
| Dwaraka | Golden city | Complete creative system — all eight dimensions present |
| MahaKaal | Lord of Time (Shiva's roop) | Outer lifecycle — every task has birth and death, time is the only edge trigger |
| ArdhNarishwar | Half-male half-female (Shiva-Shakti) | Inner quality — design and execution as one act, never two |
| Leela | Divine play | Work begun as play, not obligation — Brahma dreams, not plans |
| AshtaRasa | Eight flavours | 8 Queens of Krishna as 8 dimensions every work must carry |
| NoMind | Absorbed focus beyond effort | Mira Ji state — self vanishes into work, clock suspended |
| Tandava (MahaKaal) | Dance of dissolution | Shipping with laughter — the cosmic joke of impermanence |
| Shunya (MahaKaal) | Void between cycles | The gap between breaths — not a meeting, simply stop |
| False_Leela | Work begun as obligation | Anti-state — MahaKaal has marked this for early death |
| Stale_Rasa | Stuck perfecting forever | Anti-state — fear of death disguised as quality |
| Naad | Primordial vibration | Saraswati's sound flowing through all states — the system canary |
| Anahata | Unstruck sound | Sound heard only in Shunya — no instrument, it simply IS |
| Damaru | MahaKaal's drum | The beat of joyful dissolution during Tandava |
| Veena (Naad) | Saraswati's instrument | Knowledge flowing as sound — the work "sounds right" |
| Unified (ArdhNarishwar) | Shiva-Shakti as one | Design-and-execution are one breath — the ideal state |
| Divided (ArdhNarishwar) | Shiva ≠ Shakti | The disease — design separate from execution |
| Leaning_Shiva | Too much consciousness | Architecture astronauting — beautiful thoughts, zero code |
| Leaning_Shakti | Too much energy | Coding without thinking — fast output, zero coherence |
| Cosmic Joke | Why MahaKaal laughs | You built with total love knowing it would dissolve — BECAUSE it will |
| Pareeksha | Examination, test | Headless Slint UI testing harness — Sita's Agni Pariksha automated |
| B(s) | Balance Gap | ArdhNarishwar metric: \|mu_Shiva - mu_Shakti\| — measures Mind-Model unity |
| Mind Gates | 6 verification gates | Gate 0-5 checking model output before student sees it |
| NEG | Negative Testing Cycle | Proving boundaries hold — the Third Eye burns what should not pass |
| SAN | Sanjay Handover Cycle | Session-end narration — preserve context for tomorrow's blind king |
| Sanjay | Charioteer with divine sight | Narrates the battlefield truthfully to one who cannot see — HANDOVER.md |
| Divya Drishti | Divine sight | Vyasa's gift to Sanjay — seeing the whole battlefield, not just your part |
| Dhritarashtra | The blind king | The future developer who was not present — your HANDOVER.md reader |

---

# Evolving ATLAS — How to Add Cycles, Laws, Jugalbandis

> *The paths through the garden must be clear, or no one will walk them.*

ATLAS is a living catalog. When a new divine archetype is needed, a new cycle is added. When the fundamental nature of work changes, a law is added. When two cycles naturally compose, a jugalbandi is named.

## The three things you can change

### Laws (rare — constitutional amendments)

Laws change only when the fundamental nature of work changes. They are axioms, not opinions.

**To propose a law change:**
1. Run a Shiva Deep (`SD`) on the current law — what is broken?
2. Run a Brahma Deep (`BD`) on the proposed change — what does it create?
3. Verify consistency with all other laws (no two laws may contradict each other).
4. Document in ATLAS.md with the change date.
5. If the change touches a working-set law, also amend [`LAWS.md`](LAWS.md).

**Never:**
- Add a law that contradicts an existing law.
- Remove a law without moving its protection to another law.
- Change a law's guardian deity without deep consultation.

### Cycles (regular — planting new paths)

New cycles are added whenever a new divine archetype or review methodology is needed. This is the most common evolution.

### Glossary (continuous — naming the plants)

New terms are added whenever a new concept enters the system. Every shastra, FSM, and cycle that introduces a term should also add it to the glossary in this file. [`VOCABULARY.md`](VOCABULARY.md) is the code-side companion (canonical IT names); the Glossary in ATLAS is the lineage-side reference (full prose meaning).

## Adding a new cycle (8 steps)

### Step 1: Identify the need

A cycle is needed when:
- A situation exists that no current cycle addresses.
- An existing cycle is too broad and a focused variant would serve better.
- A new divine archetype has been modeled.

### Step 2: Choose the archetype

Every cycle belongs to one of 5 archetypes:

| Archetype | Creates | Preserves | Destroys | Strategizes | Energizes |
|---|---|---|---|---|---|
| Brahma-type | New things |  |  |  |  |
| Vishnu-type |  | Existing things |  |  |  |
| Shiva-type |  |  | Dead things |  |  |
| Krishna-type |  |  |  | Multi-path decisions |  |
| Shakti-type |  |  |  |  | Force/energy |

### Step 3: Choose the tag

Tags are 2-4 uppercase letters. They must be:
- Unique across all cycles (check the routing table in this file).
- Mnemonic (reader should guess the cycle from the tag).
- Never reused even if a cycle is archived.

### Step 4: Write the routing table entry

Add to the cycle routing table in this file:

```markdown
| Situation description | Cycle Name | 12 | `TAG` | Guardian |
```

Place in the correct section: Core / Guru Council / Bhakti / Jugalbandi / Ashtabharya / Shiva Roop. Add a new section only if the cycle genuinely doesn't fit (sparingly).

### Step 5: Write the full cycle definition

Every cycle follows this template:

```markdown
### {Name} Deep Cycle — {Subtitle} (Tag: `{TAG}`)

**When to use:** {1-2 sentences}
**Philosophy:** {2-3 sentences — the guardian's worldview applied to work}
**Method:** {1-2 sentences — how to actually run this cycle}
**Structure (3x4 {Name} Matrix):**

**Round 1 — {Theme} (Cycles 1-4):**
1. {Cycle name} — {what to do}
2-4. ...

**Round 2 — {Theme} (Cycles 5-8):**
5-8. ...

**Round 3 — {Theme} (Cycles 9-12):**
9-12. ...

**Closing:** {Mantra or affirmation}
```

**The 3x4 structure is non-negotiable:**
- Round 1: PERCEIVE — what is true?
- Round 2: THINK — what wants to change?
- Round 3: ACT — what to do?

For 4-cycle variants (Nav Shakti, Q-profile cycles), use a single round of 4.

### Step 6: Add glossary terms

Every new concept introduced by the cycle must appear in the Glossary section of this file.

### Step 7: Define drishti and Q for the guardian

Every cycle has a guardian. Every guardian has (or should have) an FSM in [`fsms/atlas-fsms/`](fsms/atlas-fsms/). That FSM must have:

> **Drishti on every transition** — `left, right, up, down, past, future, present, silence`
>
> **Q on every state** — `[rkm, jmb, stb, kln, ngj, mtv, lkq, bdr]` each ∈ [0,1]

When you define a new cycle, think about what its 12 rounds look like through the drishti lens:

| Round | Primary directions | Why |
|---|---|---|
| Round 1 (PERCEIVE) | `present`, `down`, `past` | See what IS, look at details, check history |
| Round 2 (THINK) | `left`, `right`, `up`, `future` | Alternatives, zoom out, project forward |
| Round 3 (ACT) | `present`, `down`, `future`, `silence` | Ground in reality, build precisely, know when to stop |

If Q doesn't change between states, the cycle isn't doing any work.

### Step 8: Complete the triangle

A new cycle is only complete when all five exist:

- [ ] **Cycle defined** — in this file
- [ ] **Routing entry** — in the routing table above
- [ ] **Guardian FSM** — in [`fsms/atlas-fsms/`](fsms/atlas-fsms/)
- [ ] **Glossary terms** — all new terms defined
- [ ] **Kabir Gate pass** — see [`KABIR_GATE.md`](KABIR_GATE.md): the cycle must produce a concrete artifact and pass quarterly review

## Creating a jugalbandi (cycle composition)

A jugalbandi is two cycles composed together. Use when two cycles naturally complement each other and are frequently run in sequence:

- One creates, the other validates.
- One strips down, the other optimizes what remains.
- One focuses inward, the other looks outward.

Add to the Jugalbandi section of the routing table:

```markdown
| {Combined purpose description} | {Name A} + {Name B} | 8 (4+4) | `JB-{AB}` | {Guardian A} + {Guardian B} |
```

**Mathematical form:** `J_seq(G_a, G_b) = G_b ∘ G_a`. G_a runs first (4 cycles), G_b runs on the result (4 cycles).

## Cycle sections in this file

The routing table is organized in sections:

1. **Core** — Trimurti + core divine cycles (SD, VD, BD, ND, HD, RD, RAD, SID, LD, BM, KD, GD)
2. **Guru Council** — philosophical cycles (ASD, BUD, GKD, TLD, OSD, CKD, PJD, KBD, ARD, SSD, SRD, VKD, NGD, TVD)
3. **Bhakti** — devotional cycles (PRD, HRD, TND, SDD, CHD, TYD, RVD, AND, AKD, LLD, JND, MID)
4. **Jugalbandi** — composed cycles (JB-*)
5. **Ashtabharya** — 8-queens cycles (RKM, JMB, STB, KLN, NGJ, MTV, LKQ, BDR, AB*)
6. **Shiva Roop** — time and unity cycles (MKD, ANR, NEG, SAN)

## Common mistakes when adding cycles

| Mistake | Why it's wrong | Fix |
|---|---|---|
| Cycle without routing entry | Nobody will find it | Add to routing table first, then write the definition |
| Tag collision | Two cycles with same tag cause confusion | Search existing tags before assigning |
| 3x4 with only 2 rounds | Incomplete cycle — PERCEIVE without ACT is philosophy, not work | All 3 rounds or use 4-cycle variant |
| New term without glossary | Reader encounters undefined word | Add every new term to glossary |
| Cycle without guardian | No archetype means no classification | Every cycle needs a divine guardian |
| Cycle without FSM | The method exists but the machine doesn't | Place a TOML in [`fsms/atlas-fsms/`](fsms/atlas-fsms/) |
| Glossary term without engineering analog | Terms must bridge spiritual and technical | Every entry needs all 3 columns |
| Modifying someone else's cycle without SD | Changes may break the cycle's integrity | Run Shiva Deep on the cycle before changing it |

## Relationship to V1 KIT's working set

V1 KIT's working-set primitives ([`LAWS.md`](LAWS.md), [`CYCLES.md`](CYCLES.md), [`ROLES.md`](ROLES.md)) are the subset of ATLAS that load-bears day-to-day work. A new cycle is added *to ATLAS first*. It graduates into [`CYCLES.md`](CYCLES.md) only when it has been invoked on 3+ projects and has a concrete repeatable artifact — that is the Kabir Gate threshold for working-set status. ATLAS is where cycles are born; CYCLES.md is where they earn their keep.