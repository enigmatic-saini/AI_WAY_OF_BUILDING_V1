#!/usr/bin/env bash
# test_naada_integrity.sh — integrity pin for the perception-layer spec
# (NAADA_SHASTRA.md; stone #5 of VISION.md §5). Companion to the prior spec-
# doc pins (composition + twin-fidelity) and the kit-self-sufficiency pin —
# same anti-hypocrisy / LAW 11 discipline (a doc that claims things must keep
# claiming them — its load-bearing content cannot silently disappear, and its
# honest-conjecture labels cannot silently regress to asserted-as-proven).
#
# Authored 2026-05-30. The perception-layer spec is how alignment (the three
# drifts → 0) becomes *perceptible* as harmony. The integrity risks this test
# pins:
#   (a) the doc is lost or orphaned (undiscoverable from VISION + VISION_MATH);
#   (b) it stops naming its five aesthetic primitives — they are renamings of
#       existing kit structure and must remain present as the perception
#       layer's vocabulary;
#   (c) the central unproven conjecture (CONJ 5.1) silently loses its
#       CONJECTURE label and becomes asserted-as-proven — the load-bearing
#       LAW 11 failure mode this pin's check 4 catches;
#   (d) the two PROVED failure modes (deceptive beauty / ugly truth) silently
#       lose their PROVED label, undermining the bound on the conjecture;
#   (e) the SPEC label is silently dropped — this doc is the perception spec;
#       there is by design no stone #6 "build the perception instrument."
#
# Run via: bash tests/test_naada_integrity.sh
# Exit 0 = anchor intact. Exit 1 = at least one property is missing.

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KIT_ROOT="$SCRIPT_DIR/.."

DOC="$KIT_ROOT/NAADA_SHASTRA.md"
VISION="$KIT_ROOT/VISION.md"
VISION_MATH="$KIT_ROOT/VISION_MATH.md"
GATE="$KIT_ROOT/KABIR_GATE.md"

PASS=0
FAIL=0

# $1 = description; $2 = file; $3 = literal string that must appear
# Uses grep -qF (fixed-string) so markdown / bracket-paren syntax in the
# needle is not parsed as a regex character class.
assert_in() {
  local desc="$1" file="$2" needle="$3"
  if [[ ! -f "$file" ]]; then
    printf 'FAIL  %s (file not found: %s)\n' "$desc" "$file" >&2
    FAIL=$((FAIL + 1)); return
  fi
  if grep -qF "$needle" "$file"; then
    printf 'PASS  %s\n' "$desc"; PASS=$((PASS + 1))
  else
    printf 'FAIL  %s (string not found: %s in %s)\n' "$desc" "$needle" "$file" >&2
    FAIL=$((FAIL + 1))
  fi
}

# 1. existence
if [[ -f "$DOC" ]]; then
  printf 'PASS  exists: %s\n' "$DOC"; PASS=$((PASS + 1))
else
  printf 'FAIL  missing: %s\n' "$DOC" >&2; FAIL=$((FAIL + 1))
fi

# 2. the five aesthetic primitives are named (they rename existing kit structure
#    and must remain present as the perception-layer vocabulary).
#    Needles use the DEF labels which are unique to this doc.
assert_in "aesthetic primitive 1 (seven-stage scale) defined"      "$DOC" "DEF C.1"
assert_in "aesthetic primitive 2 (project's melodic mode) defined" "$DOC" "DEF C.2"
assert_in "aesthetic primitive 3 (cycle-rhythm) defined"           "$DOC" "DEF C.3"
assert_in "aesthetic primitive 4 (originating feeling-state) defined" "$DOC" "DEF C.4"
assert_in "aesthetic primitive 5 (achieved essence) defined"       "$DOC" "DEF C.5"

# 3. the perception functional + coherent perception are defined
assert_in "perception functional defined (DEF D.1)"                "$DOC" "DEF D.1"
assert_in "coherent perception defined (DEF D.2)"                  "$DOC" "DEF D.2"

# 4. the central unproven conjecture stays a CONJECTURE (the load-bearing
#    LAW 11 guard — the doc must NOT silently promote it to a theorem).
assert_in "central aesthetic claim labeled CONJECTURE 5.1"         "$DOC" "CONJECTURE 5.1"
assert_in "central claim kept marked CONJECTURE (label present)"   "$DOC" "CONJECTURE"

# 5. the two PROVED failure modes are present with their PROVED label
assert_in "failure mode 1 (deceptive beauty) named"                "$DOC" "Deceptive beauty"
assert_in "failure mode 2 (ugly truth) named"                      "$DOC" "Ugly truth"
assert_in "failure modes keep their PROVED label"                  "$DOC" "PROVED"

# 6. SPEC label kept — the empirical aesthetic is by-design not software-buildable
assert_in "doc labels itself a spec (no stone #6 'build the instrument')" "$DOC" "no stone #6"

# 7. cosmic-scale formalization of the founder's wish kept (the bridge between
#    metric and aesthetic readings is the load-bearing claim of §F).
#    Use a Sanskrit-free unique anchor from §F: the phrase "lifted to cosmic
#    scale" appears uniquely in §F where CONJ 5.1 is stated cosmically.
assert_in "cosmic-scale reading present (CONJ 5.1 at cosmic scale)" "$DOC" "lifted to cosmic scale"

# 8. discoverable from VISION (the LAID status row points to this doc)
assert_in "VISION.md stone #5 row points to the doc"               "$VISION" "NAADA_SHASTRA.md"

# 9. bridged from VISION_MATH §3 (DEF 3.3 cross-refs the perception layer)
assert_in "VISION_MATH §3 bridges to the perception layer"         "$VISION_MATH" "NAADA_SHASTRA.md"

# 10. provenance recorded in the gate file
assert_in "provenance recorded in the gate file"                   "$GATE" "NAADA_SHASTRA.md"

TOTAL=$((PASS + FAIL))
printf '\n%d/%d perception-layer integrity assertions passed\n' "$PASS" "$TOTAL"
if [[ "$FAIL" -gt 0 ]]; then
  printf '\nFAILURES: %d. The perception-layer anchor is degraded.\n' "$FAIL" >&2
  printf 'Restore the missing property. If the central conjecture is being\n' >&2
  printf 'promoted from CONJECTURE to a proven theorem, that is a governed event\n' >&2
  printf '(gate-file additions log) — update this test deliberately.\n' >&2
  exit 1
fi
exit 0
