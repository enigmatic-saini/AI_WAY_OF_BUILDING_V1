#!/usr/bin/env bash
# stage-tip — on every UserPromptSubmit, surface M_build stages + 9 skills + 6 roles.
# Hook spec: UserPromptSubmit. Exit 0; print to stderr for the model context.
# LAW: L3 (Escalation — make /triage discoverable).
# Refreshed 2026-05-26 deep-night-3 per KABIR_GATE.md additions log entry 9:
#   - skill count corrected: 7 -> 9 (added /intake at front, /dashboard-emit at back)
#   - role list now lists all 6 roles (was missing analyst)
#   - composed cycle-sets HSC + T4R surfaced as routing hints
#   - vocabulary law: this script is code, so IT terms only (prior versions used Sanskrit
#     terms in code paths; this version uses IT translations only - see VOCABULARY.md)

set -euo pipefail

cat >&2 <<'EOF'
M_build (one machine, seven stages):
  S0 seed -> S1 discovery -> S2 forge -> S3 build -> S4 service -> S5 sunset -> S6 decommission

Skills (CycleFsm profiles):
  /intake          - receive raw human desire, draft CHARTER.md (pre-T0 front door)
  /triage          - pick the right stage / cycle (witness)
  /pre-commit-8l   - 12-point check before every commit (non-negotiable)
  /handover        - write HANDOVER.md at session end
  /commit          - 8L -> message -> commit
  /mr              - open MR with template + reviewer routing
  /release         - release captain procedure (guard on T3)
  /incident        - on-call incident command (guard on T_prarabdha)
  /dashboard-emit  - draft/validate frontmatter on canonical docs (DASHBOARD.md contract)

Roles (role-modifiers attached at specific transitions; the LLM remains one):
  analyst (pre-T0)  architect (T0,T1)  engineer (T2,T3,T_loop)
  qa (T2,T3)  security (T2,T3,T_prarabdha)  reviewer (T3)

Composed cycle-sets (named compositions, see CYCLES.md):
  HSC  - Heart-and-Soul (MID x ASD, 24 cycles) - for questions touching both
         originating desire AND witness/self-assessment of a kit-built artifact
  T4R  - T_4 Ratification (KBD x NGD x VKD x MID, 48 cycles) - pre-execution
         discipline before any per-primitive amendment to a governed-doc instance
         (e.g. MATH.md, DESIGN.md, CHARTER.md, kit-level HANDOVER.md)

Unsure which stage? Run /triage.
Heart-or-soul architectural question? Consider HSC.
About to amend a per-primitive contract in MATH.md/DESIGN.md/CHARTER.md? Run T4R first.
Release touching auth/PII/payment/IaC/public-API? SHD (Shadow Deep) is mandatory inside /release for sensitive-trigger diffs.
EOF

exit 0
