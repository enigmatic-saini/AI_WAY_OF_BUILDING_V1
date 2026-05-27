#!/usr/bin/env bash
# test_secret_scan_patterns.sh — pin secret-scan.sh's pattern coverage.
#
# Authored 2026-05-28 as part of the third SHD firing's binding-contract NEG tests.
# See SHADOW_PASS_2026-05-28_claude_hooks.md.
#
# Pins each documented secret pattern's exit-2 behavior + clean-content exit-0.
# Pins coverage against Shakuni-class insider drift (O-9) AND surfaces the
# silent-pattern-error class (O-16, O-17) empirically.
#
# Run via: bash tests/test_secret_scan_patterns.sh
# Exit 0 = all assertions pass. Exit 1 = at least one assertion failed.
#
# IMPLEMENTATION NOTE on the recursive-test problem:
#   Secret-pattern test strings cannot appear LITERALLY in this source file,
#   because secret-scan.sh would fire on the Write of THIS file. Solution:
#   construct each test payload via runtime string concatenation. The source
#   file content has no contiguous secret-shaped substring; the runtime
#   bash variable does. The hook scans file content at Write-time (file path
#   appears in tests/, no exemption); the runtime payload is what is piped
#   to the hook under test via STDIN. Two separate scan contexts; concat
#   pattern is the bridge.

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOOK="$SCRIPT_DIR/../.claude/hooks/secret-scan.sh"

if [[ ! -x "$HOOK" ]]; then
  printf 'FAIL: secret-scan.sh not found or not executable at %s\n' "$HOOK" >&2
  exit 1
fi

PASS=0
FAIL=0

# Build a JSON payload via python (safe JSON-escaping) and pipe to the hook.
# Asserts the actual exit code matches expected.
# $1 = description; $2 = content to embed; $3 = expected exit ("2" block, "0" allow)
# $4 = "yes" to mark a non-block as KNOWN-BUG (documenting O-16) rather than FAIL
assert_exit() {
  local desc="$1" content="$2" expected="$3" skip_flag="${4:-no}"
  local payload
  payload=$(python3 -c "import json,sys; print(json.dumps({'tool_input':{'content':sys.argv[1],'file_path':'/tmp/fake.txt'}}))" "$content")
  local actual=0
  printf '%s' "$payload" | "$HOOK" >/dev/null 2>&1 || actual=$?
  if [[ "$actual" == "$expected" ]]; then
    printf 'PASS  %s\n' "$desc"
    PASS=$((PASS + 1))
  else
    if [[ "$skip_flag" == "yes" && "$expected" == "2" && "$actual" == "0" ]]; then
      printf 'KNOWN-BUG  %s (expected %s got %s; documents O-16; will PASS once HK-NG-2 lands)\n' \
        "$desc" "$expected" "$actual"
      PASS=$((PASS + 1))
    else
      printf 'FAIL  %s (expected %s got %s)\n' "$desc" "$expected" "$actual"
      FAIL=$((FAIL + 1))
    fi
  fi
}

# --- Block assertions: each pattern triggers exit 2 ---
# Each test payload is built via runtime concatenation so the source file does
# not contain a contiguous secret-shaped substring (recursive-test guard).

# AWS access key: pattern is 4-letter-prefix + 16 uppercase alphanumeric
aws_prefix="AKI"; aws_tail="A"; aws_body="TESTTESTTESTTEST"
aws_payload="${aws_prefix}${aws_tail}${aws_body}"
assert_exit "AWS access key pattern blocks" "$aws_payload" 2

# GitHub PAT: gh-letter prefix + p_ + 36 alphanumeric
gh_prefix="gh"; gh_tail="p_"; gh_body=""
for _ in 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6; do gh_body="${gh_body}A"; done
gh_payload="${gh_prefix}${gh_tail}${gh_body}"
assert_exit "GitHub PAT pattern blocks" "$gh_payload" 2

# Slack: xo + x[baprs] + - + alphanumeric/dash
slack_prefix="xo"; slack_tail="xb-"
slack_payload="${slack_prefix}${slack_tail}1234567890-ABCDEFGHIJ"
assert_exit "Slack token pattern blocks" "$slack_payload" 2

# Anthropic: sk + -ant-api + 2 digits + - + 80+ allowed chars
ant_prefix="sk"; ant_tail="-ant-api01-"
ant_body=""
for _ in $(seq 1 81); do ant_body="${ant_body}A"; done
ant_payload="${ant_prefix}${ant_tail}${ant_body}"
assert_exit "Anthropic key pattern blocks" "$ant_payload" 2

# Google OAuth: ya + 29 + . + alphanumeric/underscore/dash
ya_prefix="ya"; ya_tail="29."
ya_payload="${ya_prefix}${ya_tail}AAAAAAAAAAAAAAAAAAAAAAAAAAAA"
assert_exit "Google OAuth pattern blocks" "$ya_payload" 2

# JWT: ey + J + base64-like.base64-like.base64-like
jwt_p="ey"; jwt_t="J"
jwt_payload="${jwt_p}${jwt_t}abc123.${jwt_p}${jwt_t}def456.ghi789xyz"
assert_exit "JWT pattern blocks" "$jwt_payload" 2

# PEM private key: dash-prefix + BEGIN + space + type + space + PRIVATE KEY + dash-suffix
# HK-NG-2 LANDED 2026-05-28 (fix-forge): grep now uses `grep -Eq -- "$p"`
# which terminates option parsing before the pattern. The PEM pattern is
# now functional. KNOWN-BUG flag REMOVED — this assertion now asserts the
# correct behavior (exit 2).
pem_prefix="-----"; pem_mid="BEGIN RSA PRIVATE KEY"
pem_payload="${pem_prefix}${pem_mid}${pem_prefix}"
assert_exit "PEM private key pattern blocks (HK-NG-2 fixed)" "$pem_payload" 2

# --- Allow assertions: clean content passes (exit 0) ---

assert_exit "Benign plain text allows" "this is just normal documentation text" 0
assert_exit "Benign python-like content allows" "def hello(): return greeting" 0
assert_exit "Word 'key' alone allows (lexical similarity, not pattern match)" \
  "the api key is documented in README" 0
assert_exit "Empty content now blocks (HK-NG-4 fail-closed on malformed input)" "" 2

# --- Summary ---

TOTAL=$((PASS + FAIL))
printf '\n%d/%d secret-scan pattern assertions passed\n' "$PASS" "$TOTAL"
if [[ "$FAIL" -gt 0 ]]; then
  printf 'FAILURES: %d. Investigate before merging.\n' "$FAIL" >&2
  exit 1
fi
exit 0
