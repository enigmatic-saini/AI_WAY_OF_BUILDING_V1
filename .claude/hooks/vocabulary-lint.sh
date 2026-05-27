#!/usr/bin/env bash
# vocabulary-lint — blocks lineage names in non-doc files.
# Hook spec: PreToolUse on Write|Edit. Exit 2 to block, 0 to allow.
# LAW: Vocabulary law (see VOCABULARY.md).
#
# Fixed 2026-05-28 (third SHD firing's fix-forge):
#   HK-NG-3: distinguish grep no-match (exit 1) from grep error (exit 2+).
#   HK-NG-4: refuse empty content (likely malformed input).
#   HK-NG-5: 10MB content bound.
#   HK-NG-12: regex extended to catch CamelCase + underscore-attached usage.
#   HK-NG-14: self-exemption (O-20 surfaced during this fix-forge) — the
#             hook's own source must contain the term list as data; the
#             exemption is intentionally narrow (only this file path).
#   HK-NG-15 (2026-05-28 Vishwakarma session, surfaced empirically 3x in
#             prior sessions): path-stripping pre-pass. Substrings that
#             match a filesystem-path shape ending in a known doc/code
#             extension are replaced with <PATH> before the divine-name
#             scan. Closes the false-positive class where a .sh file
#             legitimately references a kit doc file by name (e.g.,
#             "$KIT_ROOT/KABIR_GATE.md"). Lineage terms in actual code-
#             identifier positions (variable names, function names) are
#             still caught.
#
# Implementation note on the TERMS array: each entry is split via bash
# string-adjacency concatenation. The runtime value is the joined string;
# the source bytes carry a quote-pair in between. Defense in depth alongside
# the self-exemption.

set -euo pipefail

input="$(cat)"

# HK-NG-5: bound input size first.
_MAX_INPUT_BYTES=10485760
if [[ ${#input} -gt $_MAX_INPUT_BYTES ]]; then
  printf 'vocabulary-lint: blocked. Input exceeds %d bytes. Refusing to scan.\n' "$_MAX_INPUT_BYTES" >&2
  exit 2
fi

if command -v jq >/dev/null 2>&1; then
  content="$(printf '%s' "$input" | jq -r '.tool_input.content // .tool_input.new_string // ""')"
  file="$(printf '%s' "$input" | jq -r '.tool_input.file_path // ""')"
else
  content="$(printf '%s' "$input" | grep -oE '"(content|new_string)"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*"[^"]*"[[:space:]]*:[[:space:]]*"//; s/"$//')"
  file="$(printf '%s' "$input" | grep -oE '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/.*"file_path"[[:space:]]*:[[:space:]]*"//; s/"$//')"
fi

# Exclusion-based: documentation extensions and lineage-narrative directories.
# Self-exemption per HK-NG-14: this hook's own source must contain the term list.
case "$file" in
  *.md|*.toml|*.txt|*.json|*.yaml|*.yml|*.lock|*.log|*.csv|*.tsv) exit 0 ;;
  */shastras/*|*/templates/*|*/CHANGELOG*|*/LICENSE*) exit 0 ;;
  */vocabulary-lint.sh) exit 0 ;;
esac

# HK-NG-4: refuse empty content. Fail closed.
if [[ -z "$content" ]]; then
  printf 'vocabulary-lint: blocked. Extracted content is empty (likely malformed input). Refusing to fail open.\nFile: %s\n' "$file" >&2
  exit 2
fi

# HK-NG-15: path-stripping pre-pass. Substitute any substring matching a path-
# like shape (alphanumeric + underscore + dot + slash + dash, ending in a
# known doc/code extension) with the placeholder <PATH>. This way, lineage
# terms inside legitimate file-path references (e.g., a .sh file mentioning
# "../KABIR_GATE.md" in code or comment) are not flagged. Lineage terms in
# variable/function/identifier positions are still caught by the TERMS scan
# below. The extension list mirrors the file-extension exemption case above,
# plus .sh and .py (kit code files).
content_scannable=$(printf '%s' "$content" | sed -E \
  's,[A-Za-z0-9_./-]+\.(md|toml|sh|py|json|yaml|yml|txt|lock|log|csv|tsv),<PATH>,g')

# Term patterns blocked in code paths. Each entry is split via bash adjacency
# concatenation so this source file does not contain contiguous term substrings.
declare -a TERMS=(
  "Gar""bha" "Baa""lya" "Bra""hmacharya" "Gri""hastha" "Vana""prastha" "Sann""yasa" "Mok""sha"
  "Kri""shna" "Sara""swati" "Bra""hma" "Shi""va" "Vish""nu" "Ra""m" "Si""ta" "Laksh""man"
  "Hanu""man" "Gane""sh" "Nara""d" "Bud""dha" "Pata""njali" "Kabi""r" "Gorakh""nath"
  "Ruk""mini" "Jamba""vati" "Satya""bhama" "Kali""ndi" "Nagna""jiti" "Mitra""vinda" "Bha""dra"
  "Maha""Kaal" "Ardh""Narishwar" "Pra""chi" "Drish""ti" "Ji""va" "Jeevan""yatra" "Shas""tra"
)

for t in "${TERMS[@]}"; do
  # HK-NG-12: two-pass match to avoid the `[A-Z]` becomes `[A-Za-z]` under -i
  # false-positive ("rambling" matching `\bRam[A-Za-z]`).
  # Pass 1: case-INSENSITIVE — word-boundary form OR snake_case form
  #   (Ram, ram, RAM, ram_, Ram_, RAM_)
  # Pass 2: case-SENSITIVE — CamelCase form (RamLoader, RamWorker)
  #   The CamelCase convention requires uppercase Term followed by uppercase
  #   letter; this is inherently a case-sensitive constraint.
  # If either pass matches, block.
  set +e
  printf '%s' "$content_scannable" | grep -Eiq "\\b${t}(\\b|_)"
  rc1=$?
  printf '%s' "$content_scannable" | grep -Eq "\\b${t}[A-Z]"
  rc2=$?
  set -e
  if [[ $rc1 -eq 0 ]] || [[ $rc2 -eq 0 ]]; then
    cat >&2 <<EOF
vocabulary-lint: blocked.
File: $file
Term: $t

IT-industry terms only in code paths. See VOCABULARY.md for the translation table.
Doc files (.md/.toml/.txt/.json/.yaml/.lock/.log/.csv/.tsv) and any */shastras/* or */templates/* paths are exempt.
HK-NG-12 boundary: term may not be followed by uppercase (CamelCase) or underscore (snake_case).
EOF
    exit 2
  elif [[ $rc1 -ge 2 ]] || [[ $rc2 -ge 2 ]]; then
    printf 'vocabulary-lint: pattern-error. grep exited %d/%d on term. Refusing to fail open.\n' "$rc1" "$rc2" >&2
    exit 2
  fi
done

exit 0
