# Install — AI_WAY_OF_BUILDING_V1

> One command. Any product repo. Any language. Any stack.

## Prerequisites

- `git`
- `bash`
- `jq` (recommended; hooks fall back to grep if absent)
- Claude Code

## One-command vendoring

In your product repo:

```bash
git submodule add <gitlab-url>/AI_WAY_OF_BUILDING_V1.git AI_WAY_OF_BUILDING_V1 \
  && ln -s AI_WAY_OF_BUILDING_V1/.claude .claude \
  && grep -qxF 'HANDOVER.md' .gitignore || echo 'HANDOVER.md' >> .gitignore
```

That's it. Open the repo in Claude Code; the kit auto-loads.

## What the install does

1. Vendors the kit at a pinned commit (submodule).
2. Symlinks the kit's `.claude/` into the repo root so Claude Code picks up hooks, skills, and roles.
3. Adds `HANDOVER.md` to `.gitignore` (the session handover file is workspace-only per LAW 9).

## Verify the install

After install, run:

```bash
# 1. Hooks are wired
jq '.hooks' .claude/settings.json

# 2. All 6 hook scripts exist and are executable
ls -la .claude/hooks/
test -x .claude/hooks/block-dangerous-bash.sh && echo "block-dangerous-bash OK"
test -x .claude/hooks/secret-scan.sh && echo "secret-scan OK"
test -x .claude/hooks/vocabulary-lint.sh && echo "vocabulary-lint OK"
test -x .claude/hooks/frontmatter-check.sh && echo "frontmatter-check OK"
test -x .claude/hooks/handover-reminder.sh && echo "handover-reminder OK"
test -x .claude/hooks/stage-tip.sh && echo "stage-tip OK"

# 3. All 9 skills present
ls .claude/skills/   # expect: commit dashboard-emit handover incident intake mr pre-commit-8l release triage

# 4. All 6 roles present
ls .claude/agents/   # expect: analyst.md architect.md engineer.md qa.md reviewer.md security.md

# 5. All 5 FSMs present
ls AI_WAY_OF_BUILDING_V1/fsms/   # expect: CycleFsm.toml HookFsm.toml M_BUILD.toml RoleDescriptor.toml SkillFsm.toml
```

If any check fails: re-clone, re-link, file an issue.

## First-session walkthrough

1. Open the repo in Claude Code.
2. The `stage-tip` hook fires on your first prompt — it lists M_build stages and the 9 skills.
3. Run `/triage` to identify which stage applies to your work.
4. Read [M_BUILD.md](M_BUILD.md) (15 min). It is the ground truth.
5. Read [.claude/CLAUDE.md](.claude/CLAUDE.md) (5 min). It is the cheat sheet.
6. Begin work. Before any `git commit`, the `/pre-commit-8l` skill is your gate.

## Update the kit

```bash
cd AI_WAY_OF_BUILDING_V1
git pull origin main
cd ..
```

If a change broke a downstream contract (e.g., a hook signature changed), the maintainer publishes a note in the kit's release notes. Read it before merging the update.

## Uninstall

```bash
git submodule deinit AI_WAY_OF_BUILDING_V1
git rm -f AI_WAY_OF_BUILDING_V1
rm -f .claude
rm -rf .git/modules/AI_WAY_OF_BUILDING_V1
```

(The symlink at `.claude` is removed; the kit's directory is removed from the working tree; the submodule registration is cleaned up.)

## Troubleshooting

### A hook is firing too aggressively

Open the hook script. Read the reason it printed to stderr. Most likely:
- `block-dangerous-bash` — you tried a destructive command. Fix the command.
- `secret-scan` — your content contains a secret pattern. Move secrets to env vars.
- `vocabulary-lint` — a divine name in a code path. Use the IT term from [VOCABULARY.md](VOCABULARY.md).

If you believe the hook is wrong, file an issue against the kit. **Do not** add `--no-verify` to bypass; that's the very failure mode the kit defeats.

### `/pre-commit-8l` failing on a check that doesn't apply

E.g., a UI-consistency check on a backend-only commit.
- Output template allows `N/A` per check.
- If the check is structurally inapplicable to your project (e.g., a CLI tool with no UI), document the always-N/A in your project's DESIGN.md §7.

### The kit feels too heavy

Run `/triage`. Pick a smaller cycle profile (`Q` instead of `D`). The 12-cycle engine is paramterized by profile — most commits should be `Q` or `S`.
