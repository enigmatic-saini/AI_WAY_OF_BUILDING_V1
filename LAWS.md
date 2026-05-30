# Laws

> The 12 laws of building software with this kit. Read all before changing any task's status.

## L0 — Master Law

Read, internalise, and apply **every law in this file** before changing the status of any task (starting, completing, deferring). Work that proceeds without this is frozen by the **Emergency-Stop Review (`ES`)** until the laws are re-read. No exceptions.

## L1 — Traceability

Every task has lineage: a TODO entry, a commit, and (if architectural) a `DESIGN.md` update. A task not in TODO must be added to TODO **and** to the relevant design document **before** being marked complete.

TODO format (LAW 1.1): `[status] (YYYY-MM-DD HH:MM) | description {cycle-tag}`
Legend: `[ ]` pending · `[~]` working · `[x]` done · `[d]` deferred

## L2 — Continuous Flow

Once a task is complete, immediately pick the next item from TODO. No waiting, no asking. Idle hands break momentum.

## L3 — Escalation

When stuck: (a) name the *gap* (communication, knowledge, decision, infra), (b) run `/triage`, (c) run the named cycle, (d) document its output. Escalation without documentation is gossip.

## L4 — Disciplined Focus

One task at a time. Maximum 5 concurrent agents/branches per developer (LAW 6 compatibility). When scope is unclear, run the **Discipline Pass (`RH2`)**.

## L5 — Living Tests

Tests must keep up with the code. Write the test before the code (TDD). Dead tests are worse than no tests — they give false confidence. Before any release, run **`RH3`** (Pre-Release Battle-Readiness).

## L6 — Parallel Limit

Max 5 concurrent agents/branches per developer. Use `/triage` to confirm independence before parallelising. Verify no merge conflicts between parallel streams before launching.

## L7 — Project Genesis

Before starting any new project (S0 Garbha → S1 Discovery transition):
1. Run **Architect Review (`AR`)**.
2. Create `README.md`, `CHARTER.md` (this kit's charter convention), `TODO.md`.
3. **Knowledge-first**: check the project's own `shastras/` directory (if present) and existing internal modules before adding external libraries.

## L8 — Test Gates

Every commit passes `/pre-commit-8l` (the 8 Engine Laws + 4 cross-cutting concerns). Every guard/validation rule added is followed by **Negative-Path Testing (`NEG`)**. No phase begins without the prior gate passing.

## L9 — Living Documentation

Five documents are committed to git (`README.md`, `DESIGN.md`, `STATUS.md`, `TODO.md`, `HANDOVER.md`). All keep pace with the code. Committing `HANDOVER.md` is what enables cross-engineer / cross-shift continuity and CI-side harvesting for the governance layer:

- `README.md` updated on every public-facing change (≤30 days stale).
- `DESIGN.md` updated when architecture changes; `CA1` annually.
- `STATUS.md` separates **BUILT / DESIGNED / PLANNED**; updated at every milestone.
- `TODO.md` updated on every status change (LAW 1.1 format).
- `HANDOVER.md` updated at end of every session (LAW 11). The `handover-reminder` hook (Stop event) enforces this — it surfaces a missing or stale (>3 days) HANDOVER.md at session end, kit-level and project-level both.

Public symbols carry doc-comments with examples that compile and run.

## L10 — Repo Hygiene

- `main` is the trunk. It always builds and passes tests.
- Feature branches: `feature/<name>`, short-lived, merged within days.
- **Never force-push to `main`.** The `block-dangerous-bash` hook enforces this.
- No secrets in commits. The `secret-scan` hook enforces this.
- No `--no-verify`. The `block-dangerous-bash` hook enforces this.
- Commit messages: imperative mood, subject ≤72 chars, body explains *why* not *what*.
- Dead code: delete, do not comment out. Git has the history.

## L11 — Anti-Hypocrisy (Kabir Gate)

Every primitive in this kit must **live what it claims**. If a file describes an FSM but no runtime instance exists, the file is removed. If a role descriptor claims "elevated tool access during incidents" but the harness never elevates, the claim is removed.

Run the **Anti-Hypocrisy Review (`AHR`)** quarterly. See [KABIR_GATE.md](KABIR_GATE.md) for the procedure.

---

## Cycle profile tags

Tag each TODO with the cycle profile expected to apply: `Q` (Quick, 4) / `S` (Standard, 8) / `D` (Deep, 12) / `3x4` (Matrix, 12 with phase gates). For specialist cycles, use the cycle's tag: `TRG`, `8L`, `HO`, `AR`, `RR`, `SMR`, `AHR`, `OE`, `NEG`, `SR`, `ES`, `LR`. See [CYCLES.md](CYCLES.md).
