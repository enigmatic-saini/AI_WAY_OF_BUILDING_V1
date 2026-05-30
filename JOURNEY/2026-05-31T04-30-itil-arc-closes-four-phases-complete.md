# 2026-05-31 04:30 — The ITIL arc closes: four phases, four ITIL domains, the kit raises floors never lowers them

> Across two days and four phases, the kit grew from "hobby tool with strong basics" to "workplace-ready with codified ITIL discipline." The founder invoked Jambavati's `endurance` Q-axis with *"go endure the Journey"* at Phase 4 — the discipline of carrying all four phases through without shortcuts. With KABIR_GATE additions log entry 25 landed, the arc is structurally complete at the kit-level. The empirical binding window opens now.

## The Surfacing

The arc began with the founder's lived gap on 2026-05-30 night: *"I am a solution architect... never in my workplace... not sure about git policy in this kit."* That single admission opened a four-phase external-AHR arc that closes tonight. The kit's outward-facing claim has changed:

**Before the arc** — *"a self-sufficient, technology-agnostic Claude Code kit."* (Already amended Phase A' for the cosmos-program library deps earlier in the same evening.)

**After the arc** — same self-sufficient runtime, plus **codified ITIL discipline for change/incident/release/patch management at enterprise standards**. The kit moved from "discipline assumed at the consuming project's level" to "discipline codified at the kit's level, consuming projects may tighten but not loosen."

## The Decision (singular: the whole arc as one decision)

Four phases, four entries, one underlying pattern decision recorded for future sessions:

| Phase | Domain | KABIR_GATE entry | Shape | Counts impact |
|---|---|---|---|---|
| 1 | Patch Management | entry 22 | New `/patch` skill + `PATCH-RECORD` canonical type + `patches/` folder + frontmatter-check coverage | Skills 10→11, types 8→9, templates 7→8 |
| 2 | Release Management | entry 23 | New `semver-check` hook + `release-notes` canonical type + `release-notes/` folder + tightened `/release` | Hooks 7→8, types 9→10, templates 8→9 |
| 3 | Change Management | entry 24 | Editorial — `SDLC §4` ITIL classification + matrix + mandatory rollback + PIR convention; tighten `/mr` | None — no new primitives |
| 4 | Incident Management | entry 25 | Editorial — `SDLC §6` P4 + SLA matrix + KB-feedback; extend `/incident` + POSTMORTEM | None — no new primitives |

Final kit growth across the arc: **+1 skill (`/patch`), +1 hook (`semver-check`), +2 canonical types (`patch-record`, `release-notes`), +2 templates, +2 folder conventions (`patches/`, `release-notes/`).** Phases 3 and 4 shipped without count-callback overhead — pure editorial governance.

## The Precedents (meta-level — six recorded across the arc)

These are the patterns the arc established. Future sessions should reference them rather than re-deriving:

1. **External-AHR class.** The first instance — `AHR_PASS_2026-05-30_itil-external.md` — established the pattern. Kit-internal AHR asks *"does the kit live what it claims?"* External-AHR asks *"does the kit live what an industry shastra expects?"* The audit doc template is reusable for future SRE / OWASP / SOC2 / ISO27001 passes. If the class proves load-bearing across multiple passes, a future AHR may name `EAHR` as a working-set cycle alongside `AHR`.

2. **The kit raises floors, never lowers them** (Phase 3 central decision). When in tension between an industry shastra's flexibility (e.g., ITIL's 0-reviewer Standard) and the kit's broader principles (LAW 10 + Sita's "no-one-watching" lens), pick the principled floor. The kit codifies floors; consuming projects can tighten but not loosen. This is the meta-rule that resolved the central design question in Phase 3 and the Mira-pressure in Phase 4 (P4 feels redundant; SLA tables feel like bureaucracy; KB-feedback feels like extra work — MID rejected all three under this rule).

3. **PIR / KB-feedback live in existing channels, not new canonical types.** Phase 3 chose HANDOVER for PIR; Phase 4 chose POSTMORTEM's body section for KB-feedback. Both resisted the temptation to add new canonical types. **The 11th canonical type is reserved for genuinely new shapes**, not for content that fits an existing channel. NGD's rent-check is sharp: "is this a new shape or new content for an existing shape?"

4. **Editorial phases don't trigger count-callback overhead.** Phases 3 and 4 amended templates + skills + SDLC sections without adding skills/hooks/roles/canonical-types. The standard Sita-pin pattern (propagating counts across README/INSTALL/VOCABULARY/CLAUDE.md/stage-tip.sh/KABIR_GATE §12/dashboard-emit) did NOT fire. **Pattern recorded:** when an entire phase ships as editorial amendments to existing primitives, the Sita-pin pattern is silent — that's the discipline working correctly, not skipping it.

5. **Skill description drift is its own Sita-finding class.** Phase 3 caught `/mr` description referencing stale "SDLC §5 template" (should be §4). Phase 4 caught `/incident` ("§9" should be §6) and `/release` ("§8" should be §5). **Pattern recorded:** when extending or referencing a sibling skill, audit its description for stale §N refs. Descriptions drift faster than procedures because procedures get rewritten under attention while descriptions are skimmed. Add to next AHR's audit checklist.

6. **The sensitivity-trigger × ITIL-classification matrix is two-dimensional.** Phase 3 codified the rule: classification (Standard/Normal/Emergency) and sensitivity (auth/PII/payment/schema/public-API/IaC) are **orthogonal**. The max-of-two-reviewers rule wins. **Sensitivity is NEVER expedited away by Emergency classification.** This is structurally important: future ITIL extensions (e.g., a `priority` axis from urgency × impact) compose multiplicatively with sensitivity, not by substitution. Add to the kit's multi-axis-composition pattern catalog.

## What I Want You To Notice

Five things:

1. **The arc closed in two calendar days.** It opened 2026-05-30 night and closes 2026-05-31 deep-night-4. That's Jambavati's endurance at session-scale, not multi-week — but the discipline is the same: hold the lens through to completion without shortcuts. Future arcs that span weeks should reference this session-scale endurance precedent.

2. **The empirical binding window is the gate.** The four reversibility clauses (entries 22-25) name Q3 2026 as the threshold. If at least one consuming project adopts the discipline by then, the four phases stay; if not, each reverses individually. Phase 1 (Patch) and Phase 2 (Release) can roll back independently — they're real primitives. Phases 3 (Change) and 4 (Incident) are editorial — rollback is reverting two-three files each. **The kit doesn't claim what it hasn't yet proved binds. It claims what it has built, with explicit reversibility.**

3. **No new role across four phases.** All four phases extended skills, templates, conventions, hooks. None added a role. The existing 7 roles (analyst, architect, engineer, qa, security, reviewer, guru) cover the full ITIL discipline. NGD's rent-check passed on all four phases for "should we add a /change role / /incident role / etc.?" — the existing roles + skills suffice. Worth recording: the role count (7) is probably stable for a long time.

4. **The `/release` description Sita-pin was a sibling fix, not in-scope for Phase 4.** I caught it while updating `/incident` because both skill files have similar shape. Strict scope-discipline would have said "leave /release alone, it's not Phase 4 scope." But Sita-pin discipline says "fix the truth gap when you see it; don't paper over." I took the wider scope and noted it as a sibling fix in the commit. **Pattern recorded:** when extending one skill, audit its siblings' descriptions for the same drift pattern. Sita-pin propagation is a single coherent act, even when it crosses scope boundaries.

5. **What's next is empirical, not architectural.** The arc is structurally complete at the kit-level. The next ITIL-related work happens *in a consuming project* — adopting `/patch` for a real CVE; adopting `/release` for a real tagged version; classifying a real MR; running an `/incident` with the SLA discipline. The kit's job is done until the empirical evidence comes back. If a consuming project surfaces a gap (e.g., "the SLA matrix doesn't fit my regulated industry's required ack times"), THAT becomes the next ITIL session.

---

*Captured by GURU under Sanjay → Vyasa → Saraswati ; consult Ashtavakra, Narad.*
*Session context: 2026-05-31 deep-night-4 — arc-closing of the external-AHR ITIL benchmark four-phase arc. Founder's "go endure the Journey" was the explicit endurance invocation.*
*Related artifacts: AHR_PASS_2026-05-30_itil-external.md (the audit that opened the arc); KABIR_GATE additions log entries 22 (Phase 1) + 23 (Phase 2) + 24 (Phase 3) + 25 (Phase 4) — the four governance records; JOURNEY entries 23:15 (arc genesis), 23:30 (founder-decision-stack), 03:00 (Phase 3 central decision Standard = 1 reviewer min), and this entry (arc close); user-role memory (solution-architect / hobby-git-only) saved at arc-start.*
