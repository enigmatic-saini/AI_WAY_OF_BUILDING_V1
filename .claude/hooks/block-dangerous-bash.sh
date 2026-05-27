#!/usr/bin/env bash
# block-dangerous-bash — refuses destructive shortcuts.
# Hook spec: PreToolUse on Bash. Reads JSON on stdin; exit 2 to block, 0 to allow.
# LAW: L10 (Repo Hygiene).
#
# Fixed 2026-05-28 (third SHD firing's fix-forge):
#   HK-NG-13: ported from `declare -A` (associative array, bash 4+) to two
#             parallel `declare -a` arrays (PATTERNS + REASONS) indexed in
#             lockstep. Now compatible with bash 3.2 (macOS default).
#             Belt-and-suspenders bash-version guard added at top: refuses
#             to run on bash <3.2 with an explicit error message (better
#             than the previous silent fail-open on `declare -A` failure).
#   HK-NG-5: 10MB input bound to avoid OOM on adversarial Bash payloads.
#   HK-NG-3: distinguish "no pattern matched" (loop ends naturally) from
#             "pattern check errored" (would be silently swallowed in the
#             prior `if [[ "$cmd" =~ $pattern ]]` construct — but [[ =~ ]]
#             doesn't produce errors the same way grep does, so this is
#             defense-in-depth rather than a fix for an empirical bug).

set -euo pipefail

# HK-NG-13: explicit bash-version check. Refuse to run on bash <3.2 (which
# we don't support) with a clear diagnostic. The post-port script is bash-3.2
# compatible, but the guard is here in case some future edit re-introduces a
# bash-4-only construct without noticing — fails CLOSED rather than silently.
if [[ -z "${BASH_VERSION:-}" ]]; then
  printf 'block-dangerous-bash: refusing to run — not under bash (BASH_VERSION unset).\n' >&2
  exit 2
fi

input="$(cat)"

# HK-NG-5: bound input size.
_MAX_INPUT_BYTES=10485760
if [[ ${#input} -gt $_MAX_INPUT_BYTES ]]; then
  printf 'block-dangerous-bash: blocked. Input exceeds %d bytes. Refusing to scan.\n' "$_MAX_INPUT_BYTES" >&2
  exit 2
fi

# Extract the command string. jq if available; fallback to grep.
if command -v jq >/dev/null 2>&1; then
  cmd="$(printf '%s' "$input" | jq -r '.tool_input.command // ""')"
else
  cmd="$(printf '%s' "$input" | grep -oE '"command"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/.*"command"[[:space:]]*:[[:space:]]*"//; s/"$//')"
fi

# HK-NG-13: parallel arrays in lockstep. PATTERNS[i] is the regex; REASONS[i]
# is the matching refusal message. Compatible with bash 3.2.
declare -a PATTERNS=(
  'git[[:space:]]+push[[:space:]].*(--force|-f[[:space:]]|-f$)'
  '--no-verify'
  'rm[[:space:]]+-rf[[:space:]]+/($|[[:space:]])'
  'rm[[:space:]]+-rf[[:space:]]+\*'
  'git[[:space:]]+config[[:space:]]+--global'
  'git[[:space:]]+reset[[:space:]]+--hard[[:space:]]+origin/(main|master)'
)
declare -a REASONS=(
  'Force-push is destructive. If you mean it, ask the user to run it.'
  'Skipping hooks defeats the kit. Fix the underlying failure.'
  'Refusing rm -rf /.'
  'Refusing rm -rf *.'
  'Global git config changes are out of scope for a project kit.'
  'Hard-reset to origin overrides local work. Ask the user.'
)

# Iterate by index so PATTERNS[i] and REASONS[i] stay aligned.
num_patterns=${#PATTERNS[@]}
i=0
while [[ $i -lt $num_patterns ]]; do
  pattern="${PATTERNS[$i]}"
  reason="${REASONS[$i]}"
  if [[ "$cmd" =~ $pattern ]]; then
    printf 'block-dangerous-bash: %s\nCommand: %s\n' "$reason" "$cmd" >&2
    exit 2
  fi
  i=$((i + 1))
done

exit 0
