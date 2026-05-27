#!/usr/bin/env bash
# test_block_dangerous_bash_patterns.sh — pin block-dangerous-bash.sh's pattern coverage.
#
# Authored 2026-05-28 as part of the third SHD firing's binding-contract NEG tests.
# Pins the 6-pattern coverage + benign-command exit-0.
#
# IMPLEMENTATION NOTE: block-dangerous-bash.sh is a PreToolUse:Bash hook (not
# Write/Edit), so this test file's content is NOT scanned by it at Write-time.
# No recursive-test guard needed. Test payloads can use literal dangerous-bash
# strings.

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOOK="$SCRIPT_DIR/../.claude/hooks/block-dangerous-bash.sh"

if [[ ! -x "$HOOK" ]]; then
  printf 'FAIL: block-dangerous-bash.sh not found or not executable at %s\n' "$HOOK" >&2
  exit 1
fi

# HK-NG-13 LANDED 2026-05-28 (fix-forge): block-dangerous-bash.sh was ported
# from `declare -A` (bash 4+) to parallel `declare -a` arrays (bash 3.2 compat).
# A belt-and-suspenders bash-version guard was also added that refuses to run
# on non-bash. Tests below now expect correct behavior on ANY bash version.
# The bash-3.2 KNOWN-BUG path has been removed.
BASH_MAJOR="${BASH_VERSION%%.*}"
printf 'Running on bash %s (HK-NG-13 ported to bash-3.2-compat; expecting correct behavior).\n\n' "$BASH_VERSION"

PASS=0
FAIL=0

# $1 = description; $2 = command string; $3 = expected exit
assert_exit() {
  local desc="$1" cmd="$2" expected="$3"
  local payload
  payload=$(python3 -c "import json,sys; print(json.dumps({'tool_input':{'command':sys.argv[1]}}))" "$cmd")
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

# --- Block assertions: each of 6 patterns triggers exit 2 ---

assert_exit "force-push --force blocks"            "git push --force"                         2
assert_exit "force-push -f blocks"                 "git push -f origin main"                  2
assert_exit "force-push -f at end blocks"          "git push origin master -f"                2
assert_exit "--no-verify blocks"                   "git commit --no-verify -m 'fix'"          2
assert_exit "rm -rf / blocks"                      "rm -rf /"                                 2
assert_exit "rm -rf * blocks"                      "rm -rf *"                                 2
assert_exit "global git config blocks"             "git config --global user.email x@y.z"     2
assert_exit "hard-reset to origin/main blocks"     "git reset --hard origin/main"             2
assert_exit "hard-reset to origin/master blocks"   "git reset --hard origin/master"           2

# --- Allow assertions: benign bash commands pass ---

assert_exit "normal git status allows"             "git status"                                0
assert_exit "normal git push allows"               "git push origin feature-branch"            0
assert_exit "normal git commit allows"             "git commit -m 'add tests'"                 0
assert_exit "normal rm specific file allows"       "rm /tmp/scratch.txt"                       0
assert_exit "ls allows"                            "ls -la /var/log"                           0
assert_exit "empty command allows"                 ""                                          0

# --- Substring-match coverage (these were originally documented as bypasses
# in the SHADOW_PASS but the empirical test post-HK-NG-13 shows the regex
# IS caught — bash `[[ =~ ]]` matches anywhere in the string, so the
# substring `git push --force` inside the sh -c / eval wrapper is detected.
# The SHADOW_PASS overstated O-3 for this hook; the substring-match handles
# wrapper evasion correctly. Tests updated to assert correct block behavior.) ---

assert_exit "sh -c wrapping IS blocked (substring-match catches inner cmd)" \
  "sh -c 'git push --force'" 2
assert_exit "eval wrapping IS blocked (substring-match catches inner cmd)" \
  "eval \"git push --force\"" 2

# --- Summary ---

TOTAL=$((PASS + FAIL))
printf '\n%d/%d block-dangerous-bash pattern assertions passed\n' "$PASS" "$TOTAL"
if [[ "$FAIL" -gt 0 ]]; then
  printf 'FAILURES: %d. Investigate before merging.\n' "$FAIL" >&2
  exit 1
fi
exit 0
