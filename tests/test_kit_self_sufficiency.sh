#!/usr/bin/env bash
# test_kit_self_sufficiency.sh — anti-hypocrisy / LAW 11 seal on the kit's
# self-sufficiency claim.
#
# Authored 2026-05-30. CLAUDE.md states "V1 is self-sufficient. Everything you
# need is in LINEAGE.md, M_BUILD.md, and the files this CLAUDE.md links to."
# Until 2026-05-30 this claim was structurally false: the kit's foundational
# drift math (the trinary drift, the three functionals, the binary-as-projection
# theorem, the four-corners necessity check) lived in a downstream project's
# MATH.md (../RIAAN/MATH.md), inverting the proper dependency direction. The
# governance event recording the upward codification into kit-level MATH.md is
# gate-file additions log entry 18; this pin enforces the new direction so the
# seed doc cannot silently lie again.
#
# What it pins:
#   1.  MATH.md exists at the kit root.
#   2.  MATH.md contains the load-bearing primitives by English-descriptor
#       literal-string check (no silent omission).
#   3.  Foundation-grade docs reference the kit's MATH.md for the foundational
#       drift math (positive presence — they point at the kit's own source).
#   4.  Foundation-grade docs do NOT import foundational definitions from
#       ../RIAAN/MATH.md (negative absence — heuristic: a line carrying both a
#       Greek-letter math name and the RIAAN/MATH.md URL is a candidate
#       foundational import unless the line also carries an explicit context
#       marker like "project-level", "downstream", "first witness", "extension"
#       etc.).
#
# Foundation-grade docs covered: CLAUDE.md, JIVA.md (faculty-doc), Q_RUBRIC.md,
# VISION_MATH.md, COMPOSITION_SHASTRA.md, TWIN_FIDELITY_SHASTRA.md, and the
# analyst role file. Preserved analyses are out-of-scope here (they carry their
# own Historical-citation top-notes).
#
# Run via: bash tests/test_kit_self_sufficiency.sh
# Exit 0 = self-sufficiency intact. Exit 1 = the claim is structurally false again.

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KIT_ROOT="$SCRIPT_DIR/.."

MATH="$KIT_ROOT/MATH.md"
CLAUDE_MD="$KIT_ROOT/.claude/CLAUDE.md"
FACULTY_DOC="$KIT_ROOT/JIVA.md"
QR="$KIT_ROOT/Q_RUBRIC.md"
VMATH="$KIT_ROOT/VISION_MATH.md"
COMP="$KIT_ROOT/COMPOSITION_SHASTRA.md"
TWIN="$KIT_ROOT/TWIN_FIDELITY_SHASTRA.md"
ANALYST="$KIT_ROOT/.claude/agents/analyst.md"

PASS=0
FAIL=0

assert_in() {
  local desc="$1" file="$2" needle="$3"
  if [[ ! -f "$file" ]]; then
    printf 'FAIL  %s (file not found: %s)\n' "$desc" "$file" >&2
    FAIL=$((FAIL + 1)); return
  fi
  # Fixed-string match (-F) so markdown link syntax [...](...) is not parsed
  # as a regex character class.
  if grep -qF "$needle" "$file"; then
    printf 'PASS  %s\n' "$desc"; PASS=$((PASS + 1))
  else
    printf 'FAIL  %s (string not found: %s in %s)\n' "$desc" "$needle" "$file" >&2
    FAIL=$((FAIL + 1))
  fi
}

# ============================================================================
# Section 1: MATH.md exists
# ============================================================================
if [[ -f "$MATH" ]]; then
  printf 'PASS  MATH.md exists at kit root\n'; PASS=$((PASS + 1))
else
  printf 'FAIL  MATH.md missing from kit root — the kit is not self-sufficient\n' >&2
  FAIL=$((FAIL + 1))
fi

# ============================================================================
# Section 2: MATH.md contains the load-bearing primitives
# Descriptors are English so this script remains kit-vocabulary-clean.
# ============================================================================
assert_in "MATH.md owns the trinary drift definition"          "$MATH" "trinary drift"
assert_in "MATH.md owns functional 1 (originating desire)"     "$MATH" "originating desire"
assert_in "MATH.md owns functional 2 (self-assessment)"        "$MATH" "self-assessment"
assert_in "MATH.md owns functional 3 (ground-truth measure)"   "$MATH" "ground-truth measure"
assert_in "MATH.md owns the binary drift section"              "$MATH" "Binary drift"
assert_in "MATH.md owns the triangle-inequality safety lemma"  "$MATH" "triangle-inequality safety"
assert_in "MATH.md owns the binary-as-projection theorem"      "$MATH" "Binary-as-projection"
assert_in "MATH.md owns the four-corners necessity check"      "$MATH" "Four corners on the claim"
assert_in "MATH.md owns the faculty triad mapping"             "$MATH" "Faculty triad"

# ============================================================================
# Section 3: Foundation-grade docs reference the kit's MATH.md
# ============================================================================
assert_in "CLAUDE.md 'Where to look when' table has a MATH.md row" "$CLAUDE_MD"  "[MATH.md](../MATH.md)"
assert_in "faculty-doc §5b points to kit MATH.md"                  "$FACULTY_DOC" "[MATH.md §3 / §4 / §5.4](MATH.md)"
assert_in "Q_RUBRIC.md §2b points to kit MATH.md"                  "$QR"         "[MATH.md §5.4–§5.6](MATH.md)"
assert_in "VISION_MATH.md §1 'Builds on' points to kit MATH.md"    "$VMATH"      "[MATH.md §5.4](MATH.md)"
assert_in "COMPOSITION_SHASTRA.md 'Rests on' points to kit MATH"   "$COMP"       "[MATH.md §5.4](MATH.md)"
assert_in "TWIN_FIDELITY_SHASTRA.md 'Rests on' points to kit MATH" "$TWIN"       "[MATH.md §5.4](MATH.md)"
assert_in "analyst role grounded in kit MATH.md (§3, §4)"          "$ANALYST"    "[MATH.md §3, §4](../../MATH.md)"

# ============================================================================
# Section 4: No foundational RIAAN/MATH import in foundation-grade docs
# Trigger: a line carrying both a Greek-letter math name (δ_) and the
# RIAAN/MATH.md URL is a candidate foundational import. The line is exempt
# only if it also carries an explicit context marker.
# ============================================================================
REGEX_DANGEROUS='δ_.*RIAAN/MATH\.md|RIAAN/MATH\.md.*δ_'
REGEX_CONTEXT='(project-level|extension|first witness|first-witness|discovered|downstream|reference implementation|reference architecture|reference layer|one project|consumes|preserved analysis|preserved verbatim|Historical-citation|empirical witness|first empirical|empirical instance|first instance|first instances|reference impl)'

check_no_foundational_riaan_import() {
  local desc="$1" file="$2"
  if [[ ! -f "$file" ]]; then
    printf 'FAIL  %s (file not found: %s)\n' "$desc" "$file" >&2
    FAIL=$((FAIL + 1)); return
  fi
  local bad
  bad=$(grep -nE "$REGEX_DANGEROUS" "$file" 2>/dev/null | grep -vE "$REGEX_CONTEXT" || true)
  if [[ -z "$bad" ]]; then
    printf 'PASS  %s\n' "$desc"; PASS=$((PASS + 1))
  else
    printf 'FAIL  %s — foundational import remains:\n%s\n' "$desc" "$bad" >&2
    FAIL=$((FAIL + 1))
  fi
}

check_no_foundational_riaan_import "CLAUDE.md no foundational RIAAN/MATH import"               "$CLAUDE_MD"
check_no_foundational_riaan_import "faculty-doc no foundational RIAAN/MATH import"             "$FACULTY_DOC"
check_no_foundational_riaan_import "Q_RUBRIC.md no foundational RIAAN/MATH import"             "$QR"
check_no_foundational_riaan_import "VISION_MATH.md no foundational RIAAN/MATH import"          "$VMATH"
check_no_foundational_riaan_import "COMPOSITION_SHASTRA.md no foundational RIAAN/MATH import"  "$COMP"
check_no_foundational_riaan_import "TWIN_FIDELITY_SHASTRA.md no foundational RIAAN/MATH import" "$TWIN"
check_no_foundational_riaan_import "analyst role no foundational RIAAN/MATH import"            "$ANALYST"

# ============================================================================
# Summary
# ============================================================================

TOTAL=$((PASS + FAIL))
printf '\n%d/%d kit self-sufficiency assertions passed\n' "$PASS" "$TOTAL"
if [[ "$FAIL" -gt 0 ]]; then
  printf '\nFAILURES: %d. The kit is no longer self-sufficient on its foundational math.\n' "$FAIL" >&2
  printf 'Foundational definitions of the drift math (trinary drift, the three\n' >&2
  printf 'functionals, binary-as-projection, four-corners necessity check) live in\n' >&2
  printf 'the kit at MATH.md — projects extend, do not redefine. See gate-file\n' >&2
  printf 'additions log entry 18 for the governance event that established this.\n' >&2
  exit 1
fi
exit 0
