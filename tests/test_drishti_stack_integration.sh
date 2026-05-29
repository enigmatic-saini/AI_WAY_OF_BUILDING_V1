#!/usr/bin/env bash
# test_drishti_stack_integration.sh — integrity pin for the convention doc
# DRISHTI_STACK.md.
#
# Authored 2026-05-29. The convention doc was integrated into the kit at the
# discoverability + canonical-notation + provenance layer (see the gate file
# KABIR_GATE.md additions log entry 12). The integrity risk this test pins:
# the doc silently re-orphans — i.e., the inbound references rot and the kit
# once again vouches for a doc nothing points to. This test fails loudly if
# the doc is missing OR if any required referrer no longer references it.
#
# What it pins:
#   1. DRISHTI_STACK.md exists at kit root.
#   2. ROLES.md references it.
#   3. VOCABULARY.md references it.
#   4. The operating manual .claude/CLAUDE.md references it.
#   5. The gate file KABIR_GATE.md references it.
#
# Run via: bash tests/test_drishti_stack_integration.sh
# Exit 0 = doc is integrated and discoverable. Exit 1 = at least one
# reference is missing (the doc is at risk of orphaning).

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KIT_ROOT="$SCRIPT_DIR/.."

CONVENTION_DOC="$KIT_ROOT/DRISHTI_STACK.md"
ROLES_MD="$KIT_ROOT/ROLES.md"
VOCAB_MD="$KIT_ROOT/VOCABULARY.md"
CLAUDE_MD="$KIT_ROOT/.claude/CLAUDE.md"
GATE_MD="$KIT_ROOT/KABIR_GATE.md"

PASS=0
FAIL=0

# $1 = description; $2 = file to search; $3 = literal string that must appear
assert_referenced() {
  local desc="$1" file="$2" needle="$3"
  if [[ ! -f "$file" ]]; then
    printf 'FAIL  %s (referrer file not found: %s)\n' "$desc" "$file" >&2
    FAIL=$((FAIL + 1))
    return
  fi
  if grep -q "$needle" "$file"; then
    printf 'PASS  %s\n' "$desc"
    PASS=$((PASS + 1))
  else
    printf 'FAIL  %s (no reference to %s found in %s)\n' "$desc" "$needle" "$file" >&2
    FAIL=$((FAIL + 1))
  fi
}

# 1. The convention doc itself must exist.
if [[ -f "$CONVENTION_DOC" ]]; then
  printf 'PASS  convention doc exists at kit root\n'
  PASS=$((PASS + 1))
else
  printf 'FAIL  convention doc not found: %s\n' "$CONVENTION_DOC" >&2
  FAIL=$((FAIL + 1))
fi

# 2-5. The doc must not be an orphan: each required referrer points to it.
REF="DRISHTI_STACK.md"
assert_referenced "ROLES.md references the convention doc"          "$ROLES_MD"  "$REF"
assert_referenced "VOCABULARY.md references the convention doc"     "$VOCAB_MD"  "$REF"
assert_referenced "operating manual references the convention doc"  "$CLAUDE_MD" "$REF"
assert_referenced "gate file references the convention doc"         "$GATE_MD"   "$REF"

# === Summary ===
TOTAL=$((PASS + FAIL))
printf '\n%d/%d integration assertions passed\n' "$PASS" "$TOTAL"
if [[ "$FAIL" -gt 0 ]]; then
  printf '\nFAILURES: %d. The convention doc is at risk of orphaning.\n' "$FAIL" >&2
  printf 'To fix: restore the missing inbound reference(s), or if the\n' >&2
  printf 'convention is being retired, follow the demotion path in the gate\n' >&2
  printf 'file additions log entry 12 (remove this test with it).\n' >&2
  exit 1
fi
exit 0
