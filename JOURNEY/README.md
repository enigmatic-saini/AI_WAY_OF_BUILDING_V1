# JOURNEY — mid-session capture (kit-level)

> Where the moments live that would otherwise evaporate between artifacts.

This folder holds blog-style journal entries written by the `guru` role via the `/camera` skill. Each file captures **one moment** — a precedent that surfaced, a decision the founder should know about, a near-miss caught (Sita catch mid-edit, MID veto, KBD veto), an important detail that emerged in prose during a task.

## What lives here (and what doesn't)

JOURNEY captures what the kit's other persistence channels do not:

| Channel | What it preserves | When it fires |
|---|---|---|
| **CYCLE_SET / *_PASS** | Deliberation artifacts (the reasoning) | Per cycle / deep pass |
| **HANDOVER.md** | End-of-session synthesis | At session end |
| **KABIR_GATE additions log** | Primitive provenance (what was added/changed) | At governance events |
| **JOURNEY/<...>.md** (this folder) | **Mid-session moments — the running stream** | Whenever an important detail surfaces |

## File naming

`<YYYY-MM-DD>T<HH-MM>-<slug>.md`

Example: `2026-05-30T21-00-guru-camera-genesis.md`

One file per moment. Granularity is part of the searchability.

## Format

Blog-style narrative prose — **no frontmatter**. The form is part of the discipline; canonical-doc frontmatter belongs to the 8-type contract per [DASHBOARD.md](../DASHBOARD.md), not here.

The skeleton each entry follows is documented in [.claude/skills/camera/SKILL.md](../.claude/skills/camera/SKILL.md). The mandatory section is **"What I Want You To Notice"** — the direct-address paragraph that closes the gap GURU was created to close.

## Governance status

- **Kit-level JOURNEY/** (this folder): committed to git as part of the kit's lineage, alongside the kit-level HANDOVER.md.
- **Project-level JOURNEY/** (in consuming projects): per-project preference; default committed since it IS the consuming project's lived journey. A project that prefers workspace-only journaling may add `JOURNEY/` to its `.gitignore`.

## Provenance

Folder convention introduced 2026-05-30 night per [KABIR_GATE.md additions log entry 21](../KABIR_GATE.md). The role + skill + hook that populate it are documented in:

- [.claude/agents/guru.md](../.claude/agents/guru.md) — the role
- [.claude/skills/camera/SKILL.md](../.claude/skills/camera/SKILL.md) — the skill
- [.claude/hooks/camera-reminder.sh](../.claude/hooks/camera-reminder.sh) — the backstop hook
