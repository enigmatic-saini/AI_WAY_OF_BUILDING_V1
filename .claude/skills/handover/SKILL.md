---
name: handover
description: Write or update HANDOVER.md at the end of a working session per LAW 9. Captures Where-We-Are, What-Was-Done, What-Failed, What-Next, Open-Questions, Key-Decisions, Files-Changed. Use at session end; the Stop hook will remind you if you forget. Output is a workspace doc (NOT committed to git).
---

# /handover — the Sanjay narration

End-of-session report. 4 cycles.

## When to use

- End of every working session.
- After completing a meaningful chunk of work and pausing.
- When the Stop hook reminds you.

## Procedure

### 1. What was done
Bulleted list of commits + 1-line description each.

### 2. What failed and why
Failed attempts, diagnosed root causes, dead ends. Without this, future-you repeats the mistake.

### 3. What's next
Ordered list of next tasks, with cycle tags if known.

### 4. Open questions
Anything unresolved that needs investigation or human input.

## Output template

Write to `<repo>/HANDOVER.md` (overwrite or update):

```markdown
# HANDOVER — [Project Name]
> Last session: YYYY-MM-DD HH:MM
> Current M_build stage: <stage>

## Where We Are
[1–3 sentences: current state of the codebase and the work.]

## What Was Done This Session
- <commit-sha> — <one-line description>
- ...

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
```

## Rules

- HANDOVER.md is **workspace-only**. Add to `.gitignore`.
- Update at the *end* of every session, not during.
- When resuming: read HANDOVER.md *first*, before touching code.
- If HANDOVER.md is more than 3 days old, the `handover-reminder` hook will flag it. Run `/handover` to refresh.
