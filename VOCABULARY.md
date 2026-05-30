# Vocabulary

> Code, configs, log lines, schemas, commit messages, env vars: **IT-industry terms only.** Divine names live here. The `vocabulary-lint` hook enforces this.
>
> **Companion file:** [`ATLAS.md`](ATLAS.md) carries the full Glossary of Divine & Sanskrit terms — every divine name with its complete meaning, lineage, and engineering analog. VOCABULARY.md is the **two-column code-side mapping** (lineage ↔ canonical); ATLAS's Glossary is the **lineage-side reference** (full prose explanation of each term).

## The two-column rule

The right column is the canonical name (used in code). The left column is the lineage (used in comments, design docs, ADRs to preserve conceptual ancestry).

## State names

| Lineage (shastras) | Canonical (code) | One-line meaning |
|---|---|---|
| Garbha | `seed` | The womb of the project — charter and intent |
| Baalya | `discovery` | Learning the code/requirements as a sponge |
| Brahmacharya | `forge` | Disciplined spike, prototype, TDD |
| Grihastha | `build` | Active feature work (max complexity) |
| Vanaprastha | `service` | Refactor, mentor, on-call, maintain |
| Sannyasa | `sunset` | Deprecate, reduce surface |
| Moksha | `decommission` | Archive, final tag |

## Drishti directions

| Lineage | Canonical | What it scans |
|---|---|---|
| Vama | `left` | Alternatives |
| Dakshina | `right` | Push current path further |
| Urdhva | `up` | System / architecture view |
| Adho | `down` | Details / mechanics |
| Atita | `past` | History, prior decisions |
| Anagat | `future` | Consequences, rollback |
| Vartamana | `present` | What is true right now |
| Mauna | `silence` | Should I act at all? |

### Drishti-stack notation

A **drishti stack** is a runtime *composition* of the directions above (and [ATLAS.md](ATLAS.md) deep-cycle lenses) declared per session. It is a convention, not a governed primitive — full grammar, decode table, and worked examples in [DRISHTI_STACK.md](DRISHTI_STACK.md). The canonical notation:

| Symbol | Reads as | Meaning |
|---|---|---|
| `A → B` | "A serves / acts under B" | `A` is the active identity (the hand); `B` is the authority/intent it serves. Authority flows right-to-left. |
| `A + B` | "A and B, co-equal" | peer layers at the same authority level (e.g. `Ram + Sita`) |
| `; consult: X, Y` | "consulting X, Y" | advisory lenses summoned alongside, not in the authority chain |
| `keep same drishti stack` | carry-forward keyword | reuse the prior turn's declared stack without re-stating it |

The lineage persona-names in a stack obey the two-column rule like everything else: they appear only in prose/docs/prompts, never in code, configs, or the artifacts `vocabulary-lint` scans.

## Q-vector axes (capability dimensions)

| Lineage (queen) | Canonical | Domain meaning |
|---|---|---|
| Rukmini | `craft` | Strategic spec quality |
| Jambavati | `endurance` | Multi-week perseverance |
| Satyabhama | `standard` | Refuses mediocrity |
| Kalindi | `patience` | Won't rush, won't lower bar |
| Nagnajiti | `constraint` | Many constraints, zero compromise |
| Mitravinda | `authenticity` | Truth against pressure |
| Lakshmana (queen) | `precision` | One perfect shot |
| Bhadra | `fit` | Solution already in ecosystem |

`Q_shiva` = consciousness reading (awareness, scan, witness)
`Q_shakti` = energy reading (action, forge, nurture)

Goal at every state: `|μ_shiva - μ_shakti| → 0` (ArdhNarishwar balance).

## Cycle names

The 15 working-set cycles each carry a lineage tag. See [CYCLES.md](CYCLES.md) for the full list. The tag (TRG, 8L, AR, RR, SMR, SHD, …) is canonical; the lineage (Khatu Shyam, Ram, Brahma, Shiva, Krishna, Shadow-as-teacher, …) lives in comments and design docs only.

## Adversary-archetype mapping (Shadow Deep cycle, tag `SHD`)

The `SHD` cycle (ATLAS-tier; see [ATLAS.md](ATLAS.md) Shadow Deep section) iterates through 6 adversary archetypes as drishti-intensifications. In code / configs / commits / log lines / schemas / env vars / threat-model fields / monitoring labels, use the canonical attack-pattern term; the archetype name lives in comments and design docs only.

| Lineage (archetype) | Canonical (code) | Attack pattern |
|---|---|---|
| Raavan | `apt` / `advanced-persistent-threat` | Sophisticated multi-stage, nation-state-class resources, crown-jewel-targeted |
| Shakuni | `insider-threat` / `supply-chain-compromise` | Long-game manipulation, trusted-access abuse, poisoned dependencies |
| Hiranyakashipu | `spec-gap-exploit` / `invariant-bypass` | Loophole in written guarantees, edge-case attack, formal-verification bypass |
| Duryodhana | `protocol-abuse` / `dos` | Asymmetric-power abuse, rate-limit bypass, resource exhaustion |
| Maricha | `phishing` / `impersonation` | Fake-legitimate requests, social engineering, trust-by-appearance bypass |
| Tataka | `automated-scanner` / `script-kiddie` | High-volume low-sophistication, opportunistic background-noise attacks |

## Adversarial-review / red-team-pass / threat-archetype-audit (Shadow Deep verbs)

The `SHD` cycle's actions in code / configs / log lines use these canonical terms. The divine-lineage equivalents (Shadow Deep, Shadow Matrix, Shadow Verdict, shadow-as-teacher) live in docs only.

| Lineage | Canonical (code) | One-line meaning |
|---|---|---|
| Shadow Deep pass | `adversarial-review` / `red-team-pass` | Open-world adversary-imagination cycle invocation |
| Shadow Matrix iteration | `threat-archetype-audit` | The 6-archetype × crown-jewel iteration in Round 2 |
| `SHADOW_PASS_*.md` | `adversarial-review-report` (file name only) | The cycle's concrete artifact per pass |
| Shadow Verdict | `threat-model-update` / `deferred-risk-decision` | The Round-3 cycle 12 output |
| shadow-as-teacher framing | (no code term — framing is docs-only) | Binding-condition (c) per KABIR_GATE.md entry 10 — no demon/hatred framing in published text |

## Role names

The 6 roles use IT-industry titles directly: `analyst`, `architect`, `engineer`, `qa`, `security`, `reviewer`. No lineage translation needed.

## Hook names

`block-dangerous-bash`, `secret-scan`, `vocabulary-lint`, `frontmatter-check`, `handover-reminder`, `stage-tip`. These are scripts. They have no lineage.

## What `vocabulary-lint` blocks

The hook (`.claude/hooks/vocabulary-lint.sh`) maintains a curated `TERMS` array in its source — that array is the authoritative block-list and it is **broader than the LEFT-column mappings in the tables above**. In addition to the state-name / Q-axis / adversary-archetype lineage terms that have a canonical right-column translation, the lint additionally blocks **bare deity names and lineage terms that have no IT-industry canonical translation** (Ram, Sita, Krishna, Saraswati, Brahma, Shiva, Vishnu, Lakshman, Hanuman, Ganesh, Narad, Buddha, Patanjali, Kabir, Gorakhnath, Radha, Mira, Khatushyam, Parvati, Arjuna, Nataraj, Nataraja, Nagarjuna, Vishwakarma, Tansen) and the **kit-domain terms** (MahaKaal, ArdhNarishwar, Prachi, Drishti, Jiva, Jeevanyatra, Shastra). They are blocked because they are *not concepts to translate* — they are lineage references that belong in prose docs and ADR comments only.

Documentation files exempt: `*.md`, `*.toml`, `*.txt`, `*.json`, `*.yaml`, `*.lock`, `*.log`, `*.csv`, `*.tsv`. Folders exempt: any path containing `/shastras/` (project-local lineage notes), and any `templates/` directory.

**Adding a new divine name to kit prose?** Add it to the `TERMS` array in `.claude/hooks/vocabulary-lint.sh` following the bash adjacency-concatenation pattern. The lint's source comment documents recent extensions and their justification (most recently 2026-05-30 afternoon: 10 terms added post-cosmos-program — Radha/Mira/Khatushyam/Parvati/Arjuna/Nataraj/Nataraja/Nagarjuna/Vishwakarma/Tansen).
