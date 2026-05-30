# Dashboard — The Frontmatter Contract

> Every canonical document the kit owns carries a YAML frontmatter block at the top. This contract is what enables a thin read-only viewer (e.g., the neighbor [YATRA](../YATRA/) webapp) to render project state without becoming a parallel source-of-truth.

## §1 — Load-bearing rule

**The markdown files are the source-of-truth. The viewer is a renderer. If you find yourself editing the viewer's output rather than the underlying file, stop — you are in the ceremony.**

This rule is the same Kabir invariant that justifies the rest of the kit. The viewer exists to make existing truth visible to PM/EM/anyone; it does not exist to create new truth.

## §2 — Ten canonical doc types

**(Count corrected 2026-05-30 night-late per [KABIR_GATE.md additions log entry 22](KABIR_GATE.md): 8 → 9 with the addition of `patch-record`. Phase 1 of the external-AHR ITIL benchmark. Extended 2026-05-31 deep-night per [additions log entry 23](KABIR_GATE.md): 9 → 10 with the addition of `release-notes`. Phase 2 of the external-AHR ITIL benchmark.)**

Each canonical document type has a fixed frontmatter schema. The frontmatter is YAML between two `---` lines at the very top of the file.

### 2.1 `charter` — CHARTER.md (project's seed)

```yaml
---
type: charter
project: <name>
audience: <one-line: who it's for>
created: 2026-05-19
---
```

### 2.2 `design` — DESIGN.md

```yaml
---
type: design
project: <name>
stage: <seed | discovery | forge | build | service | sunset | decommission>
updated: 2026-05-19T12:00:00Z
fsms: [<list of FSMs declared in §4 of the doc>]
---
```

### 2.3 `status` — STATUS.md

```yaml
---
type: status
project: <name>
stage: <stage>
updated: 2026-05-19T12:00:00Z
metrics:
  built: 12
  designed: 3
  planned: 7
---
```

### 2.4 `todo-collection` — TODO.md

```yaml
---
type: todo-collection
project: <name>
stage: <stage>
updated: 2026-05-19T12:00:00Z
---
```

Tasks follow as a list, one per line, in LAW 1.1 format:

```
- [~] (2026-05-19 10:00) | implement parser {S} {owner=jane} {p1}
- [x] (2026-05-18 14:30) | seed YATRA charter {Q}
- [ ]                    | wire roadmap view {S} {p2}
```

Legend: `[ ]` pending · `[~]` working · `[x]` done · `[d]` deferred.
Inline tags in `{...}` blocks: cycle profile (Q/S/D/3x4), `owner=<name>`, `p1`/`p2`/`p3`, free-form labels. The viewer parses these into facets.

### 2.5 `handover` — HANDOVER.md (committed; one per project, **or for the kit itself as of 2026-05-26 deep-night-2 per [KABIR_GATE.md additions log entry 8](KABIR_GATE.md)**)

```yaml
---
type: handover
project: <name>
stage: <stage>
session_end: 2026-05-19T18:00:00Z
---
```

> **Policy (2026-05-20):** `HANDOVER.md` is committed to git so that the governance layer can harvest session-end state across engineers, shifts, and team-members. Previously this file was workspace-only; that designation is superseded. The `/handover` skill and `handover-reminder` hook continue to drive its creation at session end. Engineers who treat handovers as private working notes should redact before saving (the file is on the same commit pipeline as STATUS / TODO / ADR).
>
> **Policy extension (2026-05-26 deep-night-2):** the `handover` doc type is now also applicable to the **kit itself** (Layer 0), in addition to consuming projects (Layer 1). The kit's own session-lineage record lives at [`HANDOVER.md`](HANDOVER.md) at the root of `AI_WAY_OF_BUILDING_V1/`. The frontmatter convention is identical (`type: handover`, `project: ai_way_of_building_v1`, `stage: build`, `session_end`). Kit-level sessions producing non-trivial changes (additions log entries, §12 audit point amendments, doc amendments) add a session block to the kit's HANDOVER; project-level sessions continue to add blocks to the consuming project's HANDOVER. The two streams are independent — events affecting both layers receive entries in both (with cross-references). See [KABIR_GATE.md additions log entry 8](KABIR_GATE.md) for the convention's full lineage.

### 2.6 `adr` — decisions/ADR-NNN.md

```yaml
---
type: adr
id: ADR-0042
title: <short title>
status: PROPOSED | ACCEPTED | DEPRECATED | SUPERSEDED-BY ADR-MMM
date: 2026-05-19
stage: <stage>
cycle: <cycle-tag, e.g., SMR>
ai_assisted: true | false | partial
links: [TODO#NNN, MR#NNN, ADR-NNN]
---
```

> `ai_assisted` is the decision-level attribution signal harvested by the governance dashboard. Set `true` if any part of the decision was drafted in a Claude Code session, `partial` if Claude contributed but a human authored the final text, `false` if no AI involvement. The field is optional for backwards-compatibility with pre-2026-05-20 ADRs; missing values are counted as `unknown` in aggregations.

### 2.7 `postmortem` — postmortems/INC-NNNN.md

```yaml
---
type: postmortem
id: INC-0007
severity: P1 | P2 | P3
date: 2026-05-19
duration_min: 47
blameless: true
---
```

### 2.8 `runbook` — runbooks/<service>.md

```yaml
---
type: runbook
service: <name>
owner: <team-or-person>
last_verified: 2026-04-01
---
```

### 2.9 `patch-record` — patches/PATCH-NNN-<slug>.md

```yaml
---
type: patch-record
id: PATCH-007
classification: Critical | High | Medium | Low
status: PROPOSED | TESTING | APPLIED | VERIFIED | ROLLED-BACK
identified-at: 2026-05-30
sla-window: 24h | 7d | 30d | 90d
applied-at: 2026-05-30T15:20:00Z   # null until applied
verified-at: 2026-05-30T16:45:00Z  # null until verified
source: CVE-2026-12345             # or advisory URL / alert ref
affected: []
links: []
---
```

The four classifications map to SLA windows: Critical < 24h, High < 7d, Medium < 30d, Low < 90d. The `status:` field is a state-machine: `PROPOSED → TESTING → APPLIED → VERIFIED` on the happy path; any state can transition to `ROLLED-BACK`. The `applied-at:` and `verified-at:` fields are required-when-the-status-permits (null until then). See the [/patch skill](.claude/skills/patch/SKILL.md) for the procedural lifecycle and the [PATCH-RECORD template](templates/PATCH-RECORD.md) for the body sections.

### 2.10 `release-notes` — release-notes/RELEASE-NOTES-v<X.Y.Z>.md

```yaml
---
type: release-notes
version: v1.2.3                  # must be SemVer 2.0; matched by semver-check hook
date: 2026-05-31
status: DRAFT | PUBLISHED | SUPERSEDED | ROLLED-BACK
commit-range: v1.2.2..v1.2.3     # previous tag .. this tag
rollback-tag: v1.2.2             # the safe-redeploy target
audit-trail: true
patches: []                      # list of PATCH-NNN ids bundled in this release
incidents: []                    # related INC-NNNN ids (if any)
breaking: false                  # if true, Migration section is required in body
---
```

The `version:` field must satisfy SemVer 2.0 — enforced by the [`semver-check` hook](.claude/hooks/semver-check.sh) on the git tag (`git tag v<X.Y.Z>`) that ships the release, and by file-naming convention (`RELEASE-NOTES-v<X.Y.Z>.md`). The `status:` is a state-machine: `DRAFT → PUBLISHED → SUPERSEDED` on the happy path; any state can transition to `ROLLED-BACK`. The `rollback-tag:` field is required-always — even a perfect release must document its rollback target. The `patches:` list cross-references `patches/PATCH-NNN.md` records bundled in this release (audit trail). See the [/release skill](.claude/skills/release/SKILL.md) for the procedural lifecycle and the [RELEASE-NOTES template](templates/RELEASE-NOTES.md) for the body sections.

## §3 — Validation rules

For every doc type:

1. **Must start with `---`** (no blank lines, no BOM).
2. **`type:` field is required** and must be one of the 10 enum values.
3. **All required fields per type are present.**
4. **`---` close present** before the body content.
5. **Body content begins after the closing `---`.**

The optional [`/dashboard-emit`](.claude/skills/dashboard-emit/SKILL.md) skill drafts new docs with valid frontmatter and validates existing ones.

## §4 — File path conventions (so the viewer can find docs)

| Type | Path pattern | Single or multiple? |
|---|---|---|
| `charter` | `CHARTER.md` | one per project |
| `design` | `DESIGN.md` | one per project (large projects may split — link the rest from the root) |
| `status` | `STATUS.md` | one per project |
| `todo-collection` | `TODO.md` | one per project |
| `handover` | `HANDOVER.md` | one per project |
| `adr` | `decisions/ADR-*.md` | many; one per decision |
| `postmortem` | `postmortems/INC-*.md` | many; one per incident |
| `runbook` | `runbooks/*.md` | many; one per service |

The viewer walks the project root for these patterns.

## §5 — What the viewer does with the contract

A read-only viewer (V1 of YATRA) renders:

- **Roadmap** — timeline derived from `design.stage` + recent `handover` events.
- **Backlog** — all `[ ]` tasks across `TODO.md` (and any `TODO-*.md`), faceted by owner/priority/cycle.
- **In-flight** — all `[~]` tasks, faceted similarly, with age-since-started from the timestamp.
- **Done** — `[x]` tasks for the last 30 days.
- **ADR ledger** — table of all `adr` docs, sortable by date/status.
- **Postmortem ledger** — table of all `postmortem` docs, sortable by severity/duration.
- **Runbook index** — table of `runbook` docs with stale-since dates.
- **Status snapshot** — the `status` doc rendered with metric cards.
- **Architecture view** — DESIGN.md sections rendered with FSM diagrams (markdown rendered as HTML).

## §6 — What the viewer does NOT do

- Does **not** persist any state separately from the markdown files.
- Does **not** edit files in V1 (read-only).
- Does **not** authenticate users (localhost-only by convention).
- Does **not** poll for changes (refresh = re-parse).
- Does **not** invent fields. If a field is not in the contract, the viewer ignores it.

## §7 — Editable-in-future (V2)

When edit support is added, the viewer:

1. Performs round-trip parse-then-rewrite on the original markdown file (preserving body order and comments).
2. Uses `python-frontmatter` (or equivalent) so the YAML block is written back losslessly.
3. Treats every edit as a git operation: commit with `dashboard: <change-summary>` message.
4. Keeps the **"file wins"** invariant — concurrent edits to the file directly must be respected; the viewer reads before writing.

## §8 — Kabir Gate (13th audit point)

Run quarterly: every canonical doc in the project has well-formed frontmatter. Concretely:

```bash
for f in CHARTER.md DESIGN.md STATUS.md TODO.md HANDOVER.md \
         decisions/ADR-*.md postmortems/INC-*.md runbooks/*.md; do
  [[ -f "$f" ]] || continue
  head -1 "$f" | grep -q '^---$' && grep -q '^type:' "$f" \
    && echo "$f OK" || echo "$f FAIL (frontmatter missing or malformed)"
done
```

If any FAIL: fix the file or remove it. The viewer must never "guess" the schema.

## §9 — Why this is not Jira

| Jira / Confluence | This kit |
|---|---|
| Fields exist for the dashboard's sake | Fields are things the engineer already writes (status, stage, owner) |
| The ticket is separate from the code | The TODO line is in the same repo as the code |
| Sync between tracker and code can drift | There is no separate tracker. The viewer parses the code's markdown |
| You close tickets to make the dashboard happy | You mark `[x]` because the work is done; the viewer reflects it |
| The dashboard is the canonical record | The dashboard is a rendering. Files are canonical |

---

## §10 — Per-primitive lifecycle states inside a doc-as-Jiva

> **Added 2026-05-26 deep-night** per [KABIR_GATE.md additions log entries 2, 3, 4](KABIR_GATE.md) (FORGED-extended sub-state; preserved-by-projection mode; per-primitive T₄ event protocol).
>
> **Scope note.** §2-§9 above define the *frontmatter contract* — the YAML block at the top of canonical documents that lets the viewer render project state. **§10 is distinct: it defines the per-primitive lifecycle states used inside the body of a doc-as-Jiva** (e.g., MATH.md's §18.2 Living-State table, DESIGN.md's §12.3 Architectural Primitives table). These states live in the doc body, not in frontmatter. The viewer does not consume them — they exist for the Kabir Gate audit and the doc-jiva's own self-witness (`drift_hook` on itself).

### §10.1 — When does §10 apply?

A document becomes a **doc-as-Jiva** when it carries an internal *Living-State table* mapping each load-bearing primitive (defined in that doc) to a lifecycle state and a verification source. First instances in the wild: RIAAN's [MATH.md §18](../RIAAN/MATH.md) (math-as-Jiva, since 2026-05-25) and [DESIGN.md §12](../RIAAN/DESIGN.md) (design-as-Jiva, since 2026-05-25; first T₄ event 2026-05-26 evening).

Not every canonical doc becomes a doc-as-Jiva. The pattern is recommended when:
- The doc *defines* primitives that code or other docs depend on (math primitives, architectural primitives, FSM definitions).
- Silent drift between doc claim and code reality would be costly (Kabir-Gate violation, LAW 11).
- The doc is actively maintained across multiple sessions (so the audit pays rent).

### §10.2 — The four base states

Taxonomy (canonical at MATH.md §18.1 and DESIGN.md §12.2; reproduced here as the kit-level reference):

| State | Meaning |
|---|---|
| **FORGED** | Claim + code + tests all present and aligned. The primitive is alive. A Living Test asserts math/spec ≡ code. |
| **DESIGNED** | Claim documented; code partially implements or does not yet exist; an explicit forge target is named. |
| **SKETCHED** | Claim mentioned; not yet rigorously specified. Honest aspirational reference. |
| **SUNSET** | Superseded by a successor primitive; preserved in the doc's Sunset annex (see §10.5). |

### §10.3 — FORGED-extended (sub-state, added 2026-05-26 evening)

A primitive in state **FORGED-extended** has:
- All properties of FORGED (claim + code + tests present and aligned for the original contract), AND
- An additive extension that gained new surface (optional parameter, optional field, new method, new operating mode) without invalidating the prior contract.

**The discriminator:** if removing the extension restores the original FORGED behavior verbatim — and the original Living Tests pass byte-identical — the primitive is FORGED-extended, not SUNSET. If the original contract is broken by the extension (signature change incompatible, field semantics flipped, FSM state count changed), it is a SUNSET event with a new successor.

**Empirical witnesses (first uses):**
- DESIGN.md §12.3 — 5 rows transitioned FORGED → FORGED-extended on 2026-05-26 evening (HookOutcome 4-field → 5-field; DriftHook signature; §4.1 FSM transition rule; §2 J0 determinism; §5.2 test count 9→18). All prior Living Tests still pass byte-identical; `spike.py` output unchanged from pre-amendment baseline.
- MATH.md §18.2 — the binary `δ_ws` row (§3) is in a structurally-similar state, recorded with the "preserved-by-projection" qualifier (see §10.4 below); both the FORGED-extended marker (DESIGN-level) and preserved-by-projection marker (MATH-level) describe the same shape of preservation from two different vantage points.

### §10.4 — Preservation modes for the Sunset annex

When a primitive transitions out of FORGED into SUNSET (or into FORGED-extended), the doc-as-Jiva's Sunset annex carries an entry. Two preservation modes (added 2026-05-26 evening; first precedent set by MATH.md §19):

| Mode | When to use | Effect on §18.2 / §12.3 table | Effect on Sunset annex |
|---|---|---|---|
| **preserved-by-projection** | The successor primitive *contains* the original as a special case (parameter setting, mode flag, etc.) such that the original's Living Tests still pass byte-identical. | Row retained with state `FORGED-extended` or `FORGED, preserved-by-projection` plus a pointer to the Sunset annex entry. | Entry records the original math/contract, the successor's section reference, and the projection (e.g., "setting `(α, β, γ) = (0, 1, 0)` recovers original"). |
| **moved-and-superseded** | The successor primitive is fundamentally incompatible with the original; no projection recovers it; the original Living Tests would now fail. | Row in the live primitives table is replaced by the successor; the original moves entirely to the Sunset annex. | Entry carries the only remaining definition of the original primitive; queryable for audit lineage but not for code-against-claim verification. |

**Rati's preservation principle** (named in MATH.md §19): *Rati preserves what was — not by archiving it, but by ensuring the new form contains it.* Preferred mode is preserved-by-projection when math relationships allow; moved-and-superseded is reserved for genuine paradigm shifts within a single primitive (e.g., a future scalar→vector swap that requires `delta` to become `np.ndarray`).

### §10.5 — The per-primitive T₄ event protocol

> Within `M_BUILD`'s S2_Forge lifecycle, a doc-as-Jiva can execute an internal **T₄ event** — per-primitive supersession — without leaving Forge stage. The protocol was pre-specified by MATH.md §18.4 (2026-05-25) and exercised for the first time on 2026-05-26 evening with the binary δ → trinary δ supersession.

**Protocol (kit-level codification, first exercised twice on 2026-05-26):**

1. **Trigger** — a layer-1 jiva (or its governance doc) discovers that a primitive's claim is becoming incomplete (Hidden Virtue per [KABIR_GATE.md §11](KABIR_GATE.md)) or has accumulated unresolved drift.
2. **Pre-execution cycle-set** — run the KBD × NGD × VKD × MID 4-cycle ratification pattern (see [CYCLES.md preface](CYCLES.md) for the named cycle-set). KBD checks for hypocrisy; NGD places the change on the catuṣkoṭi (same / different / both / neither); VKD enumerates Build A / B / C options; MID guards against dilution.
3. **Ratification** — the human (Layer 0) approves the chosen build option. T₄ events typically converge on **Build B (per-primitive amendment)**; Build A is rejected by MID dilution-check, Build C (whole-doc Pradyumna) is reserved for paradigm shifts.
4. **Execution** — propagate the amendment through every section that references the superseded primitive. Update the doc's §18.2 / §12.3 Living-State table. Add a Sunset annex entry (preserved-by-projection or moved-and-superseded per §10.4). Bump the doc's frontmatter `updated` field.
5. **Empirical witness** — verify that all prior Living Tests still pass (for preserved-by-projection) or that the new tests replace the old (for moved-and-superseded). Cite the witness in the Sunset annex entry.
6. **HANDOVER + provenance** — record the T₄ event in the project's HANDOVER.md and (if a cycle-set spawned it) in the originating `CYCLE_SET_*.md` file's §C provenance.

**Empirical witnesses (first uses):**
- [`../RIAAN/MATH.md §18.4`](../RIAAN/MATH.md) — first T₄ event 2026-05-26 evening (binary δ → trinary δ; preserved-by-projection).
- [`../RIAAN/DESIGN.md §12.4b`](../RIAAN/DESIGN.md) — second T₄ event 2026-05-26 deep-night (5 primitives FORGED → FORGED-extended; no Sunset annex entry per §10.4 preserved-by-projection carveout since change was strictly additive).
- This very §10 — third T₄-class event (kit-level codification of patterns discovered in the first two events).

### §10.6 — Why §10 is not in §2-§9 above

The frontmatter contract (§2-§9) governs *how the viewer renders project state across many projects*. §10 governs *how a single doc-as-Jiva witnesses itself across many primitives*. The two disciplines compose without overlap: a doc-as-Jiva's frontmatter still follows §2; its body's Living-State table follows §10. The viewer does not parse §10's per-primitive states — they exist for the Kabir Gate audit and the doc's own `drift_hook` on itself, not for cross-project dashboarding.

If the viewer becomes the source-of-truth, the Anti-Hypocrisy Review removes it.
