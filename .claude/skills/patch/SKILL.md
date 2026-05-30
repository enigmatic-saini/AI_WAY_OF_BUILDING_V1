---
name: patch
description: ITIL-class patch management lifecycle — identify, classify (Critical/High/Medium/Low), plan rollback, apply, verify, record. Writes a `patches/PATCH-NNN-<slug>.md` artifact per the PATCH-RECORD canonical type. Use for security patches (CVE-driven), dependency updates, and any change whose primary purpose is fixing a vulnerability or version delta rather than adding a feature. The /commit + /mr flow covers feature-shaped changes; this skill covers patch-shaped changes.
---

# /patch — patch management lifecycle

The kit's patch-management discipline, codified per ITIL v4 + OWASP. Writes one PATCH-RECORD artifact per patch, with SLA-window-tracked classification.

## When to use

- **Security patches** (CVE advisory, supply-chain alert, dependency vulnerability) — Critical / High / Medium / Low.
- **Dependency updates** that close known vulnerabilities (e.g., bumping a library past a CVE).
- **Any change** whose primary purpose is fixing a defect/vulnerability rather than adding a feature.

## When NOT to use

- Feature work → use `/commit` + `/mr` directly.
- Active incident response → use `/incident` (the patch artifact emerges *from* the incident postmortem; this skill is for proactive / planned patches).
- Architectural refactor → use `/commit` with the appropriate cycle (`AR` for architecture review).

## Procedure (Q profile, 4 cycles)

### 1. Identify + Classify
- Record the source: CVE-NNNN-NNNNN ID, advisory link, dependency-bot alert, etc.
- Classify under the four-tier taxonomy:

| Classification | Definition | SLA window (convention — projects may tighten) |
|---|---|---|
| **Critical** | Active exploit in the wild; severity CVSS ≥ 9.0; affects production crown-jewels | < 24 hours from identification |
| **High** | No active exploit yet; CVSS ≥ 7.0; or affects production but not crown-jewels | < 7 days |
| **Medium** | CVSS 4.0–6.9; or affects non-production / lower-criticality systems | < 30 days |
| **Low** | CVSS < 4.0; or hardening / hygiene with no immediate threat | < 90 days |

If classification is ambiguous, default *up* (Critical→High borderline → call it Critical and re-classify down only after evidence). Mira's anti-dilution lens applies here.

### 2. Plan rollback + test
- Write the rollback plan: *if this patch breaks production, what is the exact procedure to undo?*
  - Git: which commits to revert; which tag to redeploy from.
  - Data/migrations: any forward-only changes? Name them as un-rollbackable; flag risk.
  - Cache / config: anything that needs to be cleared/restored.
- Write the test plan: *how will we verify the patch actually closes the vulnerability without regressing?*
  - Negative test: the vulnerability that this patch addresses should no longer be exploitable.
  - Regression test: existing functionality should not have moved.
- Critical + High patches: rollback plan + test plan are **required** in the PATCH-RECORD before applying.
- Medium + Low: rollback plan required; test plan is "smoke test + standard test suite" by default.

### 3. Apply + verify
- Apply the patch via the appropriate path:
  - Standard flow: `/pre-commit-8l` → `/commit` → `/mr` → review → merge.
  - **Emergency** (Critical with active exploit): the *expedited* /mr flow — same gates (8L still runs, reviewer still approves), but the SLA may compress review-time to minutes. Emergency does NOT bypass the gates; it expedites the queue.
- Verify after deploy:
  - Run the test plan from step 2.
  - Confirm the original vulnerability is no longer exploitable.
  - Watch the canary window per `/release` discipline if the patch shipped via a release.

### 4. Record
- Write the PATCH-RECORD artifact to `patches/PATCH-NNN-<slug>.md` per the [PATCH-RECORD template](../../templates/PATCH-RECORD.md). Required fields per the [DASHBOARD.md §2](../../DASHBOARD.md) canonical contract:
  - `type: patch-record`
  - `id: PATCH-NNN` (zero-padded 3 digits; project-local sequence)
  - `classification: Critical | High | Medium | Low`
  - `status: PROPOSED | TESTING | APPLIED | VERIFIED | ROLLED-BACK`
  - `identified-at: <ISO-8601 date>`
  - `sla-window: <window per classification>`
  - `applied-at: <ISO-8601 date when applied; null until applied>`
  - `verified-at: <ISO-8601 date when verified; null until verified>`
  - Body sections: Source, Impact, Rollback plan, Test plan, Verification result, Links.
- The PATCH-RECORD is **committed to git** as part of the change (it IS the audit trail).
- Link the PATCH-RECORD from the related MR, incident postmortem (if any), and any cross-referenced ADRs.

## Output template

```
PATCH RECORD WRITTEN
====================
ID:              PATCH-NNN
Classification:  Critical | High | Medium | Low
SLA window:      <window>
Status:          PROPOSED | TESTING | APPLIED | VERIFIED | ROLLED-BACK
Path:            patches/PATCH-NNN-<slug>.md
Source:          <CVE / advisory / alert>
Linked MR:       <MR ref or N/A — emergency cases land MR after, not before>
Next:            <one-line: what's the next discipline step?>
```

## Anti-patterns

- **Classifying *down* under pressure** ("it's just Medium, we don't have time for the full 7-day SLA"). Mira's anti-dilution lens — name capacity as capacity, do not erase the classification. If a Critical can't be patched in 24h, the *gap* is named, not the classification.
- **Skipping the rollback plan** for "obvious" patches. The least-obvious-to-skip is precisely the one most likely to require rollback. KBD anti-hypocrisy says: the rollback plan section is non-negotiable.
- **Bypassing /pre-commit-8l** under "emergency." Block-dangerous-bash refuses `--no-verify` regardless. Emergency expedites, doesn't skip.
- **Patches without verification** (`status: APPLIED` but `verified-at: null` for > 24h after apply). The Sita pin: a patch is not done until verified.
- **Reusing PATCH-RECORDs** for unrelated patches (one record per patch — each gets its own id). The audit trail relies on 1:1 mapping.
- **Recording patches *after* they are applied** without the PROPOSED / TESTING states. The record IS the discipline, not just the receipt.

## Provenance

Added 2026-05-30 night-late per [KABIR_GATE.md additions log entry 22](../../KABIR_GATE.md) as Phase 1 of the external-AHR ITIL benchmark ([AHR_PASS_2026-05-30_itil-external.md](../../AHR_PASS_2026-05-30_itil-external.md)). Founder's prior session named the gap: solution architect by profession, hobby-git only; the kit had no patch-management discipline. This skill closes that gap.
