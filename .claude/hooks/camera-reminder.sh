#!/usr/bin/env bash
# camera-reminder — at session Stop, surface a reminder if JOURNEY/ exists but
# no recent entry was written this session.
#
# Hook spec: Stop. Exit 0 always; print to stderr for the user.
# LAW: extends LAW 9 (Living Documentation) to mid-session capture.
# Companion: the /camera skill + the guru role descriptor.
#
# Discipline:
#   - If no JOURNEY/ folder exists anywhere visible, exit 0 (project hasn't
#     adopted the GURU role).
#   - If JOURNEY/ exists AND a recent entry was written (within the session
#     window) → exit 0.
#   - Otherwise → print a reminder to stderr suggesting /camera or /handover.
#
# The hook does NOT auto-write. The /camera skill does that — invoked by the
# LLM under the guru role's discipline. The hook is a backstop.

set -euo pipefail

base="${CLAUDE_PROJECT_DIR:-$PWD}"
kit_journey="$base/AI_WAY_OF_BUILDING_V1/JOURNEY"
project_journey="$base/JOURNEY"

# If neither JOURNEY/ exists, the project hasn't adopted the role; remain silent.
if [[ ! -d "$kit_journey" ]] && [[ ! -d "$project_journey" ]]; then
  exit 0
fi

mtime_of() {
  local f="$1"
  if [[ "$(uname)" == "Darwin" ]]; then
    stat -f %m "$f"
  else
    stat -c %Y "$f"
  fi
}

session_window=10800  # 3 hours in seconds — a generous session-duration bound
now=$(date +%s)

recent_entry_exists() {
  local dir="$1"
  [[ -d "$dir" ]] || return 1
  local newest
  newest=$(find "$dir" -maxdepth 1 -name "*.md" -type f -print0 2>/dev/null \
    | xargs -0 ls -t 2>/dev/null | head -1)
  [[ -z "$newest" ]] && return 1
  local age=$(( now - $(mtime_of "$newest") ))
  (( age < session_window ))
}

if recent_entry_exists "$kit_journey" || recent_entry_exists "$project_journey"; then
  exit 0  # session captured; no reminder
fi

# JOURNEY/ exists somewhere but no recent entry. Backstop reminder.
cat >&2 <<EOF
camera-reminder: a JOURNEY/ folder exists but no entry was written in the last 3h.
If this session surfaced an important detail, a precedent, or a decision the
founder should know about, run /camera to capture it before closing. If the
session warrants a full end-of-session synthesis, run /handover instead.

The discipline (per .claude/agents/guru.md):
  - mid-session moments       -> /camera   -> JOURNEY/<date>T<time>-<slug>.md
  - end-of-session synthesis  -> /handover -> HANDOVER.md (a new session block)

A trivial session (typo fix, bug squash without precedent value) may
legitimately have neither -- the documentation 'standard' Q-axis refuses to
record the trivial.
EOF

exit 0
