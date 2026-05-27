---
type: handover
project: <name>
stage: <seed | discovery | forge | build | service | sunset | decommission>
session_end: YYYY-MM-DDTHH:MM:SSZ
---

# HANDOVER — [Project Name]

> Workspace-only. NOT committed to git. The end-of-session report per LAW 11 / LAW 9.
> When resuming: read this file FIRST, before touching code.

## Where We Are

[1–3 sentences: current state of the codebase and the work.]

## What Was Done This Session

- <commit-sha> — <one-line description>

## What Failed & Why

- <attempt> — <root cause discovered>

## What's Next

1. <next task> {cycle-tag}
2. ...

## Open Questions

- <question that needs human input>

## Key Decisions Made

- <decision> — <reasoning>

## Files Changed

- <path>: <what changed and why>

---

*The `handover-reminder` hook will flag this file at session Stop if missing, or remind you if it's older than 3 days. Run `/handover` to refresh.*
