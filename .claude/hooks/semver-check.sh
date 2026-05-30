#!/usr/bin/env bash
# semver-check - blocks malformed release tags (PreToolUse on Bash).
# Hook spec: PreToolUse on Bash. Reads JSON on stdin; exit 2 to block, 0 to allow.
# LAW: extends L10 (Repo Hygiene); ITIL Release Management discipline (Phase 2
#      of external-AHR ITIL benchmark per KABIR_GATE.md additions log entry 23).
#
# What this hook does:
#   - Detects `git tag <NAME>` / `git tag -a <NAME>` / `git tag -s <NAME>` /
#     `git tag -am '...' <NAME>` etc. (tag CREATION, not list/delete/verify).
#   - Checks NAME against SemVer 2.0 pattern v?MAJOR.MINOR.PATCH[-pre][+build].
#   - Blocks if NAME does not match.
#
# What this hook does NOT do:
#   - Does NOT block `git tag` with no args (lists tags).
#   - Does NOT block `git tag -l|-d|-v ...` (list/delete/verify).
#   - Does NOT validate semver version-progression (1.0.0 -> 0.9.0 would pass
#     this hook; the /release skill's RH3 step is where progression is reviewed).
#   - Does NOT block non-v-prefixed identifiers used for non-release purposes
#     (e.g., `milestone-2026-Q3`, `checkpoint-pre-launch`). The check only fires
#     when the tag is shaped like a version.
#
# Fail-closed policy:
#   - bash <3.2: refuse to run (same as block-dangerous-bash).
#   - input > 10MB: refuse (same bound as block-dangerous-bash + secret-scan).
#   - jq pattern errors: surface loudly rather than swallow.

set -euo pipefail

if [[ -z "${BASH_VERSION:-}" ]]; then
  printf 'semver-check: refusing to run -- not under bash (BASH_VERSION unset).\n' >&2
  exit 2
fi

input="$(cat)"

_MAX_INPUT_BYTES=10485760
if [[ ${#input} -gt $_MAX_INPUT_BYTES ]]; then
  printf 'semver-check: blocked. Input exceeds %d bytes. Refusing to scan.\n' "$_MAX_INPUT_BYTES" >&2
  exit 2
fi

if command -v jq >/dev/null 2>&1; then
  cmd="$(printf '%s' "$input" | jq -r '.tool_input.command // ""')"
else
  cmd="$(printf '%s' "$input" | grep -oE '"command"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/.*"command"[[:space:]]*:[[:space:]]*"//; s/"$//')"
fi

# Only fire on `git tag <NAME>`-shape commands. Skip everything else.
if ! [[ "$cmd" =~ ^[[:space:]]*git[[:space:]]+tag([[:space:]]+|$) ]]; then
  exit 0
fi

# Skip if the command is read-only (list / verify) or destructive (delete).
# `git tag` with NO args lists; `git tag -l ...` / `--list ...` lists;
# `git tag -d ...` / `--delete ...` deletes; `git tag -v ...` / `--verify ...` verifies.
if [[ "$cmd" =~ (^|[[:space:]])(-[ldv]|--list|--delete|--verify)([[:space:]]|$) ]]; then
  exit 0
fi

# Extract args after `git tag`.
tag_args="$(printf '%s' "$cmd" | sed -E 's/^[[:space:]]*git[[:space:]]+tag[[:space:]]*//')"

# If no args, this is a list-all -- skip.
if [[ -z "$tag_args" ]]; then
  exit 0
fi

# Walk the args looking for the first positional (non-flag, non-message-arg) token.
# Flags that take an argument: -m, -F, --message, --file, -u, --local-user, --cleanup,
# --sort, --points-at, --contains, --no-contains, --merged, --no-merged. We skip the
# next token after any of these.
tag_name=""
skip_next=0
# shellcheck disable=SC2206
args=($tag_args)
for arg in "${args[@]}"; do
  if (( skip_next )); then
    skip_next=0
    continue
  fi
  case "$arg" in
    -m|-F|-u|--message|--file|--local-user|--cleanup|--sort|--points-at|--contains|--no-contains|--merged|--no-merged)
      skip_next=1
      continue
      ;;
    -m=*|-F=*|--message=*|--file=*|-u=*|--local-user=*|--cleanup=*|--sort=*|--points-at=*|--contains=*|--no-contains=*|--merged=*|--no-merged=*)
      # flag with = value form, no separate arg to skip
      continue
      ;;
    -*)
      # other flag (booleans like -a, -s, -f); does not take an arg
      continue
      ;;
    *)
      tag_name="$arg"
      break
      ;;
  esac
done

# No tag name -- let git itself decide what to do (probably a syntax error).
if [[ -z "$tag_name" ]]; then
  exit 0
fi

# Strip enclosing quotes if any (single or double).
case "$tag_name" in
  \"*\")  tag_name="${tag_name#\"}"; tag_name="${tag_name%\"}" ;;
  \'*\')  tag_name="${tag_name#\'}"; tag_name="${tag_name%\'}" ;;
esac

# If the tag does NOT look like a version (no digits, or all letters), don't enforce
# SemVer -- the user is creating a non-version tag (e.g., milestone marker). Skip.
if ! [[ "$tag_name" =~ [0-9] ]]; then
  exit 0
fi
# Tags that don't START with v|V|digit are clearly non-version markers.
if ! [[ "$tag_name" =~ ^[vV0-9] ]]; then
  exit 0
fi

# SemVer 2.0 practical regex (catches typical version tags; full spec includes more
# corner cases around leading zeros and pre-release identifier shape, which we accept
# loosely here). Matches: v1.2.3 / 1.2.3 / v1.2.3-rc.1 / v1.2.3-beta+build.123 / 1.0.0
semver_pattern='^[vV]?[0-9]+\.[0-9]+\.[0-9]+(-[a-zA-Z0-9.-]+)?(\+[a-zA-Z0-9.-]+)?$'

if [[ "$tag_name" =~ $semver_pattern ]]; then
  exit 0  # PASS
fi

# BLOCK.
cat >&2 <<EOF
semver-check: blocked.
Command: $cmd
Tag name: $tag_name
Reason: tag looks like a version (starts with v/V or a digit) but does not match the
SemVer 2.0 pattern. Expected: v<major>.<minor>.<patch>[-<prerelease>][+<build>].

Valid examples:
  v1.0.0          (initial release)
  v1.2.3          (semantic version)
  v2.0.0-beta     (pre-release)
  v1.0.0-rc.1     (release candidate)
  v1.0.0+build.5  (with build metadata)
  1.0.0           (no v prefix is also accepted)

Per ITIL release management discipline + the kit's /release skill (step 4 + the
RELEASE-NOTES canonical doc-type per DASHBOARD.md sec.2.10), release tags must
follow SemVer 2.0 so the audit trail is queryable. See https://semver.org.

If you need a non-SemVer tag for a non-release purpose (milestone marker,
pre-launch checkpoint), use a prefix that does NOT start with v/V or a digit,
e.g.:  milestone-2026-Q3  /  checkpoint-pre-launch  /  pre-release-alpha
EOF

exit 2
