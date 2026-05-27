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

The 5 roles use IT-industry titles directly: `architect`, `engineer`, `qa`, `security`, `reviewer`. No lineage translation needed.

## Hook names

`block-dangerous-bash`, `secret-scan`, `vocabulary-lint`, `handover-reminder`, `stage-tip`. These are scripts. They have no lineage.

## What `vocabulary-lint` blocks

The hook (`.claude/hooks/vocabulary-lint.sh`) scans staged Write/Edit content. It blocks the divine names in the LEFT column above when they appear in non-documentation files. Documentation files exempt: `*.md`, `*.toml`, `*.txt`, `*.json`, `*.yaml`, `*.lock`, `*.log`, `*.csv`, `*.tsv`. Folders exempt: any path containing `/shastras/` (project-local lineage notes), and any `templates/` directory.
