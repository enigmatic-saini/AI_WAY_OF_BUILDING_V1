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

Use `/mr`. **(Extended 2026-05-31 deep-night per [KABIR_GATE.md additions log entry 24](KABIR_GATE.md) as Phase 3 of the external-AHR ITIL benchmark — ITIL classification (Standard/Normal/Emergency) + reviewer-routing matrix + mandatory rollback + PIR convention added.)**

### §4.1 — ITIL classification (added Phase 3)

Every MR carries one of three classifications. The `/mr` skill labels the MR description with the classification; reviewers route by it.

| Classification | Definition | Examples |
|---|---|---|
| **Standard** | Low-risk, well-understood, follows a pre-approved pattern | dependency-bot bumps within policy; doc typo fix; pre-approved config tweak |
| **Normal** | Default class — medium risk, requires substantive review | feature work; refactors; new endpoints; bug fixes |
| **Emergency** | Urgent, often during/after incident; expedited review | security patch (Critical/High); incident hotfix; urgent data fix |

Classification is **orthogonal to sensitivity-trigger routing** (§4.2). An Emergency security-patch is BOTH Emergency AND sensitivity-flagged — both apply.

If unsure, **default Normal**. Standard is for pre-approved pattern-changes only; Emergency is for genuinely urgent fixes (not just "I want to ship this fast").

### §4.2 — Sensitivity triggers

The `/mr` skill scans the diff and flags any of these:
- `auth/*`, `*auth*` files
- PII paths (user data, profile, contact)
- Payment paths
- Schema files (`migrations/`, `schema.*`)
- Public APIs (`api/`, `*Controller*`, route definitions)
- IaC (`*.tf`, `*.yaml` in `infra/`, `k8s/`, `helm/`)

If any flagged: **sensitive**. Otherwise: **non-sensitive**.

### §4.3 — Reviewer-routing matrix (classification × sensitivity)

The reviewer count is the **max** between classification's floor and sensitivity's floor. Sensitivity adds the `security` reviewer. **Sensitivity-triggers are NEVER expedited away by Emergency classification** — Emergency-sensitive still requires 2 reviewers + security; it just gets expedited queue priority.

| Classification | Sensitivity | Reviewers required | Mandatory PIR |
|---|---|---|---|
| Standard | non-sensitive | 1 (lightweight review) | No |
| Standard | sensitive | 2 + `security` | Yes (§4.5) |
| Normal | non-sensitive | 1 (substantive review) | Conditional (large diffs) |
| Normal | sensitive | 2 + `security` | Yes (§4.5) |
| Emergency | non-sensitive | 1 (expedited queue) | Yes within 24h (§4.5) |
| Emergency | sensitive | 2 + `security` (expedited queue) | Yes within 24h (§4.5) |

**Standard is 1 reviewer minimum, NOT zero.** ITIL's "Standard = pre-approved at class level (0 per-change reviewers)" assumes infrastructure (dep-bot + passing CI + policy validation) that the kit cannot assume in every consuming project. The kit's floor is 1 — the consuming project may raise it but cannot drop it. See [JOURNEY/2026-05-31T03-00-standard-class-min-1-reviewer.md](JOURNEY/2026-05-31T03-00-standard-class-min-1-reviewer.md) for the precedent.

Reviewer matching by file paths (unchanged from prior §4):
- Backend / data-layer → backend reviewer
- Frontend / UI → frontend reviewer
- IaC / CI → devops reviewer
- Schema / migration → data-engineer reviewer
- Auth / PII / payment → **+ security reviewer (always)**

Also: spawn the `reviewer` role (via `Agent`) for a second-opinion review before the human queue.

### §4.4 — MR template (extended Phase 3)

```
## Classification
- [ ] Standard | Normal | Emergency
- Sensitivity triggers: <none | auth | PII | payment | schema | public-API | IaC>
- Reviewers requested: <list>
- PIR: <not required | conditional | required within 24h>

## Summary
<1-3 bullets>

## Why
<the user-facing reason or the engineering reason>

## M_build context
- Stage: <build | service>
- Transition: <T_loop | T3>
- Cycle profile used: <Q | S | D | 3x4>

## Test plan
- [ ] <bulleted markdown checklist>

## Rollback (mandatory)
- Rollback procedure: <exact git/deploy commands to undo this change>
- Estimated time-to-rollback: <minutes>
- Forward-only changes (un-rollbackable): <list or "none">
- Rollback verification: <how we'll know rollback succeeded>

## Audit trail
- Related ADRs: <decisions/ADR-NNN.md links>
- Related incidents: <postmortems/INC-NNNN.md links>
- Related patches: <patches/PATCH-NNN.md links>
- Related release: <release-notes/RELEASE-NOTES-v<...>.md if this MR ships in a tagged release>
```

The Rollback section is **mandatory** — same discipline as `/release` step 6 (per Phase 2). Even a perfect MR needs a documented rollback for audit + future incidents.

### §4.5 — PIR (Post-Implementation Review) convention

PIR captures *what actually happened after the change landed* — distinct from MR review (what's *proposed*) and HANDOVER (what's *in flight this session*).

| Classification | PIR requirement |
|---|---|
| Standard | Not required (the class itself is the policy review) |
| Normal | Conditional — required for large diffs (consuming project defines threshold; default: > 500 LOC or > 10 files) |
| Emergency | **Mandatory within 24h** of merge, regardless of size |

**Where PIR lives:** a labeled subsection in the next HANDOVER session block after the MR merges:

```
## PIR for MR #N (<classification>)

- **Did the change land as planned?** <yes / no — what diverged>
- **Did any incident result?** <none / link to postmortems/INC-NNNN.md>
- **Did the rollback section turn out to be accurate?** <yes / no — what was missing>
- **Lessons:** <what we now know that we didn't when we proposed the change>
- **Follow-up tasks:** <link to TODO entries or future MRs>
```

**Resisted: a `pir` canonical doc type.** PIR is borderline per the audit — HANDOVER suffices. The 11th canonical type is reserved for genuinely new shapes, not for content that fits an existing channel.

### §4.6 — Merge conditions

**The MR cannot be merged until:**
- `/pre-commit-8l` PASS on the final commit.
- All requested reviewers approve (per §4.3 matrix).
- Required CI passes.
- For sensitive changes: 2 human approvals + `security` sign-off.
- Rollback section is populated (not "TBD") — per §4.4.
- For Emergency MRs: the rollback section is *verified* (rollback command tested) before merge.

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

Use `/incident` IMMEDIATELY when a P1/P2 alert fires. **(Extended 2026-05-31 deep-night-4 per [KABIR_GATE.md additions log entry 25](KABIR_GATE.md) as Phase 4 of the external-AHR ITIL benchmark — P4 severity added; full SLA matrix codified; KB-feedback loop (postmortem → runbook) added.)** The skill runs:
1. Acknowledge (within the SLA-ack window per §6.1)
2. Channel (open `#inc-<id>` + incident doc)
3. Triage (symptom / impact / start time / recent changes)
4. Mitigate (restore service first; root cause later) within the SLA-mitigation budget per §6.1
5. Restore (confirm with metrics, not eyeballs)
6. Watch (stay on ≥1 hour after restore)
7. Postmortem (blameless, per §6.2) — **including the KB-feedback step (§6.3)**

### §6.1 — Severity classification + SLA matrix (extended Phase 4)

The kit's severity taxonomy and SLA convention:

| Severity | Definition | Ack window | Mitigation budget | Restore target | Postmortem |
|---|---|---|---|---|---|
| **P1** | Customer-impacting outage, all-hands, revenue/safety at risk | 5 min | 15 min | 1 hour | Required within 5 business days |
| **P2** | Degraded service, on-call only, customer-visible but not full-outage | 15 min | 1 hour | 4 hours | Required within 5 business days |
| **P3** | No customer impact, fix in-hours | 1 hour (business hours) | 1 business day | 5 business days | Recommended (mandatory if recurring) |
| **P4** | Low impact, tracked but no SLA pressure (cosmetic, hygiene, known-issue) | 1 business day | 30 days | 90 days | Not required (an ADR or TODO entry is sufficient) |

These are kit-level **defaults**. Consuming projects may tighten (e.g., a finance system may set P1 ack to 2 min) but cannot loosen beyond these without explicit project-level documentation (Sita's "no-one-watching" lens).

When severity is unclear, **upgrade**. P3-vs-P4 borderline → call it P3. P1-vs-P2 borderline → call it P1. Downgrading later (with evidence) is auditable; under-classifying initially is the failure mode this discipline catches.

### §6.2 — Postmortem (blameless) — required for P1/P2; recommended for P3 if recurring

Every P1 and P2 incident produces a postmortem within 5 business days. The artifact lives at `postmortems/INC-NNNN.md` per [DASHBOARD.md §2.7](DASHBOARD.md) (canonical type `postmortem`). The [POSTMORTEM template](templates/POSTMORTEM.md) is the canonical body shape.

Blameless framing is non-negotiable: *"What was the system that allowed this?"* — not *"Who broke it?"*

### §6.3 — KB-feedback loop (postmortem → runbook) (added Phase 4)

Every P1 and P2 postmortem must produce **one of two outcomes** in its `runbook-updates:` frontmatter field and its "Runbook updates" body section:

1. **At least one runbook update** — either a NEW `runbooks/<service>.md` file (per [DASHBOARD.md §2.8](DASHBOARD.md)) or an AMENDMENT to an existing runbook. The amendment must teach the operator what to do if the same incident recurs.
2. **An explicit "no runbook change needed" statement** with a one-sentence justification — for example: *"This was a one-off corrupted-data event upstream; no operational pattern survives the postmortem. No runbook change."*

The discipline is: *the kit's anti-hypocrisy on incident learning is that lessons must flow to where the operator looks during the next incident.* Postmortems that gather dust in `postmortems/` without runbook propagation are ceremony. The `runbook-updates: []` empty default + the body-section "no runbook change needed" rule forces the propagation decision to be made and recorded.

For P3 postmortems (if produced): the KB-feedback step is recommended, not required. For P4: the postmortem itself is not required, so the KB-feedback step does not apply.

When unsure, **upgrade**.

## §7 — Repo Hygiene (always)

- **Never force-push to `main`.** The `block-dangerous-bash` hook enforces this.
- **No secrets in commits.** The `secret-scan` hook enforces this.
- **No `--no-verify`.** The `block-dangerous-bash` hook enforces this.
- **Every MR carries an ITIL classification** (Standard / Normal / Emergency, per §4.1). The `/mr` skill enforces. Default Normal if unsure.
- **Every MR has a populated Rollback section** (per §4.4). Even a perfect MR. Sita's "no-one-watching" lens applies.
- Dead code: delete, do not comment out.
- Large binaries: never commit. Use `.gitignore`.
- Tag releases: `v<X.Y.Z>`. Every tag has a STATUS.md entry. The `semver-check` hook enforces SemVer 2.0 format on tag creation. Every tagged release has a `release-notes/RELEASE-NOTES-v<X.Y.Z>.md` per [DASHBOARD.md §2.10](DASHBOARD.md).

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
