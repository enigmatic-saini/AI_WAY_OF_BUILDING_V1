#!/usr/bin/env bash
# test_twin_fidelity_integrity.sh — integrity pin for TWIN_FIDELITY_SHASTRA.md
# (stone #2 of VISION.md §5). Companion to test_composition_shastra_integrity.sh
# and test_vision_integrity.sh — same anti-hypocrisy / LAW 11 discipline.
#
# Authored 2026-05-30. TWIN_FIDELITY_SHASTRA.md is the operational spec for
# the boundary axis of a twin (δ_twin between T and its referent R), distinct
# from the internal-alignment axis (δ_trishul) and the cross-twin axis
# (δ_emergent, composition spec doc). The integrity risks this test pins:
#   (a) the doc is lost or orphaned (undiscoverable from VISION + VISION_MATH);
#   (b) it stops naming its load-bearing primitives — independence theorem,
#       the three-channel decomposition, the Twin Charter pattern;
#   (c) the SPEC label is silently dropped — the runtime estimator is stone #4
#       and this doc must not claim to BE the estimator;
#   (d) THM C.1 (independence) loses its PROVED label, regressing the
#       load-bearing claim to assertion-without-proof;
#   (e) the discoverability backbone breaks (VISION §5 row, VISION_MATH §1
#       cross-ref, gate file provenance).
#
# Run via: bash tests/test_twin_fidelity_integrity.sh
# Exit 0 = anchor intact. Exit 1 = at least one property is missing.

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KIT_ROOT="$SCRIPT_DIR/.."

DOC="$KIT_ROOT/TWIN_FIDELITY_SHASTRA.md"
VISION="$KIT_ROOT/VISION.md"
VISION_MATH="$KIT_ROOT/VISION_MATH.md"
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

# 1. existence
if [[ -f "$DOC" ]]; then
  printf 'PASS  exists: %s\n' "$DOC"; PASS=$((PASS + 1))
else
  printf 'FAIL  missing: %s\n' "$DOC" >&2; FAIL=$((FAIL + 1))
fi

# 2. independence theorem present (the load-bearing PROVED claim)
assert_in "independence theorem named (THM C.1)"        "$DOC" "Independence"

# 3. THM C.1 stays PROVED (cannot regress to asserted-without-proof)
assert_in "independence stays PROVED"                   "$DOC" "PROVED"

# 4. three-channel decomposition present (witness/action/closed-loop)
assert_in "three-channel decomposition: witness"        "$DOC" "Witness fidelity"
assert_in "three-channel decomposition: action"         "$DOC" "Action fidelity"
assert_in "three-channel decomposition: closed-loop"    "$DOC" "Closed-loop fidelity"

# 5. Twin Charter pattern present (twin's μ_hridaya)
assert_in "Twin Charter pattern defined (DEF E.1)"      "$DOC" "Twin Charter"

# 6. SPEC label kept — runtime estimator is stone #4, not claimed-as-built here
assert_in "doc labels itself a spec (estimator is stone #4)" "$DOC" "stone #4"

# 7. discoverable from VISION §5 (the LAID status row points to the doc)
assert_in "VISION.md §5 stone #2 row points to the doc" "$VISION" "TWIN_FIDELITY_SHASTRA.md"

# 8. discoverable from VISION_MATH §1 (the operational-theory cross-ref)
assert_in "VISION_MATH §1 cross-refs the doc"            "$VISION_MATH" "TWIN_FIDELITY_SHASTRA.md"

# 9. provenance recorded in the gate file
assert_in "provenance recorded in the gate file"         "$GATE" "TWIN_FIDELITY_SHASTRA.md"

TOTAL=$((PASS + FAIL))
printf '\n%d/%d twin-fidelity spec-doc integrity assertions passed\n' "$PASS" "$TOTAL"
if [[ "$FAIL" -gt 0 ]]; then
  printf '\nFAILURES: %d. The twin-fidelity spec-doc anchor is degraded.\n' "$FAIL" >&2
  printf 'Restore the missing property. If this doc is being promoted from\n' >&2
  printf 'SPEC (this stone) to a built estimator (stone #4), that is a governed\n' >&2
  printf 'event (gate file additions log) — update this test deliberately.\n' >&2
  exit 1
fi
exit 0
