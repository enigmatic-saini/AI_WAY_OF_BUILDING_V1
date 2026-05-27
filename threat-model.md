# V1 KIT — threat-model.md (kit-level)

> **Created 2026-05-28** as the verdict-delta artifact of the third Shadow Deep (`SHD`) pass — the first SHD firing on a non-RIAAN surface. See [`SHADOW_PASS_2026-05-28_claude_hooks.md`](SHADOW_PASS_2026-05-28_claude_hooks.md) for the full 12-cycle Shadow Matrix.
>
> **Maintenance contract:** every subsequent SHD pass against any kit surface appends a verdict-delta block to this file. Prior deltas preserved as historical record. Mirrors the maintenance contract of [`../RIAAN/threat-model.md`](../RIAAN/threat-model.md).
>
> **Scope:** kit-internal surfaces — `.claude/hooks/`, `.claude/skills/`, `.claude/agents/`, `.claude/settings.json`, `fsms/`, and any other code paths governed by the kit's own discipline. Project-level threats (consuming-project surfaces) belong in the consuming project's own threat-model.md.

---

## Current verdict-state (as of 2026-05-28 — first SHD pass on `.claude/hooks/`)

### Surface covered

The 6 hooks in [`.claude/hooks/`](.claude/hooks/) (341 lines total): `block-dangerous-bash.sh`, `secret-scan.sh`, `vocabulary-lint.sh`, `frontmatter-check.sh`, `handover-reminder.sh`, `stage-tip.sh`.

### Crown jewels

| ID | Asset | Criticality |
|---|---|---|
| HK-CJ-1 | Refusal correctness | BUSINESS-ENDING |
| HK-CJ-2 | Refusal completeness | BUSINESS-ENDING |
| HK-CJ-3 | Exit-code semantics correctness | BUSINESS-ENDING |
| HK-CJ-8 | Pattern syntactic correctness (NEW from this firing) | BUSINESS-ENDING |
| HK-CJ-4 | Input parsing reliability (jq fallback parity) | COSTLY |
| HK-CJ-5 | Lineage stability (PATTERNS/TERMS array drift defense) | COSTLY |
| HK-CJ-6 | Memory bound | COSTLY |
| HK-CJ-7 | Cross-hook coherence | COSTLY |

### Exposed gaps — STATUS POST FIX-FORGE (2026-05-28 same-day)

All 6 P0 gaps from the original SHD pass are MITIGATED. Plus one additional finding (O-20) surfaced during the fix-forge itself and also MITIGATED.

| ID | Gap | Archetype | Status | Resolution |
|---|---|---|---|---|
| ~~HK-G-pem-bug~~ | secret-scan PEM grep option-parsing bug | Hiranyakashipu O-16 | **MITIGATED 2026-05-28** | HK-NG-2 LANDED: `grep -Eq -- "$p"`. Witness test: `test_secret_scan_patterns.sh` PEM assertion now PASS (was KNOWN-BUG). |
| ~~HK-G-bash32-incompat~~ | block-dangerous-bash `declare -A` requires bash 4+ | Hiranyakashipu O-18 | **MITIGATED 2026-05-28** | HK-NG-13 LANDED: ported to parallel `declare -a` arrays + bash-version guard. Witness tests: 17/17 block-dangerous-bash assertions now PASS on bash 3.2 (were ALL KNOWN-BUG). |
| ~~HK-G-silent-pattern-errors~~ | `if grep -Eq` swallowed grep exit-2 errors | Hiranyakashipu O-17 | **MITIGATED 2026-05-28** | HK-NG-3 LANDED: explicit rc capture; 0=block, 1=continue, 2+=loud refusal. Applied to secret-scan and vocabulary-lint. |
| ~~HK-G-camelcase-bypass~~ | vocabulary-lint `\bTerm\b` missed CamelCase + snake_case | Hiranyakashipu O-19 | **MITIGATED 2026-05-28** | HK-NG-12 LANDED with mid-forge design correction: two-pass match (case-insensitive `\bTerm(\b\|_)` + case-sensitive `\bTerm[A-Z]`). The original single-grep design false-positived on "rambling" under `-i`. Witness tests: 3 CamelCase assertions now PASS (were KNOWN-BUG). |
| ~~HK-G-empty-content-pass~~ | Malformed JSON → empty content → silent pass | Maricha O-7 | **MITIGATED 2026-05-28** | HK-NG-4 LANDED: secret-scan, vocabulary-lint refuse empty content. Witness tests: "empty content now blocks" assertions PASS. |
| ~~HK-G-no-memory-bound~~ | No content size bound | Duryodhana O-5 | **MITIGATED 2026-05-28** | HK-NG-5 LANDED: 10MB bound on all Write/Edit/Bash hooks. |
| ~~HK-G-vocabulary-lint-self-edit~~ | NEW: vocabulary-lint's TERMS list trips its own scan on self-Edit | Hiranyakashipu O-20 (surfaced during fix-forge) | **MITIGATED 2026-05-28** | HK-NG-14 LANDED: narrow self-exemption (only `*/vocabulary-lint.sh` path); bash adjacency-concatenation in TERMS entries as defense-in-depth. |
| ~~HK-G-lineage-drift~~ | No pattern-coverage tests pre-this-firing | Shakuni O-9, O-10 | **MITIGATED 2026-05-28** | HK-NG-1 LANDED: `tests/` directory + 3 test scripts + runner. |
| **HK-G-jq-fallback-parity** | grep+sed JSON-parse fallback diverges from jq on escaped quotes | Maricha O-8 | **EXPOSED — P1** | HK-NG-6: parity test. |
| **HK-G-edit-tool-frontmatter-bypass** | frontmatter-check only fires on Write; Edit tool bypasses (explicitly documented in script) | Duryodhana O-4 | **EXPOSED — P1** | HK-NG-7: extend to Edit (re-read file from disk; validate). Cost-benefit consider. |
| **HK-G-vocab-terms-desync** | vocabulary-lint TERMS array hardcoded; doesn't auto-derive from VOCABULARY.md | Shakuni O-12 | **EXPOSED — P1** | HK-NG-8: sync-assertion test. |

### Remaining gaps (P2 / P3 — deferred)

| ID | Gap | Plan |
|---|---|---|
| HK-G-harness-failure-behavior | Undefined harness behavior on hook exit non-2 / syntax error | HK-NG-9: requires external investigation of Claude Code harness behavior |
| HK-G-cross-hook-ordering | Cross-hook ordering not specified or asserted | HK-NG-10: integration assertion + documentation |
| HK-G-base64-secrets | Secret-scan doesn't decode base64 | HK-NG-11: defer absent empirical evidence |

### Deferred-risk decisions

| ID | Risk | Decision | Re-evaluation trigger |
|---|---|---|---|
| HK-D-1 | Base64-encoded secrets | ACCEPT | Empirical leak found |
| HK-D-2 | handover-reminder advisory-only | ACCEPT — design intent | If kit policy ever requires HANDOVER to be enforcement-grade |
| HK-D-3 | stage-tip informational-only | ACCEPT — design intent | Same |
| HK-D-4 | Harness behavior on hook error | DEFER pending investigation | When harness behavior is empirically characterized |

### Monitoring signals

| ID | Signal | Status |
|---|---|---|
| HK-MA-1 | Hook exit-code distribution drift | PROPOSED |
| HK-MA-2 | Hook execution-time anomaly (>1s = potential memory exhaustion) | PROPOSED |
| HK-MA-3 | tests/test_*.sh running in CI | **LIVE 2026-05-28** (after this firing) — but only if a CI exists for the kit |
| HK-MA-4 | git log .claude/hooks/ quarterly review | PROPOSED — surface in next AHR |
| HK-MA-5 | VOCABULARY.md hash drift triggers HK-NG-8 re-run | PROPOSED |

### Outstanding obligations (kit-specific)

1. ~~Apply HK-NG-1 through HK-NG-5 + HK-NG-12 + HK-NG-13~~ — **COMPLETED 2026-05-28 same-day fix-forge.** All P0 bundle landed. Plus HK-NG-14 added during the fix-forge for O-20. Test suite: 44/44 hook tests pass, 0 KNOWN-BUG. RIAAN regression: charter_intent 21/21 + drift_hook 27/27 + spike (0,3,7) preserved (amendment 11).
2. **Apply HK-NG-6 + HK-NG-7 + HK-NG-8** (P1 bundle) as follow-on. **OPEN.**
3. **Surface HK-NG-9 investigation** as next-quarterly-AHR work. **OPEN.**
4. **Surface bundled CODEOWNERS-class governance ask** to user. **OPEN.**
5. **File working-set promotion proposal as KABIR_GATE.md additions log entry 11.** Criteria (a)(b)(d) MET; (c) PENDING. **OPEN — single most consequential next-session act.**

### Empirical-witness ledger for V1 KIT `SHD` working-set promotion

This firing closes the kit-side empirical-witness obligations for working-set promotion:

| Criterion | Status |
|---|---|
| (a) ≥3 firings across ≥2 projects | **MET 2026-05-28** (3 firings: charter_intent, drift_hook, .claude/hooks; 2 projects: RIAAN, V1 KIT) |
| (b) unique 3-round method distinct from ATLAS prose verbatim | **MET** (ShadowFsm.toml + the 3x4 Shadow Matrix with archetype iteration) |
| (c) Kabir Gate ratification via additions log entry | **PENDING** (requires new entry naming the empirical evidence and recommending promotion) |
| (d) concrete harm prevented or value produced no other working-set cycle would surface | **MET** (24+ SHD-surfaced gaps across 3 surfaces, including the empirical PEM-bug + bash-3.2-incompat findings that no NEG/RR/OE/etc would have caught) |

---

## Historical verdict-deltas (oldest below)

*No prior kit-level SHD passes. This is the first.*

---

## Maintenance log

- **2026-05-28 (first event)** — File created as verdict-delta artifact of first kit-level SHD pass (third overall SHD firing) on `.claude/hooks/`. Authored 3 new test scripts + runner. 44 assertions, 25 PASS + 19 KNOWN-BUG. KNOWN-BUG distribution: 1 secret-scan (PEM O-16), 15 block-dangerous-bash (bash 3.2 incompat O-18), 3 vocabulary-lint (CamelCase O-19).
- **2026-05-28 (second event, same-day fix-forge)** — All 7 P0 hook gaps MITIGATED + the additional O-20 finding (vocabulary-lint cannot self-edit) MITIGATED via HK-NG-14 self-exemption. **Test suite now 44/44 PASS with 0 KNOWN-BUG.** Mid-forge design corrections: HK-NG-12 redesigned from single-grep (false-positive on "rambling" under `-i`) to two-pass (case-insensitive `\bTerm(\b|_)` + case-sensitive `\bTerm[A-Z]`); SHADOW_PASS original O-3 claim about sh -c bypass corrected (bash `[[ =~ ]]` substring-match catches it). RIAAN downstream regression: charter_intent 21/21, drift_hook 27/27, spike (0,3,7) byte-identical. **`(0,3,7)` empirical contract survives amendment 11 — first amendment that hardened the KIT itself (not RIAAN) while preserving RIAAN's empirical invariant.** Third repetition of the SHD→fix-forge two-act pattern; first repetition on bash scripts (prior were Python).
