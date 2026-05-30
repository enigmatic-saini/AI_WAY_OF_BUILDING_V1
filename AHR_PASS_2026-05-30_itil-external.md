# AHR PASS 2026-05-30 — external-benchmark audit: kit vs ITIL v4 service management

> **First instance of the external-benchmark AHR class.** The kit-internal AHR (KABIR_GATE §12, 13 audit points) asks *"does the kit live what it claims?"*. This pass asks the orthogonal question: *"does the kit live what an enterprise workplace would expect?"* The founder named the gap on 2026-05-30 night: solution architect by profession; hobby-git only; uncertain whether the kit meets workplace standards. Today's pass benchmarks against **ITIL v4** across four service-management domains and recommends a build order with NGD rent-checks per gap.

## Provenance

- **Authored** under the drishti stack `Saraswati → Vishwakarma → Ram + Sita ; consult: NGD, KBD, MID` chosen by Claude in [JOURNEY/2026-05-30T23-15-itil-discipline-arc-genesis.md](JOURNEY/2026-05-30T23-15-itil-discipline-arc-genesis.md).
- **Authority delegated** by the founder 2026-05-30 night-late: *"You decide as you know ITIL."*
- **Scope** (per the analyst-style mirror in HANDOVER session-evening-late block + the ITIL-arc-genesis JOURNEY entry): four domains — Change Management, Incident Management, Release Management, Patch Management.
- **What this is NOT**: not specific tool recommendations (no Jira/ServiceNow/PagerDuty/Snyk); not SOC2/ISO27001 enforcement; not re-standardization of git workflow (kit already takes trunk-based + short-lived feature branches per LAW 10 + SDLC.md); not a wholesale rewrite of existing primitives.

## ITIL v4 framing (in one paragraph)

ITIL v4 codifies service management as a continuous flow: *identify → classify → plan → execute → verify → record → review*. The four domains audited here each have this lifecycle, parameterized differently:
- **Change Management** parameterizes the lifecycle around *planned modifications to deployed systems* (normal/standard/emergency change classification, CAB approval workflow, rollback plan, post-implementation review).
- **Incident Management** parameterizes it around *unplanned disruptions* (P1–P4 severity, on-call response, RCA, knowledge feedback).
- **Release Management** parameterizes it around *promotion of versioned packages to production* (SemVer, release notes, staging→prod, canary/blue-green, rollback, audit trail).
- **Patch Management** parameterizes it around *security and dependency updates* (CVE-driven, critical/high/medium/low classification, SLA per class, emergency path).

The kit's own existing discipline (LAWS.md, SDLC.md, KABIR_GATE.md, the 9 cycles + 9 skills + 6 + GURU's 7 roles + 6 + camera-reminder's 7 hooks) already implements parts of this. The audit per-domain identifies *which parts are covered, where the gaps are, and which gaps justify a new primitive under NGD's rent test.*

---

## Domain 1 — Change Management

**ITIL v4 expects:**
1. Change record (who, what, why, when, rollback plan) for every change
2. Classification: **Standard** (pre-approved, low risk — e.g., dependency bump matching policy) / **Normal** (CAB-approved, medium risk — e.g., feature work) / **Emergency** (urgent, high risk — e.g., active incident hotfix)
3. Change Advisory Board (CAB) — multi-reviewer approval for Normal changes
4. Documented rollback plan in every change record
5. Post-Implementation Review (PIR) — after the change lands

**Kit currently covers:**
| ITIL expectation | Kit primitive | Coverage |
|---|---|---|
| Change record | git commit message + MR description (per `/mr` skill + SDLC.md §5) | **PARTIAL** — has the record but no classification field, no rollback section by default |
| Standard / Normal / Emergency classification | none | **GAP** |
| CAB-equivalent | sensitivity-trigger 2-reviewer rule in SDLC.md §5 (auth/PII/payment/schema/public-API/IaC requires 2 reviewers) | **PARTIAL** — covers the "high-risk requires more eyes" principle but not the formal classification taxonomy |
| Rollback plan in record | none mandated; mentioned in `/release` as a "rollback gate" but not in `/mr` template | **GAP** |
| Post-Implementation Review | kit-level HANDOVER session block + `/handover` skill | **PARTIAL** — captures session-level "what happened" but not per-change PIR |

**NGD rent-check on the gaps:**
- *Classification field in MR template + reviewer-routing-by-classification policy*: pays rent (operationally distinct from current sensitivity-triggers; gives downstream projects a vocabulary to map to their own CAB) → **JUSTIFIED**
- *Mandatory rollback section in MR template*: pays rent (the kit currently assumes rollback is implicit in feature-branch + revert; ITIL says be explicit) → **JUSTIFIED**
- *PIR artifact*: borderline — HANDOVER already captures session-level review; a per-change PIR risks ceremony unless the change crossed a risk threshold. **JUSTIFIED for risk-classified Normal+Emergency changes only**, not Standard.

**Recommendation:** extend the existing `/mr` skill + SDLC.md MR template rather than create new primitives. Add: classification field, rollback section, conditional PIR (link to HANDOVER block).

---

## Domain 2 — Incident Management

**ITIL v4 expects:**
1. Incident lifecycle: detect → log → categorize → prioritize → diagnose → resolve → close → review
2. Severity classification: **P1** critical (major outage) / **P2** high (degraded service) / **P3** medium (minor disruption) / **P4** low (cosmetic / tracked)
3. On-call rotation — who responds when
4. SLA per severity (e.g., P1 ack < 15min, P2 < 1h, P3 < 4h)
5. Root Cause Analysis (RCA) — post-incident artifact
6. Knowledge feedback — RCA learnings flow to KB so the same incident doesn't recur

**Kit currently covers:**
| ITIL expectation | Kit primitive | Coverage |
|---|---|---|
| Lifecycle | `/incident` skill: ack → channel → triage → mitigate → restore → watch → postmortem | **STRONG** — covers all 8 ITIL phases (detect→log via "ack"; categorize→prioritize embedded in triage; diagnose→resolve in mitigate→restore; close→review in watch→postmortem) |
| P1/P2/P3/P4 severity classification | none explicit | **GAP** — `/incident` mentions "P1/P2 incidents" in its description but no formal taxonomy |
| On-call rotation | none | **GAP** — kit assumes single-developer or implicit rotation |
| SLA per severity | none | **GAP** |
| RCA artifact | `templates/POSTMORTEM.md` template + `postmortems/INC-*.md` convention per DASHBOARD.md frontmatter contract | **STRONG** |
| Knowledge feedback | KABIR_GATE additions log + the dashboard's POSTMORTEM rendering | **PARTIAL** — additions log catches kit-level learnings; project-level POSTMORTEMs are produced but no canonical "lessons flow into runbook/KB" loop |

**NGD rent-check on the gaps:**
- *P1–P4 classification taxonomy*: pays rent (gives `/incident` a concrete prioritization vocabulary downstream projects can map to their tooling) → **JUSTIFIED**
- *SLA per severity (ack-time / resolve-time)*: borderline — kit cannot enforce SLAs (it's tech-agnostic), but it CAN codify the contract that downstream teams write into their on-call docs. **JUSTIFIED as convention, not enforcement.**
- *On-call rotation*: **REJECTED** under NGD — this is a team-management concern, not a git-discipline concern. The kit codifies discipline, not org structure.
- *KB feedback loop*: pays rent (POSTMORTEMs currently die in postmortems/ folder; a discipline to surface their learnings into runbooks/ or a kit-level lessons.md would close the loop) → **JUSTIFIED**

**Recommendation:** extend `/incident` skill + POSTMORTEM template with P1-P4 classification + add a "lessons" propagation discipline (postmortem → runbook). No new role/hook; this is procedural.

---

## Domain 3 — Release Management

**ITIL v4 expects:**
1. SemVer (or equivalent) versioning
2. Release notes — what changed, what's new, what's broken
3. Staging → production promotion — tested before prod
4. Canary / blue-green deployment patterns for risk reduction
5. Rollback procedure — documented and tested
6. Audit trail — every release recorded for compliance review

**Kit currently covers:**
| ITIL expectation | Kit primitive | Coverage |
|---|---|---|
| Versioning | git tags + `/release` skill steps (proposes the tag) | **PARTIAL** — `/release` mentions "propose the tag" but no SemVer enforcement / format check |
| Release notes | `/release` drafts release notes | **PARTIAL** — drafts them but no canonical format |
| Staging → prod | none | **GAP** — kit assumes single-deploy hobby-project pattern |
| Canary / blue-green | `/release` sets up "canary watch" | **PARTIAL** — names the pattern but no concrete artifact |
| Rollback procedure | `/release` "rollback gate" mentioned | **PARTIAL** — names but doesn't codify |
| Audit trail | git history + HANDOVER + KABIR_GATE additions log | **STRONG** for kit-level; weaker for project-level release-specific records |

**NGD rent-check on the gaps:**
- *SemVer enforcement (format check on the tag)*: pays rent (catches `v1.2`, `release-1`, `v1.2.3.4` typos at gate-time) → **JUSTIFIED — as a hook**
- *Canonical release-notes template*: pays rent (kit already has 7 templates per DASHBOARD §2; an 8th for RELEASE-NOTES fits the existing contract) → **JUSTIFIED — extends DASHBOARD.md to 9 canonical types**
- *Staging→prod promotion artifact*: borderline — many projects don't have staging environments. **REJECTED for kit core; JUSTIFIED as optional convention** for projects that do.
- *Concrete canary/blue-green artifact*: **REJECTED** — too tooling-specific; kit codifies discipline, not deployment-tech specifics.
- *Codified rollback procedure*: pays rent (`/release` mentions it but doesn't enforce its presence) → **JUSTIFIED — as a required step in `/release` output template**

**Recommendation:** add a `semver-check` hook (PreToolUse on tag-creation or release commits) + add RELEASE-NOTES to the DASHBOARD frontmatter contract as the 9th canonical type + tighten `/release` skill to require rollback section in output. Staging→prod stays optional.

---

## Domain 4 — Patch Management

**ITIL v4 expects:**
1. Security patches (CVE-driven) — track advisories, schedule application
2. Dependency updates (e.g., Dependabot-class) — bumps to libraries with vuln/version policy
3. Classification: **Critical** (active exploit, immediate) / **High** (no exploit yet, soon) / **Medium** (planned cycle) / **Low** (tracked, deferred)
4. SLA per class (typical: Critical < 24h, High < 7d, Medium < 30d, Low < 90d)
5. Emergency patch path — fast-track for critical without skipping audit

**Kit currently covers:**
| ITIL expectation | Kit primitive | Coverage |
|---|---|---|
| Security patches | `secret-scan` hook for credentials; no CVE-tracking discipline | **NONE** |
| Dependency updates | none (kit has minimal deps: bash + jq; consuming projects' deps are out of kit scope BY CURRENT FRAMING — but the framing itself is a coverage decision) | **NONE** |
| Classification | none | **NONE** |
| SLA per class | none | **NONE** |
| Emergency path | `/incident` covers active-exploit cases (T_prarabdha edge) | **PARTIAL** — emergency patches that respond to a fired incident go through `/incident`, but proactive patches (no incident yet) have no path |

**This is the genuine gap.** All four sub-items are uncovered. Patch management is the only ITIL domain with NO kit primitive at all. Per NGD's rent-check — entire domain pays rent.

**Recommendation:** add a `/patch` skill that codifies the patch lifecycle (identify → classify → plan rollback → apply → verify → record) + a `patches/PATCH-NNN.md` artifact convention + a PATCH-RECORD canonical type added to DASHBOARD.md frontmatter contract (10th type — but only if RELEASE-NOTES from Domain 3 is also added; otherwise PATCH-RECORD is 9th). Add a `patch-classifier` hint to `/triage` (route patch-like work to `/patch` skill).

---

## Verdict per domain

| Domain | Coverage | Gap shape | Primitive type |
|---|---|---|---|
| Change Management | **PARTIAL** | Classification + rollback + PIR | Extend `/mr` + SDLC.md template (no new primitive) |
| Incident Management | **STRONG** | P1-P4 + SLA + KB feedback | Extend `/incident` + POSTMORTEM template (no new primitive) |
| Release Management | **PARTIAL** | SemVer + release-notes + rollback discipline | New `semver-check` hook + RELEASE-NOTES canonical type + tighten `/release` |
| Patch Management | **NONE** | Entire ITIL discipline | **New `/patch` skill + PATCH-RECORD canonical type + patches/ folder convention** |

## Recommended build order (Vishwakarma's Build A/B/C per gap)

**Phase 1 — Patch Management (clean slate, biggest rent paid):**
1. `/patch` skill (Q profile, 4 cycles — identify, classify, plan, record)
2. `templates/PATCH-RECORD.md` template with YAML frontmatter
3. `patches/README.md` folder-convention doc
4. Extend `DASHBOARD.md` §2 with `patch-record` type
5. Extend `frontmatter-check.sh` to recognize `patches/PATCH-*.md` path
6. KABIR_GATE additions log entry 22

**Phase 2 — Release Management extensions:**
1. `semver-check.sh` hook (PreToolUse on Bash, blocks malformed git tags)
2. `templates/RELEASE-NOTES.md` template
3. Extend `DASHBOARD.md` §2 with `release-notes` type
4. Tighten `/release` skill output template to require rollback section
5. KABIR_GATE additions log entry 23

**Phase 3 — Change Management extensions (no new primitives, template + skill changes):**
1. Add classification field to SDLC.md MR template (Standard / Normal / Emergency)
2. Add reviewer-routing-by-classification policy
3. Add rollback section to MR template
4. Tighten `/mr` skill to require classification + rollback
5. KABIR_GATE additions log entry 24

**Phase 4 — Incident Management extensions (template + skill changes):**
1. Add P1-P4 severity taxonomy to `/incident` skill + `templates/POSTMORTEM.md`
2. Add SLA convention reference (codified but not enforced — kit is tech-agnostic)
3. Add "lessons" propagation discipline (postmortem → runbook)
4. KABIR_GATE additions log entry 25

**Total new primitives** (across all 4 phases): 1 new skill, 1 new hook, 2 new canonical doc types (extending DASHBOARD.md contract from 8 to 10), 1 new folder convention. Plus template + skill text amendments. Counts will move 7 hooks → 8, 10 skills → 11.

## Why this order

- **Patch first** because: clean slate (no existing primitive to coordinate with), biggest gap (entire domain uncovered), fits VKD's "fresh build" preference, and the first patch record in `patches/` becomes a worked example for the others.
- **Release second** because: the SemVer hook is independent and small; the RELEASE-NOTES canonical type slots cleanly into the existing DASHBOARD contract; extends `/release` without changing its shape.
- **Change third** because: it's the largest *editorial* change (MR template + reviewer-routing policy) but no new primitives. Smaller surface area than Phase 1 + 2 combined.
- **Incident last** because: smallest delta — current `/incident` already covers the lifecycle; the additions are taxonomy + convention, not new primitives.

## Open questions for the founder (Mauna lens — what shouldn't I decide alone)

1. **DASHBOARD frontmatter contract extension (8 → 9 → 10 canonical types).** This touches a foundational contract. Should I treat extending it as a `T4R` event for each type (per CLAUDE.md row 5 — governed-doc amendment)? **Recommend yes.** T4R per type at landing-time.

2. **Folder convention `patches/`.** Mirror the existing `postmortems/`, `runbooks/`, `decisions/` convention. Default committed. Per-project preference allows `.gitignore`. **No founder input needed — convention pattern is established.**

3. **Phase ordering — start with Patch as recommended, or do you want a different order?** Mauna fires here. If you have a workplace pressure that favors a different domain first, say so. Otherwise I proceed with Phase 1 immediately following this audit.

4. **Within Phase 1: should the `/patch` skill be Q profile (4 cycles) or S profile (8 cycles)?** Patch lifecycle is 5-6 steps which fits Q. I'll default Q. Override with one word if you want S.

## Closing

This pass is the first instance of the **external-benchmark AHR class** — kit benchmarked against external industry shastras rather than against itself. Future external-AHR passes (SRE-class, OWASP-class, SOC2/ISO27001-class) can follow this template. If this class proves load-bearing across multiple passes, the next quarterly AHR may consider naming `EAHR` as a working-set cycle alongside `AHR` (the internal one).

Per Hanuman discipline: I am proceeding directly to **Phase 1 (Patch Management) build** in this same session. The founder's *"You decide as you know ITIL"* grants the scope. If you want me to stop after the audit and wait for confirmation, say so in your next message and I will halt; the audit alone is a complete deliverable.
