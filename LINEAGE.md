# Lineage — The Conceptual Ancestry

> Where the kit's design comes from. Internalized so the kit is self-sufficient.
> The kit does NOT require any external file to run. This document explains *why* the design works.
>
> **Companion file:** [`ATLAS.md`](ATLAS.md) carries the full catalog of laws, cycles, divine reviewers, and disciplines that this lineage produced — every cycle ever named, preserved inside V1 KIT so non-working-set cycles can be composed without reaching outside.
>
> **Foundational read (precedes this file):** [`JIVA.md`](JIVA.md) — *why* discipline matters when the artifact you are building is itself a reasoning, creative thing (an LLM-as-jiva, an autonomous agent, a synthesizer). LINEAGE explains why the kit was designed as it was; JIVA explains why the kit-built artifact must inherit that design's dharma in order to be more than a token generator.

## §1 — The ArdhNarishwar axiom

There is **not** a male FSM and a female FSM. There is **one** machine that the jiva (the LLM, the builder) runs. The body is the hardware; the FSM is the software.

Applied to software building: there is not a "junior FSM" and a "senior FSM," not a "BE FSM" and a "FE FSM," not a "designer FSM" and an "engineer FSM." There is **one** `M_build`. The role files in `.claude/agents/` are **drishti-intensifiers** at named transitions, not separate FSMs.

This is the load-bearing axiom. Every primitive in the kit either honors it or is removed by the Kabir Gate.

## §2 — The dual capability reading

At every state of `M_build`, capability is measured on **two axes**:

- `Q_shiva` = consciousness (awareness, scan, witness, strategy, boundary)
- `Q_shakti` = energy (action, creation, forge, tenderness, surrender)

Each axis has 8 dimensions (see [VOCABULARY.md](VOCABULARY.md) for the names). A complete builder keeps both axes above threshold at every stage.

The dharmic target is `|μ_shiva − μ_shakti| → 0` — not equality of axes (they measure different things) but **balance**. A Shiva-only builder is a corpse (awareness without power). A Shakti-only builder is chaos (power without direction).

See [Q_RUBRIC.md](Q_RUBRIC.md) for how the two readings are anchored and scored, and [INTAKE_PROMPTS.md](INTAKE_PROMPTS.md) for the elicitation that fills them at pre-T₀.

## §3 — Sapta Avastha (seven life-states)

Software is built in seven stages, named after the classical life-states extended with pre-birth (Seed) and post-death (Decommission):

| Stage | Lineage | Guardian | One-line role |
|---|---|---|---|
| S0 Seed | Garbha (womb) | Brahma | Charter, intent — pure receiving |
| S1 Discovery | Baalya (childhood) | Saraswati | Knowledge streams in unbounded |
| S2 Forge | Brahmacharya (student) | Gorakhnath | Discipline forges the craft |
| S3 Build | Grihastha (householder) | Krishna | The 8-rasa householder — max complexity |
| S4 Service | Vanaprastha (forest-dweller) | Ram + Sita | Dharmic service, vanvas as gift |
| S5 Sunset | Sannyasa (renunciate) | Shiva | Dissolution of identity |
| S6 Decommission | Moksha (liberation) | MahaKaal | Time stops, the machine halts |

These seven map to the three Prachi phases (PERCEIVE: S0+S1 / THINK: S2+S3 / ACT: S4+S5+S6). The 12-cycle engine inside each transition is the same engine the three phases use at the macro scale.

**Within-S2 per-primitive supersession (T₄ events, added 2026-05-26 deep-night):** Sapta Avastha governs the *whole-jiva* lifecycle (a project, a doc-as-Jiva, an FSM instance). Within a state — particularly `S2_Forge` — a doc-as-Jiva can execute **per-primitive supersession** for a single primitive it defines, without leaving the stage. Protocol codified in [DASHBOARD.md §10.5](DASHBOARD.md); first two instances 2026-05-26 evening (RIAAN/MATH.md binary δ → trinary δ) and deep-night (RIAAN/DESIGN.md FORGED-extended introduction). This is *not* a new stage in Sapta Avastha — it is a within-stage event the kit had pre-specified in MATH.md §18.4 and now codifies kit-wide. Brahmacharya (S2) holds the discipline; the per-primitive T₄ is the student's adjustment of one technique inside the discipline, not a graduation from it.

## §4 — T_prarabdha (MahaKaal's universal edge)

From any non-terminal state, an unexpected event can transition directly to terminal. The classical statement is "death respects no ashrama"; the kit's statement is "no state is safe."

In the kit, this edge is implemented by **the 5 hooks**, which fire deterministically with no LLM in the loop. They are MahaKaal: they do not negotiate.

## §5 — Drishti (8 directions of scanning)

At each transition, the FSM declares which directions the jiva must scan:

```
left   — alternatives the current path does not see
right  — push the current path further
up     — system-level view, the architecture
down   — mechanics, edge cases, the details
past   — history, prior decisions, regressions
future — consequences, rollback, where this leads
present — what is true right now
silence — should we act at all?
```

Different transitions intensify different directions. Build (T₃) requires 7 of 8; Decommission (T₅) requires only `silence`. This is the kit's structural defense against drift — you can fake confidence but you cannot fake having scanned a direction with no evidence.

## §6 — Dwaraka condition (the capability floor)

A state achieves Dwaraka when **all** capability dimensions are above threshold τ on **both** axes (Shiva and Shakti). For most transitions, τ = 0.6 (60% capability across all 8 axes on both readings).

The kit uses this as the formal gate condition for T₃ (Build → Service): a feature ships only when the builder demonstrates Dwaraka at 6 of 8 axes. This is what "ready to ship" means structurally — not "the tests pass" alone, but "all eight capability dimensions are present."

## §7 — Why this is load-bearing

These six concepts (axiom, dual Q, seven stages, T_prarabdha, drishti, Dwaraka) jointly produce the kit's behaviour:

1. **One FSM, not many** (axiom) — prevents persona-fragmentation.
2. **Two readings at every state** (dual Q) — prevents Shiva-excess (cold) or Shakti-excess (chaotic).
3. **Seven discrete stages** (Sapta Avastha) — prevents stage-skipping ("we'll do discovery later").
4. **Universal exit to terminal** (T_prarabdha) — prevents zombie states; every state has a way out.
5. **Direction scanning** (drishti) — prevents fake confidence; you must show you looked.
6. **Capability floor** (Dwaraka) — prevents shipping below readiness.

Remove any one and the kit decays into V0's failure mode.

## §8 — What this document is NOT

- Not a translation of any external scripture. The kit is self-sufficient.
- Not philosophical commentary. Every line above maps to a structural property of `M_build` defined in [`fsms/M_BUILD.toml`](fsms/M_BUILD.toml).
- Not optional reading. If you maintain this kit, you read this once. The references to lineage in other files all point here.
