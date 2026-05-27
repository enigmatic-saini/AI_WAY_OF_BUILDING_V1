# SDLC — Branches, Commits, MRs, Releases, Incidents

> The mechanics. Each section names the M_build transition it operates on.

## §1 — Branches

- `main` is the trunk. It always builds and passes tests.
- Feature branches: `feature/<short-name>`. Short-lived. Merged within days.
- Hotfix branches: `hotfix/<short-name>`. From `main`, merged back via MR with `priority: P1`.
- Release branches (optional, only for held-back releases): `release/v<X.Y>`.

**Stale branches** (no activity >30 days) are deleted after confirming no open MR.

## §2 — Commit messages (T₂, T_loop)

- **Subject:** imperative mood, ≤72 characters. Why over what.
- **Body** (optional, blank line after subject): explain *why*, not *what*. Reference the M_build transition.
- **Trailers:** if AI-assisted, add `Co-Authored-By: ...`.

Use `/commit` instead of `git commit` so the 8L gate is the easy path.

Examples:
- ✅ `add rate limiter to auth endpoint` (subject) + `Prevents brute-force per security/2026-04 threat model.` (body)
- ✅ `T_loop: refactor session store to use redis adapter`
- ❌ `wip` / `fix stuff` / `final final v3`

## §3 — Pre-Commit Review (the T₂ guard)

**Non-negotiable per LAW 8.** Every commit runs `/pre-commit-8l`. See `.claude/skills/pre-commit-8l/SKILL.md` for the 12 checks. If any fails: fix, do not bypass. The `block-dangerous-bash` hook will refuse `--no-verify`.

## §4 — Merge Requests (T_loop, T₃)

Use `/mr`. The skill:
1. Scans for sensitivity triggers (auth/PII/payment/schema/public-API/IaC).
2. Routes reviewers:
   - **Non-sensitive:** 1 reviewer (matched by domain).
   - **Sensitive:** 2 reviewers + `security` role spawned.
3. Fills the MR template (Summary, Why, M_build context, Test plan, Sensitivity, Rollback).
4. Spawns the `reviewer` role for a second-opinion before the human queue.

**The MR cannot be merged until:**
- `/pre-commit-8l` PASS on the final commit.
- All requested reviewers approve.
- Required CI passes.
- For sensitive changes: 2 human approvals + `security` sign-off.

## §5 — Releases (T₃)

Use `/release`. The skill runs:
1. RH3 (Pre-Release Battle-Readiness Pass)
2. STATUS.md honesty check
3. Release notes draft
4. Tag proposal (SemVer: `v<major>.<minor>.<patch>`)
5. Canary watch (≥1 hour)
6. Rollback gate (pre-staged command)
7. Tag and publish

**Co-ownership:**
- `architect` approves the tag.
- `qa` can veto the release.
- `engineer` runs the canary.
- `security` signs off if RH3 flagged security.
- `reviewer` provides second-eye on the tag.

## §6 — Incidents (T_prarabdha)

Use `/incident` IMMEDIATELY when a P1/P2 alert fires. The skill runs:
1. Acknowledge (within 5 min)
2. Channel (open `#inc-<id>` + incident doc)
3. Triage (symptom / impact / start time / recent changes)
4. Mitigate (restore service first; root cause later)
5. Restore (confirm with metrics, not eyeballs)
6. Watch (stay on ≥1 hour after restore)
7. Postmortem (blameless, within 5 business days)

**Severity:**
- **P1:** customer-impacting, all-hands. Mitigation budget: 15 min.
- **P2:** degraded, on-call only. Mitigation budget: 1 hour.
- **P3:** no customer impact, fix in-hours.

When unsure, **upgrade**.

## §7 — Repo Hygiene (always)

- **Never force-push to `main`.** The `block-dangerous-bash` hook enforces this.
- **No secrets in commits.** The `secret-scan` hook enforces this.
- **No `--no-verify`.** The `block-dangerous-bash` hook enforces this.
- Dead code: delete, do not comment out.
- Large binaries: never commit. Use `.gitignore`.
- Tag releases: `v<X.Y.Z>`. Every tag has a STATUS.md entry.

## §8 — Single remote

Configure ONE remote (origin). Default: local-machine GitLab. If this kit is vendored into a repo with a different SCM, override here.

## §9 — Maintenance calendar

| Frequency | Check | Cycle |
|---|---|---|
| Every session | HANDOVER.md updated | L9 (`/handover`) |
| Every commit | `/pre-commit-8l` PASS | L8 |
| Weekly | Heartbeat: are TODOs, FSMs moving? | — |
| Fortnightly | README.md accurate? | `DOC` |
| Monthly | STATUS.md honest? | `WR` |
| Monthly | Stale branches pruned? | `RR` |
| Quarterly | DESIGN.md matches code? | `TR` |
| Quarterly | Kabir Gate audit | `AHR` (see KABIR_GATE.md) |
| Annually | DESIGN.md still inspires? | `CA1` |
