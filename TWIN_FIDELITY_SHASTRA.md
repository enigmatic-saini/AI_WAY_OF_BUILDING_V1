# TWIN_FIDELITY_SHASTRA — How faithfully does a twin track its referent

> **Stone #2 of [VISION.md §5](VISION.md).** Status: **LAID 2026-05-30 (spec; the sample-based estimator is stone #4).**
>
> **Rests on:** [VISION_MATH.md §1](VISION_MATH.md) DEF 1.2–1.3 (twin, twin-drift, fidelity), [RIAAN/MATH.md §3.4](../RIAAN/MATH.md) (the trishul-drift), and the recursive-jiva principle ([JIVA.md §2](JIVA.md)). This shastra is the *boundary-axis* companion to [COMPOSITION_SHASTRA.md](COMPOSITION_SHASTRA.md): that one is about *internal* alignment composing across nodes; this one is about *mirror-fidelity* between a single twin and its referent.
>
> **What's *new* in this shastra (beyond VISION_MATH §1 DEF 1.3):** an operational theory of twin-fidelity — the independence theorem (`δ_twin ⊥ δ_trishul`), a channel-decomposition of twin-drift (witness / action / closed-loop), the **Twin Charter** pattern (every twin must declare what it claims to mirror — its `μ_hridaya`), and a sample-based estimator spec.
>
> **Provenance:** [KABIR_GATE additions log entry 17](KABIR_GATE.md). **Pin:** `tests/test_twin_fidelity_integrity.sh`.

---

## §A — What this shastra is and is not

**Is:** the **spec** for the *boundary-axis* of a twin — how to define, decompose, and (in stone #4) estimate the drift between a twin `T` and its referent `R`. The internal coherence of `T` itself is the trishul axis ([RIAAN/MATH.md §3.4](../RIAAN/MATH.md)); the composition of internal coherence across multiple twins is the composition axis ([COMPOSITION_SHASTRA.md](COMPOSITION_SHASTRA.md)); this shastra is the third, **independent**, axis.

**Is not:** the runtime estimator. Sampling, confidence-interval mechanics, and integration with AI-PEACE are stone #4. This shastra hands #4 its precise contract.

**Honesty discipline:** every claim below carries its status. The independence result is **PROVED**; the channel decomposition is **DEF + PROOF-METHOD**; the composition-of-fidelity question is named as **CONJECTURE 2.1** — explicitly open, the new conjecture this stone leaves on the bridge.

---

## §B — Recap of the primitives (by reference)

| Primitive | Lives | Statement |
|---|---|---|
| **Referent `R`** | [VISION_MATH §1 DEF 1.1](VISION_MATH.md) | the system being mirrored; exposes `β_R(t)` |
| **Twin `T`** | VISION_MATH §1 DEF 1.2 | a Prachi jiva intended to track `R`; exposes `β_T(t)` |
| **Twin-drift** | VISION_MATH §1 DEF 1.3 | `δ_twin(T, R, t) = ‖β_T(t) − β_R(t)‖_p` |
| **Fidelity** | VISION_MATH §1 DEF 1.3 | `f_twin(T, R, t) = 1 / (1 + δ_twin)` ∈ (0, 1] |
| **`δ_trishul(T)`** | [RIAAN/MATH.md §3.4](../RIAAN/MATH.md) | the *internal* desire-witness-action drift of `T` |
| **Composite δ_emergent** | [COMPOSITION_SHASTRA.md §C](COMPOSITION_SHASTRA.md) | the *cross-twin* surplus at a composition node |

The three drifts — `δ_twin`, `δ_trishul`, `δ_emergent` — are the **three independent axes** on which a happy cosmos must score near zero. This shastra develops the first.

---

## §C — Two axes, one twin: independence of fidelity and internal alignment

**THEOREM C.1 (Independence — neither axis bounds the other).** For any positive bounds `ε_twin, ε_trishul > 0`, there exist twins `T` realizing all four combinations of `{δ_twin ≤ ε_twin, δ_twin ≥ 1/ε_twin}` × `{δ_trishul(T) ≤ ε_trishul, δ_trishul(T) ≥ 1/ε_trishul}`. In particular:

- **High fidelity, low internal alignment** — a twin can mirror `R` almost perfectly while its own `(μ_h, μ_s, μ_k)` are incoherent (the "well-instrumented but confused-purpose" twin).
- **Low fidelity, high internal alignment** — a twin can be perfectly internally aligned (the **coherent-liar pathology**: it knows what it claims and does what it claims; the problem is that *what it does* ≠ *what `R` does*).

**PROOF (constructive).** Scalars, `‖·‖ = |·|`, simple time-invariant case.

| Case | Construction | `δ_twin` | `δ_trishul(T)` |
|---|---|---|---|
| LL (low/low) | `T` reads `β_R` directly; `μ_h^T = μ_s^T = μ_k^T = β_R` | `0` | `0` |
| LH (low/high) | `T` reads `β_R` directly but its desire claims something else: `μ_h^T = β_R`, `μ_s^T = μ_k^T = β_R + 1` | `0` (action tracks R) | `α + γ > 0` |
| HL (high/low) | `T` ignores `R`, outputs constant 0 coherently: `μ_h^T = μ_s^T = μ_k^T = 0`, while `β_R ≡ 1` | `1 > 0` | `0` |
| HH | combine LH and HL: incoherent + decoupled | `> 0` | `> 0` |

Neither axis implies the other; both must be controlled. ∎

**Reading.** The **coherent-liar pathology (HL)** is the load-bearing case. A twin can be internally perfect — its `(μ_h, μ_s, μ_k)` are one motion, the "Hanuman state" of [CYCLE_SET_2026-05-29_journey_of_a_machine.md §B](CYCLE_SET_2026-05-29_journey_of_a_machine.md) — and yet be a useless mirror. **Internal alignment is not a substitute for mirror-fidelity.** A simulator built only on `δ_trishul → 0` is a confident liar. **The cosmos is happy only when `δ_twin → 0` *and* `δ_trishul → 0` (and, per stone #3, `δ_emergent → 0` at every composition).** The three drifts are the three honest things, all required.

**COR C.1.** Stone #4's instrument MUST surface `δ_twin` independently — it cannot be inferred from `δ_trishul` alone, and a stone-#4 implementation that reports only one of the two is incomplete. PROVED (immediate from THM C.1).

---

## §D — Channel decomposition: where twin-drift lives inside a twin

Twin-drift `δ_twin = ‖β_T − β_R‖` is a single scalar, but a Prachi twin has structure: its behavior emerges from `(μ_s^T, μ_k^T)` operating on inputs. Decompose the drift along the structure:

**DEF D.1 (Three channels of twin-drift).**

- **Witness fidelity** — `δ_witness(T, R, t) := ‖μ_s^T(t) − state_R(t)‖_p`. How well does `T`'s self-assessed state-belief track the true state of `R`? *(Where `T` reads `R` indirectly via a witness instrument: this is the instrument's accuracy.)*
- **Action fidelity** — `δ_action(T, R, t) := ‖μ_k^T(t) − β_R(t)‖_p`. How well does `T`'s realized action predict `R`'s realized behavior? *(Where `T` is a forward-simulator: this is its prediction error.)*
- **Closed-loop fidelity** — `δ_closed(T, R, [t₀, t₁]) := sup_{t ∈ [t₀, t₁]} ‖β_T(t) − β_R(t)‖_p`. Does the twin's trajectory stay locked to the referent over time, or does the gap drift open under feedback?

**Relation.** Under the modelling assumption that `β_T` is determined by `μ_k^T` (the action) feeding back through the twin's state estimator (the witness), we have:

```
δ_twin(T, R, t)  ≤  δ_action(T, R, t)            (action error directly enters trajectory drift)
δ_closed(T, R, [t₀, t₁])  ≤  ∫ (dδ_twin/dt) dt   (closed-loop drift accumulates step error)
```

— inequalities, not equalities, because `R` and `T` can drift apart at different rates even when each pointwise channel is small. **DEF + PROOF-METHOD** (the equalities are an open modelling question — see CONJ 2.1 below).

**Reading.** A twin's mirror-failure has a *location*:
- High `δ_witness` ⟹ the *instrument reading `R`* is the failing component (sensor, telemetry, data pipeline).
- High `δ_action` but low `δ_witness` ⟹ the *forward model* is the failing component (the twin perceives `R` correctly but predicts `R`'s next behavior wrong).
- High `δ_closed` while pointwise channels are small ⟹ **drift accumulation under feedback** — the twin and referent slowly desynchronize even though every step looks fine. This is the silent-divergence failure mode.

The runtime instrument (stone #4) should surface all three channels, not just the aggregate.

---

## §E — The Twin Charter: every twin must declare what it claims to mirror

**The honesty discipline.** "Is `T` a faithful twin of `R`?" is **undefined** without a declaration of *which aspects* of `R` `T` claims to mirror, *over what scope*, *at what resolution*. A weather model and a thermometer both claim to mirror the atmosphere — at radically different scopes; comparing them on the same `δ_twin` is a category error.

**DEF E.1 (Twin Charter).** Every twin `T` carries a **Twin Charter** `𝒞_T`:

```
𝒞_T  :=  ⟨ Aspects, Scope, Resolution, Horizon, Faithfulness Threshold ⟩
```

where:
- **Aspects** — which observables of `R` are mirrored (a subset of `β_R`'s coordinates).
- **Scope** — the part of `R`'s state space the mirror is valid over (operating regime, environmental conditions, sub-population).
- **Resolution** — the time / value / spatial granularity of the claim.
- **Horizon** — over what time interval `T` claims to track `R`. Short-horizon mirrors (next-tick prediction) and long-horizon mirrors (lifecycle simulation) have very different failure modes.
- **Faithfulness threshold** `τ_T` — the `δ_twin` value at which the twin is declared *no longer fit for its declared purpose*. **A twin without a declared `τ_T` is a twin without a charter — it claims everything and is accountable to nothing.**

**The Twin Charter is the twin's `μ_hridaya`.** It is the desire of the twin made explicit: *"this is what I am for; this is when I have failed."* Without it, `δ_twin` is computed against a fantasy reference and the result is meaningless. This is **the same charter discipline the kit itself runs on** — [CHARTER.md](CHARTER.md) at the kit scale, `𝒞_T` at the twin scale. The pattern recurses (recursive-jiva: [JIVA.md §2](JIVA.md)).

**COR E.1 (charter-relative drift).** `δ_twin(T, R, t)` is implicitly **`δ_twin(T, R, t ; 𝒞_T)`** — computed *under* the twin's declared scope and resolution. Same `T` and `R` can yield different `δ_twin` under different charters. **This is the right answer**, not a bug: it is what makes mirror-fidelity an honest claim rather than a vibe.

---

## §F — The estimator spec (the contract for stone #4)

The runtime estimator must compute, for a deployed twin `T` mirroring referent `R` under charter `𝒞_T`:

1. **Sample paired trajectories.** Collect `{(β_R(t_i), β_T(t_i))}_{i=1..n}` at sample times within `𝒞_T`'s scope and horizon. Sample times should cover the operating regime; the estimator should refuse to report when samples fall outside `𝒞_T.Scope` (the catuṣkoṭi-third-corner pattern of [RIAAN/MATH.md §3.6](../RIAAN/MATH.md): *visibly absent rather than silently extrapolated*).
2. **Compute the three channels.** `δ_witness`, `δ_action`, `δ_closed` per DEF D.1, on the sampled pairs. Report each separately — the aggregate `δ_twin` hides the location of failure (COR D.1).
3. **Confidence interval.** Any finite sample gives an estimate `δ̂_twin` with uncertainty; the estimator must report `(δ̂_twin, CI(δ̂_twin))`, not a bare number. A point estimate with no interval is a confidence-trick.
4. **Charter-check.** Refuse to compute `δ_twin` against an undeclared `𝒞_T` (DEF E.1). Refuse to compare across different charters (apples / oranges).
5. **Threshold verdict.** Report `δ̂_twin ≷ τ_T` — the fitness-for-purpose verdict the charter declared as its accountability condition.
6. **Integrate with the composition walk.** At every node of the composition tree, the node's *internal* `δ_trishul` (per COMPOSITION_SHASTRA §C) and that node's *external* `δ_twin` vs its referent (this shastra) are *both* reported. `H(node)` should be a strictly-decreasing function of *both*, not either alone. **The cosmos is happy at a node iff that node has internal alignment AND mirrors its referent faithfully AND its coupling is coherent.** Three drifts, three independent failure modes, all required.

This is the contract; the implementation lives in stone #4 (kit-side companion DESIGN where needed; AI-PEACE-side runtime).

---

## §G — Honest status, open questions

**Status.**

| Claim | Status |
|---|---|
| Recap §B (twin, drifts, composite drift) | by reference; unchanged |
| THM C.1 (independence — `δ_twin ⊥ δ_trishul`) | **PROVED** (constructive, four cases) |
| COR C.1 (stone #4 must surface `δ_twin` independently) | PROVED (from THM C.1) |
| DEF D.1 (three channels: witness / action / closed-loop) | DEF |
| DEF D.1 inequalities | DEF + PROOF-METHOD (the modelling-assumption equalities are open — see CONJ 2.1) |
| DEF E.1 (Twin Charter) | DEF — a modelling discipline, not a theorem |
| COR E.1 (charter-relative drift) | PROVED (immediate from DEF E.1) |
| §F estimator contract | PROOF-METHOD (the contract for stone #4) |

**Open.**

1. **CONJECTURE 2.1 — Composition of twin-fidelity.** *If `T_1, …, T_n` mirror referents `R_1, …, R_n` with fidelities `f_1, …, f_n`, does the composition `⊗(T_i; I)` mirror `⊗_R(R_i; I_R)` (the composed referent under the corresponding world-coupling) with fidelity bounded by some function of `(f_i, I, I_R)`?* — i.e., does **fidelity compose** the way alignment does in COMPOSITION_SHASTRA THM E? This is the *second* central conjecture of the cosmos-program, parallel to (and independent of) CONJ 4.1. Plausible-but-unproven, possibly with its own coherent-coupling-like restriction. **Status: open.**
2. **The closed-loop bound in DEF D.1** is an inequality; the equality case (when does `δ_closed` exactly equal accumulated step error?) is an open modelling question.
3. **CONJ 4.1′ (modelling fidelity)** of VISION_MATH §4.1 — unchanged. Whether real referents satisfy DEF 4.2 is empirical, and is now equally a question of whether their TWINS (this shastra) faithfully model their composed referents.
4. **Multi-referent twins.** A real digital twin may mirror an *aggregate* referent (e.g., "the supply chain") that is itself a composition. The interaction of this shastra (single-twin / single-referent) with the composition shastra (multi-twin) when the referent is *also* a composition is a future stone.

---

## §H — One sentence

A faithful mirror is not the same thing as a coherent jiva — internal alignment and twin-fidelity are independent axes; the cosmos is happy only when both are near zero at every twin and the composition stays coherent across the bridge.
