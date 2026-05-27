#!/usr/bin/env bash
# secret-scan — blocks committing common secret formats.
# Hook spec: PreToolUse on Write|Edit. Exit 2 to block, 0 to allow.
# LAW: L10.
#
# Fixed 2026-05-28 (third SHD firing's fix-forge):
#   HK-NG-2: leading `--` added to grep so patterns starting with `-` (PEM)
#            are not interpreted as grep flags. The PEM pattern was
#            non-functional before this fix.
#   HK-NG-3: pattern-error detection — grep exit 2+ (pattern error) is now
#            distinguished from grep exit 1 (no match) and surfaced loudly
#            rather than silently swallowed by the if-test.
#   HK-NG-4: empty content (e.g. from malformed JSON input) is now refused
#            rather than silently passed. Empty extraction = parse failure;
#            fail closed for security-sensitive hooks.
#   HK-NG-5: 10MB content bound; refuse rather than risk OOM under
#            Duryodhana-class adversarial Write payloads.
#   HK-NG-16 (2026-05-28 Vishwakarma session): markdown code-fence + inline-
#            backtick stripping, ONLY for .md files. Closes the false-positive
#            class where SHADOW_PASS / HANDOVER / threat-model documents
#            discussing secret patterns by example were blocked. Convention:
#            example patterns in markdown docs should be wrapped in backticks
#            (inline) or fenced code blocks (multi-line); the hook then
#            ignores them. Non-.md files (.sh, .py, etc.) are scanned in
#            full — their backticks have different semantics (e.g., bash
#            command substitution) and stripping them would lose real code.
#            Trade-off: an attacker could embed a real secret inside a
#            markdown code-fence to bypass. Risk accepted as net-positive
#            vs the recurring real false-positive class. Symmetric to HK-NG-15
#            (path-stripping in vocabulary-lint).

set -euo pipefail

input="$(cat)"

# HK-NG-5: bound the input size before any other processing.
# Roughly 10 MB. Real charters and code files are well under this; legitimate
# multi-MB payloads to Write/Edit do not exist in normal practice.
_MAX_INPUT_BYTES=10485760
if [[ ${#input} -gt $_MAX_INPUT_BYTES ]]; then
  printf 'secret-scan: blocked. Input exceeds %d bytes (got %d). Refusing to scan to avoid resource exhaustion.\n' \
    "$_MAX_INPUT_BYTES" "${#input}" >&2
  exit 2
fi

# Pull the to-be-written content. Write tool: .tool_input.content. Edit tool: .tool_input.new_string.
if command -v jq >/dev/null 2>&1; then
  content="$(printf '%s' "$input" | jq -r '.tool_input.content // .tool_input.new_string // ""')"
  file="$(printf '%s' "$input" | jq -r '.tool_input.file_path // ""')"
else
  content="$(printf '%s' "$input" | grep -oE '"(content|new_string)"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*"[^"]*"[[:space:]]*:[[:space:]]*"//; s/"$//')"
  file="$(printf '%s' "$input" | grep -oE '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/.*"file_path"[[:space:]]*:[[:space:]]*"//; s/"$//')"
fi

# HK-NG-4: refuse empty content. Empty extraction typically means malformed
# JSON or unexpected harness input; treating it as "nothing to scan" silently
# fails open. Fail closed instead.
if [[ -z "$content" ]]; then
  printf 'secret-scan: blocked. Extracted content is empty (likely malformed input). Refusing to fail open.\nFile: %s\n' "$file" >&2
  exit 2
fi

# HK-NG-16: file-extension-gated markdown stripping. For .md files only, strip
# fenced code blocks (``` ... ```) and inline backtick spans (`...`) before
# pattern scanning. This way, documentation files (SHADOW_PASS, HANDOVER,
# threat-model.md) can discuss secret-shaped patterns by example without
# tripping the hook — provided the examples are wrapped in markdown code
# notation. Non-.md files are scanned in full; their backticks have different
# semantics (e.g., bash command substitution) and stripping them would lose
# real code.
case "$file" in
  *.md|*.markdown)
    # awk strips fenced blocks; sed strips remaining inline backtick spans.
    content_scannable=$(printf '%s' "$content" \
      | awk 'BEGIN{in_fence=0} /^```/{in_fence=1-in_fence; next} !in_fence{print}' \
      | sed 's/`[^`]*`/<EXAMPLE>/g')
    ;;
  *)
    content_scannable="$content"
    ;;
esac

# Common secret formats. The PEM pattern starts with `-`; the loop below uses
# `grep -Eq --` to terminate option parsing before the pattern so the leading
# dashes are not interpreted as grep flags (HK-NG-2).
declare -a PATTERNS=(
  '-----BEGIN [A-Z ]+ PRIVATE KEY-----'        # PEM
  'AKIA[0-9A-Z]{16}'                            # AWS access key
  'ghp_[A-Za-z0-9]{36}'                         # GitHub personal token
  'xox[baprs]-[A-Za-z0-9-]+'                    # Slack
  'sk-ant-api[0-9]{2}-[A-Za-z0-9_-]{80,}'       # Anthropic
  'ya29\.[A-Za-z0-9_-]+'                        # Google OAuth
  'eyJ[A-Za-z0-9_=-]+\.eyJ[A-Za-z0-9_=-]+\.[A-Za-z0-9_=-]+'  # JWT
)

for p in "${PATTERNS[@]}"; do
  # HK-NG-2 + HK-NG-3: capture grep's exit code explicitly. grep exits 0 on
  # match, 1 on no-match, 2+ on error. Previously the `if grep -Eq` construct
  # collapsed exits 1 and 2+ together and moved on; pattern errors vanished.
  # Now: 0 = block, 1 = continue, 2+ = error (loud refusal, fail closed).
  set +e
  printf '%s' "$content_scannable" | grep -Eq -- "$p"
  rc=$?
  set -e
  if [[ $rc -eq 0 ]]; then
    printf 'secret-scan: blocked. Pattern %q matched in %s.\nDo NOT commit secrets. Move to env vars or a vault.\n' "$p" "$file" >&2
    exit 2
  elif [[ $rc -ge 2 ]]; then
    printf 'secret-scan: pattern-error. grep exited %d on pattern %q. Refusing to fail open.\nThis is a hook-configuration bug (pattern is malformed or grep version-incompatible). Investigate.\n' \
      "$rc" "$p" >&2
    exit 2
  fi
done

exit 0
