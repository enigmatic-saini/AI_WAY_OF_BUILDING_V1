#!/usr/bin/env bash
# test_vision_integrity.sh — integrity pin for the north-star (VISION.md) and
# its formal core (VISION_MATH.md). See the gate file KABIR_GATE.md entry 14.
#
# Authored 2026-05-29. VISION.md is the externalized originating-desire of the
# whole journey — the anti-amnesia anchor. The integrity risks this test pins:
#   (a) the north-star is lost or orphaned (undiscoverable from the seed doc);
#   (b) it stops naming its two children or its two crux equations;
#   (c) the formal core's load-bearing claim silently loses its "conjecture"
#       label and becomes an assertion-as-proven (the anti-hypocrisy / LAW 11
#       failure mode).
#
# What it pins:
#   1. VISION.md exists.
#   2. names both children (the two repos it is parent to).
#   3. names crux equation 1 ("composition of all twins").
#   4. names crux equation 2 ("happiness").
#   5. references its formal core file.
#   6. VISION_MATH.md exists.
#   7. the formal core still marks its load-bearing claim as a CONJECTURE.
#   8. discoverable from the seed doc (referenced by CHARTER.md).
#   9. provenance recorded (referenced by the gate file).
#
# Run via: bash tests/test_vision_integrity.sh
# Exit 0 = anchor intact. Exit 1 = at least one integrity property is missing.

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KIT_ROOT="$SCRIPT_DIR/.."

VISION="$KIT_ROOT/VISION.md"
VISION_MATH="$KIT_ROOT/VISION_MATH.md"
CHARTER="$KIT_ROOT/CHARTER.md"
GATE="$KIT_ROOT/KABIR_GATE.md"

PASS=0
FAIL=0

# $1 = description; $2 = file; $3 = literal string that must appear
assert_in() {
  local desc="$1" file="$2" needle="$3"
  if [[ ! -f "$file" ]]; then
    printf 'FAIL  %s (file not found: %s)\n' "$desc" "$file" >&2
    FAIL=$((FAIL + 1)); return
  fi
  if grep -q "$needle" "$file"; then
    printf 'PASS  %s\n' "$desc"; PASS=$((PASS + 1))
  else
    printf 'FAIL  %s (string not found: %s in %s)\n' "$desc" "$needle" "$file" >&2
    FAIL=$((FAIL + 1))
  fi
}

# 1 / 6. existence
for f in "$VISION" "$VISION_MATH"; do
  if [[ -f "$f" ]]; then
    printf 'PASS  exists: %s\n' "$f"; PASS=$((PASS + 1))
  else
    printf 'FAIL  missing: %s\n' "$f" >&2; FAIL=$((FAIL + 1))
  fi
done

# 2-5. north-star content
assert_in "north-star names child 1"              "$VISION"      "AI-PEACE"
assert_in "north-star names child 2"              "$VISION"      "RIAAN"
assert_in "north-star names crux equation 1"      "$VISION"      "composition of all twins"
assert_in "north-star names crux equation 2"      "$VISION"      "happiness"
assert_in "north-star references its formal core" "$VISION"      "VISION_MATH.md"

# 7. the load-bearing claim stays a conjecture (not asserted-as-proven)
assert_in "formal core keeps its load-bearing CONJECTURE label" "$VISION_MATH" "CONJECTURE"

# 8-9. non-orphan: discoverable from the seed + provenance recorded
assert_in "discoverable from the seed doc"       "$CHARTER"     "VISION.md"
assert_in "provenance recorded in the gate file" "$GATE"        "VISION.md"

TOTAL=$((PASS + FAIL))
printf '\n%d/%d north-star integrity assertions passed\n' "$PASS" "$TOTAL"
if [[ "$FAIL" -gt 0 ]]; then
  printf '\nFAILURES: %d. The north-star anchor is degraded.\n' "$FAIL" >&2
  printf 'Restore the missing property. If the load-bearing claim is being\n' >&2
  printf 'promoted from CONJECTURE to a proven theorem, that is a governed\n' >&2
  printf 'event (gate file additions log) — update this test deliberately.\n' >&2
  exit 1
fi
exit 0
