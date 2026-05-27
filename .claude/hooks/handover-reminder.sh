#!/usr/bin/env bash
# handover-reminder — at session Stop, surfaces missing/stale HANDOVER.md.
# Hook spec: Stop. Exit 0 always; print to stderr for the user.
# LAW: L9.
#
# Two-layer awareness (added 2026-05-26 deep-night-3 per KABIR_GATE.md additions log entry 9):
#   - Project-level HANDOVER.md at $CLAUDE_PROJECT_DIR/HANDOVER.md (per DASHBOARD.md §2.5)
#   - Kit-level HANDOVER.md at $CLAUDE_PROJECT_DIR/AI_WAY_OF_BUILDING_V1/HANDOVER.md when the kit
#     is nested under the consuming project (created 2026-05-26 deep-night-2)
# Both are committed to git per DASHBOARD.md §2.5 policy 2026-05-20.

set -euo pipefail

base="${CLAUDE_PROJECT_DIR:-$PWD}"
project_ho="$base/HANDOVER.md"
kit_ho="$base/AI_WAY_OF_BUILDING_V1/HANDOVER.md"

stale_threshold=259200  # 3 days in seconds

mtime_of() {
  local f="$1"
  if [[ "$(uname)" == "Darwin" ]]; then
    stat -f %m "$f"
  else
    stat -c %Y "$f"
  fi
}

check_one() {
  local label="$1"
  local path="$2"
  local required="$3"  # "required" or "optional"

  if [[ ! -f "$path" ]]; then
    if [[ "$required" == "required" ]]; then
      cat >&2 <<EOF
handover-reminder: no $label HANDOVER.md found at $path.
Per LAW 9 + DASHBOARD.md §2.5, every session should leave one. Run /handover to write it.
Format: Where We Are, What Was Done, What Failed, What's Next, Open Questions, Key Decisions, Files Changed.
HANDOVER.md is committed to git (policy 2026-05-20, per DASHBOARD.md §2.5) so the governance layer can harvest session-end state across engineers and shifts.
EOF
    fi
    return 0
  fi

  local age
  age=$(( $(date +%s) - $(mtime_of "$path") ))
  if (( age > stale_threshold )); then
    printf 'handover-reminder: %s HANDOVER.md is more than 3 days old (age: %dh) at %s. Refresh it before resuming, or run /handover.\n' \
      "$label" "$((age / 3600))" "$path" >&2
  fi
}

# Project-level: required if no kit-level exists; otherwise optional (the project may legitimately
# only have a kit-level HANDOVER if it IS the kit itself).
if [[ -f "$kit_ho" ]]; then
  check_one "project-level" "$project_ho" "optional"
  check_one "kit-level" "$kit_ho" "required"
else
  check_one "project-level" "$project_ho" "required"
fi

exit 0
