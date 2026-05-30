# 2026-05-31 03:00 — Phase 3 central decision: Standard-class changes require 1 reviewer minimum (not ITIL's 0-reviewer pre-approve pattern)

> The audit's Phase 3 surfaced the central design question: when ITIL says "Standard changes are pre-approved (potentially 0 reviewers)," what does the kit say? Deciding under the same ITIL-arc drishti stack (`Saraswati → Vishwakarma → Ram + Sita ; consult: NGD, KBD, MID`) — Standard = 1 reviewer minimum, sensitivity-triggers NEVER expedited away by classification. Recording the reasoning so future sessions don't re-litigate.

## The Surfacing

ITIL v4 says **Standard** changes are pre-approved at the policy level — the *class* was approved by the CAB once; individual changes in the class flow without per-change approval. Examples: dependency-bot bumps within policy; pre-approved config tweaks; doc typos. ITIL allows these to deploy with 0 per-change reviewers because the *class* of change already passed CAB review.

The kit's existing discipline:
- **LAW 10**: never force-push to main. Implicitly: every merge to main is reviewed.
- **SDLC §4**: non-sensitive = 1 reviewer; sensitive = 2 reviewers + security.
- **block-dangerous-bash** hook: refuses `--no-verify`.

So the question: when adopting ITIL classification, should `Standard` align with ITIL (0 reviewers, auto-merge) or with the kit's existing 1-reviewer floor?

## The Decision

**Standard = 1 reviewer minimum.** Same as the kit's current non-sensitive default. Reasoning:

1. **The kit is technology-agnostic.** ITIL's "Standard = auto-approve" assumes infrastructure that pre-validates the change shape (e.g., dependency-bot's automated bumps with passing CI = no human review). The kit cannot assume that infrastructure exists in every consuming project. Defaulting to 1 reviewer is the safe lower bound.

2. **LAW 10 + the spirit of SDLC §4.** "Never force-push to main" implies "every merge is witnessed." Standard-class can have a *lightweight* review (skim + ✓) but not a *zero* review. Sita's "truth-when-no-one-is-watching" lens applies: a zero-reviewer merge means no human witnesses the merge at the moment it happens.

3. **The kit codifies floors, not policies.** Consuming projects with mature CI + dep-bot infra can override with their own policy (1 → 0 for known-safe classes). The kit's floor is 1; the project's ceiling can be higher.

**Sensitivity triggers ALWAYS apply on top of classification.** This is the more important rule. Emergency-sensitive does NOT bypass security review. Standard-sensitive does NOT auto-approve. Sensitivity is orthogonal to classification — both apply, and the max-reviewer-count wins.

**PIR requirements by class:**
- Standard: no PIR (the class itself is the review)
- Normal: conditional PIR (only for large diffs — exact threshold left to consuming projects)
- Emergency: mandatory PIR within 24h, recorded in HANDOVER session block with explicit "PIR for MR #N" subsection (linked from the MR)

## The Precedent

**Recorded so future sessions don't re-litigate.** The next session that revisits change-management discipline will see this entry. The line is: *the kit can be stricter than ITIL but never looser at the merge boundary.* ITIL is the floor for what the kit's discipline must cover; the kit raises floors where its broader principles (LAW 10, LAW 11, Sita's "no-one-watching" lens) demand.

## What I Want You To Notice

Three things:

1. **The reviewer-routing matrix is two-dimensional, not one-dimensional.** Classification (Standard/Normal/Emergency) and sensitivity-trigger (auth/PII/payment/schema/public-API/IaC) are independent. A Standard dep-bump that happens to touch `migrations/` (schema trigger) becomes a 2-reviewer + security review. An Emergency security-patch CANNOT bypass that. **The MAX of the two dimensions wins** at the reviewer count; both dimensions independently can require PIR.

2. **The kit raises floors; it does not lower them.** ITIL says Standard can be 0-reviewer. The kit says Standard is 1-reviewer minimum. This is the general pattern: when in tension between ITIL's flexibility (which assumes downstream policy + tooling) and the kit's general principles (LAW 10, LAW 11), pick the principled floor. The consuming project can extend (e.g., add more reviewers, add more PIR requirements) but cannot remove a kit-level floor.

3. **PIR for Emergency goes in HANDOVER, not a new canonical type.** Resisted the temptation to add a `pir` canonical doc type. The audit was clear: PIR is *borderline* — HANDOVER already captures session-level review. A new canonical type would have been ceremony. The mandatory "PIR for MR #N" subsection in the HANDOVER session block + the MR's cross-link is sufficient audit trail. **The 11th canonical type is reserved for genuine new shapes**, not for things that fit existing channels.

---

*Captured by GURU under Sanjay → Vyasa → Saraswati ; consult Ashtavakra, Narad.*
*Session context: 2026-05-31 deep-night-3 — opening Phase 3 (Change Management extensions) of the external-AHR ITIL benchmark; founder said "go" implicitly delegating the central design question.*
*Related artifacts: AHR_PASS_2026-05-30_itil-external.md (the audit naming the Phase 3 question); SDLC.md §4 (the existing MR discipline being extended); LAW 10 + LAW 11 (the kit-level principles that anchored the floor); KABIR_GATE additions log entry 24 (forthcoming, the governance record of Phase 3).*
