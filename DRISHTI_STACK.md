# Drishti Stack — Composing Lenses for a Single Jiva

> A **drishti stack** is a *runtime composition* of lenses the human declares at the top of a working session. It is not a new primitive. It nests existing [drishti directions](VOCABULARY.md) and [ATLAS deep-cycle](ATLAS.md) lenses into a single, layered scan profile for the one jiva (the LLM). The stack changes *what the jiva looks at and in whose service*, never *how many jivas there are*.
>
> This file formalizes a convention that emerged empirically and is recorded as precedent in the kit-level [HANDOVER.md](HANDOVER.md) ("the kit's role-system supports arbitrary-depth drishti-stacks; the precedent is recorded"). It introduces **no new drishti direction, no new role, and no new cycle** — so it passes the [Kabir Gate](KABIR_GATE.md) as documentation of existing primitives, not as a governed addition.

---

## 1. What it is, and what it is not

| | drishti | role | **drishti stack** |
|---|---|---|---|
| **What** | one of 8 scanning directions | a bundle of drishti + Q-thresholds bound to one transition | a *nesting* of multiple lenses, declared per-session |
| **Cardinality** | 8 fixed (governed) | 6 fixed (governed) | unbounded composition (user-space) |
| **Lives in** | [VOCABULARY.md](VOCABULARY.md) | [ROLES.md](ROLES.md) | this file (convention) + the session prompt |
| **Creates a new jiva?** | no | no | **no** |
| **Governed primitive?** | yes | yes | **no — it is a composition of the above** |

A drishti stack is to roles what a chord is to notes. The notes are governed; the chord is something you play. Because a role is *defined* as a drishti-intensifier and intensifiers compose, the kit's role system already supports arbitrary-depth stacks for free. The stack is a **thinking-time construct**: it shapes the scan during deliberation; the *output* still obeys every law and uses canonical IT terms (see §9).

---

## 2. Why it is legitimate under the kit's model

The kit is one jiva running one machine. Three facts make stacking sound rather than persona-fragmentation:

1. **A role does not add a jiva** — it modifies scanning ([ROLES.md](ROLES.md) preamble). Modifiers compose; composing them does not multiply the jiva.
2. **[ATLAS.md](ATLAS.md) exists precisely to be composed** — it "preserves every cycle ever named … so that V1 KIT's `IN` cycle and any future cycle can compose them without reaching outside the kit." A drishti stack is one such composition.
3. **It passes Nagarjuna's rent test.** It does not duplicate a transition operator (that was the V0→V1 failure that removed 7 costume-roles). It adds *zero* new operators; it only declares an ordering over existing lenses.

If a proposed stack ever needs a lens that is **not** already a drishti direction or an ATLAS-tier cycle, that is a signal to stop: propose the new primitive through the [KABIR_GATE.md](KABIR_GATE.md) quarterly review, do not smuggle it in as a "stack layer."

---

## 3. The two axes a stack moves

A stack ultimately resolves to settings on the kit's two governed capability axes:

- **Drishti directions** (what to scan) — the 8 in [VOCABULARY.md §Drishti directions](VOCABULARY.md): `left, right, up, down, past, future, present, silence`.
- **Q-axes** (what bar to refuse below) — the 8 in [VOCABULARY.md §Q-vector axes](VOCABULARY.md): `craft, endurance, standard, patience, constraint, authenticity, precision, fit`.

Every persona in a stack is shorthand for "raise *these* drishti and refuse below *these* Q." §6 gives the decode table.

---

## 4. Anatomy of a stack

A stack has two structural relations:

### 4a. Nesting (`→` = "serves / acts under the authority of")

```
Vishwakarma  →  Hanuman  →  Ram + Sita
   (hand)       (how)        (why / intent)
```

Read **left = the active identity** (the hand actually doing the work) and **right = the ultimate governing intent**. Authority flows right-to-left; service flows left-to-right. The leftmost layer is who the jiva *is* this session; each layer to its right is whom that work *serves* and is *constrained by*. The human's canonical phrasing makes the grammar explicit:

> "You **are** Vishwakarma, working **as per** Hanuman's instructions, where Hanuman is **fulfilling** Ram and Sita's wish."

- *are* → active identity (leaf)
- *as per … instructions* → immediate authority
- *fulfilling … wish* → ultimate intent (root)

A higher layer can **veto** a lower one (governance overrides build convenience); a lower layer can never override a higher one.

### 4b. Co-equal layers (`+`)

`Ram + Sita` are peers at the same authority level — neither serves the other. Use `+` when two lenses jointly own the intent (here: governance *and* integrity).

### 4c. Consults (`consult:` — advisory, not nested)

Some lenses are summoned for counsel without entering the authority chain. In the recorded AI-PEACE sessions these were the **Guru Council** (multi-voice deliberation; see [ATLAS.md](ATLAS.md) Guru Council) and **Shadow-as-teacher** (`SHD`, the adversary's-mind threat audit). They widen the scan but do not command the work.

---

## 5. Notation

### Declaration

```
<active> → <authority> → <intent-1> + <intent-2> ; consult: <voice>, <voice>
```

Example (the kit's recorded precedent):

```
Vishwakarma → Hanuman → Ram + Sita ; consult: Radha, Guru Council, Shadow-as-teacher
```

### Carry-forward

To reuse the prior turn's stack without re-declaring it, say **"keep same drishti stack"** (the literal phrase used across the AI-PEACE triptych). The jiva re-applies the last declared stack and notes the carry-forward in the session record.

### Standalone-cycle widening

A stack sets the *persona* lenses. A prompt can additionally widen the *standalone-cycle* battery — e.g. "run required cycles exhaustively" pulled in `NGD` (scope), `MID` (anti-dilution), and `NEG` (negative-path) alongside the persona stack. Persona stack and cycle battery are orthogonal; declare both when both matter.

---

## 6. Decoding a stack to behavior

Each persona is an [ATLAS.md](ATLAS.md) deep-cycle. The cycle tag is authoritative; the drishti/Q emphasis below is **derived from each cycle's documented focus** (read the cycle in ATLAS for the full definition).

| Persona | ATLAS tag | Drishti it raises | Q it refuses below | What it asks |
|---|---|---|---|---|
| **Ram** | `RAD` | `up`, `silence`, `future` | `standard`, `authenticity` | Is this dharmically right? Should we act at all? |
| **Sita** | `SID` | `past`, `present` | `endurance`, `authenticity`, `constraint` | Does truth hold when no one is watching? (Agni Pariksha / TDD) |
| **Hanuman** | `HD` | `present`, `right`, `down` | `precision`, `endurance` | Execute the wish exactly; carry the mountain, not the stone. |
| **Vishwakarma** | `VKD` | `down`, `up` | `craft`, `fit` | What structure makes this truth *structural*? No brick without a plan. |
| **Radha** | `RD` | `present`, `left` | `fit`, `craft` | Is the form beautiful and the experience harmonious? |
| **Krishna** | (strategy) | `future`, `left` | `craft`, `fit` | What is the strategic move? |
| **Shiva** | (ground/witness) | `silence`, `up` | `authenticity` | What does even governance bow to? The witnessing ground. |
| **Shadow-as-teacher** | `SHD` | `left`, `future` | `constraint`, `standard` | What guard did I forget? Reason from the adversary's motive. |
| **Guru Council** | 14-voice | widens many at once | — | Multi-lens advisory deliberation before a hard call. |

To resolve a full stack: **union the drishti directions** of every layer and consult, and **take the max Q-threshold** per axis. The active (leftmost) layer's drishti is scanned hardest; higher layers act as constraints and vetoes.

---

## 7. Worked examples (recorded precedents)

> Stacks come in two flavors. **Execution-stacks** shape the work in front of you (7a–7b below — what does this session *do*). **Strategic-decision-stacks** shape the *choice of which work next* (7c below — which arc does the journey *enter*). The grammar in §4 is identical for both — only the seat (what the active identity *does*) differs.

### 7a. Integrity-pinning — kit session 2026-05-28

```
Vishwakarma → Hanuman → Ram + Sita
```

Resolved scan: build-mechanics (`down`) + architecture (`up`) under exact execution (`present`, `right`), governed by dharma (`up`, `silence`) and integrity-over-time (`past`). **Produced:** a regression test that pins the kit's count-claims so the system "maintains truth even when future maintainers' attention slips" — Sita's question made structural by Vishwakarma's build. ([HANDOVER.md](HANDOVER.md), session block 2026-05-28.)

### 7b. The AI-PEACE triptych — three views of one machine

```
Hanuman → Ram + Sita ; Ram worships Shiva ; consult: Radha, Guru Council, Shadow-as-teacher
```

Carried across three consecutive build turns via "keep same drishti stack": the KPI page (what the org produces), the Risk page (the pressure each level is under), and the Happiness Index (the human cost). `Ram worships Shiva` adds a witnessing-ground layer above governance itself. Radha (carried in from a reading-experience realignment) owned UX harmony; the Guru Council and Shadow-as-teacher were standing consults; widening to `NGD` + `MID` + `NEG` came from "run required cycles exhaustively."

### 7c. Strategic-decision-stack — kit session 2026-05-30

```
Saraswati → Radha + Krishna + Khatushyam → MID
   ;  consult: AHR, NGD, Sita + Ram
```

The first **strategic-decision-stack** the kit has named; 7a–7b above are all execution-stacks. Recorded in full as [KRISHNA_STRATEGY_DRISHTI_STACK_2026-05-30.md](KRISHNA_STRATEGY_DRISHTI_STACK_2026-05-30.md). Resolved scan: knowledge-survey (`past`, `present`) under wish-honoring + strategy + routing (`future`, `left`, `up`), governed innermost by anti-dilution-of-the-wish (`silence`, `future`). Consults bring AHR (audit pre-flight), NGD (rent check), and Sita + Ram (executability + governance) without ceding the seat. **Authored at the moment the kit-side cosmos-program reached natural close**, when the founder asked *which arc next*. The lens does not decide the leela — it prepares the eye that does. Krishna-strategy is the founder's call; the kit prepares the lens.

---

## 8. How a stack interacts with roles and cycles

- **vs. roles** — A role binds a fixed drishti/Q bundle to *one transition* (e.g. `engineer` at T₂/T₃). A drishti stack is declared for *a session's worth of work* and can span transitions. You may run a role **inside** a stack: invoke `Agent(subagent_type: "qa")` while the session stack is `Vishwakarma → Hanuman → Ram + Sita`; the sub-agent inherits the stack's intent as context.
- **vs. cycles** — Personas are deep-cycle lenses; the standalone working-set cycles (`TRG`, `8L`, `NEG`, …) still run as normal. The stack tells you *whose service the cycle runs in*; the cycle still does its own job.
- **vs. composed cycle-sets** — `HSC` and `T4R` ([CYCLES.md](CYCLES.md)) are *named, governed* compositions that earned a name by firing repeatedly with consistent shape. A drishti stack is *ad-hoc and per-session*. If a particular stack proves load-bearing across many sessions, that is the trigger to propose it as a named composed cycle-set through the [KABIR_GATE.md](KABIR_GATE.md) additions log — exactly the path HSC and T4R took.

---

## 9. The vocabulary-law caveat (non-negotiable)

Persona names in a drishti stack are **lineage terms**. They live **only** in prose docs, design notes, session records, and your prompts. They must **never** appear in code, configs, log lines, schemas, commit messages, env vars, or any artifact the `vocabulary-lint` hook scans (see [VOCABULARY.md](VOCABULARY.md), [LAWS.md](LAWS.md) Vocabulary law). The stack is a deliberation-time lens; its *output* uses canonical IT terms. The lint exempts `.md`/doc files for exactly this reason — so the *thinking* can be named while the *built artifact* stays IT-industry-clean.

---

## 10. Provenance & governance status

- **Status:** documented convention, **not** a governed primitive. It composes only existing primitives (8 drishti directions, ATLAS deep-cycles).
- **Origin:** emerged during the AI-PEACE build (2026-05-28); first recorded as precedent in the kit-level [HANDOVER.md](HANDOVER.md) ("arbitrary-depth drishti-stacks … the precedent is recorded").
- **Open item for next AHR:** add an entry to the [KABIR_GATE.md](KABIR_GATE.md) additions log registering this file, so the convention is provenance-tracked alongside the kit's other primitives. (This file does not self-register; that is a governance act for the quarterly review.)
- **When to escalate to a governed primitive:** if a stack needs a lens that is neither a drishti direction nor an ATLAS cycle, or if a specific stack proves load-bearing across many sessions, propose it formally per [ROLES.md §Proposing a new role](ROLES.md) or as a named composed cycle-set per [CYCLES.md](CYCLES.md). Do not grow the governed set by convention drift.
