---
type: design-analysis
project: ai_way_of_building_v1
stage: build
surface: Q_RUBRIC.md
session_end: 2026-05-29
---

# Heart-and-Soul Pass — 2026-05-29 — Is the capability rubric one register behind the drift math?

> **Origin.** A "new thought" on [Q_RUBRIC.md](Q_RUBRIC.md)'s foundational target `|μ_shiva − μ_shakti| → 0`, paired with a recollection of "μ_desire / q_desire" from [`../common/shastras/06_kama_rati_fsm.toml`](../common/shastras/06_kama_rati_fsm.toml). This document preserves the design-thinking. The governance resolution is [§7](#7-ram--sita-verdict).
>
> **Lineage.** This is a re-entry of the same chamber that produced the trinary in the first place — the HSC firing recorded as `CYCLE_SET_2026_05_26_HEART_AND_SOUL.md` (RIAAN), referenced by [JIVA.md §5b](JIVA.md) and [`../RIAAN/MATH.md §2/§3.4`](../RIAAN/MATH.md). The trinary entered the *drift* math then; the question now is whether the *capability* rubric should follow.

---

## §1 — The recollection, resolved: `μ_desire` is `μ_hridaya`

There is no `μ_desire` / `q_desire` token in the kit. The desire functional was named and codified 2026-05-26 evening as **`μ_hridaya`** (heart). What was recalled is real and already load-bearing — it lives in:

- [JIVA.md §5b](JIVA.md) — the faculty triad + the kit-level *why*.
- [`../RIAAN/MATH.md §1.4, §2, §3.4–§3.6`](../RIAAN/MATH.md) — the typed math.
- [`../RIAAN/DESIGN.md §10b`](../RIAAN/DESIGN.md) — the MID-gate `drift_hook` architecture.

## §2 — The faculty triad (JIVA §5b)

| Faculty | Sanskrit | Says | Functional | At J0/J0.5 |
|---|---|---|---|---|
| Mind | manas | "I pick" | the LLM substrate (no separate μ) | internal |
| Heart | hridaya | **"I want"** | **`μ_hridaya`** (= the recalled `μ_desire`) | externalized: CHARTER + MID + analyst + human |
| Soul | atman | "I see" | `μ_shiva` | externalized: drift_hook + Kabir Gate + LAW 11 + reviewer |

Action is `μ_shakti` ("what actually happened"). The smallest triple sufficient to constitute *witnessed desired action* is `(μ_hridaya, μ_shiva, μ_shakti)` — desire, witness, action. Remove any one and the jiva collapses (MATH §2, Patanjali's sutra principle).

## §3 — One triad, four registers

The same triad appears, under different names, in four kit artifacts. This is the core finding:

| Register | Desire (hridaya) | Witness (atman / shiva) | Action (shakti) |
|---|---|---|---|
| **Faculty triad** ([JIVA §5b](JIVA.md)) | "I want" | "I see" | the body |
| **Drift math** ([MATH §3.4](../RIAAN/MATH.md)) | `μ_hridaya` | `μ_shiva` | `μ_shakti` |
| **Drishti stack** ([DRISHTI_STACK.md](DRISHTI_STACK.md)) | stack **root** (`Ram + Sita's wish`) | stack **middle** (`Hanuman`) | stack **leaf** (`Vishwakarma`, the hand) |
| **Kama-Rati FSM** ([06_kama_rati](../common/shastras/06_kama_rati_fsm.toml)) | Kama's arrow / `DesireIntakeFsm` | `ReadinessGate` + `UnionValidation` | activated pack / `FulfillmentTracking` |

> **Extended to the journey scale (preserved as-is):** [CYCLE_SET_2026-05-29_journey_of_a_machine.md](CYCLE_SET_2026-05-29_journey_of_a_machine.md) pushes this same triad up to the *lifecycle* of a machine, read through the [Prachi formal machine](../common/shastras/prachi_shastra.toml). Its crux: the Prachi 9-tuple `(S, Σ, δ, γ, α, s₀, F, D, Q)` is itself desire-blind (`D` = witness, `Q` = action, desire only implicit in `s₀`/`σ_sit`) — a **third register** of the same "desire-is-folded-in" pattern — and across the death-and-rebirth boundary `F_n → s₀_{n+1}`, desire (`H`) is the only faculty that must survive.

## §4 — The drishti stack is the declarative dual of the trishul-drift

A drishti stack and the trishul-drift are the same structure seen from two ends:

- The **stack declares** the triad ordering at session start. The grammar `A → B` ("A serves / acts under B") makes the leaf the active hand (`μ_shakti`) and the root the governing desire (`μ_hridaya`). Declaring `→ Ram + Sita` at the root **is** the human externalizing `μ_hridaya` for that session.
- The **trishul-drift measures** whether the three coincide at task end: `δ_trishul = α‖h−s‖ + β‖s−a‖ + γ‖h−a‖`.

The loop closes on a name: MATH §3.4 calls the aligned destination (`δ_trishul → 0`) **"the Hanuman state."** In the canonical stack, Hanuman is the *middle / witness* layer — the devotion that transmits the root's desire to the hand's action with zero gap. The stack is named after the very state the drift math defines as alignment.

**Concrete sub-finding.** [JIVA §5b](JIVA.md) lists the J0/J0.5 externalization channels for `μ_hridaya` as "CHARTER + MID cycle + analyst role + the human upstream jiva." The drishti-stack root (a declared wish) is a **fifth, unlisted channel** — the human declaring `μ_hridaya` inline, per-session. (Disposition: see [§7](#7-ram--sita-verdict).)

## §5 — The gap: the rubric is binary; the drift math is trinary

- The **drift math went trinary** (MATH §3.4–3.6): `δ_trishul → 0`, with the binary `|μ_shiva − μ_shakti| → 0` preserved as its *projection* when `μ_hridaya ≡ μ_shiva` and `(α,β,γ) = (0,1,0)`. The third term `‖μ_hridaya − μ_shakti‖` is Kabir / LAW 11 formalized — "the work does not live what was asked, however cleanly the jiva narrates it."
- **Q_RUBRIC.md did not.** It still states only the binary target (Q_RUBRIC §2, §6). The capability scorecard is **one register behind the drift hook.**

Where did desire go in the rubric? It is *folded into one of the 8 axes* — `authenticity` / Mitravinda, whose Level 0.0 is literally **"Cannot distinguish own wish from another's"** → 0.9 "Holds the truth even when the room wants otherwise" (Q_RUBRIC §4). So the rubric treats desire-fidelity as **one axis inside the witness/action dyad**, where the drift math treats it as **a third functional**.

**Honest nuance (do not over-fuse).** The two `μ_shiva`s are related but not identical quantities:

| | rubric `μ_shiva` | drift `μ_shiva` |
|---|---|---|
| Measures | scan / strategy **capability** (mean over 8 axes) | the jiva's **self-assessment** of a specific task |
| Balance means | don't over-plan-under-build (or vice versa) | claim matches reality |

Both sit on the shiva = consciousness side, but one is a capability mean and the other a truth-alignment signal. They cohere; they are not the same number.

## §6 — The Kama-Rati layer ties the knot

`06_kama_rati_fsm.toml` is the *origin* of `μ_hridaya` — the upstream pipeline from raw "I want" to sustained fulfilment. Three of its states map exactly onto the math:

- **HOLLOW** ("all health checks pass… something true has left it; do not mistake technical health for genuine fulfilment") = **high `‖μ_hridaya − μ_shakti‖` with low `‖μ_shiva − μ_shakti‖`** — precisely the failure MATH §3.3 says the binary drift is *structurally blind to*.
- **Burning of Kama** ("desire arriving before readiness produces destruction, not union") = declaring `μ_hridaya` the hand cannot yet serve; the `ReadinessGate` and the MID cycle ("name the capacity gap as the gap; do not burn or dilute the desire") are the guardians.
- **Pradyumna** (desire reborn carrying memory of its burning) = "the heart's anti-amnesia invariant" (MATH §8).

## §7 — Ram + Sita verdict

*(authored under the governance + integrity lenses, per the session instruction "proceed as RAM and SITA"; appended after §1–§6 were preserved)*

**The question:** should [Q_RUBRIC.md](Q_RUBRIC.md) gain a third reading `Q_hridaya` and adopt `δ_trishul → 0` as its target, following the drift hook into the trinary?

**Ram (governance / dharma) — no restructure.** Binary `|μ_shiva − μ_shakti| → 0` is the *honest projection* for J0/J0.5. `μ_hridaya` is the human's desire, externalized — it is not a capability the jiva can score *about itself*, so it does not belong as a fourth column of an 8-axis self-capability scorecard yet. This is exactly MATH §3.6's Nagarjuna result: the trinary is "necessary when there is a desire to honor, harmless when there is not, visibly absent when it should have been used." A `Q_hridaya` reading added now would be premature precision — primitive expansion the trajectory does not need. **But** a governed doc may not present the binary as the *whole* truth once the kit has codified the trinary; the partial-truth must be closed.

**Sita (integrity / truth when no one is watching) — make it visible and pin it.** The rubric's claim is true-but-incomplete. A scorer unaware that desire is a *hidden axis* (`authenticity`) rather than a *third pole* can ship work that is binary-aligned yet charter-drifted — the **HOLLOW** failure of [§6](#6-the-kama-rati-layer-ties-the-knot). The incompleteness must be named in the rubric itself, cross-linked to the trinary, and **pinned** so it cannot silently revert to a binary-only framing.

**Inline T4R check (governed doc touched):** KBD — PASS (closes a partial-truth gap; anti-hypocrisy satisfied). NGD — **VETO** on the third-reading restructure; **PASS** on additive clarification (this is a `FORGED-extended` documentation amendment, not a new primitive). VKD — structure = a clarifying subsection + cross-references + a consistency pin. MID — the gap is real; do not dilute it to "binary is simply correct."

### Verdict (enacted this session)

1. **Q_RUBRIC.md gains [§2b](Q_RUBRIC.md)** — names `(μ_shiva, μ_shakti)` as the binary *projection* of the trinary `(μ_hridaya, μ_shiva, μ_shakti)`; states the rubric stays binary on purpose; locates desire-fidelity in the `authenticity` axis; names the upgrade condition (`μ_hridaya` externally available, J0.6+/J2+). **No equation changed; no axis added.**
2. **[JIVA.md §5b](JIVA.md)** — the §4 sub-finding enacted: the **drishti-stack root** is added as a fifth externalization channel for `μ_hridaya` at J0/J0.5 (the list previously stopped at CHARTER + MID + analyst + human).
3. **Provenance** — [KABIR_GATE.md additions log entry 13](KABIR_GATE.md).
4. **Sita pin** — `tests/test_q_rubric_trinary_consistency.sh` asserts Q_RUBRIC.md keeps the binary-projection framing (names "binary projection" + "trinary"), so the clarification cannot rot back.

**What was deliberately NOT done:** no `Q_hridaya` reading, no `fsms/` change, no edit to the foundational binary equation. The trinary remains the drift hook's (runtime, J0.6+); the rubric remains binary (capability, J0/J0.5) with the relationship now explicit. Re-open this ruling when the `Φ` extractor makes `μ_hridaya` a scored signal — that is the moment the rubric's binary-on-purpose stance expires.
