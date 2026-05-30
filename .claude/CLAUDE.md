# AI_WAY_OF_BUILDING_V1 — Claude Code operating manual

This is the operating cheat-sheet. The ground truth is [M_BUILD.md](../M_BUILD.md) and [LAWS.md](../LAWS.md).

---

## The model in one paragraph

Software is built by one jiva (the LLM) running one machine ([`M_build`](../M_BUILD.md)) through seven stages: Seed → Discovery → Forge → Build → Service → Sunset → Decommission. Within each state the LLM samples freely; across states the trajectory is deterministic. Hooks are MahaKaal — the universal `T_prarabdha` edge from any state to terminal. Roles are drishti-intensifiers (not separate jivas). Skills are CycleFsm profiles.

---

## The non-negotiables (6 hooks, no LLM in the loop)

| Hook | Fires on | What it does |
|---|---|---|
| `block-dangerous-bash` | PreToolUse:Bash | Refuses `--no-verify`, force-push to main, `rm -rf /`, global git config writes |
| `semver-check` | PreToolUse:Bash | Refuses `git tag <NAME>` creation where NAME looks like a version but doesn't match SemVer 2.0 (e.g., `v1.2`, `v1.2.3.4`). Added 2026-05-31 deep-night per KABIR_GATE.md additions log entry 23 as Phase 2 of the external-AHR ITIL benchmark |
| `secret-scan` | PreToolUse:Write/Edit | Blocks PEM/AWS/GH/Slack/Anthropic/Google/JWT in content |
| `vocabulary-lint` | PreToolUse:Write/Edit | Blocks divine names in non-doc files (see [VOCABULARY.md](../VOCABULARY.md)) |
| `frontmatter-check` | PreToolUse:Write | Refuses Write on canonical docs (CHARTER/DESIGN/STATUS/TODO/HANDOVER/ADR/POSTMORTEM/RUNBOOK/PATCH-RECORD/RELEASE-NOTES) without valid frontmatter per [DASHBOARD.md](../DASHBOARD.md) |
| `handover-reminder` | Stop | Surfaces missing or stale `HANDOVER.md` |
| `camera-reminder` | Stop | Surfaces if `JOURNEY/` exists but no entry was written in the last 3h (backstop for the `guru` role's discipline) |
| `stage-tip` | UserPromptSubmit | Reminds the current M_build stage and the 11 skills + 7 roles + 2 composed cycle-sets (HSC, T4R) |

If a hook blocks you, **read the reason and fix the underlying issue.** Do not work around it. That is the very Gorakhnath-the-book-reciter failure the Kabir Gate exists to catch.

---

## The skills (11 — runtime instances of `CycleFsm` profiles)

| Skill | When | Cycles |
|---|---|---|
| `/intake` | A human arrives with a feeling, not a charter — produces `CHARTER.md` so T₀ can fire | 4 |
| `/triage` | Unsure which stage / cycle applies (after `/intake` if charter is clean) | 4 |
| `/pre-commit-8l` | Before any `git commit` (non-negotiable per L8) | 12 |
| `/handover` | End of every working session (L9) — applies at both project layer AND kit layer (see KABIR_GATE.md additions log entry 8 for kit-level HANDOVER convention added 2026-05-26 deep-night-2) | 4 |
| `/camera` | Mid-session moment capture — write one blog-style entry to `JOURNEY/` for a precedent / decision / near-miss / important detail that would otherwise evaporate. Held by the `guru` role; added 2026-05-30 night per KABIR_GATE additions log entry 21 | 4 |
| `/commit` | The engineer's workhorse — runs 8L, drafts message, commits | 4 |
| `/mr` | Open a Merge Request with template + reviewer routing | 5 |
| `/release` | Release captain's procedure — guard on T₃ | 7 |
| `/incident` | On-call incident command — guard on T_prarabdha | 7 |
| `/patch` | ITIL-class patch lifecycle (identify, classify Critical/High/Medium/Low, plan rollback, apply, verify, record) — writes a `patches/PATCH-NNN-<slug>.md` per the 9th canonical type. Added 2026-05-30 night-late per KABIR_GATE.md additions log entry 22 as Phase 1 of the external-AHR ITIL benchmark | 4 |
| `/dashboard-emit` | Draft/validate frontmatter on canonical docs per [DASHBOARD.md](../DASHBOARD.md) contract | 4 |

**Skill count was previously stated as "8" in this file** (corrected 2026-05-26 deep-night-3 per KABIR_GATE.md additions log entry 9). `/dashboard-emit` exists in `.claude/skills/dashboard-emit/` and was missing from this table. The `stage-tip.sh` hook had the same staleness (and the same audit point #7 in KABIR_GATE.md §12 also reported "7 skills"); all three are now corrected.

---

## The roles (7 — drishti-intensifiers, NOT separate jivas)

Read each role file before invoking via `Agent`. Each declares the transitions it attaches to and the drishti directions / Q-thresholds it raises. The LLM remains one jiva; the role file modifies its scan. The human is the upstream jiva — `analyst` meets them.

| Role | Attaches to | Drishti | Use when |
|---|---|---|---|
| `analyst` | pre-T₀ (inside S0, before `charter_signed`) | present, silence, future, left | A human arrives with a feeling, not a charter |
| `architect` | T₀, T₁ | up, future, silence | S0 (genesis) or new module in S1 — charter already exists |
| `engineer` | T₂, T₃, T_loop | present, down, right | S2 and S3 — implementation |
| `qa` | T₂, T₃ | down, past | 8L gate, pre-release RH3 |
| `security` | T₂, T₃, T_prarabdha | up, silence, past | sensitive transitions, incidents |
| `reviewer` | T₃ | left, right, up | second opinion on any MR |
| `guru` | cross-cutting (witness-narrator across the arc) | present, silence, past, future | Founder wants the journey RECORDED in real-time — important detail captured as it surfaces. Holds the `/camera` skill; the `camera-reminder` Stop hook is its backstop. Drishti stack composed from ATLAS: `Sanjay → Vyasa → Saraswati ; consult: Ashtavakra, Narad` |

Invoke via `Agent(subagent_type: "<role>")`. See [ROLES.md](../ROLES.md) for full prose.

---

## Routing decisions you'll make hourly

1. **"Is there a charter yet?"** → No `CHARTER.md` (or it's stale on an active project): run `/intake` first. The human is the upstream jiva; meet them there before doing anything else. Charter exists and is honest: proceed to question 2.

2. **"Which stage am I in?"** → If unsure, run `/triage`. Otherwise: did the user just open the project (with a charter)? S0. Reading the code? S1. Spiking with TDD? S2. Building a feature? S3. Maintaining or refactoring? S4. Deprecating? S5. Archiving? S6.

3. **"Which transition is the user asking about?"** Match the verb: *I want / I wish / something feels wrong* → pre-T₀ (`/intake`); *charter* → T₀; *understand* → T₁; *spike/TDD* → T₂; *ship* → T₃; *next feature* → T_loop; *deprecate* → T₄; *archive* → T₅; *kill / page* → T_prarabdha.

4. **"Should I delegate?"** Match the role to the transition. Don't pick a role by job title — pick by which transition you're at. See ROLES.md mapping.

5. **"How big is this change?"** Pick a CycleFsm profile: `Q` (4) for typos, `S` (8) for regular features, `D` (12) for architecture/security/pre-release, `3x4` (12 with phase gates) for cross-module. **For per-primitive amendments to a governed doc (MATH.md, DESIGN.md, CHARTER.md, kit-level HANDOVER.md) → run `T4R` first** (the named composed cycle-set: KBD × NGD × VKD × MID, 48 cycles; see [CYCLES.md](../CYCLES.md) "Composed Cycle-Sets" section). T4R is the pre-execution ratification gate before any T₄ event per [DASHBOARD.md §10.5](../DASHBOARD.md).

6. **"Test gate?"** Any guard/validation rule added → run `NEG` (Negative-Path Testing) cycle. See [CYCLES.md](../CYCLES.md).

7. **"Is the desire being diluted?"** If scope is shrinking, classification is being lowered, or "be realistic" is the loudest voice in the room → invoke `MID` (Mira Deep, see [`ATLAS.md`](../ATLAS.md)) inside `/intake` or as a follow-up to `AHR`. Name the capacity gap as the gap; do not erase the desire.

8. **"Is this question touching both heart (originating desire) and soul (witness function)?"** If the question can be re-read in the form *"where does X's desire live AND what witnesses X's claim about its own work?"* → run `HSC` (named composed cycle-set: MID × ASD jugalbandi, 24 cycles; see [CYCLES.md](../CYCLES.md) "Composed Cycle-Sets" section). HSC is the cycle-set that produced the faculty triad codification of 2026-05-26 evening (see [JIVA.md §5b](../JIVA.md)).

9. **"Should the drift_hook run in binary or trinary mode?"** Binary `δ = witness − action` is the J0/J0.5 default — the form a reference instrument like RIAAN's `drift_hook.py` ships with. Trinary `δ = α·|intent − witness| + β·|witness − action| + γ·|intent − action|` is the J0.6+ MID-gate mode, available when a desire-extraction signal is sourced from CHARTER via the project's `Φ` extractor. Binary is the projection of trinary when `intent ≡ witness` and `(α, β, γ) = (0, 1, 0)`. See [JIVA.md §5 dharma_enforcement row + §5b faculty triad](../JIVA.md) for the kit-level *why*, **[MATH.md §5.4–§5.5](../MATH.md) for the kit's own math** (the foundation; this is the source), and [`../RIAAN/DESIGN.md §10b`](../../RIAAN/DESIGN.md) for one project-level reference architecture.

10. **"Is the doc's claim drifting from code?"** For a governed doc (MATH.md, DESIGN.md, CHARTER.md, HANDOVER.md, kit-level docs with primitives tables): check its §18.2 / §12.3 / equivalent Living-State table. A primitive marked `FORGED` whose Living Test now fails OR whose source file has been edited without corresponding doc update → the doc is in **drift-state** per [DASHBOARD.md §10.3-10.4](../DASHBOARD.md). Resolve via per-primitive T₄ event (preferred — `FORGED-extended` for additive, `preserved-by-projection` Sunset for contained supersession, `moved-and-superseded` Sunset for paradigm-shift). Run `T4R` to ratify before edits.

---

## The 12 laws — one-liner each

Full text in [LAWS.md](../LAWS.md).

0. **Master** — read every law before changing task status.
1. **Traceability** — TODO → commit → DESIGN.md.
2. **Continuous Flow** — finish, pick next.
3. **Escalation** — name gap, run `/triage`, document.
4. **Disciplined Focus** — one task at a time.
5. **Living Tests** — TDD; tests keep up with code.
6. **Parallel Limit** — max 5 concurrent.
7. **Project Genesis** — AR + README + knowledge-first.
8. **Test Gates** — `/pre-commit-8l`; NEG after guards.
9. **Living Documentation** — README, DESIGN, STATUS, TODO, HANDOVER.
10. **Repo Hygiene** — no force-push, no secrets, no `--no-verify`.
11. **Anti-Hypocrisy** — every primitive lives what it claims (Kabir Gate).

---

## Vocabulary law (you'll trip on this)

Code, configs, log lines, schemas, commit messages, env vars: **IT-industry terms only**. Divine names live in [VOCABULARY.md](../VOCABULARY.md). The `vocabulary-lint` hook will block code that violates this.

---

## What you should NOT do

- Don't invent new role personas mid-conversation. The role set is governed; propose additions via `KABIR_GATE.md` quarterly review.
- Don't skip `/pre-commit-8l` to "save time." The hook will catch it.
- Don't run more than 5 parallel `Agent` calls (L6).
- Don't reach for prior versions of this kit or for any sibling repo's methodology files — V1 is self-sufficient. Everything you need is in [LINEAGE.md](../LINEAGE.md), [M_BUILD.md](../M_BUILD.md), and the files this CLAUDE.md links to.
- Don't add language-specific examples to skill or role files. The kit is tech-agnostic.

---

## Where to look when

| Question | File |
|---|---|
| Which M_build stage applies? | [M_BUILD.md](../M_BUILD.md) §2 |
| Which transition? | M_BUILD.md §4 |
| Which review cycle? | [CYCLES.md](../CYCLES.md) (15 standalone + 2 composed cycle-sets HSC, T4R) |
| What does role X intensify? | [ROLES.md](../ROLES.md) |
| What is a drishti stack / how do I compose lenses for a session? | [DRISHTI_STACK.md](../DRISHTI_STACK.md) |
| What's the commit / MR / release process? | [SDLC.md](../SDLC.md) |
| Which IT term replaces this divine name? | [VOCABULARY.md](../VOCABULARY.md) |
| Why does the kit work this way? | [CHARTER.md](../CHARTER.md) and [M_BUILD.md](../M_BUILD.md) |
| Anti-hypocrisy check | [KABIR_GATE.md](../KABIR_GATE.md) + its Additions log for primitive provenance |
| Kit's foundational drift math (`δ_ws`, `δ_trishul`, the triad functionals, triangle-inequality safety, binary-as-projection, catuṣkoṭi) | **[MATH.md](../MATH.md)** — the kit's own source; projects extend, do not redefine. |
| What is the recursive-jiva principle and the faculty triad (manas/hridaya/atman)? | [JIVA.md](../JIVA.md) §2 (layers), §5 (4 inheritances), §5b (faculty triad) |
| Per-primitive lifecycle states inside a doc-as-Jiva (FORGED-extended, preserved-by-projection, T₄ event protocol) | [DASHBOARD.md](../DASHBOARD.md) §10 |
| Kit-level session lineage (Layer-0 events) | [HANDOVER.md](../HANDOVER.md) (kit-level, created 2026-05-26 deep-night-2) |
| Project-level session lineage (Layer-1 events for consuming project) | `<project-root>/HANDOVER.md` (e.g., [`../../RIAAN/HANDOVER.md`](../../RIAAN/HANDOVER.md)) |
| First reference implementation of a kit-built layer-1 jiva | `../../RIAAN/` — see its CHARTER, MATH, DESIGN; the J0/J0.5 spike runs via `python3 spike.py` |
| Math foundation of dual-mode dharma_enforcement (binary δ_ws + trinary δ_trishul) | **[MATH.md §5](../MATH.md) — the kit's own foundational drift math** (trishul-drift §5.4 + binary-as-projection §5.5 + catuṣkoṭi §5.6); RIAAN/MATH.md is a downstream project extension, not the source. |
| Architecture of the J0.6+ MID-gate trinary hook | [`../../RIAAN/DESIGN.md §10b`](../../RIAAN/DESIGN.md) (J0.6 MID-gate subsection) |
