#!/usr/bin/env bash
# frontmatter-check — refuses Write to canonical docs without proper YAML frontmatter.
# Hook spec: PreToolUse on Write|Edit. Exit 2 to block, 0 to allow.
# Companion to the /dashboard-emit skill (procedural). This hook is structural.
# Contract: see DASHBOARD.md §2 — 9 canonical doc types, each with required frontmatter.
# (Extended 2026-05-30 night-late with `patch-record` type per KABIR_GATE.md additions log entry 22.)

set -euo pipefail

input="$(cat)"

if command -v jq >/dev/null 2>&1; then
  file="$(printf '%s' "$input" | jq -r '.tool_input.file_path // ""')"
  content="$(printf '%s' "$input" | jq -r '.tool_input.content // ""')"
  tool="$(printf '%s' "$input" | jq -r '.tool_name // ""')"
else
  file="$(printf '%s' "$input" | grep -oE '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/.*"file_path"[[:space:]]*:[[:space:]]*"//; s/"$//')"
  content="$(printf '%s' "$input" | grep -oE '"content"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*"content"[[:space:]]*:[[:space:]]*"//; s/"$//')"
  tool=""
fi

[[ -z "$file" ]] && exit 0

# Is this a canonical doc path?
basename="${file##*/}"
expected_type=""

case "$basename" in
  CHARTER.md)  expected_type="charter" ;;
  DESIGN.md)   expected_type="design" ;;
  STATUS.md)   expected_type="status" ;;
  TODO.md)     expected_type="todo-collection" ;;
  HANDOVER.md) expected_type="handover" ;;
esac

# Directory-scoped patterns
if [[ -z "$expected_type" ]]; then
  case "$file" in
    */decisions/ADR-*.md|decisions/ADR-*.md)     expected_type="adr" ;;
    */postmortems/INC-*.md|postmortems/INC-*.md) expected_type="postmortem" ;;
    */runbooks/*.md|runbooks/*.md)               expected_type="runbook" ;;
    */patches/PATCH-*.md|patches/PATCH-*.md)     expected_type="patch-record" ;;
  esac
fi

# Not canonical: no enforcement.
[[ -z "$expected_type" ]] && exit 0

# Edit tool only mutates a slice of the file; we can't reliably check overall structure
# from new_string alone. Trust the LLM to maintain frontmatter on edits (the /dashboard-emit
# skill in validate mode can be run after). Only enforce on Write (full-file replacement).
if [[ "$tool" != "Write" ]]; then
  exit 0
fi

# 1. Starts with '---' on the first line.
if ! printf '%s' "$content" | head -1 | grep -q '^---$'; then
  cat >&2 <<EOF
frontmatter-check: blocked.
File:           $file
Expected type:  $expected_type
Reason:         file does not start with '---' (YAML frontmatter open).

The DASHBOARD.md contract requires canonical docs to begin with a YAML frontmatter block.
Run the /dashboard-emit skill to draft a valid frontmatter, then retry the write.

Minimum frontmatter for type=$expected_type:
---
type: $expected_type
...
---
EOF
  exit 2
fi

# 2. Has a 'type:' line in the first 20 lines.
if ! printf '%s' "$content" | head -20 | grep -qE '^type:[[:space:]]+\S+'; then
  cat >&2 <<EOF
frontmatter-check: blocked.
File:           $file
Expected type:  $expected_type
Reason:         no 'type:' field found in the frontmatter block.

Expected a line of the form: type: $expected_type
EOF
  exit 2
fi

# 2b. The type value matches the path-derived expectation.
actual_type="$(printf '%s' "$content" | head -20 | awk '/^type:[[:space:]]+/ {print $2; exit}')"
if [[ -n "$actual_type" && "$actual_type" != "$expected_type" ]]; then
  cat >&2 <<EOF
frontmatter-check: blocked.
File:           $file
Expected type:  $expected_type
Found type:     $actual_type
Reason:         the doc's path implies type='$expected_type' but the frontmatter says type='$actual_type'.

Either move the file to the correct path, or update the type: field. They must agree.
EOF
  exit 2
fi

# 3. Has a closing '---' on its own line, after line 1.
if ! printf '%s' "$content" | awk 'NR>1 && /^---[[:space:]]*$/ {found=1; exit} END {exit !found}'; then
  cat >&2 <<EOF
frontmatter-check: blocked.
File:           $file
Expected type:  $expected_type
Reason:         no closing '---' line found.

The frontmatter block must close with a '---' on its own line, before the document body.
EOF
  exit 2
fi

exit 0
