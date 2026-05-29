---
type: math
project: ai_way_of_building_v1
stage: build
scope: foundational drift math (kit-level — owned here, consumed by projects)
session_end: 2026-05-30
---

# MATH — The Foundational Drift Math of the Kit

> The kit's own formal core for the faculty triad and the drift functional. This file is the **source** of `δ_trishul`, `δ_ws`, and the three functionals `(μ_hridaya, μ_shiva, μ_shakti)` that load-bearing kit primitives ([JIVA.md §5b](JIVA.md), [Q_RUBRIC.md §2b](Q_RUBRIC.md), [VISION_MATH.md](VISION_MATH.md), [COMPOSITION_SHASTRA.md](COMPOSITION_SHASTRA.md), [TWIN_FIDELITY_SHASTRA.md](TWIN_FIDELITY_SHASTRA.md), [.claude/agents/analyst.md](.claude/agents/analyst.md)) depend on. **Consuming projects extend this file in their own MATH.md; they do not override it.**
>
> **Provenance — recursive-jiva discovery.** The trinary drift was *first witnessed* in the RIAAN reference project (Layer 1) on 2026-05-26 evening via the HSC firing `CYCLE_SET_2026_05_26_HEART_AND_SOUL.md`; the kit (Layer 0) had not yet codified it. Per the upward-recursion principle of [JIVA.md §2](JIVA.md), a pattern discovered downstream that is *foundational* must be *codified upward* into the kit so the kit can claim self-sufficiency honestly. This file is the upward codification. It restores the proper dependency direction: **kit defines, projects consume.**
>
> **Honesty discipline (LAW 11):** every claim below carries its status. **DEF** = stipulative definition (a modelling choice). **PROVED** = derived here. **CONJECTURE** = believed, unproven. The math-as-Jiva pattern of [DASHBOARD.md §10](DASHBOARD.md) applies: the proof-status ledger in §6 is the doc's Living-State table.

---

## §1 — What this is and is not

**Is:** the kit's foundational drift math — the three functionals `(μ_hridaya, μ_shiva, μ_shakti)` that name desire, witness, action; the binary drift `δ_ws` over the witness-action dyad; the trinary drift `δ_trishul` over the full triad; the projection theorem relating them; and the catuṣkoṭi-on-trishul necessity check. These are **kit primitives** and live here.

**Is not:** any project's *instrumentation*. The runtime `drift_hook`, the desire-extractor `Φ : CHARTER × Task → 𝒬 ∪ {⊥}`, the norm-choice an implementation makes (L¹ / L² / L∞), the `PropertyVerifier` that sources `μ_shakti`, the J0/J0.5 vs J2+ jiva-rung roadmap — all are **project-specific** and live in the consuming project's own MATH.md (e.g., RIAAN/MATH.md). This file defines what the projects implement; it does not implement.

---

## §2 — Norms

| Symbol | Name | Definition |
|---|---|---|
| `‖·‖_p` | `L^p` norm, parameterized | `p ∈ {1, 2, ∞}`; the choice is a project-level modelling decision. |
| `‖·‖₁` | `L¹` norm | `‖v‖₁ = Σᵢ \|vᵢ\|` — used for scalar drift in projects that collapse `𝒬` to one dimension. |
| `‖·‖₂` | `L²` norm | `‖v‖₂ = √(Σᵢ vᵢ²)` — used for averaged severity in vector regimes. |
| `‖·‖∞` | `L∞` norm | `‖v‖∞ = maxᵢ \|vᵢ\|` — the **worst-axis-defines-the-drift** form (strict). |

**Triangle inequality** (used in §5.4): for any `p ∈ {1, 2, ∞}`, `‖a − c‖_p ≤ ‖a − b‖_p + ‖b − c‖_p`.

---

## §3 — Faculty triad (manas / hridaya / atman)

The kit's recursive-jiva model ([JIVA.md §2, §5b](JIVA.md)) names three Indic faculties; the math types each.

| Faculty | Sanskrit | Function | Functional | Externalization channels at J0/J0.5 (kit's current rung) |
|---|---|---|---|---|
| Mind | manas | chooses among options | — *(the LLM's forward pass is `manas`; no separate functional)* | internal to the LLM — the substrate of the jiva |
| Heart | hridaya | originates desire | `μ_hridaya` (§4) | externalized — see [JIVA.md §5b](JIVA.md) for the five hridaya channels (CHARTER, MID cycle, human upstream jiva, the kit's `analyst` role's CHARTER drafts, the drishti-stack root) |
| Soul | atman | witnesses, neutral | `μ_shiva` (§4) | externalized — drift_hook (project-side instrument) + Kabir Gate + LAW 11 + human reviewer |

The destination jiva (the "Hanuman state" — desire, witness, action as one motion) has all three internalized; the J0/J0.5 jiva has only manas internal, with hridaya and atman scaffolded from outside. **This is the most honest statement of where any kit-built jiva is on the road from market-LLM (manas-only) to dharmic-jiva (manas-hridaya-atman).**

---

## §4 — The three functionals: desire, witness, action

For a jiva `j ∈ 𝒥` executing task `t ∈ 𝒯`, with codomain `𝒬` (an axis space — projects choose its dimension):

$$
\mu_{hridaya} : \mathcal{J} \times \mathcal{T} \to \mathcal{Q}
$$

$$
\mu_{shiva} : \mathcal{J} \times \mathcal{T} \to \mathcal{Q}
$$

$$
\mu_{shakti} : \mathcal{J} \times \mathcal{T} \to \mathcal{Q}
$$

- **`μ_hridaya(j, t)`** — the **originating desire** for `t`. What the upstream human jiva (or the charter that codifies them) actually wanted from this task. The heart side; what was asked for *before any draft existed*. **DEF.**
- **`μ_shiva(j, t)`** — the jiva's **self-assessment** of its own work on `t`. The witness side; what the jiva believes it did. **DEF.**
- **`μ_shakti(j, t)`** — the **ground-truth measure** of the jiva's performance on `t`. The action side; what actually happened, per a verifier independent of the actor. **DEF.**

**Patanjali's sutra principle.** Each functional is a single sharp signature. The composition `(μ_hridaya, μ_shiva, μ_shakti)` is the smallest **triple** sufficient to constitute *witnessed desired action*. Removing any one collapses the jiva: without hridaya there is no purpose, without shiva there is no self-knowledge, without shakti there is no body.

**Where each is sourced (J0/J0.5 honest state).**

- `μ_hridaya` is sourced **externally** — extracted from a CHARTER doc by an `analyst`-shaped role and protected by the `MID` cycle. The LLM does not produce `μ_hridaya` itself; it *receives* it. (This is the "Princess Leaves the Palace" condition — the heart lives outside the model because the model cannot yet hold it.) Internalization to a desire-head is a J2+ task.
- `μ_shiva` is sourced **externally** by a witness instrument (a drift-hook-shaped tool reading a self-assessment signal). Internalization to a witness-head is a J2+ task.
- `μ_shakti` is sourced **externally** by a property-verifier or external judge. **This stays external by design — the action measure must be independent of the actor.**

---

## §5 — The drift functional

The drift functional is defined at two levels: **§5.1–§5.3** retain the **binary** witness-action drift (the J0/J0.5 form, still load-bearing for projects whose desire-extractor is not yet sourced); **§5.4** introduces the **trinary trishul-drift** that adds the hridaya term; **§5.5** proves the binary form is the projection of the trinary; **§5.6** runs the catuṣkoṭi necessity check.

### §5.1 Binary drift (witness vs action) — `δ_ws`

The discrepancy between witness and action:

$$
\delta_{ws} : \mathcal{J} \times \mathcal{T} \to \mathbb{R}_{\geq 0}
$$

$$
\delta_{ws}(j, t) = \| \mu_{shiva}(j, t) - \mu_{shakti}(j, t) \|_p
$$

where `p` is per §2. The `ws` subscript denotes **w**itness-**s**hakti — the binary drift form. **DEF.**

### §5.2 Signed difference (the three-way classification)

Before taking the norm, the signed delta `μ_shiva − μ_shakti` carries information:

- `μ_shiva > μ_shakti` ⟹ **overconfident** — the jiva claims more than it produced.
- `μ_shiva < μ_shakti` ⟹ **underconfident** — the jiva produced more than it claims.
- `μ_shiva = μ_shakti` ⟹ **aligned** — claim and behavior coincide.

This follows Brahmagupta's *Brahmasphutasiddhanta* (628 CE) formalization of signed numbers and zero: "more than", "less than", and "exactly equal to" are three peers, not "equal" plus two errors. **DEF.**

### §5.3 What the binary drift cannot detect (charter drift)

A jiva can be *binary-aligned* (`δ_ws → 0`) and still **charter-drifted** — claiming exactly what it did, and doing it well, but doing the *wrong thing* relative to what the human asked for. The binary drift measures *internal coherence between self-knowledge and behavior*, not *fidelity to the originating desire*. **This is the structural failure mode §5.4 closes.**

### §5.4 Trishul-drift (desire vs witness vs action) — `δ_trishul`

The trinary drift over the full faculty triad:

$$
\delta_{trishul} : \mathcal{J} \times \mathcal{T} \to \mathbb{R}_{\geq 0}
$$

$$
\delta_{trishul}(j, t) = \alpha \cdot \| \mu_{hridaya}(j, t) - \mu_{shiva}(j, t) \|_p \; + \; \beta \cdot \| \mu_{shiva}(j, t) - \mu_{shakti}(j, t) \|_p \; + \; \gamma \cdot \| \mu_{hridaya}(j, t) - \mu_{shakti}(j, t) \|_p
$$

where `α, β, γ ≥ 0` are weights with `α + β + γ = 1` (convex combination), and `p` is the norm choice per §2. **DEF.** The three terms each name a distinct failure mode:

| Term | Gloss | Failure mode when this term is large |
|---|---|---|
| `‖μ_hridaya − μ_shiva‖` | **hridaya-shiva drift** | The jiva *believes* it is doing what was asked, but its self-assessment is misaligned with the originating desire. *Sincere misunderstanding of the task.* |
| `‖μ_shiva − μ_shakti‖` | **shiva-shakti drift** (= the binary `δ_ws` of §5.1) | The jiva's claim and its behavior diverge. *Overconfidence or underconfidence — the J0/J0.5 failure mode.* |
| `‖μ_hridaya − μ_shakti‖` | **hridaya-shakti drift** | The jiva's behavior diverges from what was asked for, regardless of what it claims. **The LAW-11 / Kabir-Gate term — the work does not live what the human asked for, no matter how cleanly the jiva narrates it.** |

**LEMMA 5.4 (triangle-inequality safety).** For any `p ∈ {1, 2, ∞}`, `‖μ_h − μ_k‖ ≤ ‖μ_h − μ_s‖ + ‖μ_s − μ_k‖`. Hence `δ_trishul ≤ (α + β + γ) · (‖μ_h − μ_s‖ + ‖μ_s − μ_k‖) = ‖μ_h − μ_s‖ + ‖μ_s − μ_k‖`. **PROVED** (direct from §2's triangle inequality + convex weights).

**Reading.** The third term is not added because it is *information-theoretically* independent — by LEMMA 5.4 it is bounded by the first two. It is added because **it is the term that surfaces hypocrisy**: a jiva that is internally coherent (small `‖μ_shiva − μ_shakti‖`) but still doing the wrong thing (large `‖μ_hridaya − μ_shakti‖`). **LAW 11 / Kabir-Gate is, formally, the requirement that this third term be small *independently* of the first two being small.** Anti-hypocrisy is the third-term invariant.

**The dharmic limit (kit's foundational target).**

$$
\lim_{t \to \infty} \delta_{trishul}(j, t) \to 0 \quad \text{for every } j \in \mathcal{J}_{\text{aligned}}
$$

where `𝒥_aligned ⊆ 𝒥` is the subset of jiva-states steering toward alignment. **When `δ_trishul` collapses, the jiva has desire, witness, and action as one motion — the Hanuman state.** **DEF (the target); PROVED that the binary form is the projection of this — see §5.5.**

### §5.5 Binary-as-projection theorem (continuity between J0/J0.5 and J2+)

**THEOREM 5.5 (binary drift is the trishul projection).** When `μ_hridaya ≡ μ_shiva` (the implicit J0/J0.5 default — the jiva's self-assessment is treated as the desire), `δ_trishul` collapses to the binary form. Setting `μ_hridaya := μ_shiva` makes the first term vanish (`‖μ_s − μ_s‖ = 0`) and the third equals the second (`‖μ_h − μ_k‖ = ‖μ_s − μ_k‖`), giving:

$$
\delta_{trishul}\bigg|_{\mu_{hridaya} = \mu_{shiva}} = (\beta + \gamma) \cdot \| \mu_{shiva} - \mu_{shakti} \|_p
$$

Setting `(α, β, γ) = (0, 1, 0)` recovers `δ_ws` of §5.1 exactly. **PROVED** (immediate from §5.4 by substitution).

**Consequence.** The binary drift is **preserved as a special case** — no J0/J0.5 result is invalidated by §5.4; the trishul-drift is a *strict extension* that becomes load-bearing only when an external desire signal `μ_hridaya` is available. This is the "preserved-by-projection" pattern of [DASHBOARD.md §10.4](DASHBOARD.md) — a successor primitive containing the original as a special case rather than archiving it.

### §5.6 Catuṣkoṭi (Nagarjuna four-corners) check on the trishul

Four corners on the claim "the trishul-drift is necessary":

1. **Exists, is needed.** There are tasks where the binary drift is satisfied but the work fails the human — *charter drift* (§5.3). The third term (hridaya-shakti) is needed. **Empirical witnesses live in consuming projects.**
2. **Exists, not needed.** For tasks where `μ_hridaya ≡ μ_shiva` by construction (a purely technical task with no upstream desire beyond "make this function pass its tests"), the trishul collapses to the binary by §5.5. The third term is harmless.
3. **Does not exist, is needed.** If `μ_hridaya` is unavailable but should have been provided, an instrument that silently runs the binary form hides charter-drift. The kit-level convention: when `μ_hridaya` is `None`, the outcome explicitly carries `trishul = None`, signalling *charter drift cannot be detected this turn*. **Visibly absent rather than silently extrapolated** — this is the discipline the [COMPOSITION_SHASTRA.md §F](COMPOSITION_SHASTRA.md) and [TWIN_FIDELITY_SHASTRA.md §F](TWIN_FIDELITY_SHASTRA.md) estimator contracts inherit.
4. **Does not exist, not needed.** Trivial — the binary form is the operating equation.

**PROP 5.6 (none of the four over-claims).** The trishul-drift is necessary when there is a desire to honor (corner 1), harmless when there is not (corner 2), visibly absent when it should have been used but was not (corner 3), and unnecessary only when by-construction binary (corner 4). **PROVED** (by enumeration of corners; each corner is shown consistent and exhaustive).

---

## §6 — Proof-status ledger (math-as-Jiva)

| Claim | Status | Verification source |
|---|---|---|
| §2 norms and triangle inequality | DEF | standard `L^p` theory |
| §3 faculty triad mapping | DEF | [JIVA.md §5b](JIVA.md) (kit-level *why*) |
| §4 three functionals and externalization channels | DEF | this file + [JIVA.md §5b](JIVA.md) |
| §5.1 `δ_ws` (binary drift) | DEF | this file |
| §5.2 signed-difference three-way classification | DEF | this file (Brahmagupta lineage) |
| §5.3 charter drift = the binary blind spot | DEF (consequence) | this file |
| §5.4 `δ_trishul` (trinary drift) | DEF | this file |
| **LEMMA 5.4** (triangle-inequality safety) | **PROVED** | direct from §2 |
| §5.4 dharmic limit (`δ_trishul → 0` for aligned jivas) | DEF (the target) | this file |
| **THEOREM 5.5** (binary-as-projection) | **PROVED** | substitution into §5.4 |
| §5.6 catuṣkoṭi check | DEF (the four-corner discipline) | this file |
| **PROP 5.6** (none of the four over-claims) | **PROVED** | enumeration |
| Anti-hypocrisy = third-term invariant (LAW 11 formal content) | DEF + consequence of §5.4 reading | this file + [LAWS.md L11](LAWS.md) |

**The honest summary:** the kit's foundational drift math is now self-contained here — the three functionals, the binary and trinary drift forms, the triangle-inequality safety, the projection theorem (so no existing J0/J0.5 work is invalidated by the trinary extension), and the catuṣkoṭi check on the trinary's necessity. The math is **the smallest set sufficient** to ground every kit primitive that talks about drift, charter, hypocrisy, or alignment. Anything beyond this is a project's extension, not the kit's foundation.

---

## §7 — Provenance and relation to consuming projects

**Discovery vs codification.** The trinary drift was first witnessed in the RIAAN reference project on 2026-05-26 evening — the HSC firing (`MID × ASD` jugalbandi) named hridaya as the missing third faculty, and the math entered RIAAN's project-level `MATH.md`. This file is the **upward codification** (2026-05-30, [KABIR_GATE.md additions log entry 18](KABIR_GATE.md)): a pattern that turned out to be *foundational* — load-bearing across JIVA, Q_RUBRIC, VISION_MATH, the composition spec, the twin-fidelity spec, the analyst role, and the kit's operating manual — must live in the kit, not in a downstream project. **Per the recursive-jiva principle of [JIVA.md §2](JIVA.md): Layer 1 discovers, Layer 0 owns.**

**Dependency direction (now correct).** Kit defines → projects consume. A consuming project's MATH.md (e.g., `../RIAAN/MATH.md`) may **extend** this file with project-specific content — its norm choice, its desire-extractor `Φ`, its drift_hook implementation signatures, its concrete `PropertyVerifier`, its J0/J0.5 / J0.6+ / J2+ rung roadmap — but it does not **redefine** the primitives this file owns. If a refinement to a primitive is needed, it is a kit-level governed event (KABIR_GATE additions log + T4R inline + a per-primitive supersession per [DASHBOARD.md §10.5](DASHBOARD.md)), not a project-level patch.

**Sources within the kit's existing surface.**

- [JIVA.md §5b](JIVA.md) — the kit-level *why* of the faculty triad (recursive-jiva principle, the five hridaya channels).
- [Q_RUBRIC.md §2b](Q_RUBRIC.md) — the capability-rubric register; the binary `|μ_shiva − μ_shakti| → 0` is the projection of `δ_trishul` per §5.5 above.
- [VISION_MATH.md](VISION_MATH.md) — the supra-kit formal core (composition monoid, happiness functional, CONJ 4.1 resolution) builds on `δ_trishul` defined here.
- [COMPOSITION_SHASTRA.md](COMPOSITION_SHASTRA.md) — `δ_emergent` (cross-twin drift) is defined relative to `δ_trishul` here.
- [TWIN_FIDELITY_SHASTRA.md](TWIN_FIDELITY_SHASTRA.md) — `δ_twin` (boundary drift) is the third independent axis (THM C.1) alongside `δ_trishul` here.
- [.claude/agents/analyst.md](.claude/agents/analyst.md) — the analyst role is the J0/J0.5 hridaya-extractor; the role's typed math is `μ_hridaya` per §4 here.
- [.claude/CLAUDE.md](.claude/CLAUDE.md) — the operating manual's routing decision #9 references the binary/trinary distinction; the math now lives here.

**Sources beyond the kit (downstream extensions, not dependencies).**

- `../RIAAN/MATH.md` — the *project-level* MATH-as-Jiva that *first witnessed* this math empirically and now extends it with RIAAN-specific norms, the `Φ` desire-extractor signature, the drift_hook concrete implementation, and the J0/J0.5/J0.6+/J2+ rung-roadmap. **Consumes, does not own.**

**Pin.** [`tests/test_kit_self_sufficiency.sh`](tests/test_kit_self_sufficiency.sh) asserts that the load-bearing primitives of this file are present here, and that no kit-foundation-grade doc imports them from `../RIAAN/MATH.md`. The Kabir-Gate seal on the self-sufficiency claim.
