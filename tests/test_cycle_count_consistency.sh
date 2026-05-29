#!/usr/bin/env bash
# test_cycle_count_consistency.sh — pin the kit's working-set cycle count
# across all files that claim it.
#
# Authored 2026-05-28 as integrity-protection: the kit claims "15 working-set
# cycles" in at least 4 separate files; any future PR that updates one without
# the others creates silent drift. This test fails loudly when the claimed
# counts disagree.
#
# Surfaced as an open question in the kit HANDOVER.md (post-propagation
# session 2026-05-28 What-Next): "Should there be a 'promotion test' for
# working-set cycles?" This test is the answer.
#
# What it pins:
#   1. CYCLES.md: count of `^## [0-9]+\.` entries (the actual cycle definitions)
#   2. CYCLES.md preamble: "Fifteen standalone cycles" claim
#   3. CYCLES.md "How to read this file": "The 15 cycles cover" claim
#   4. CYCLES.md graduation criteria: "15-cycle catalog" reference
#   5. VOCABULARY.md: "The 15 working-set cycles" claim
#   6. Kit gate file section-12 audit point #10 title: "15 working cycles"
#   7. Kit gate file section-12 audit point #10 verify-command claim: "is 15"
#   8. .claude/CLAUDE.md "Where to look when" table: "15 standalone"
#   9. Composed cycle-sets: 2 (HSC + T4R) in CYCLES.md
#  10. CHARTER.md "What this kit IS": "15 working-set cycles" (added 2026-05-29)
#
# When the cycle catalog grows (16, 17, ...) update ALL of these consistently.
# This test will surface the discrepancy if any single file lags behind.
#
# IMPLEMENTATION NOTE: prior versions of this test used a bash adjacency-
# concatenation workaround for the gate-file basename because vocabulary-lint
# caught the lineage term in the filename. HK-NG-15 (2026-05-28) added a
# path-stripping pre-pass to vocabulary-lint that recognises filesystem-path
# references and exempts them from the divine-name scan. The workaround is
# no longer needed; this test now uses the literal filename.
#
# Run via: bash tests/test_cycle_count_consistency.sh
# Exit 0 = all assertions align. Exit 1 = at least one assertion failed.

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KIT_ROOT="$SCRIPT_DIR/.."

CYCLES_MD="$KIT_ROOT/CYCLES.md"
VOCAB_MD="$KIT_ROOT/VOCABULARY.md"
GATE_MD="$KIT_ROOT/KABIR_GATE.md"
CLAUDE_MD="$KIT_ROOT/.claude/CLAUDE.md"
CHARTER_MD="$KIT_ROOT/CHARTER.md"

# Check all required files exist before any assertion.
for f in "$CYCLES_MD" "$VOCAB_MD" "$GATE_MD" "$CLAUDE_MD" "$CHARTER_MD"; do
  if [[ ! -f "$f" ]]; then
    printf 'FAIL: required file not found: %s\n' "$f" >&2
    exit 1
  fi
done

PASS=0
FAIL=0

# $1 = description; $2 = expected; $3 = actual
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

# === Source of truth: count of `^## N.` entries in CYCLES.md ===
# This is the actual cycle definitions; every other claim about cycle count
# must match this number.
ACTUAL_CYCLE_COUNT=$(grep -cE '^## [0-9]+\.' "$CYCLES_MD")
printf '\nSource of truth: CYCLES.md contains %d numbered cycle entries.\n\n' "$ACTUAL_CYCLE_COUNT"

# 1. CYCLES.md preamble claim ("Fifteen standalone cycles" or similar)
PREAMBLE_NUM_WORD=$(grep -oE 'Fourteen|Fifteen|Sixteen|Seventeen|Eighteen|Nineteen|Twenty' "$CYCLES_MD" | head -1)
# Map number-word back to digit for comparison
case "$PREAMBLE_NUM_WORD" in
  Fourteen)   PREAMBLE_NUM=14 ;;
  Fifteen)    PREAMBLE_NUM=15 ;;
  Sixteen)    PREAMBLE_NUM=16 ;;
  Seventeen)  PREAMBLE_NUM=17 ;;
  Eighteen)   PREAMBLE_NUM=18 ;;
  Nineteen)   PREAMBLE_NUM=19 ;;
  Twenty)     PREAMBLE_NUM=20 ;;
  *)          PREAMBLE_NUM=0 ;;
esac
assert_eq "CYCLES.md preamble number-word matches actual" "$ACTUAL_CYCLE_COUNT" "$PREAMBLE_NUM"

# 2. CYCLES.md "How to read this file": "The N cycles cover"
HOW_TO_READ_NUM=$(grep -oE 'The [0-9]+ cycles cover' "$CYCLES_MD" | head -1 | grep -oE '[0-9]+')
assert_eq "CYCLES.md 'How to read' cycle count matches actual" "$ACTUAL_CYCLE_COUNT" "${HOW_TO_READ_NUM:-0}"

# 3. CYCLES.md graduation-criteria reference: "N-cycle catalog"
GRAD_CRITERIA_NUM=$(grep -oE '[0-9]+-cycle catalog' "$CYCLES_MD" | head -1 | grep -oE '[0-9]+')
assert_eq "CYCLES.md graduation-criteria '-cycle catalog' matches actual" "$ACTUAL_CYCLE_COUNT" "${GRAD_CRITERIA_NUM:-0}"

# 4. VOCABULARY.md: "The N working-set cycles"
VOCAB_NUM=$(grep -oE 'The [0-9]+ working-set cycles' "$VOCAB_MD" | head -1 | grep -oE '[0-9]+')
assert_eq "VOCABULARY.md 'The N working-set cycles' matches actual" "$ACTUAL_CYCLE_COUNT" "${VOCAB_NUM:-0}"

# 5. Gate file section-12 audit point #10 title: "N working cycles"
GATE_TITLE_NUM=$(grep -oE '^### 10\. The [0-9]+ working cycles' "$GATE_MD" | head -1 | grep -oE '[0-9]+' | tail -1)
assert_eq "Gate file section-12 #10 title matches actual" "$ACTUAL_CYCLE_COUNT" "${GATE_TITLE_NUM:-0}"

# 6. Gate file section-12 audit point #10 verify command: "is N"
# The relevant line says "count of `^## [0-9]+\.` entries in CYCLES.md is N"
GATE_VERIFY_NUM=$(grep -oE 'entries in CYCLES\.md is [0-9]+' "$GATE_MD" | head -1 | grep -oE '[0-9]+')
assert_eq "Gate file section-12 #10 verify-command count matches actual" "$ACTUAL_CYCLE_COUNT" "${GATE_VERIFY_NUM:-0}"

# 7. .claude/CLAUDE.md "Where to look when" table: "N standalone"
CLAUDE_NUM=$(grep -oE '[0-9]+ standalone \+ [0-9]+ composed' "$CLAUDE_MD" | head -1 | grep -oE '^[0-9]+')
assert_eq ".claude/CLAUDE.md 'N standalone' matches actual" "$ACTUAL_CYCLE_COUNT" "${CLAUDE_NUM:-0}"

# 8. CHARTER.md "What this kit IS" list: "N working-set cycles"
# Coverage added 2026-05-29: CHARTER had drifted to "12 working-set cycles"
# (an untested anti-hypocrisy / LAW 11 gap surfaced in the kit HANDOVER).
CHARTER_NUM=$(grep -oE '[0-9]+ working-set cycles' "$CHARTER_MD" | head -1 | grep -oE '[0-9]+')
assert_eq "CHARTER.md 'N working-set cycles' matches actual" "$ACTUAL_CYCLE_COUNT" "${CHARTER_NUM:-0}"

# === Composed cycle-sets: HSC + T4R; must be exactly 2 ===
EXPECTED_COMPOSED=2
ACTUAL_COMPOSED=$(grep -cE '^### `(HSC|T4R)`' "$CYCLES_MD")
assert_eq "CYCLES.md composed cycle-sets (HSC, T4R) count" "$EXPECTED_COMPOSED" "$ACTUAL_COMPOSED"

# .claude/CLAUDE.md composed-cycle-set count: "2 composed cycle-sets"
# Extract: match the full "N standalone + M composed" string, then take the
# second (trailing) digit sequence via tail -1. Using `$` anchor fails because
# the matched substring ends with "composed", not a digit.
CLAUDE_COMPOSED_NUM=$(grep -oE '[0-9]+ standalone \+ [0-9]+ composed' "$CLAUDE_MD" | head -1 | grep -oE '[0-9]+' | tail -1)
assert_eq ".claude/CLAUDE.md composed-cycle-set count matches CYCLES.md" "$EXPECTED_COMPOSED" "${CLAUDE_COMPOSED_NUM:-0}"

# === Summary ===

TOTAL=$((PASS + FAIL))
printf '\n%d/%d cycle-count consistency assertions passed\n' "$PASS" "$TOTAL"
if [[ "$FAIL" -gt 0 ]]; then
  printf '\nFAILURES: %d. The kit claims different cycle counts in different files.\n' "$FAIL" >&2
  printf 'To fix: identify the correct count (CYCLES.md ^## N. is the source of truth)\n' >&2
  printf 'and update ALL affected files. See test source for the list of files checked.\n' >&2
  exit 1
fi
exit 0
