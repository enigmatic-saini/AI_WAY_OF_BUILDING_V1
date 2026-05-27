---
name: dashboard-emit
description: Draft or validate YAML frontmatter for canonical docs (CHARTER, DESIGN, STATUS, TODO, HANDOVER, ADR, POSTMORTEM, RUNBOOK) per the contract in DASHBOARD.md. Use BEFORE writing any new canonical doc, or to validate an existing one. The viewer (e.g., the neighbor YATRA webapp) cannot render a doc with malformed frontmatter — this skill is the discipline that keeps the contract intact.
---

# /dashboard-emit — frontmatter drafter & validator

Companion to [DASHBOARD.md](../../../DASHBOARD.md). Two modes: **emit** (draft a new doc's frontmatter) and **validate** (check an existing doc's frontmatter).

## When to use

- **Before** creating any new canonical doc (CHARTER, DESIGN, STATUS, TODO, HANDOVER, ADR, POSTMORTEM, RUNBOOK).
- **Before** committing changes to a canonical doc — validate the frontmatter still matches its schema.
- During the quarterly Kabir Gate (audit point 13) to verify project-wide compliance.

## Procedure (S profile, 5 cycles)

### 1. Identify the doc type
Match the file path to a contract type:

| Path | Type |
|---|---|
| `CHARTER.md` | `charter` |
| `DESIGN.md` | `design` |
| `STATUS.md` | `status` |
| `TODO.md` | `todo-collection` |
| `HANDOVER.md` | `handover` (workspace-only) |
| `decisions/ADR-*.md` | `adr` |
| `postmortems/INC-*.md` | `postmortem` |
| `runbooks/*.md` | `runbook` |
| anything else | not canonical — frontmatter not required |

### 2. Look up the required fields
See DASHBOARD.md §2 for the full schema per type. The 8 schemas share these structural rules:
- Frontmatter is YAML between two `---` lines at the very top.
- `type:` field is mandatory and must equal one of the 8 enum values.
- `---` close must precede the body.

### 3. Emit or validate

**Emit mode** — produce a frontmatter block for the new doc:
1. Take the doc type's required fields.
2. Fill in known values (project name, current stage from HANDOVER.md, today's date).
3. Leave unknowable fields as a placeholder (`<...>`) for the human/LLM to fill.
4. Prepend the block to the doc body.

**Validate mode** — check an existing doc:
1. Read the first 30 lines.
2. Confirm: line 1 is `---`; `type:` is present and valid; closing `---` is present; all required fields per the type are present and non-empty.
3. Report PASS or list of FAILs with `file:line` references.

### 4. Cross-check (optional)
- If `links:` is set on an ADR, verify the linked TODO/MR/ADR ids parse (they need not exist yet — links can be forward).
- If `stage:` is set, verify it's one of the 7 M_build stages.
- If `cycle:` is set, verify it's one of the 12 working cycles.

### 5. Output template

**Emit mode:**
```
TYPE:    <one of 8>
PATH:    <file path>
FILLED:  [<field>=<value>, ...]
PLACEHOLDERS: [<field>, ...]   (the human must fill before commit)
```

**Validate mode:**
```
PATH:    <file path>
TYPE:    <detected type or "unknown">
RESULT:  PASS  |  FAIL
FAILS:   [<file:line> — <reason>, ...]
```

## Anti-patterns

- **Inventing a new doc type** mid-conversation. The 8 types are the contract; new types require an MR touching DASHBOARD.md + this skill + the YATRA viewer.
- **Omitting `type:`** because "the file path makes it obvious." The viewer parses by frontmatter, not by path. Path is just a discovery hint.
- **Stuffing extra fields the viewer ignores.** The viewer ignores unknown fields, but a polluted frontmatter rots. Keep it minimal.
- **Lying in the frontmatter.** If `updated: 2026-05-19T12:00:00Z` but the body changed yesterday, the viewer trusts the frontmatter. Don't do this; the Kabir Gate will catch it.

## Worked example — drafting a new ADR

Path: `decisions/ADR-0042.md`. Decision: use SQLite over Postgres for V1.

```yaml
---
type: adr
id: ADR-0042
title: SQLite over Postgres for V1
status: PROPOSED
date: 2026-05-19
stage: build
cycle: SMR
links: []
---

# ADR-0042 — SQLite over Postgres for V1

> Status: PROPOSED
> ...
```

After acceptance: change `status:` to `ACCEPTED`, append `links: [TODO#NNN, MR#NNN]`.
