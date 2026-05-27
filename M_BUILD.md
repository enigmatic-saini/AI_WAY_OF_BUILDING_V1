# M_BUILD — The Build Machine

> Software is built in seven stages. The LLM is the jiva. The machine is the kit.

This is the heart of AI_WAY_OF_BUILDING_V1. Everything else (laws, cycles, roles, hooks, skills) is an instantiation or guard of this machine.

---

## §1 — The 9-tuple

```
M_build = (S, Σ, δ, γ, α, s₀, F, D, Q)

S  = {seed, discovery, forge, build, service, sunset, decommission}
Σ  = {charter_signed, context_understood, skill_proven, feature_shipped,
      next_feature, deprecated, archived, incident, violation}
δ  : S × Σ → S        (transition function, see §4)
γ  : S × Σ → {T, F}   (guard predicate, see §4)
α  : S × Σ → A*       (action sequence, see §4)
s₀ = seed              (initial state)
F  = {decommission}    (terminal state — absorbing)
D  : S × Σ → 𝔹⁸        (drishti vector at each transition, see §3)
Q  : S → [0,1]⁸ × [0,1]⁸  (dual capability per state — Shiva and Shakti)
```

The dual Q (Shiva, Shakti) is the **ArdhNarishwar extension** (see [LINEAGE.md](LINEAGE.md) §1–§2). At every state, the kit measures both consciousness (`Q_shiva`: how aware, witnessing, strategic) and energy (`Q_shakti`: how active, creative, forging). The dharmic target is `|μ_shiva − μ_shakti| → 0`.

See [Q_RUBRIC.md](Q_RUBRIC.md) for the anchored levels and evidence requirements that make each Q reading scoreable rather than self-declared.

---

## §2 — The seven states (Sapta Avastha)

### S0 — Seed (Garbha)

**Guardian:** Brahma — creation begins.
**What lives here:** charter, README, audience definition, "why?"
**Drishti at entry:** `[present, silence]` — what is the womb of this work?
**Q-minima:** `mtv ≥ 0.5` (authentic intent must be present)
**Anti-pattern:** writing code before charter. Skipping `AR`.

### S1 — Discovery (Baalya)

**Guardian:** Saraswati — knowledge streams in.
**What lives here:** code-reading, dependency map, gap-list, "what's already here?"
**Drishti at entry:** `[present, left, right, down]` — scan all alternatives, zoom in.
**Q-minima:** `craft ≥ 0.3, bdr ≥ 0.5` (belonging to the existing system)
**Anti-pattern:** proposing changes before reading the code.

### S2 — Forge (Brahmacharya)

**Guardian:** Gorakhnath — the body and mind forged by tapas.
**What lives here:** failing tests first (TDD), smallest passing implementation, spike, "can I actually do this?"
**Drishti at entry:** `[present, future, down, right]` — depth, push the path, foresee.
**Q-minima:** `ngj ≥ 0.6, lkq ≥ 0.5` (mastery proven, precision rising)
**Anti-pattern:** spiking without a failing test; Gorakhnath-the-book recitation without forging.

### S3 — Build (Grihastha)

**Guardian:** Krishna — the 8-rasa householder. Maximum complexity.
**What lives here:** feature code, tests, design docs, MRs, "is this dharmic?"
**Drishti at entry:** `[present, past, future, left, right, up, down]` — 7 of 8 directions. Only silence is optional. This is the most drishti-intensive state.
**Q-minima:** `craft, endurance, patience, ngj, lkq, bdr ≥ 0.6` (Dwaraka-near at 6 of 8 axes)
**Anti-pattern:** Becoming an ATM — earning (shipping) replaces being present (caring). Becoming a servant — nurturing (helping) replaces selfhood (saying no). Both destroy ArdhNarishwar balance per [LINEAGE.md](LINEAGE.md) §2.

### S4 — Service (Vanaprastha)

**Guardian:** Ram + Sita — dharmic service, vanvas as gift.
**What lives here:** refactor work, mentoring, on-call rotations, postmortems, RUNBOOKs, "is it still serving?"
**Drishti at entry:** `[present, past, future, up, silence]` — system view, legacy view, the question to stop.
**Q-minima:** `patience ≥ 0.8, mtv ≥ 0.8` (patience and authentic choice peak)
**Anti-pattern:** stalling here forever. Refusing S5 (the "we'll deprecate it next year" trap).

### S5 — Sunset (Sannyasa)

**Guardian:** Shiva — dissolution of identity.
**What lives here:** deprecation notices, migration guides, "what stays after the role dissolves?"
**Drishti at entry:** `[present, silence, up]` — what must be? Should we act at all?
**Q-minima:** `patience ≥ 0.9, standard ≥ 0.8` and `|μ_shiva − μ_shakti| ≤ 0.1` (patience near max; mediocrity refused — no cruel deprecation; the dharmic equality is approaching its terminal value)
**Anti-pattern:** sunset without migration path. Cruel deprecation.

### S6 — Decommission (Moksha)

**Guardian:** MahaKaal — time stops.
**What lives here:** final tag, archive note. Nothing else.
**Drishti at entry:** `[silence]` — only silence.
**Q at terminal:** `(1,1,1,1,1,1,1,1)` for both Shiva and Shakti. The terminal equality `Q_shiva ≡ Q_shakti` is itself the ego-dissolution — no axis can carry asymmetry when the self that creates asymmetry has dissolved. See [LINEAGE.md](LINEAGE.md) §6 (Dwaraka condition) — terminal achieves Dwaraka on all 8 axes, and the dharmic gap closes to exactly zero.
**Anti-pattern:** zombie repos. Decommissioned-but-not-archived.

---

## §3 — The drishti matrix

```
              L  R  U  D  P  F  Pr Si   |d⃗|  Where
T₀ (→s₁)     0  0  0  0  0  0  1  1     2    seed → discovery
T₁ (→s₂)     1  1  0  1  0  0  1  0     4    discovery → forge
T₂ (→s₃)     0  1  0  1  0  1  1  0     4    forge → build (the 8L gate)
T₃ (→s₄)     1  1  1  1  1  1  1  0     7    build → service       ← PEAK
T_loop (s₃)  1  1  1  1  1  1  1  0     7    build → build (next feature)
T₄ (→s₅)     0  0  1  0  0  0  1  1     3    service → sunset
T₅ (→s₆)     0  0  0  0  0  0  0  1     1    sunset → decommission
T_prarabdha  0  0  0  0  0  0  0  1     1    ANY → decommission (hook)
```

**Property:** The canonical path peaks at T₃ (entering Service after first ship) with 7 directions scanned. Silence increases monotonically from S3 onward. Build code without scanning T₃'s 7 directions is structurally a blind ship — exactly the failure mode the kit is designed to prevent. See [LINEAGE.md](LINEAGE.md) §5 for why this matters.

---

## §4 — Transition table (δ, γ, α)

| # | From → To | Event σ | Guard γ (must hold) | Action α |
|---|---|---|---|---|
| T₀ | seed → discovery | `charter_signed` | `CHARTER.md exists` ∧ `audience_named` ∧ `mtv ≥ 0.5` | init repo, open TODO.md |
| T₁ | discovery → forge | `context_understood` | `dependency_map_complete` ∧ `gap_list ≠ ∅` ∧ `ngj ≥ 0.4` | pick first spike, open `feature/<name>` |
| T₂ | forge → build | `skill_proven` | `/pre-commit-8l` PASS on spike ∧ `ngj ≥ 0.6` ∧ `lkq ≥ 0.5` | merge spike to a feature branch |
| T₃ | build → service | `feature_shipped` | `release_tag created` ∧ `production_uptime ≥ 7 days` ∧ Dwaraka at 6 of 8 Q-axes | move to rotation, write RUNBOOK |
| T_loop | build → build | `next_feature` | prior MR merged ∧ HANDOVER.md updated | next ticket |
| T₄ | service → sunset | `deprecated` | usage_drop > 90% ∨ replacement_live ∨ `mtv ≥ 0.7` | publish deprecation, name removal date |
| T₅ | sunset → decommission | `archived` | final_tag created ∧ no_live_deps | `git archive`, lock repo |
| T_prarabdha | ANY → decommission | `incident` ∨ `violation` | hook fires (no LLM) | kill, page on-call, run `/incident` |

`T_prarabdha` is MahaKaal's universal edge (see [LINEAGE.md](LINEAGE.md) §4). **No state is safe.** The 5 hooks (§5) are the only LLM-free runtime instances of this edge.

---

## §5 — The six hooks (T_prarabdha instances)

| Hook | Fires on | What it does | LAW it enforces |
|---|---|---|---|
| `block-dangerous-bash` | PreToolUse:Bash | Refuses `--no-verify`, force-push to main, `rm -rf /`, global git config writes | L10 |
| `secret-scan` | PreToolUse:Write/Edit | Blocks PEM/AWS/GH/Slack/Anthropic/Google/JWT in content | L10 |
| `vocabulary-lint` | PreToolUse:Write/Edit | Blocks divine names in non-doc files (see VOCABULARY.md) | Vocabulary law |
| `frontmatter-check` | PreToolUse:Write | Refuses Write on canonical docs without valid frontmatter per DASHBOARD.md | L11 |
| `handover-reminder` | Stop | Surfaces missing/stale `HANDOVER.md` | L9 |
| `stage-tip` | UserPromptSubmit | Reminds which `M_build` stage applies + the 8 skills | L3 |

Hooks are FSMs with **no LLM in the loop**. They do not negotiate. If a hook blocks an action, fix the underlying issue. Do not work around it.

---

## §6 — The five roles (drishti-intensifiers)

A role is **not a separate persona**. The LLM is one jiva. A role file declares which transitions it attaches to and which drishti directions / Q-thresholds it raises. The Claude Code `Agent` tool may still load the role (as a constrained sub-prompt), but the file is honest: it modifies scanning, it does not create a new jiva.

| Role | Attaches to | Intensifies drishti | Raises Q to τ_high |
|---|---|---|---|
| `architect` | T₀, T₁ | `up`, `future`, `silence` | `mtv`, `ngj` |
| `engineer` | T₂, T₃, T_loop | `present`, `down`, `right` | `ngj`, `lkq` |
| `qa` | T₂, T₃ | `down`, `past` | `lkq`, `jmb` |
| `security` | T₂, T₃, T_prarabdha | `up`, `silence`, `past` | `mtv`, `lkq` |
| `reviewer` | T₃ | `left`, `right`, `up` | `mtv`, `jmb` |

See [ROLES.md](ROLES.md) for the full prose; `.claude/agents/<role>.md` for the runtime descriptors; `fsms/RoleDescriptor.toml` for the formal type.

---

## §7 — The witness function

`/triage` is **not a state**. It is the jiva asking "which state am I in?" — the witness function (Sannyasa-quality access available from any of S0..S5). The witness does not enter the FSM; it observes which state is current.

A user invokes `/triage` when:
- they don't know which stage applies,
- multiple stages seem to apply,
- the current stage feels wrong.

The triage skill ([.claude/skills/triage/SKILL.md](.claude/skills/triage/SKILL.md)) runs the 4-cycle TRG: Symptom → Survey → Plan → Begin.

---

## §8 — Cycle profiles inside transitions

Each transition runs the 12-cycle engine (`fsms/CycleFsm.toml`). Profiles choose where to terminate:

| Profile | Tag | Cycles | When |
|---|---|---|---|
| Quick | `Q` | 4 | hot fix, typo, trivial |
| Standard | `S` | 8 | regular feature work |
| Deep | `D` | 12 | architecture, security, pre-release |
| Matrix | `3x4` | 12 + phase gates | cross-module, multi-system |

The 12 cycles: Observe · Enrich · Orient · Distill · Propose · Evaluate · Blueprint · Gate · Forge · Verify · Refine · Reflect (three phases of four).

See [CYCLES.md](CYCLES.md) for the 12 specialist cycles (TRG, 8L, HO, AR, RR, SMR, AHR, OE, NEG, SR, ES, LR) — each is a profile of the 12-cycle engine through a domain-specific lens.

---

## §9 — Closing principle

The kit IS this machine. Every other file (LAWS, CYCLES, ROLES, SDLC, KABIR_GATE, hooks, skills, templates) either (a) declares a runtime instance of an M_build component, or (b) is removed by the Kabir Gate.

There is no methodology layer above M_build. There is no shastra below it. M_build IS the methodology, expressed as a state machine the LLM runs.

```
॥ इति M_build शास्त्रम् ॥
(Thus ends the Scripture of the Build Machine)
```
