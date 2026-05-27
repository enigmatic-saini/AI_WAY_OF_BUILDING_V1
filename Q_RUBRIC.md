# Q_RUBRIC — The Capability Scorecard

> Capability has two readings (`Q_shiva`, `Q_shakti`) and 8 axes. This file is the anchor table that turns those readings from claims into evidence-backed scores.
>
> **Ground truth this rests on:** [M_BUILD.md](M_BUILD.md) §1 (the dual Q in the 9-tuple), [LINEAGE.md](LINEAGE.md) §2 (the ArdhNarishwar axiom), [VOCABULARY.md](VOCABULARY.md) §Q-vector-axes (the 8 canonical names).
>
> **Companion file:** [INTAKE_PROMPTS.md](INTAKE_PROMPTS.md) — the grooming question-bank that elicits the evidence this rubric scores. Rubric is the answer-key; INTAKE_PROMPTS is the test paper.

---

## §1 — What this rubric is and is not

**Is:**
- The anchor table for scoring `Q_shiva` and `Q_shakti` on each of the 8 capability axes.
- The stop-condition for elicitation (the `analyst` stops asking when the rubric saturates for the current state's Q-minima).
- The discipline that makes `|μ_shiva − μ_shakti| → 0` computable rather than aspirational.

**Is not:**
- A substitute for reading the code. Read the code, then score against the rubric.
- A scoring exercise that bypasses the artifact. **No artifact, no score above 0.0.**
- A fixed law. The rubric is draft; Kabir Gate recalibrates it quarterly.

---

## §2 — The two readings

At every state of `M_build`, capability is measured twice:

- `Q_shiva` ∈ [0,1]⁸ — consciousness: what was witnessed, scanned, strategized, bounded.
- `Q_shakti` ∈ [0,1]⁸ — energy: what was acted, forged, nurtured, completed.

Define:
- `μ_shiva = mean(Q_shiva)`
- `μ_shakti = mean(Q_shakti)`
- `δ = μ_shiva − μ_shakti` (signed gap)

Dharmic target: `|δ| → 0`. The **sign** of δ is the steering signal — see [§6](#§6--reading-the-trajectory).

---

## §3 — The 8 axes (canonical from VOCABULARY.md)

| Axis | Lineage | Domain meaning | Where M_BUILD invokes |
|---|---|---|---|
| `craft` | Rukmini | Strategic spec quality | S1, S3 |
| `endurance` | Jambavati | Multi-week perseverance | S3 |
| `standard` | Satyabhama | Refuses mediocrity | S3 (implicit), S4 |
| `patience` | Kalindi | Won't rush, won't lower the bar | S3, S4, S5 |
| `constraint` | Nagnajiti | Many constraints, zero compromise | S2, S3 |
| `authenticity` | Mitravinda | Truth against pressure | S0, S4 |
| `precision` | Lakshmana (queen) | One perfect shot | S2, S3 |
| `fit` | Bhadra | Solution already in ecosystem | S1, S3 |

**Note on resolved naming inconsistencies (Ram Deep runs, 2026-05-24):**

1. **`stb` axis removed.** Earlier drafts of [M_BUILD.md](M_BUILD.md) S5/S6 referenced an `stb` axis ("pride near zero") with no entry in VOCABULARY's canonical 8 (the Ashta-Mahishi anchor). The ego-dissolution insight is now carried structurally by the terminal equality `Q_shiva ≡ Q_shakti` at S6 — no axis can hold asymmetry when the self that creates asymmetry has dissolved.

2. **`kln` / `patience` duplicate resolved.** Both abbreviations pointed to Kalindi. Renamed `kln` → `patience` at S4 and S5; one canonical name per axis.

3. **`standard` orphan resolved.** Satyabhama's `standard` was declared canonical but never invoked. Added `standard ≥ 0.8` to S5 Sunset, where the anti-pattern (cruel deprecation) is precisely a mediocrity failure. Every canonical axis now has at least one gate.

**Residual drift, non-blocking:** M_BUILD still uses four short abbreviations (`mtv, bdr, ngj, lkq`) that map cleanly to canonical names (`authenticity, fit, constraint, precision`) but do not collide with anything. Tightening these to canonical long form is a future Kabir Gate cleanup, not load-bearing for the rubric.

---

## §4 — The rubric

Per axis: a 4-level anchor table (0.0, 0.3, 0.6, 0.9). Each level names a Shiva form (consciousness) and a Shakti form (energy), plus the evidence required to claim that level.

### `craft` — Rukmini — Strategic spec quality

| Level | Shiva (consciousness) | Shakti (energy) | Evidence required |
|---|---|---|---|
| 0.0 | No spec; building from gut | No artifact references any spec | — |
| 0.3 | Ticket with acceptance criteria | Skeleton files match ticket headings | ticket ID + file paths |
| 0.6 | CHARTER.md or DESIGN.md exists; names *why*, *audience*, *constraints* | Implementation matches spec; spec is updated when reality diverges | spec file path + last-modified delta vs. code |
| 0.9 | ADR-grade: tradeoffs, alternatives, rejected paths recorded | spec → tests → impl traceability is mechanical | ADR IDs + spec-to-test map |

### `endurance` — Jambavati — Multi-week perseverance

| Level | Shiva | Shakti | Evidence |
|---|---|---|---|
| 0.0 | No awareness of long-haul shape | No sustained work yet | — |
| 0.3 | Rough phase plan held in mind | 1–3 days of focused work landed | commit log |
| 0.6 | Roadmap with phases and reset points; setbacks expected | Multiple weeks of incremental progress at stable cadence | roadmap doc + commit cadence chart |
| 0.9 | Knows where energy will drop; has the recovery plan | Multi-month trajectory has survived a real setback | recovery commit after a documented setback |

### `standard` — Satyabhama — Refuses mediocrity

| Level | Shiva | Shakti | Evidence |
|---|---|---|---|
| 0.0 | "Good enough" undefined | Ships whatever compiles | — |
| 0.3 | Knows what mediocre looks like in this domain | Rejects 1–2 obvious shortcuts | review comments naming the shortcut |
| 0.6 | Bar and floor named explicitly | Returns work that clears the floor but not the bar | rejected diffs with named criteria |
| 0.9 | Distinguishes ship-quality from exemplar-quality per stage | Declines work below the bar under pressure; names the dilution | MID invocations preserved in writing |

### `patience` — Kalindi — Won't rush, won't lower the bar

| Level | Shiva | Shakti | Evidence |
|---|---|---|---|
| 0.0 | No awareness of pace pressure | Cuts corners when pressure rises | — |
| 0.3 | Notices when pace is degrading quality | Pauses when pressure spikes | session note / handover entry |
| 0.6 | Timeline and no-rush corners named explicitly | Defers past deadline rather than ship below floor | timeline preserved in TODO.md |
| 0.9 | Distinguishes legitimate urgency from manufactured urgency | Holds the bar across multiple pressure cycles | postmortem references to held quality |

### `constraint` — Nagnajiti — Many constraints, zero compromise

| Level | Shiva | Shakti | Evidence |
|---|---|---|---|
| 0.0 | Constraints unstated | Implementation violates constraints silently | — |
| 0.3 | 1–2 named constraints | Code passes those constraints | named constraint in CHARTER + matching test |
| 0.6 | Complete constraint list with *why each matters* | Each constraint mechanically enforced by tests | one test file per constraint |
| 0.9 | Distinguishes hard constraints from soft preferences; names what would loosen each | Hooks/guards prevent violation at system level | hook configuration + test of the hook |

### `authenticity` — Mitravinda — Truth against pressure

| Level | Shiva | Shakti | Evidence |
|---|---|---|---|
| 0.0 | Cannot distinguish own wish from another's | Builds what is expected, not what is right | — |
| 0.3 | Knows the wish belongs to someone; not sure who | Names the requester in the artifact | requester named in CHARTER |
| 0.6 | Knows whose wish this is and where the pressure comes from | Artifact records the pressure context honestly | CHARTER §1 (human's words verbatim) present |
| 0.9 | Holds the truth even when the room wants otherwise | Says no in writing, with reason, surviving the conversation | declined-PR comment or MID note |

### `precision` — Lakshmana (queen) — One perfect shot

| Level | Shiva | Shakti | Evidence |
|---|---|---|---|
| 0.0 | Success criteria fuzzy | Ships approximations | — |
| 0.3 | One-sentence acceptance criteria | Code matches that sentence | spec line + matching test |
| 0.6 | Numerically anchored success criteria | Tests assert the numbers | numeric assertion in test file |
| 0.9 | Distinguishes the perfect shot from the close miss | Ships only the perfect shot; rolls back close misses | rollback commit after a close miss |

### `fit` — Bhadra — Solution already in ecosystem

| Level | Shiva | Shakti | Evidence |
|---|---|---|---|
| 0.0 | Has not looked at what exists | Builds from scratch | — |
| 0.3 | Knows there are adjacent solutions | Prototype references one of them | import or citation of existing module |
| 0.6 | Enumerates 3+ adjacent solutions; can say why each does / does not fit | Chosen path explicitly builds on (or replaces) a named existing piece | ADR naming alternatives |
| 0.9 | Positions this work as an integration, not a greenfield | Final artifact ships alongside / on top of existing pieces without duplicating | dependency map + non-duplicate-of-X claim verified |

---

## §5 — The witness protocol

Scoring is not a private act. Three witnesses, three moments:

| Witness | When | What they look at |
|---|---|---|
| **Self** (the jiva, before starting work) | Session start | Last session's HANDOVER + the artifacts named there |
| **Role** (drishti-intensifier for the transition) | At any gate (T₀ … T₅) | The transition's Q-minima clause vs. current rubric scores |
| **Peer** (reviewer role) | At MR | The diff's evidence vs. the claim level recorded in the MR |

**Evidence-first rule:** A score above 0.0 requires the named evidence in the rubric's right column. If the evidence does not exist, the score is 0.0 regardless of conviction.

**Disagreement protocol:** If self-score and peer-score diverge by more than 0.3 on any axis, the lower score holds and `/triage` is invoked. Optimism is not a tiebreaker.

---

## §6 — Reading the trajectory

After scoring, compute:

```
δ = μ_shiva − μ_shakti
|δ|       — magnitude (how far from dharmic balance)
sign(δ)   — which side is heavy
```

Steering rule:

| Sign | Failure mode | Corrective pull |
|---|---|---|
| `δ > 0` (Shiva-heavy) | Cold witness — scanning without shipping | Toward Shakti: S2 Forge, S3 Build, `engineer` role |
| `δ < 0` (Shakti-heavy) | Chaotic ship — building without scanning | Toward Shiva: S1 Discovery, S4 Service, `architect` or `reviewer` role; run `/triage` |
| `δ ≈ 0` (`\|δ\| < 0.1`) | On the dharmic vector | Proceed to next transition gate |

A dharmic-aligned trajectory shows monotonic `|δ|` descent through S0 → S5, and reaches `|δ| = 0` at S6 by construction — terminal Q is defined identically on both axes ([M_BUILD.md:85](M_BUILD.md#L85)).

---

## §7 — How this couples with INTAKE_PROMPTS.md

At pre-T₀:

1. The `analyst` runs the first two tiers of [INTAKE_PROMPTS.md](INTAKE_PROMPTS.md) (Reception, Disambiguate).
2. Q_RUBRIC.md scores what the transcript so far supplies.
3. For each axis still below the T₀ Q-minima floor (`mtv ≥ 0.5`, i.e. `authenticity ≥ 0.5`), the analyst runs the matching Tier-3 prompt.
4. When all required axes saturate, `/intake` advances to the readiness check.

Without the rubric, the analyst cannot tell when to stop asking. Without the prompts, the rubric has nothing to score. The two are dual.

---

## §8 — Anti-patterns (Kabir Gate)

- **Self-scoring without artifacts** — theater. Mitigation: the evidence column is non-optional.
- **Optimizing the score, not the balance** — Goodhart. Mitigation: the rubric measures *capability*, never *productivity*; promotions/perf cannot use rubric scores directly.
- **Lowering the rubric to fit current capacity** — the failure MID exists to catch. Mitigation: if capacity is the gap, name capacity as the gap; do not edit the rubric to make it disappear.
- **Treating the rubric as definitive** — premature precision. Mitigation: rubric is recalibrated quarterly through the same Kabir Gate that governs roles.
- **Letting one axis's high score mask another's collapse** — `μ` arithmetic hides outliers. Mitigation: always read the full 8-vector before reading the mean.

---

## §9 — What this file does NOT do

- Does not elicit (`INTAKE_PROMPTS.md` does that).
- Does not enumerate transitions or guards (`M_BUILD.md` §4 does that).
- Does not define divine names (`VOCABULARY.md` does that).
- Does not enforce anything mechanically — the hooks do that. The rubric is read by a jiva (LLM + human) and scored honestly, or it is theater.
