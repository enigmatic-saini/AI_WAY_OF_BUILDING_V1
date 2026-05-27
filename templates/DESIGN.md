---
type: design
project: <name>
stage: <seed | discovery | forge | build | service | sunset | decommission>
updated: YYYY-MM-DDTHH:MM:SSZ
fsms: []
---

# [Project Name] — Software Design Document

> [One-line philosophy: what this IS]
> M_build stage at last update: see frontmatter `stage:`
> Last updated: see frontmatter `updated:`

## §1 — Purpose

What it IS. What it IS NOT. No ambiguity.

## §2 — Architecture

The pipeline. Data flow. The two or three halves and how they unite. Diagrams as needed.

## §3 — Module / Crate Architecture

Directory tree with 1-line descriptions per node. Every module justified.

```
src/
  module-a/    — <one-line purpose>
  module-b/    — <one-line purpose>
  ...
```

## §4 — FSM Governance

Every FSM in the project: state diagram, transitions, owners. No FSM exists without a diagram here.

| FSM | Purpose | States | Owner | TOML |
|---|---|---|---|---|
| `MainFsm` | ... | ... | ... | `fsms/main.toml` |

## §5 — Testing

Test suites, counts, what each proves. Review cycles used.

| Suite | Count | Proves | Cycle |
|---|---|---|---|
| unit | ... | ... | `8L` cycle 1, 11 |
| integration | ... | ... | `8L` cycle 3, NEG |
| ... | | | |

## §6 — Design System

Theme, tokens, components used. Reference to `ui-guidelines/` if present.

## §7 — Work-Culture Governance

Which laws and cycles govern this project. A reference, not a copy.

- Laws applied: L0–L11 (per `AI_WAY_OF_BUILDING_V1/LAWS.md`)
- Cycles used: <list of `TRG`, `8L`, `HO`, `AR`, ...>
- Annual review: `CA1` (Strategic-Spec).

## §8 — Open Questions

Anything unresolved. Tag with severity.
