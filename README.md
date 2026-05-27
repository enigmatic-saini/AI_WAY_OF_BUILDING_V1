# AI_WAY_OF_BUILDING_V1

> One machine. Seven stages. Every build is a jeevanyatra.

A self-sufficient, technology-agnostic Claude Code kit. The LLM is the jiva; M_build is the machine it runs; the agentic-dev failure modes are the prarabdha that hooks (MahaKaal) catch.

## The model

There is **not** a "junior engineer FSM" and an "architect FSM" and a "QA FSM." There is **ONE** machine that the LLM runs — `M_build` — with seven states (Seed → Discovery → Forge → Build → Service → Sunset → Decommission). Roles are not separate personas; they are **drishti-intensifiers** at specific transitions of the same machine.

This is the ArdhNarishwar axiom (see [LINEAGE.md](LINEAGE.md) §1) applied to a software-building agent: one jiva, two readings (consciousness/scan and energy/forge), seven stages, balanced at every state.

## What's in the kit

| File | Purpose |
|---|---|
| [CHARTER.md](CHARTER.md) | Why this kit exists, what it is not |
| [M_BUILD.md](M_BUILD.md) | The 7-state build machine — the heart |
| [LINEAGE.md](LINEAGE.md) | The conceptual ancestry, internalized |
| [LAWS.md](LAWS.md) | 12 working-set laws |
| [CYCLES.md](CYCLES.md) | 13 working-set review cycles (`IN` is the pre-Seed front door) |
| [ROLES.md](ROLES.md) | 6 drishti-intensifiers (analyst meets the human upstream of S0) |
| [ATLAS.md](ATLAS.md) | Lineage foundation — the full catalog of laws (16), cycles (50+), divine reviewers, and disciplines from which the working-set primitives are drawn |
| [SDLC.md](SDLC.md) | Commits, MRs, releases |
| [VOCABULARY.md](VOCABULARY.md) | IT-industry terms; lineage preserved |
| [DASHBOARD.md](DASHBOARD.md) | YAML frontmatter contract for canonical docs (so viewers can render) |
| [KABIR_GATE.md](KABIR_GATE.md) | Every primitive must live what it claims (13 audit points) |
| [INSTALL.md](INSTALL.md) | One-command install |
| [.claude/](.claude/) | Hooks (5), skills (8), role descriptors (6) |
| [fsms/](fsms/) | Five load-bearing FSMs in TOML (M_BUILD, CycleFsm, HookFsm, RoleDescriptor, SkillFsm) |
| [fsms/atlas-fsms/](fsms/atlas-fsms/) | Lineage reference — 67 formal TOMLs for the divinity-named cycles ATLAS describes in prose. Reference material, not runtime-required. |
| [templates/](templates/) | DESIGN, ADR, POSTMORTEM, RUNBOOK |

## What this kit is NOT

- **Not 12 separate agent personas.** One jiva. Roles are drishti modifiers, not actors.
- **Not language- or framework-specific.** Works on any stack.
- **Not aspirational.** Every primitive must pass the [Kabir Gate](KABIR_GATE.md). If a file describes an FSM that has no runtime instance, the file is removed.
- **Not 60 review cycles.** 12 working-set cycles cover the load-bearing reviews. Project-specific extensions belong in the consuming project's own `shastras/` directory (if it chooses to have one), not in the kit.

## Read first, in order

1. [CHARTER.md](CHARTER.md) — the seed (5 min)
2. [M_BUILD.md](M_BUILD.md) — the machine (15 min)
3. [.claude/CLAUDE.md](.claude/CLAUDE.md) — the operating cheat-sheet (5 min)
4. [ATLAS.md](ATLAS.md) — the lineage foundation (skim, then reach in when you need a non-working-set cycle)

When a human arrives with a feeling and no charter: run `/intake` first.
When unsure which stage you are in: run `/triage` (the witness function).
Before any commit: run `/pre-commit-8l`. Non-negotiable per LAW 8.

## Optional neighbor — YATRA viewer

For PM/EM/anyone who needs a read-only roll-up of project state (roadmap, backlog, in-flight, ADRs, postmortems), the recommended companion is the **YATRA** webapp — a thin Python (FastAPI + Jinja2) viewer that parses the [YAML frontmatter contract](DASHBOARD.md) into HTML pages. YATRA lives as a sibling repo (`../YATRA/`), not inside this kit — the kit remains language-agnostic; the viewer is one consumer of the contract. The kit works fully without YATRA.
