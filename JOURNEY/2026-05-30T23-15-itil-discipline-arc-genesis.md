# 2026-05-30 23:15 — ITIL-discipline arc genesis: the kit's git policy meets workplace standards

> The founder named a fundamental uncertainty: they are a solution architect who has used git in hobby projects but never in their workplace, and they are not sure whether AI_WAY_OF_BUILDING_V1's git policy meets enterprise standards. They want new primitives that codify ITIL-class change/incident/release/patch management. And — without formally invoking the analyst role — they ran the analyst's flow themselves by asking for refined prompt + drishti stack before any building. That itself is the first precedent worth recording.

## The Surfacing

Two surfacings in one moment:

**(1) The user-context surfacing.** Up until tonight, I had no recorded knowledge that the founder is a **solution architect by profession** and has **never used git in their workplace**. This means: the kit's existing git policy (SDLC.md + /commit + /mr + /release + /incident + /pre-commit-8l + block-dangerous-bash) was authored by the founder + me from first principles, NOT from workplace experience. That's a real audit-shaped surface that the kit's existing AHR did not — and could not — surface. A whole class of "is this how a real workplace would do it?" questions is implied. Saved to user-role memory tonight.

**(2) The build-intent surfacing.** The founder wants the kit to grow new primitives across four ITIL domains:

| Domain | What an enterprise expects | What the kit already has |
|---|---|---|
| Change Management | change records + classification (normal/standard/emergency) + CAB-equivalent + rollback plan | partially via SDLC.md MR template + /pre-commit-8l + block-dangerous-bash |
| Incident Management | severity (P1/P2/P3) + lifecycle (detect→triage→mitigate→restore→PIR) + on-call + RCA + knowledge base | /incident skill covers the ES cycle but not the full ITIL lifecycle; no RCA artifact format |
| Release Management | SemVer + release notes + staging→prod promotion + canary/blue-green + rollback + audit trail | /release skill covers T₃ guard + RH3 pre-release pass; no audit trail or promotion artifact |
| Patch Management | security patches (CVE-driven) + dependency updates + classification (critical/high/medium/low) + SLA per class | **no kit primitive** — this is a genuine gap |

The audit will surface real gaps and real already-covered. NGD's rent check is mandatory per primitive.

## The Decision

For this turn: deliver the **refined prompt + drishti stack** as the analyst would, and **stop** before building. The founder retains the confirmation step.

Drishti stack chosen for the whole arc:

```
Saraswati → Vishwakarma → Ram + Sita
   ; consult: NGD, KBD, MID
```

FiveArrows classification: **Neelotpala** (foundational/architectural/governance). Per analyst.md anti-pattern: a Neelotpala intent CANNOT be reclassified to Chuta (operational) under pressure. This is multi-session work; the founder is preparing for a multi-stage arc, not a quick patch.

## The Precedent

**Two precedents named tonight:**

1. **The founder ran the analyst-flow without invoking the agent.** When the founder says "first refine my prompt and find required drishti stack to build this," they are asking for the analyst's Phase 2 (classify) + Phase 3 pre-step (find the lens), without formally invoking `Agent("analyst")`. Treat this pattern as the analyst-equivalent and respond accordingly. Saved to user-role memory.

2. **The "I have not used git in my workplace" admission opens a new AHR class.** All future audits should consider "is this how a real workplace would do it?" alongside "does the kit live what it claims?" The first AHR was kit-internal anti-hypocrisy; this opens an external-benchmark AHR (kit vs industry-shastras). The Saraswati lens makes this concrete — read the shastras (ITIL v4, SRE practices, OWASP, SemVer, conventional commits, SOC2/ISO27001) before designing.

## What I Want You To Notice

Three things:

1. **The audit will surface real gaps AND real already-covered.** NGD will refuse the urge to add primitives "for completeness" — many ITIL patterns the kit ALREADY covers (e.g., /pre-commit-8l is essentially a pre-change-record gate; block-dangerous-bash is the audit-trail-by-default principle). The audit must distinguish what's truly new vs what's already-discipline-with-a-different-name.

2. **The drishti stack uses Saraswati as active identity for a reason.** Industry-standard discipline IS an existing knowledge base (ITIL, SRE, OWASP, SOC2). Designing without reading is guessing. The arc's first phase MUST be Saraswati-led survey — what do the shastras actually say — before Vishwakarma's primitive-design phase.

3. **The MID caveat is alive at the wish-level.** The founder's wish *"proper policy as per industry standards"* is BIG. Easy MID-failure mode: shrink it to "the three things I know how to add quickly" (e.g., add a CHANGE_RECORD.md template + done). The discipline must preserve the wish at full size — four domains, real gaps, real coverage of each domain's lifecycle. MID will veto any proposal that quietly drops a domain.

---

*Captured by GURU under Sanjay → Vyasa → Saraswati ; consult Ashtavakra, Narad.*
*Session context: 2026-05-30 night-late — founder named ITIL-class build intent + asked for analyst-flow refinement before building.*
*Related artifacts: user-role memory (newly saved tonight); the kit's existing /release + /incident + /commit + /mr + /pre-commit-8l skills + SDLC.md + block-dangerous-bash hook (the current baseline); future commits forging change/incident/release/patch primitives once the founder confirms the mirror.*
