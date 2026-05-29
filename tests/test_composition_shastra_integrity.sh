#!/usr/bin/env bash
# test_composition_shastra_integrity.sh — integrity pin for COMPOSITION_SHASTRA.md
# (the composition spec doc; stone #3 of VISION.md §5). Companion to
# test_vision_integrity.sh; same anti-hypocrisy / LAW 11 discipline (a doc
# that claims things must be kept claiming them — its load-bearing content
# cannot silently disappear).
#
# Authored 2026-05-29. COMPOSITION_SHASTRA.md operationalizes the resolution
# of CONJ 4.1 (VISION_MATH §4.1) into a theory of emergent-drift handling
# (definition, channel decomposition by failing condition, localization walk,
# remediation principle). The integrity risks this test pins:
#   (a) the doc is lost or orphaned (undiscoverable from VISION + VISION_MATH);
#   (b) it stops naming its central operational primitives (emergent drift,
#       least-aligned coupling);
#   (c) the SPEC label is silently dropped — this doc is a spec; the runtime
#       instrument is stone #4 and must not be claimed-as-built here;
#   (d) the "PROVED given DEF 4.2" honesty qualifier disappears, regressing
#       the load-bearing claims to asserted-as-proven-absolutely (LAW 11);
#   (e) the discoverability backbone breaks (VISION §5 status row, VISION_MATH
#       §4.1 cross-ref, gate file provenance).
#
# Run via: bash tests/test_composition_shastra_integrity.sh
# Exit 0 = anchor intact. Exit 1 = at least one property is missing.

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KIT_ROOT="$SCRIPT_DIR/.."

DOC="$KIT_ROOT/COMPOSITION_SHASTRA.md"
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

# 2-3. central operational primitives present (cannot silently disappear)
assert_in "names central primitive: emergent drift"          "$DOC" "emergent drift"
assert_in "names central primitive: least-aligned coupling"  "$DOC" "least-aligned coupling"

# 4. SPEC label kept — runtime instrument is stone #4, not claimed-as-built here
assert_in "doc labels itself a spec (instrument is stone #4)" "$DOC" "stone #4"

# 5. honesty qualifier "PROVED given DEF 4.2" kept (not promoted to absolute)
assert_in "doc keeps 'PROVED given' honesty qualifier" "$DOC" "PROVED given DEF 4.2"

# 6. discoverable from VISION (the LAID status row points to it)
assert_in "VISION.md stone #3 row points to the doc" "$VISION" "COMPOSITION_SHASTRA.md"

# 7. discoverable from VISION_MATH §4.1 (the operational-consequence cross-ref)
assert_in "VISION_MATH cross-refs the doc" "$VISION_MATH" "COMPOSITION_SHASTRA.md"

# 8. provenance recorded in the gate file
assert_in "provenance recorded in the gate file" "$GATE" "COMPOSITION_SHASTRA.md"

TOTAL=$((PASS + FAIL))
printf '\n%d/%d composition spec-doc integrity assertions passed\n' "$PASS" "$TOTAL"
if [[ "$FAIL" -gt 0 ]]; then
  printf '\nFAILURES: %d. The composition spec-doc anchor is degraded.\n' "$FAIL" >&2
  printf 'Restore the missing property. If this doc is being promoted from\n' >&2
  printf 'SPEC (this stone) to a built instrument (stone #4), that is a governed\n' >&2
  printf 'event (gate file additions log) — update this test deliberately.\n' >&2
  exit 1
fi
exit 0
