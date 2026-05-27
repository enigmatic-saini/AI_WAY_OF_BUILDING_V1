---
name: commit
description: The engineer's workhorse for landing a change. Runs /pre-commit-8l first; if PASS, drafts a commit message (imperative subject ≤72 chars, body explains why) and runs git commit. If pre-commit-8l fails, refuses to commit and surfaces the failing checks. Use this instead of running git commit directly so the 8L gate cannot be accidentally skipped.
---

# /commit — wrapper around the T₂ guard

4-cycle skill that makes the right path the easy path.

## Procedure

### 1. Run /pre-commit-8l
If FAIL on any of the 12 checks: STOP. Surface the failures. Do NOT commit.

### 2. Draft the commit message
- **Subject:** imperative mood, ≤72 chars. *Why* over *what*.
- **Body** (optional, blank line after subject): explain *why* this change exists. Reference the M_build transition (e.g., "T_loop: next ticket in feature/auth-revamp").
- **Trailers:** if AI-assisted, add `Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>`.

### 3. Stage
Add the specific files. Prefer `git add <files>` over `git add -A` (avoids accidentally staging secrets or large binaries).

### 4. Commit
Run `git commit -m "..."` (use a HEREDOC for multi-line messages). The `block-dangerous-bash` hook will refuse `--no-verify` — fix any pre-commit failure, do not bypass.

## Output template

```
8L:        PASS
SUBJECT:   <imperative, ≤72 chars>
BODY:      <why; references M_build transition>
FILES:     [<path>, ...]
RESULT:    committed <sha> | refused (8L FAIL: <which>)
```

## Anti-patterns

- Drafting the commit message before running `/pre-commit-8l`.
- Using `git add -A` when the diff contains files outside the change.
- `--amend` after a pre-commit hook failure — the commit did NOT happen, so amending touches the PREVIOUS commit. Make a NEW commit after fixing.
