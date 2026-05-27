#!/usr/bin/env bash
# test_vocabulary_lint_patterns.sh — pin vocabulary-lint.sh's pattern coverage.
#
# Authored 2026-05-28 as part of the third SHD firing's binding-contract NEG tests.
# Pins TERMS-array coverage + exemption-list correctness.
#
# IMPLEMENTATION NOTE: this source file uses runtime concatenation to avoid
# embedding any literal lineage term that vocabulary-lint.sh would catch when
# THIS file (a .sh, no exemption) is Written. Same recursive-test guard as
# test_secret_scan_patterns.sh.

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOOK="$SCRIPT_DIR/../.claude/hooks/vocabulary-lint.sh"

if [[ ! -x "$HOOK" ]]; then
  printf 'FAIL: vocabulary-lint.sh not found or not executable at %s\n' "$HOOK" >&2
  exit 1
fi

PASS=0
FAIL=0

# $1 = description; $2 = content; $3 = file_path; $4 = expected exit
assert_exit() {
  local desc="$1" content="$2" file_path="$3" expected="$4"
  local payload
  payload=$(python3 -c "import json,sys; print(json.dumps({'tool_input':{'content':sys.argv[1],'file_path':sys.argv[2]}}))" "$content" "$file_path")
  local actual=0
  printf '%s' "$payload" | "$HOOK" >/dev/null 2>&1 || actual=$?
  if [[ "$actual" == "$expected" ]]; then
    printf 'PASS  %s\n' "$desc"
    PASS=$((PASS + 1))
  else
    printf 'FAIL  %s (expected %s got %s)\n' "$desc" "$expected" "$actual"
    FAIL=$((FAIL + 1))
  fi
}

# --- Block assertions: lineage terms in code-path files trigger exit 2 ---

# Each term is built via runtime concatenation so this source file does not
# contain the literal term that vocabulary-lint would catch when this file
# itself is Written. The runtime variable carries the contiguous string;
# the source carries the split parts.

t1_a="R";  t1_b="am"      ; t1_term="${t1_a}${t1_b}"
t2_a="Kr"; t2_b="ishna"   ; t2_term="${t2_a}${t2_b}"
t3_a="Br"; t3_b="ahma"    ; t3_term="${t3_a}${t3_b}"
t4_a="Sh"; t4_b="iva"     ; t4_term="${t4_a}${t4_b}"
t5_a="Vis"; t5_b="hnu"    ; t5_term="${t5_a}${t5_b}"
t6_a="Garb"; t6_b="ha"    ; t6_term="${t6_a}${t6_b}"

# Pick a code-path file path (no extension exemption applies).
code_path="/tmp/somecode.py"

# Word-boundary semantic: vocabulary-lint uses grep -Eiq "\\b${term}\\b" — requires
# non-word-char before AND after the term. These tests use payloads that satisfy that
# (terms wrapped by quotes or spaces). Tests t3-t5 (CamelCase / underscore-attached)
# below document O-19 — the word-boundary check legitimately misses CamelCase-attached
# divine references like "BrahmaWorker", "ShivaProcessor". This is a SHD-surfaced gap.

assert_exit "lineage term #1 in .py blocks (word-boundary)"  "def hello(): return '${t1_term}'"   "$code_path" 2
assert_exit "lineage term #2 in .py blocks (word-boundary)"  "name = '${t2_term}'"                 "$code_path" 2
# Use space-separated form so word-boundary triggers on these three:
assert_exit "lineage term #3 in .py blocks (word-boundary)"  "stage_name = '${t3_term}'"           "$code_path" 2
assert_exit "lineage term #4 in .py blocks (word-boundary)"  "if persona == '${t4_term}':"         "$code_path" 2
assert_exit "lineage term #5 in .py blocks (word-boundary)"  "return ['${t5_term}', 'other']"      "$code_path" 2
assert_exit "lineage term #6 in .py blocks (word-boundary)"  "stage = '${t6_term}'"                "$code_path" 2

# O-19 CamelCase-attached usage — HK-NG-12 LANDED 2026-05-28 (fix-forge):
# regex now matches \bTerm followed by uppercase OR underscore (in addition
# to word-boundary). CamelCase forms now block correctly.
assert_exit "CamelCase 'TermWorker' in .py blocks (HK-NG-12 fixed)"  "class ${t3_term}Worker: pass"  "$code_path" 2
assert_exit "underscore-attached 'Term_thread' blocks (HK-NG-12 fixed)" "${t4_term}_thread.start()"  "$code_path" 2
assert_exit "CamelCase 'TermLoader' blocks (HK-NG-12 fixed)" "module = ${t5_term}Loader()"            "$code_path" 2

# --- Allow assertions: same terms in exempted paths exit 0 ---

# .md extension: exempt per case branch in vocabulary-lint.sh
assert_exit "lineage term in .md allows"   "stage transitions: ${t6_term} -> growth"      "/tmp/doc.md"  0
assert_exit "lineage term in .toml allows" "name = '${t2_term}-bhakti'"                    "/tmp/cfg.toml" 0

# /shastras/ path exemption
assert_exit "lineage term in shastras/ path allows" \
  "def shastra_loader(): return '${t3_term}'" "/tmp/somerepo/shastras/notes.py" 0

# templates/ path exemption
assert_exit "lineage term in templates/ path allows" \
  "header: '${t4_term}'" "/tmp/somerepo/templates/header.tmpl" 0

# --- Allow: benign code-path content ---

assert_exit "benign python content allows"            "def add(a, b): return a + b"        "$code_path" 0
assert_exit "english word with overlap allows"        "rambling pattern detector"          "$code_path" 0
assert_exit "empty content now blocks (HK-NG-4 fail-closed)"  ""                              "$code_path" 2

# --- Summary ---

TOTAL=$((PASS + FAIL))
printf '\n%d/%d vocabulary-lint pattern assertions passed\n' "$PASS" "$TOTAL"
if [[ "$FAIL" -gt 0 ]]; then
  printf 'FAILURES: %d. Investigate before merging.\n' "$FAIL" >&2
  exit 1
fi
exit 0
