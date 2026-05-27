---
type: todo-collection
project: <name>
stage: <seed | discovery | forge | build | service | sunset | decommission>
updated: YYYY-MM-DDTHH:MM:SSZ
---

# TODO — [Project Name]

> All planned work for the project across any phase(s). Each task has a status, timestamp, description, and inline tags.

## Legend

- `[ ]` pending — no work has started
- `[~]` working — in progress (records start time)
- `[x]` done — completed (records completion time)
- `[d]` deferred — paused with reason

## Format

```
- [status] (YYYY-MM-DD HH:MM) | description {cycle-tag} {owner=name} {p1|p2|p3} {label}
```

Inline tag conventions (parsed by the viewer):

- **Cycle profile**: `{Q}`, `{S}`, `{D}`, `{3x4}` — or a specialist cycle: `{TRG}`, `{8L}`, `{AR}`, `{RR}`, `{SMR}`, `{AHR}`, `{OE}`, `{NEG}`, `{SR}`, `{ES}`, `{LR}`, `{HO}`.
- **Owner**: `{owner=<name>}`.
- **Priority**: `{p1}`, `{p2}`, `{p3}`.
- **Free-form labels**: any other `{...}` (e.g., `{auth}`, `{tech-debt}`).

Pending `[ ]` tasks carry no timestamp until work begins. Do not modify timestamps on existing tasks unless their status changes.

## Tasks

- [ ]                    | <description> {S} {p2}
- [~] (2026-05-19 10:00) | <description> {S} {owner=jane} {p1}
- [x] (2026-05-18 14:30) | <description> {Q}
- [d] (2026-05-15 09:00) | <description> {D} — reason: <why deferred>

## Notes

- Add new tasks under the appropriate priority. Keep the file roughly ordered by status: `[~]` first, then `[ ]` priority-ordered, then `[x]` recent, then `[d]`.
- Run `/triage` if the cycle tag is unclear.
- Run `/handover` at session end to capture in-flight context.
