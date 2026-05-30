---
type: patch-record
id: PATCH-NNN
classification: Critical
status: PROPOSED
identified-at: YYYY-MM-DD
sla-window: 24h
applied-at: null
verified-at: null
source: CVE-NNNN-NNNNN
affected: []
links: []
---

# PATCH-NNN — [one-sentence summary of what is being patched]

> Classification: see frontmatter `classification:` (Critical | High | Medium | Low)
> Status: see frontmatter `status:` (PROPOSED → TESTING → APPLIED → VERIFIED, or ROLLED-BACK)
> SLA window: see frontmatter `sla-window:` (24h / 7d / 30d / 90d per classification)
> Identified at: see frontmatter `identified-at:`
> Source: see frontmatter `source:` (CVE id, advisory URL, dependency-bot alert ref, etc.)

## Source

The advisory / alert / discovery that triggered this patch:

- **CVE / Advisory ID**: <CVE-NNNN-NNNNN or vendor advisory link>
- **Discovered via**: <dependency-bot / security team / external report / internal audit>
- **Published**: <date when the advisory was made public>
- **CVSS** (if applicable): <score and vector>

## Impact

What is at risk if this patch is NOT applied within the SLA window:

- **Affected systems / dependencies**: <list>
- **Exploit availability**: <none / proof-of-concept / active exploitation in the wild>
- **Blast radius**: <which crown-jewels / customer-facing surfaces are exposed>
- **Workaround (if any)**: <temporary mitigation while patch is in flight>

## Classification justification

Why this is `<classification>` and not the adjacent tiers. Mira's anti-dilution lens: if borderline, default *up*; if Critical→High borderline, name it Critical and re-classify down only after evidence.

## Rollback plan

If this patch breaks production, the exact procedure to undo:

- **Git**: <commits to revert, tag to redeploy from>
- **Data / migrations**: <forward-only changes flagged as un-rollbackable, if any>
- **Cache / config**: <anything to clear/restore>
- **Estimated time-to-rollback**: <minutes>
- **Rollback verification**: <how we'll know the rollback succeeded>

## Test plan

How we will verify the patch closes the vulnerability without regressing:

- **Negative test** (the original vulnerability should no longer be exploitable): <test description / reference>
- **Regression test** (existing functionality must not move): <test suite to run / reference>
- **Acceptance criteria**: <what PASS looks like before we mark `status: VERIFIED`>

## Application

| Step | When | By | Notes |
|---|---|---|---|
| Identified | YYYY-MM-DD HH:MM | <who> | Source: <ref> |
| Triaged | YYYY-MM-DD HH:MM | <who> | Classification confirmed |
| Tested | YYYY-MM-DD HH:MM | <who> | Test plan executed; PASS / FAIL |
| Applied | YYYY-MM-DD HH:MM | <who> | Set `applied-at:` in frontmatter |
| Verified | YYYY-MM-DD HH:MM | <who> | Set `verified-at:` in frontmatter; set `status: VERIFIED` |

## Verification result

Evidence that the patch closed the vulnerability:

- <Reference to the negative test passing>
- <Reference to the regression test passing>
- <Any monitoring / canary metrics showing the system healthy post-patch>

If `status: ROLLED-BACK`, record instead:

- **Why**: <root cause of the rollback>
- **What broke**: <observable symptom>
- **Next**: <re-attempt date / alternative plan / accept-and-document>

## Links

- **MR**: <link to the merge request>
- **Related incident** (if any): <postmortems/INC-NNNN.md>
- **Related ADR** (if any): <decisions/ADR-NNNN.md>
- **Upstream fix**: <commit / release in the upstream dependency>
- **Cross-referenced PATCH-RECORDs** (e.g., a follow-up patch): <patches/PATCH-MMM.md>

---

> *Per [/patch skill](../../.claude/skills/patch/SKILL.md) procedure + [DASHBOARD.md §2](../../DASHBOARD.md) canonical-doc contract + [KABIR_GATE.md additions log entry 22](../../KABIR_GATE.md).*
