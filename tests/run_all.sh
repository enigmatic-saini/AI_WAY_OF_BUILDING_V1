#!/usr/bin/env bash
# run_all.sh — aggregate runner for the kit's hook NEG tests.
#
# Authored 2026-05-28 as part of the third SHD firing.
# Runs all tests/test_*.sh scripts and reports pass/fail count.
#
# Run via: bash tests/run_all.sh
# Exit 0 = all test scripts exit 0. Exit 1 = at least one test script failed.

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$SCRIPT_DIR"

PASS=0
FAIL=0
FAILED_TESTS=()

for t in test_*.sh; do
  [[ -f "$t" ]] || continue
  printf '\n=== %s ===\n' "$t"
  if bash "$t"; then
    PASS=$((PASS + 1))
  else
    FAIL=$((FAIL + 1))
    FAILED_TESTS+=("$t")
  fi
done

TOTAL=$((PASS + FAIL))
printf '\n----------------------------------------\n'
printf '%d/%d test scripts passed\n' "$PASS" "$TOTAL"
if [[ "$FAIL" -gt 0 ]]; then
  printf 'Failed: %s\n' "${FAILED_TESTS[*]}" >&2
  exit 1
fi
exit 0
