#!/usr/bin/env bash
# test_q_rubric_trinary_consistency.sh — integrity pin for Q_RUBRIC.md's
# binary-as-projection framing.
#
# Authored 2026-05-29 (see the gate file KABIR_GATE.md additions log entry 13).
# The capability rubric states a binary foundational target while the kit's
# drift math is trinary. Entry 13 added a subsection to Q_RUBRIC.md that names
# the binary as the projection of the trinary, so the rubric is honest about
# its scope. The integrity risk this test pins: a future edit silently strips
# that framing and the rubric reverts to presenting the binary as the whole
# truth (re-hiding the desire term).
#
# What it pins:
#   1. Q_RUBRIC.md exists.
#   2. It names the binary-as-projection relationship ("binary projection").
#   3. It names the trinary it projects from ("trinary").
#
# This pin is intentionally scoped to expire: when the desire signal becomes a
# scored reading (J0.6+/J2+), the rubric may legitimately go trinary — at which
# point entry 13's reversibility clause governs, and this test is superseded.
#
# Run via: bash tests/test_q_rubric_trinary_consistency.sh
# Exit 0 = framing intact. Exit 1 = the framing is missing.

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KIT_ROOT="$SCRIPT_DIR/.."
RUBRIC_MD="$KIT_ROOT/Q_RUBRIC.md"

PASS=0
FAIL=0

# $1 = description; $2 = literal string that must appear in the rubric
assert_contains() {
  local desc="$1" needle="$2"
  if grep -q "$needle" "$RUBRIC_MD"; then
    printf 'PASS  %s\n' "$desc"
    PASS=$((PASS + 1))
  else
    printf 'FAIL  %s (string not found: %s)\n' "$desc" "$needle" >&2
    FAIL=$((FAIL + 1))
  fi
}

if [[ -f "$RUBRIC_MD" ]]; then
  printf 'PASS  Q_RUBRIC.md exists\n'
  PASS=$((PASS + 1))
else
  printf 'FAIL  Q_RUBRIC.md not found: %s\n' "$RUBRIC_MD" >&2
  printf '\n1 failure. Cannot check framing.\n' >&2
  exit 1
fi

assert_contains "Q_RUBRIC.md names the binary-as-projection relationship" "binary projection"
assert_contains "Q_RUBRIC.md names the trinary it projects from"          "trinary"

TOTAL=$((PASS + FAIL))
printf '\n%d/%d framing assertions passed\n' "$PASS" "$TOTAL"
if [[ "$FAIL" -gt 0 ]]; then
  printf '\nFAILURES: %d. The rubric no longer declares itself the binary\n' "$FAIL" >&2
  printf 'projection of the trinary. Restore the framing (see Q_RUBRIC.md\n' >&2
  printf 'section 2b), or if the rubric is intentionally going trinary, follow\n' >&2
  printf 'the reversibility clause in the gate file additions log entry 13.\n' >&2
  exit 1
fi
exit 0
