#!/usr/bin/env bash
# test_primitive_count_consistency.sh — pin the kit's primitive counts
# (skills, roles, hooks, M_build stages) across all files that claim them.
#
# Authored 2026-05-28 as integrity-protection. Companion to
# test_cycle_count_consistency.sh — same pattern, different primitive classes.
# Surfaced as next-session candidate in the prior HANDOVER What-Next.
#
# Each primitive class has:
#   - A source-of-truth file/directory enumeration (counts what actually exists)
#   - Multiple claim locations across kit files (CLAUDE.md, gate file,
#     stage-tip.sh, M_BUILD.md for stages)
# This test fails loudly if any claim disagrees with the source of truth.
#
# Sections:
#   1. SKILLS         (source: dirs in .claude/skills/)
#   2. ROLES          (source: .md files in .claude/agents/)
#   3. HOOKS          (source: .sh files in .claude/hooks/)
#   4. M_BUILD STAGES (source: ### S[0-9] headers in M_BUILD.md)
#
# IMPLEMENTATION NOTE: prior versions of this test used a bash adjacency-
# concatenation workaround for the gate-file basename. HK-NG-15 (2026-05-28)
# added a path-stripping pre-pass to vocabulary-lint that recognises
# filesystem-path references and exempts them from the divine-name scan;
# the workaround is no longer needed.
#
# Run via: bash tests/test_primitive_count_consistency.sh
# Exit 0 = all assertions align. Exit 1 = at least one failed.

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KIT_ROOT="$SCRIPT_DIR/.."

CLAUDE_MD="$KIT_ROOT/.claude/CLAUDE.md"
GATE_MD="$KIT_ROOT/KABIR_GATE.md"
STAGE_TIP_SH="$KIT_ROOT/.claude/hooks/stage-tip.sh"
MBUILD_MD="$KIT_ROOT/M_BUILD.md"

# Pre-flight: all required files exist.
for f in "$CLAUDE_MD" "$GATE_MD" "$STAGE_TIP_SH" "$MBUILD_MD"; do
  if [[ ! -f "$f" ]]; then
    printf 'FAIL: required file not found: %s\n' "$f" >&2
    exit 1
  fi
done

PASS=0
FAIL=0

assert_eq() {
  local desc="$1" expected="$2" actual="$3"
  if [[ "$expected" == "$actual" ]]; then
    printf 'PASS  %s (= %s)\n' "$desc" "$actual"
    PASS=$((PASS + 1))
  else
    printf 'FAIL  %s (expected %s, got %s)\n' "$desc" "$expected" "$actual"
    FAIL=$((FAIL + 1))
  fi
}

# ============================================================================
# Section 1: SKILLS
# ============================================================================
# Source of truth: directories under .claude/skills/ (each contains SKILL.md)

ACTUAL_SKILLS=$(ls -d "$KIT_ROOT/.claude/skills/"*/ 2>/dev/null | wc -l | tr -d ' ')
printf '\n--- SKILLS ---\nSource of truth: %d directories in .claude/skills/\n' "$ACTUAL_SKILLS"

# Claim 1: CLAUDE.md "## The skills (N — ...)" section heading
CLAUDE_SKILLS_HEADING=$(grep -oE 'The skills \([0-9]+ ' "$CLAUDE_MD" | head -1 | grep -oE '[0-9]+')
assert_eq "CLAUDE.md 'The skills (N ...)' heading" "$ACTUAL_SKILLS" "${CLAUDE_SKILLS_HEADING:-0}"

# Claim 2: CLAUDE.md hooks-table cell "N skills + M roles"
CLAUDE_SKILLS_TABLE=$(grep -oE '[0-9]+ skills \+ [0-9]+ roles' "$CLAUDE_MD" | head -1 | grep -oE '^[0-9]+')
assert_eq "CLAUDE.md 'N skills + M roles' table cell" "$ACTUAL_SKILLS" "${CLAUDE_SKILLS_TABLE:-0}"

# Claim 3: stage-tip.sh comment "stages + N skills + M roles"
TIP_SKILLS=$(grep -oE 'stages \+ [0-9]+ skills' "$STAGE_TIP_SH" | head -1 | grep -oE '[0-9]+')
assert_eq "stage-tip.sh 'stages + N skills' comment" "$ACTUAL_SKILLS" "${TIP_SKILLS:-0}"

# Claim 4: gate file section-12 audit point #7 title "### 7. The N skills"
GATE_SKILLS=$(grep -oE '^### 7\. The [0-9]+ skills' "$GATE_MD" | head -1 | grep -oE '[0-9]+' | tail -1)
assert_eq "Gate file section-12 #7 'The N skills' title" "$ACTUAL_SKILLS" "${GATE_SKILLS:-0}"

# ============================================================================
# Section 2: ROLES
# ============================================================================
# Source of truth: .md files in .claude/agents/

ACTUAL_ROLES=$(ls "$KIT_ROOT/.claude/agents/"*.md 2>/dev/null | wc -l | tr -d ' ')
printf '\n--- ROLES ---\nSource of truth: %d .md files in .claude/agents/\n' "$ACTUAL_ROLES"

# Claim 1: CLAUDE.md "## The roles (N — ...)" section heading
CLAUDE_ROLES_HEADING=$(grep -oE 'The roles \([0-9]+ ' "$CLAUDE_MD" | head -1 | grep -oE '[0-9]+')
assert_eq "CLAUDE.md 'The roles (N ...)' heading" "$ACTUAL_ROLES" "${CLAUDE_ROLES_HEADING:-0}"

# Claim 2: CLAUDE.md "N skills + M roles" table cell (M is the role count)
CLAUDE_ROLES_TABLE=$(grep -oE '[0-9]+ skills \+ [0-9]+ roles' "$CLAUDE_MD" | head -1 | grep -oE '[0-9]+' | tail -1)
assert_eq "CLAUDE.md 'N skills + M roles' table cell" "$ACTUAL_ROLES" "${CLAUDE_ROLES_TABLE:-0}"

# Claim 3: gate file section-12 audit point #8 title "### 8. The N roles"
GATE_ROLES=$(grep -oE '^### 8\. The [0-9]+ roles' "$GATE_MD" | head -1 | grep -oE '[0-9]+' | tail -1)
assert_eq "Gate file section-12 #8 'The N roles' title" "$ACTUAL_ROLES" "${GATE_ROLES:-0}"

# ============================================================================
# Section 3: HOOKS
# ============================================================================
# Source of truth: .sh files in .claude/hooks/

ACTUAL_HOOKS=$(ls "$KIT_ROOT/.claude/hooks/"*.sh 2>/dev/null | wc -l | tr -d ' ')
printf '\n--- HOOKS ---\nSource of truth: %d .sh files in .claude/hooks/\n' "$ACTUAL_HOOKS"

# Claim 1: CLAUDE.md section heading "## The non-negotiables (N hooks, ...)"
CLAUDE_HOOKS=$(grep -oE 'non-negotiables \([0-9]+ hooks' "$CLAUDE_MD" | head -1 | grep -oE '[0-9]+')
assert_eq "CLAUDE.md 'non-negotiables (N hooks ...)' heading" "$ACTUAL_HOOKS" "${CLAUDE_HOOKS:-0}"

# Claim 2: gate file section-12 audit point #6 title "### 6. The N hooks"
GATE_HOOKS=$(grep -oE '^### 6\. The [0-9]+ hooks' "$GATE_MD" | head -1 | grep -oE '[0-9]+' | tail -1)
assert_eq "Gate file section-12 #6 'The N hooks' title" "$ACTUAL_HOOKS" "${GATE_HOOKS:-0}"

# ============================================================================
# Section 4: M_BUILD STAGES
# ============================================================================
# Source of truth: count of `^### S[0-9] ` headers in M_BUILD.md

ACTUAL_STAGES=$(grep -cE '^### S[0-9] ' "$MBUILD_MD")
printf '\n--- M_BUILD STAGES ---\nSource of truth: %d "### SN " headers in M_BUILD.md\n' "$ACTUAL_STAGES"

# Map digit count to number-word for prose claims
case "$ACTUAL_STAGES" in
  5) STAGES_WORD="five" ;;
  6) STAGES_WORD="six" ;;
  7) STAGES_WORD="seven" ;;
  8) STAGES_WORD="eight" ;;
  9) STAGES_WORD="nine" ;;
  *) STAGES_WORD="?" ;;
esac

# Claim 1: M_BUILD.md preamble "N stages" number-word
MBUILD_WORD=$(grep -oE '(five|six|seven|eight|nine) stages' "$MBUILD_MD" | head -1 | awk '{print $1}')
assert_eq "M_BUILD.md preamble 'N stages' number-word" "$STAGES_WORD" "${MBUILD_WORD:-?}"

# Claim 2: CLAUDE.md "N stages: Seed -> ..." prose
CLAUDE_STAGES_WORD=$(grep -oE '(five|six|seven|eight|nine) stages: Seed' "$CLAUDE_MD" | head -1 | awk '{print $1}')
assert_eq "CLAUDE.md 'N stages: Seed -> ...' number-word" "$STAGES_WORD" "${CLAUDE_STAGES_WORD:-?}"

# Claim 3: stage-tip.sh "one machine, N stages" comment
TIP_STAGES_WORD=$(grep -oE 'one machine, (five|six|seven|eight|nine) stages' "$STAGE_TIP_SH" | head -1 | awk '{print $3}')
assert_eq "stage-tip.sh 'one machine, N stages' number-word" "$STAGES_WORD" "${TIP_STAGES_WORD:-?}"

# Claim 4: gate file section-12 audit point #1 "Claims: N states, ..."
GATE_STAGES=$(grep -oE '\*\*Claims:\*\* [0-9]+ states' "$GATE_MD" | head -1 | grep -oE '[0-9]+')
assert_eq "Gate file section-12 #1 'N states' claim" "$ACTUAL_STAGES" "${GATE_STAGES:-0}"

# Claim 5: stage-tip.sh explicit stage-chain (S0 ... -> S6 ...) count
# Count "S<digit> <lowercase-word>" tokens in the chain — one per stage
TIP_CHAIN_COUNT=$(grep -oE 'S[0-9] [a-z]+' "$STAGE_TIP_SH" | wc -l | tr -d ' ')
assert_eq "stage-tip.sh stage-chain explicit count (S0 ... S<N-1>)" "$ACTUAL_STAGES" "${TIP_CHAIN_COUNT:-0}"

# ============================================================================
# Summary
# ============================================================================

TOTAL=$((PASS + FAIL))
printf '\n%d/%d primitive-count consistency assertions passed\n' "$PASS" "$TOTAL"
if [[ "$FAIL" -gt 0 ]]; then
  printf '\nFAILURES: %d. The kit claims different primitive counts in different files.\n' "$FAIL" >&2
  printf 'To fix: identify the correct count (source-of-truth is the filesystem/heading enumeration)\n' >&2
  printf 'and update ALL claim locations. See test source for the list of files checked per primitive class.\n' >&2
  exit 1
fi
exit 0
