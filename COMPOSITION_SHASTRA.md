# COMPOSITION_SHASTRA — How twins compose into larger twins (and what to do when alignment doesn't)

> **Stone #3 of [VISION.md §5](VISION.md).** Status: **LAID 2026-05-29 (spec; the runtime instrument is stone #4).**
>
> **Rests on:** [VISION_MATH.md §2 + §4.1](VISION_MATH.md) (composition monoid + the CONJ 4.1 resolution), the Prachi guardian-composition ([prachi_shastra §6,§8,§10](../common/shastras/prachi_shastra.toml)), and the trishul-drift ([MATH.md §5.4](MATH.md) — the kit's own source).
>
> **What's *new* in this shastra (beyond what VISION_MATH §4.1 already proved):** an operational theory of **emergent drift** — how to *detect, decompose, localize, and remediate* the alignment failure that a composition introduces beyond its parts. The math is already in §4.1; this is what to *do* with it.
>
> **Provenance:** [KABIR_GATE additions log entry 16](KABIR_GATE.md). **Pin:** `tests/test_composition_shastra_integrity.sh`.

---

## §A — What this shastra is and is not

**Is:** the **spec** for how a recursive composition of twins is reasoned about — the operational counterpart of VISION_MATH §4.1. It defines `emergent drift`, gives a tree-walk that localizes the least-aligned coupling, decomposes drift by which coherence condition failed, and names the remediation principle.

**Is not:** an *implementation*. The runtime instrument that computes these quantities on a real referent (AI-PEACE's Happiness Index wired to per-level `δ_trishul`) is **stone #4** of VISION.md §5. This shastra hands #4 its precise contract; #4 implements it.

**Honesty discipline:** every claim below carries its status. Most are **PROVED given [DEF 4.2 of VISION_MATH.md](VISION_MATH.md)** — *not* proved absolutely. **CONJ 4.1′** (modelling fidelity — does real composition obey DEF 4.2?) is **unchanged** and remains the residual frontier.

---

## §B — Recap of the composition primitives (by reference)

The base objects are already defined and will not be re-derived here:

| Primitive | Lives | Statement |
|---|---|---|
| **Twin** | [VISION_MATH §1](VISION_MATH.md) | a Prachi jiva mirroring a referent `R` |
| **`δ_trishul`** | [MATH.md §5.4](MATH.md) | `α·‖μ_h−μ_s‖ + β·‖μ_s−μ_k‖ + γ·‖μ_h−μ_k‖` |
| **`⊗(T_i; I)`** | [VISION_MATH §2](VISION_MATH.md) | composition operator (Prachi guardian-monoid lifted to twins) |
| **Cosmos** | VISION_MATH §2 DEF 2.2 | fixed point of `⊗` up the machine → … → cosmos ladder |
| **DEF 4.2 (triad-composition)** | VISION_MATH §4.1 | `μ_k^⊗ = m_I(μ_k^i)`, `μ_s^⊗ = a_s(μ_s^i)`, `μ_h^⊗` independent |
| **DEF 4.3 (coherent coupling)** | VISION_MATH §4.1 | `(C1)` intent-compositional ∧ `(C2)` `K_I`-Lipschitz ∧ `(C3)` `a_s = m_I` |
| **THM 4.3 (alignment composes)** | VISION_MATH §4.1 | under DEF 4.3: `δ_trishul(⊗) ≤ 3·K_I·max_i δ_trishul(T_i)` |
| **PROP 4.2 (general form false)** | VISION_MATH §4.1 | coherent coupling is *necessary*; bounded coupling alone is not |

The composition is a monoid (associative, identity, **not** a group — [Prachi §10.1 / VISION_MATH THM 2.1](VISION_MATH.md)). All claims below take these as given.

---

## §C — Emergent drift: definition and decomposition

The shastra's central new quantity.

**DEF C.1 (coherent-bound drift).** For a composition `⊗(T_i; I)` with `n` components:

```
B(T_1, …, T_n; I)  :=  3 · K_I · max_i δ_trishul(T_i)
```

— the upper bound on the composite drift *under* coherent coupling (THM 4.3).

**DEF C.2 (emergent drift).** The composition's emergent drift is the surplus the whole adds beyond what its parts can explain under coherent coupling:

```
δ_emergent(⊗; I)  :=  max( 0,  δ_trishul(⊗)  −  B(T_i; I) )
```

**COR C.1 (alignment composes iff no emergent drift).** Under coherent coupling (DEF 4.3), THM 4.3 gives `δ_trishul(⊗) ≤ B` so `δ_emergent = 0`. Under any incoherent coupling, PROP 4.2's counterexample exhibits `δ_trishul(⊗) > B = 3·K_I·0 = 0` from `δ = 0` parts, so `δ_emergent > 0`. **`δ_emergent = 0` is the precise signal that the coupling is coherent at this composition node.** PROVED given DEF 4.2.

**PROP C.2 (channel decomposition — which condition failed?).** `δ_trishul(⊗) = α·|μ_h^⊗−μ_s^⊗| + β·|μ_s^⊗−μ_k^⊗| + γ·|μ_h^⊗−μ_k^⊗|`. Each failing coherence condition has a *signature* on which channel carries the excess:

| Failure | The mechanism | Channel signature on `δ_emergent` |
|---|---|---|
| **C1** violated (`μ_h^⊗ ≠ m_I(μ_h^i)`: the whole's desire is not the merge of the parts' desires) | local intents conflict, or the whole has emergent purpose | **α + γ** dominate (intent-vs-witness and intent-vs-action gaps open at the composite scale — the **composite-scale LAW-11 / Kabir term** fires: the whole narrates coherence while failing its purpose) |
| **C3** violated (`a_s ≠ m_I`: self-model aggregates differently from action) | locally-true reports union into a globally-false self-model | **β** dominates (the system's story diverges from its behavior — *institutional hypocrisy at scale*) |
| **C2** violated (`m_I` not Lipschitz, or `K_I` very large) | tight coupling amplifies any residual component drift | **all channels scaled up** by the un-bounded coupling — drift cascades; signature is *amplification proportional to the bound `K_I` itself* |

PROVED given DEF 4.2 by direct construction (PROP 4.2's counterexample violates C1 and fills the α+γ channels exactly).

**Reading.** The channel ratios `(α-share, β-share, γ-share)` of `δ_emergent` are a **diagnostic fingerprint**: the relative magnitudes tell which coherence condition the coupling violates. This is what the runtime instrument (stone #4) measures.

---

## §D — Localization: the walk that finds the least-aligned coupling

A composition is a tree: leaves are base twins `T_machine`, internal nodes are `⊗(children; I_node)`, the root is `Cosmos`. Both `δ_trishul` and `δ_emergent` apply at every node.

**DEF D.1 (least-aligned coupling).** For a composition tree `𝒯` with internal-node set `N(𝒯)`:

```
n*(𝒯)  :=  argmax_{n ∈ N(𝒯)}  δ_emergent(n)
```

— the composition node where the most drift is being *manufactured by the coupling itself*, not inherited from below.

**THEOREM D.1 (the bottleneck is the inf).** Recall `H(Cosmos) = inf_t H(t)` over all twins in the tree (VISION_MATH DEF 3.2). Then the cosmos-happiness bottleneck is the *least-aligned* twin or coupling: improving any other node is invisible to `H(Cosmos)` until `n*` is improved.

**Proof.** `H` is a strictly decreasing function of `δ_trishul`. `inf H` is achieved where `δ_trishul` is maximum. If the maximum is at an internal node where the parts are aligned but the coupling is not (`δ_emergent > 0`), the inf is sitting at the coupling, not at any leaf — and *no improvement to any leaf moves the inf*. ∎ (PROVED given DEF 4.2 + VISION_MATH DEF 3.2.)

**Algorithm D.1 (post-order walk — the spec for stone #4).**

```
walk(node):
    if node is a leaf (T_machine):
        return ( δ_trishul(T_machine),  0 )            # leaves have no coupling, no emergent drift

    for child in node.children:
        ( δ_child, _ )  =  walk(child)

    δ_node      =  δ_trishul(node)                      # measured at this composition's triad
    B_node      =  3 · K_I(node) · max_child δ_child   # the coherent-coupling bound (DEF C.1)
    δ_emergent  =  max( 0, δ_node − B_node )           # surplus beyond the bound (DEF C.2)

    return ( δ_node, δ_emergent )

# Top-level:
( δ_cosmos, _ )  =  walk(Cosmos)
n*               =  argmax over the tree of δ_emergent(node)
signature(n*)    =  ( α-share, β-share, γ-share )  of  δ_trishul(n*)   # PROP C.2 diagnostic
H_cosmos         =  1 − min( δ_cosmos / τ_max, 1 )    # VISION_MATH DEF 3.2
```

PROOF-METHOD (not executed here — it is the contract for stone #4): correctness follows from THM D.1 (the inf localizes to the worst node) and PROP C.2 (the signature names which condition failed). Termination is trivial (finite tree). Composition with the rest of the Prachi framework is by THEOREM 8.1 (composition preserves laws): the walk is a Vishnu-type operator over the tree and preserves the 12 laws node-wise.

---

## §E — Remediation: the inf aggregator earns its rent

The shastra's load-bearing operational consequence.

**PRINCIPLE E.1 (you cannot align an incoherent coupling by aligning its parts).** PROP 4.2 exhibits aligned parts (`δ_trishul(T_i) = 0`) producing a misaligned whole (`δ_trishul(⊗) > 0`). Therefore: at any node `n*` with `δ_emergent(n*) > 0`, **further reduction of `δ_trishul(child)` cannot reduce `δ_trishul(n*)`** (the bound `B(n*)` is already at its minimum `0` and `δ_trishul(n*) > 0`). Remediation must act at the *coupling itself*. PROVED given DEF 4.2.

**Channel-specific remediation** (read off PROP C.2's signature):

| Signature at `n*` | Failing condition | Remediation |
|---|---|---|
| α + γ dominate | **C1** (intent-incompositional) | clarify / ratify `μ_h^{n*}` as a *real* telos of the whole — not a synthesis of conflicting child telos. **This is the C1-remediation pattern that the kit's own `CHARTER.md` discipline implements** at the kit/jiva scale: the charter is the explicit `μ_h` for a composed jiva (this kit is a composition of skills, roles, hooks). Mapped up: every composed twin needs a ratified charter at *its* level. |
| β dominates | **C3** (self-model ≠ action) | bring the witness aggregation `a_s` into homomorphism with the action merge `m_I` — i.e., make the system's story compose the same way its behavior composes. **This is LAW 11 / Kabir lifted to the composite scale: institutional anti-hypocrisy.** |
| Amplification across all channels with large `K_I` | **C2** (coupling unbounded / very tight) | tighten the coupling specification (reduce `K_I`), or insulate components (reduce coupling cross-section so the merge does not propagate small part-drifts into large composite-drift). |

**COR E.1 (the inf is load-bearing, not bookkeeping).** Because emergent drift cannot be remediated by leaf-level alignment alone (PRINCIPLE E.1), the `inf` aggregator in `H(Cosmos)` (VISION_MATH DEF 3.2) is doing genuine work: it makes the bottleneck unavoidable. A mean aggregator would let an incoherent coupling be "averaged away" by many aligned parts; `inf` refuses that. PROVED given DEF 4.2 + DEF 3.2.

---

## §F — What this shastra provides for stone #4 (the instrument)

The runtime contract that the AI-PEACE Happiness Index implementation must satisfy:

1. **For every node of the composition tree, compute `δ_trishul(node)`** by reading the node's `(μ_h, μ_s, μ_k)` from its referent and its twin.
2. **For every internal node, compute `δ_emergent(node)`** per Algorithm D.1.
3. **Surface `n*` and its channel signature** so the diagnosis (C1 / C2 / C3) is read off automatically.
4. **Report `H(Cosmos) = 1 − min(δ_cosmos / τ_max, 1)`** with the bottleneck location attached — *the bottleneck is a first-class output, not a derived statistic.*
5. **Refuse to compute when `μ_h^⊗` is unavailable for some node** — that is `μ_hridaya = None`, the catuṣkoṭi-third-corner of [MATH.md §5.6](MATH.md). Make charter-drift at the composite scale *visible as absent*, not silently inferred.

Anything an instrument computes outside (1)–(5) is enrichment; (1)–(5) is the *minimum* the math demands.

---

## §G — Honest status, open questions

**Status.**

| Claim | Status |
|---|---|
| DEF C.1, C.2 (coherent-bound drift; emergent drift) | DEF (operational, derived from VISION_MATH §4.1) |
| COR C.1 (`δ_emergent = 0` ⟺ coherence at the node) | PROVED given DEF 4.2 |
| PROP C.2 (channel decomposition by failing condition) | PROVED given DEF 4.2 (constructive — PROP 4.2 supplies the C1 instance) |
| DEF D.1, THM D.1 (least-aligned coupling localizes the inf) | DEF + PROVED given DEF 4.2 + DEF 3.2 |
| Algorithm D.1 (the walk) | PROOF-METHOD (contract for stone #4; correctness from THM D.1) |
| PRINCIPLE E.1 (remediation cannot be done at the leaves) | PROVED given DEF 4.2 (direct from PROP 4.2) |
| Channel-specific remediation table | PROOF-METHOD (each entry is *necessary* by PROP C.2; *sufficient* is open) |
| COR E.1 (inf is load-bearing) | PROVED given DEF 4.2 + DEF 3.2 |

**Open.**

1. **The runtime instrument (stone #4).** This shastra is the spec; the implementation is the next stone. AI-PEACE's Happiness Index is the seed surface.
2. **Sufficiency of channel-specific remediation.** The shastra proves each remediation is *necessary* for its channel; it does not prove they *suffice* (i.e., that applying them returns `δ_emergent → 0`). Sufficiency is an open prop — likely true under additional regularity, false in pathological I.
3. **CONJ 4.1′ (modelling fidelity).** Unchanged. Whether real referent-composition obeys DEF 4.2 is empirical, not mathematical — the instrument (stone #4) is what eventually answers it.
4. **The Cosmos fixed point.** The recursive `⊗` up the ladder is well-defined as a structural induction (VISION_MATH COR 2.1 PROOF-METHOD), but the *convergence* of `H(Cosmos)` under refinements of the tree is open — adding finer-grained children can lower or raise the inf. Worth its own analysis at a future stone.

---

## §H — One sentence

A happy cosmos is reachable bottom-up exactly where the couplings are coherent; everywhere else, the `inf` finds the bottleneck and points at which of C1 / C2 / C3 to fix — the shastra is how a future instrument will read that pointer.
