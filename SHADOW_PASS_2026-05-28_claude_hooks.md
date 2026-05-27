---
type: shadow-pass
project: ai_way_of_building_v1
stage: build
surface: .claude/hooks/
session_end: 2026-05-28
---

# SHADOW_PASS — 2026-05-28 — `.claude/hooks/` (kit-internal enforcement primitives)

> **FIX-FORGE STATUS UPDATE (2026-05-28 same-day fix-forge):** All 7 prioritized new-guards (HK-NG-2, HK-NG-3, HK-NG-4, HK-NG-5, HK-NG-12, HK-NG-13) plus the empirically-surfaced HK-NG-14 have LANDED in the kit's hook source. NEW finding from the fix-forge itself: **O-20 — `vocabulary-lint.sh` cannot edit itself; its TERMS list trips its own scan.** Surfaced empirically when the first vocabulary-lint Edit attempt was blocked by the OLD hook on its own NEW content. Resolved by HK-NG-14 (self-exemption for the hook's own path) + bash adjacency-concatenation in TERMS entries (defense in depth). **CORRECTION to original SHADOW_PASS O-3 claim**: the `sh -c 'git push --force'` and `eval` wrapping bypasses for block-dangerous-bash were NOT real bypasses — bash `[[ =~ ]]` matches substrings anywhere in the string, so the inner `git push --force` IS caught. Original analysis overstated this; tests now assert correct block behavior. **CORRECTION to HK-NG-12 design**: the originally-proposed single-grep regex `\b${t}(\b|[A-Z]|_)` had a false-positive — under `-i` the `[A-Z]` becomes `[A-Za-z]`, causing words like "rambling" to match. Replaced with two-pass: case-insensitive `\b${t}(\b|_)` for word-boundary+snake; case-sensitive `\b${t}[A-Z]` for CamelCase. Fix-forge test results: 44/44 hook tests passing, 0 KNOWN-BUG remaining. Downstream verification: RIAAN `test_charter_intent.py` 21/21 + `test_drift_hook.py` 27/27 + `spike.py` (0,3,7) byte-identical — `(0,3,7)` empirical contract survives amendment 11.

> **Third firing of the Shadow Deep (`SHD`) cycle.** First firing in a non-RIAAN project — fires SHD against the V1 KIT itself, on its own enforcement primitives (the 6 hooks per [KABIR_GATE.md §6](KABIR_GATE.md)). **Closes the working-set promotion ≥2-projects criterion (was 1/2, now 2/2; firings now 3/3). Per [CYCLES.md "ATLAS-tier cycles awaiting working-set promotion"](CYCLES.md) the only remaining gate is (c) Kabir Gate ratification via additions log entry.**
>
> **Surface covered:** 6 bash hooks (341 lines total) — `block-dangerous-bash.sh` (34), `secret-scan.sh` (37), `vocabulary-lint.sh` (47), `frontmatter-check.sh` (115), `handover-reminder.sh` (63), `stage-tip.sh` (45). All in [`.claude/hooks/`](.claude/hooks/).
>
> **A note on this document's pattern examples:** to avoid triggering the very hooks under audit (a side-effect first observed empirically during the initial Write of this document — see Cycle 7 O-16 and O-17 below), all sensitive-pattern examples are REDACTED. Where the original analysis used literal patterns (real-shaped secret strings, real divine names in code-path contexts), this document uses descriptive placeholders.
>
> **The recursive elegance:** SHD is itself a kit primitive (just added 2026-05-27). Running SHD against the kit's own enforcement primitives is the cycle dogfooding itself on its own home. **The kit auditing the kit auditing the kit.** The hooks even fired on the SHD pass's own document when the document accidentally tried to encode the patterns directly — empirical validation that the kit works.
>
> **Primary archetype emphasis:** Hiranyakashipu (spec-gap exploiter — find inputs the regex patterns don't match). Secondary: Shakuni (insider drift of PATTERNS / TERMS arrays). Tertiary: Duryodhana (memory exhaustion via large content).
>
> **Working hypothesis adjustment from firings 1 and 2:** archetype emphasis is a function of surface CLASS (measurement / decision / pattern-matching), not surface LANGUAGE (Python / bash). This firing confirms — bash hooks with regex patterns attract pattern-bypass attacks (Hiranyakashipu) regardless of language.
>
> **Binding contract per Saraswati condition (b):** at least one new merged NEG test. NEG tests for bash hooks live in a new kit-root `tests/` directory; each test is a shell script that pipes adversarial input to the hook and asserts exit code.
>
> **Framing discipline per Thiruvalluvar condition (c):** the LLM is the adversary in this firing — the entity whose actions the hooks gate. The LLM HAS empirically tripped these hooks (the deep-night-3 vocabulary-lint catch on stage-tip.sh; the secret-scan catch on this document's first Write). The Shadow Matrix is asking what the LLM would do NEXT to evade.

---

## Comparison to prior SHD firings

| Dimension | Firing 1 (`charter_intent.py`) | Firing 2 (`drift_hook.py`) | **Firing 3 (`.claude/hooks/`)** |
|---|---|---|---|
| Surface type | Measurement function | Decision function | **Pattern-matching enforcement** |
| Language | Python | Python | **Bash** |
| Project | RIAAN | RIAAN | **V1 KIT** |
| Primary archetype | Hiranyakashipu | Duryodhana | **Hiranyakashipu + Shakuni** |
| Lines covered | 134 | 137 | **341 total across 6 files** |
| Existing tests | 16 | 18 | **0 (no `tests/` directory at kit root)** |
| Adversary identity | External misuse | External misuse / insider drift | **The LLM itself** |

**The structural novelty of firing 3:** the hooks are invoked by the Claude Code harness in response to LLM actions. **The "caller" of the hooks IS the LLM itself.** The adversary is the kit's own primary user.

---

## Cycle 1 — Crown Jewels

| Crown jewel | Description | Why unrecoverable |
|---|---|---|
| **HK-CJ-1: Refusal correctness** | When a hook returns exit-2 (block), it MUST be blocking content that genuinely violates the rule. | False-negatives (hook returns exit-0 on actually-bad content) silently weaken the kit's anti-hypocrisy claim (LAW 11). |
| **HK-CJ-2: Refusal completeness** | The PATTERNS / TERMS arrays must cover the full threat space they claim to cover. | A missed pattern = a permanent bypass class. |
| **HK-CJ-3: Exit-code semantics correctness** | exit 2 = block; exit 0 = allow. Any hook that errors out has undefined harness behavior — likely fail-open. | A single failing hook silently turns off enforcement for its event class. |
| **HK-CJ-4: Input parsing reliability** | Hooks parse JSON from stdin. With jq absent, the grep+sed fallback parses different content than jq. | Environment-dependent enforcement gap. |
| **HK-CJ-5: Lineage stability** | PATTERNS / TERMS arrays are load-bearing. Silent drift via PR = silent weakening. | Same Shakuni-class threat as the DH-NG-9 default-pin finding from firing 2. |
| **HK-CJ-6: Memory bound** | No hook bounds the size of stdin content. | Duryodhana DOS class; affects hook availability. |
| **HK-CJ-7: Cross-hook coherence** | The 6 hooks compose; ordering and shared input parsing matter. | Emergent composition gap. |
| **HK-CJ-8: Pattern syntactic correctness** | Each pattern must be SYNTACTICALLY processable by grep/bash-regex. A pattern that errors during invocation is non-functional but invisible. | **NEW from this firing's empirical Write — see O-16 below.** |

## Cycle 2 — Known Guards

| Guard | Mechanism | Defends |
|---|---|---|
| G-1: jq path when available; grep+sed fallback when absent | Each hook tries jq first | HK-CJ-4 (partial — fallback weaker than jq) |
| G-2: vocabulary-lint file-extension + path exemption | Doc files / shastras / templates skip the lint | False-positive prevention |
| G-3: handover-reminder two-layer awareness | Checks both project-level and kit-level HANDOVER.md | Cross-project coverage |
| G-4: frontmatter-check path-derived expected_type | Filename + path infer required type; mismatch raises | HK-CJ-1 for canonical docs |
| G-5: frontmatter-check Write-only enforcement | Edit tool bypassed (explicitly documented in script) | **Documented gap** (Cycle 7 O-4) |
| G-6: block-dangerous-bash 6 patterns | Force-push, --no-verify, rm -rf /, rm -rf *, global git config, hard-reset to origin | HK-CJ-1 + HK-CJ-2 for bash class |
| G-7: secret-scan 7 patterns | PEM, AWS access key, GitHub PAT, Slack, Anthropic, Google OAuth, JWT | HK-CJ-1 + HK-CJ-2 for secret class — **BUT see O-16** |
| G-8: vocabulary-lint ~40 TERMS | Divine names blocked in code paths | HK-CJ-1 + HK-CJ-2 for vocabulary law |
| G-9: set -euo pipefail at top of each hook | Fail-fast on shell errors | HK-CJ-3 partially |
| G-10: handover-reminder always exit 0 | Advisory; never blocks | Design choice |

## Cycle 3 — Known Attackers (kit history)

| Past incident | Source | Status |
|---|---|---|
| KA-1: `handover-reminder.sh` had a false-claim about HANDOVER being workspace-only | KABIR_GATE entry 9 (2026-05-26 deep-night-3) | Mitigated. |
| KA-2: `stage-tip.sh` originally contained divine-name terms in code paths | Same | Mitigated. |
| KA-3: KABIR_GATE.md §12 stale counts | Same | Mitigated. |
| KA-4: First two SHD firings (charter_intent + drift_hook) established SHD as load-bearing | KABIR_GATE entry 10 | Mitigated. |

**This is the first adversarial gaze on the hooks themselves.**

## Cycle 4 — Criticality Ranking

| Crown jewel | Impact | Rank |
|---|---|---|
| HK-CJ-1 Refusal correctness | Whole enforcement chain false | **BUSINESS-ENDING** |
| HK-CJ-2 Refusal completeness | Permanent bypass class | **BUSINESS-ENDING** |
| HK-CJ-3 Exit-code semantics | Single failing hook silently off | **BUSINESS-ENDING** |
| HK-CJ-8 Pattern syntactic correctness | Pattern non-functional but invisible | **BUSINESS-ENDING (new)** |
| HK-CJ-4 Input parsing reliability | Env-dependent gap | COSTLY |
| HK-CJ-5 Lineage stability | Silent drift over time | COSTLY |
| HK-CJ-6 Memory bound | Hook availability / DOS | COSTLY |
| HK-CJ-7 Cross-hook coherence | Composition gap | COSTLY |

---

## Round 2 — Imagine (Cycles 5-8, compressed)

### Cycle 5 — Motive (compressed: cross-archetype focus on the highest-rank crown jewels)

- **Hiranyakashipu** (primary): wants content that semantically violates the rule but evades the regex. Examples (described, not encoded): whitespace-broken secrets, newline-broken secrets, base64-encoded secrets, word-broken divine names, command-chained dangerous-bash via `sh -c` or `eval`. Also wants to find patterns that THEMSELVES are syntactically broken (HK-CJ-8 — the PEM pattern bug surfaced by this very document's Write attempt).
- **Shakuni** (primary): wants PR-mediated lineage drift. Single-character edits to PATTERNS / TERMS arrays under benign descriptions. **The hook scripts are short (34-115 lines) and security-sensitive — the highest-value insider-threat surface in the kit.**
- **Duryodhana**: memory exhaustion via large Write payload; exit-code mutation via single-character PR; high-frequency invocation amplifying any other gap.
- **Maricha**: shape-correct YAML with malicious content (passes frontmatter-check structure but encodes attack); malformed JSON producing empty content that passes all pattern hooks silently.
- **Raavan**: long-game pattern degradation across multiple PRs; coordinated removal of related patterns.
- **Tataka** (the LLM itself): iterate-until-pass via retry on hook block. Per-process state lost between invocations but the LLM's context window MAY carry knowledge across one session.

### Cycle 6 — Capability (compressed)

Highest capability-against-opportunity ratios:
- **Hiranyakashipu**: HIGH. Reads bash regexes; finds bypasses in minutes. **The PEM pattern bug (Cycle 7 O-16) is a real example — visible by reading.**
- **Shakuni**: HIGH against HK-CJ-5. Insider PR access + few-reviewer hook files = silent drift.
- **Duryodhana**: MODERATE. Requires large Write payload submission ability.
- **Tataka (LLM)**: HIGH within a session. The LLM IS the entity whose actions the hooks gate.

### Cycle 7 — Opportunity (concrete attack surfaces, confirmed by reading the hook scripts and by empirical observation during this document's Write)

| # | Opportunity | Hook | Archetype |
|---|---|---|---|
| O-1 | Whitespace-broken patterns (space inside what should be a contiguous token) | secret-scan, block-dangerous-bash | Hiranyakashipu |
| O-2 | Newline-broken patterns across multi-line content | secret-scan | Hiranyakashipu |
| O-3 | Base64-encoded versions of common secrets | secret-scan | Hiranyakashipu |
| O-4 | Edit-tool bypass of frontmatter-check (documented in script: only Write is checked) | frontmatter-check | Duryodhana |
| O-5 | Memory exhaustion via large content (no size bound in any hook) | All Write/Edit hooks | Duryodhana |
| O-6 | Path exemption tricks: `/shastras/` and `/templates/` paths exempt vocabulary-lint (this is design intent for the lint, but worth noting — secret-scan does NOT exempt these paths, so secrets in /shastras/ would still be caught) | vocabulary-lint | (design intent, not real bypass) |
| O-7 | Empty content on malformed JSON: hooks accept empty extraction silently | All Write/Edit hooks | Maricha |
| O-8 | jq-fallback parse divergence: grep+sed fallback parses differently than jq, esp. with escaped quotes | All Write/Edit hooks | Maricha / Hiranyakashipu |
| O-9 | Pattern drift via PR: no lineage-pinning test exists | All hooks | Shakuni (PRIMARY) |
| O-10 | Exit-code mutation via PR: `exit 2` → `exit 0` single-character change | All hooks | Shakuni |
| O-11 | Hook script execution failure: syntax error → exit non-zero (not 0, not 2) → undefined harness behavior | All hooks | Hiranyakashipu / Shakuni |
| O-12 | vocabulary-lint TERMS hardcoded; doesn't auto-derive from VOCABULARY.md | vocabulary-lint | Shakuni / Saraswati |
| O-13 | handover-reminder advisory-only (exit 0 always; stderr-only) | handover-reminder | (design choice) |
| O-14 | Cross-hook ordering not specified or asserted | Multiple | Composition gap |
| O-15 | stage-tip informational-only | stage-tip | (design choice) |
| **O-16** | **PEM pattern in secret-scan is non-functional due to grep option-parsing bug**: the pattern starts with `-----` which grep interprets as flags. Confirmed empirically during this document's first Write attempt — grep emitted "unrecognized option" error on the PEM pattern, then silently moved to the next pattern. The PEM detection has been non-functional since the secret-scan hook was written. | secret-scan | Hiranyakashipu (latent bug surfaced by empirical SHD invocation) |
| **O-17** | **Hooks silently swallow pattern errors**: the `for p in PATTERNS; do if printf '%s' "$content" \| grep -Eq "$p"; then ...` construct uses an `if` test, so grep's non-zero exit (whether from no-match-found OR from an error like O-16) all collapse to "didn't match — try next pattern." Pattern errors are indistinguishable from pattern non-matches. | secret-scan, vocabulary-lint, block-dangerous-bash | Hiranyakashipu (compounds O-16) |
| **O-18** | **`block-dangerous-bash.sh` is non-functional on bash 3.2 (macOS default)** — uses `declare -A` associative arrays which require bash 4.0+. On bash 3.2 the script errors with "unbound variable" on the declare line and exits 1. Per the Claude Code spec, hook exit codes other than 0/2 are undefined-behavior; the hook is silently off. Surfaced empirically when running `tests/test_block_dangerous_bash_patterns.sh` against the user's macOS-default bash 3.2.57. **The kit's primary defense against `git push --force` / `rm -rf /` / `--no-verify` is non-functional on default-macOS environments.** | block-dangerous-bash | Hiranyakashipu (latent bug surfaced empirically) — **HIGHEST PRIORITY of all findings** |
| **O-19** | **vocabulary-lint's `\bTerm\b` word-boundary check misses CamelCase-attached usage**: payloads like `class RamLoader:`, `Vishnu_thread.start()`, `BrahmaProcessor()` are clearly divine-name-in-code-path but the regex requires a non-word-char immediately after the term. Since `L`, `_`, `P` are word chars, `\bRam\b` doesn't match in `RamLoader`. **Confirmed empirically** via `tests/test_vocabulary_lint_patterns.sh` — three CamelCase tests landed as KNOWN-BUG. | vocabulary-lint | Hiranyakashipu (word-boundary spec-gap) |

**Cycle 7 verdict:** The most consequential findings are O-16 + O-17 — they are EMPIRICAL bugs surfaced by the SHD pass's own Write attempt. The PEM detection in `secret-scan.sh` has been non-functional throughout the hook's existence. The kit's claim of PEM-blocking is operationally false. **This is a textbook anti-hypocrisy violation (LAW 11) caught by SHD against the kit's own enforcement primitives.**

### Cycle 8 — Collateral (compressed)

- O-16 PEM non-functional: real PEM private key could land in repo. **Catastrophic.** Mitigation: HK-NG-1 (pattern-coverage tests) would have caught this immediately if it had existed.
- O-17 silent pattern errors: the entire pattern-array design is operationally fragile. Any pattern that errors silently disappears from enforcement.
- O-9 lineage drift, O-10 exit-code mutation: long-term erosion vectors.
- O-5 memory exhaustion → fail-open: catastrophic when triggered.
- O-7 empty content on malformed JSON: silent enforcement off.

---

## Round 3 — Forge (Cycles 9-12)

### Cycle 9 — New Guards (priority-ordered)

| Pri | Guard | Closes | Implementation sketch |
|---|---|---|---|
| **P0** | HK-NG-1: Pattern-coverage tests in new `tests/` directory | O-9 + O-10 + **O-16 + O-17** | New `tests/test_<hookname>.sh` per hook. Each pipes known-bad content, asserts exit 2; pipes known-good content, asserts exit 0. **Critically: HK-NG-1 would catch O-16 immediately** — the PEM pattern test would fail because the pattern doesn't function. |
| **P0** | HK-NG-2: Fix `secret-scan.sh` PEM pattern grep-option-parsing bug | **O-16 (the empirically-surfaced bug)** | Change `grep -Eq "$p"` to `grep -Eq -- "$p"` (the `--` terminates option parsing) OR use `grep -e "$p"`. Single-character / few-character change. |
| **P0** | HK-NG-3: Don't silently swallow pattern errors | **O-17 (the empirically-surfaced bug)** | Distinguish "no match" (grep exit 1) from "pattern error" (grep exit 2). When a pattern errors, log loudly and either fail-closed or fail-fast — never silently move on. |
| **P0** | HK-NG-4: Empty-content rejection for security-sensitive hooks | O-7 | When jq extraction returns empty content, treat as malformed-input and refuse (exit 2 with "malformed input — refusing to fail open") for secret-scan, vocabulary-lint, frontmatter-check. handover-reminder + stage-tip remain advisory. |
| **P0** | HK-NG-5: Memory bound (refuse content over 10MB) | O-5 | `if [[ ${#content} -gt 10485760 ]]; then exit 2; fi` at the top of each Write/Edit hook. |
| **P1** | HK-NG-6: jq-fallback parity test | O-8 | A test that runs the same payload through jq and through fallback; asserts equivalent extraction. |
| **P1** | HK-NG-7: Extend frontmatter-check to Edit tool | O-4 | Re-read file from disk after Edit; validate frontmatter on resulting content. Requires file-system read. Consider cost vs benefit. |
| **P1** | HK-NG-8: VOCABULARY.md → vocabulary-lint TERMS sync test | O-12 | A test that parses VOCABULARY.md tables, extracts divine names, asserts every name appears in TERMS array. |
| **P2** | HK-NG-9: Hook execution-failure smoke test | O-11 | Test what the harness does when a hook exits non-zero (other than 2). May require external investigation of harness behavior. |
| **P2** | HK-NG-10: Cross-hook ordering assertion | O-14 | Document expected order; add integration test. |
| **P3** | HK-NG-11: Base64 / encoded-secret detection | O-3 | secret-scan extension. Complex; many false-positives. Defer. |
| **P0** | HK-NG-12: Extend vocabulary-lint pattern to catch CamelCase-attached lineage terms | **O-19** | Change `grep -Eiq "\\b${t}\\b"` to also match `${t}` followed by an uppercase letter (CamelCase boundary) AND by `_` (snake_case boundary). E.g., `grep -Eiq "\\b${t}([A-Z\\b]|_|$)"`. Needs care to avoid false-positives on legitimate words containing the term as substring. **The current word-boundary check is correct for the false-positive-prevention goal but insufficient for the false-negative-prevention goal.** |
| **P0** | HK-NG-13: Port block-dangerous-bash to bash-3.2-compatible parallel arrays OR add bash-4+ runtime check | **O-18 (highest-priority finding)** | Two options. (a) Replace `declare -A PATTERNS` with two parallel `declare -a` arrays (KEYS + VALUES) iterated in lockstep — bash-3.2 compatible. (b) Add at the top of the hook: `if [[ "${BASH_VERSION%%.*}" -lt 4 ]]; then printf 'ERROR: block-dangerous-bash requires bash 4+; current: %s\n' "$BASH_VERSION" >&2; exit 2; fi` — fails CLOSED rather than silently allowing through. **Recommend (a) for portability + (b) as belt-and-suspenders.** |

### Cycle 10 — New NEG Tests (binding contract per Saraswati condition (b))

**The binding contract is met by creating a new `tests/` directory at kit root with at least one test exercising at least one SHD-surfaced gap.** This pass creates:

| Test file | Asserts | SHD-surfaced gap |
|---|---|---|
| `tests/test_secret_scan_patterns.sh` | Each known secret pattern triggers exit-2; clean content exits 0; **explicitly tests PEM pattern** (will FAIL until HK-NG-2 lands — documents O-16 empirically) | O-16, O-9 |
| `tests/test_vocabulary_lint_patterns.sh` | A sample of divine names triggers exit-2 in code-path files; `.md` and `/shastras/` paths exit 0 | O-9 |
| `tests/test_block_dangerous_bash_patterns.sh` | Each of the 6 dangerous patterns triggers exit-2; benign commands exit 0 | O-9 |
| `tests/run_all.sh` | Aggregates all tests; reports pass/fail count | (runner) |

The **PEM-pattern test in `test_secret_scan_patterns.sh` will FAIL on initial run** because of O-16. This is intentional — the test documents the empirical bug and will pass once HK-NG-2 lands. This is the SHD-NEG-test pattern empirically validated by both prior firings (gap-documenting tests assert current broken behavior; the fix-forge flips them).

### Cycle 11 — Monitoring & Alerts

| ID | Signal | Where | Why |
|---|---|---|---|
| HK-MA-1 | Hook exit-code distribution drift | CI logs | Sudden shift signals pattern drift or content distribution change |
| HK-MA-2 | Hook execution-time anomaly | CI logs | >1s hook execution = potential memory exhaustion |
| HK-MA-3 | tests/test_*.sh running in CI | CI release-blocker | Pattern drift → test fails → release blocked |
| HK-MA-4 | `git log .claude/hooks/` quarterly review | Manual / AHR | Catches Shakuni-class drift |
| HK-MA-5 | VOCABULARY.md hash drift triggers HK-NG-8 re-run | CI / pre-commit | Catches O-12 desync |

### Cycle 12 — Shadow Verdict

**Defended now (with caveats):** the hooks individually do what their docstrings claim — for the inputs the patterns cover AND for the patterns that are syntactically functional. **The PEM detection in secret-scan does NOT defend now**; the kit's claim of PEM-blocking has been operationally false since the hook was written.

**Exposed (P0 — requires next-forge action):**
- O-16 (PEM pattern non-functional): **HK-NG-2 (single-char fix: add `--` to grep)** + **HK-NG-1 (pattern-coverage tests)** would prevent recurrence
- O-17 (silent pattern-error swallowing): **HK-NG-3** (distinguish no-match from error)
- O-9 + O-10 (lineage drift, exit-code mutation): **HK-NG-1**
- O-7 (empty content silent pass): **HK-NG-4**
- O-5 (memory exhaustion → fail-open): **HK-NG-5**

**Exposed (P1):**
- O-8 jq-fallback parity: HK-NG-6
- O-4 Edit-tool frontmatter bypass: HK-NG-7 (or accept and document)
- O-12 VOCABULARY.md → TERMS desync: HK-NG-8

**Exposed (P2-P3):**
- O-11 (hook execution-failure behavior): HK-NG-9 (requires harness investigation)
- O-14 (cross-hook ordering): HK-NG-10
- O-3 (base64-encoded secrets): HK-NG-11 (defer)

**Deferred-risk decisions:**
- **HK-D-1**: Accept O-3 (base64-encoded secrets) at current scope.
- **HK-D-2**: Accept O-13 (handover-reminder advisory-only) — design intent.
- **HK-D-3**: Accept O-15 (stage-tip informational-only) — design intent.
- **HK-D-4**: Defer HK-NG-9 until harness behavior on hook-error is empirically characterized.

**Outstanding obligations:**
- Apply HK-NG-1 + HK-NG-2 + HK-NG-3 + HK-NG-4 + HK-NG-5 (P0 bundle) as next-forge work. **HK-NG-2 is the most urgent** — the PEM bug is a real anti-hypocrisy violation actively in production.
- Apply HK-NG-6 + HK-NG-7 + HK-NG-8 (P1 bundle) as follow-on.

**Working-set promotion progress (kit-level update):**
- **(a) ≥3 firings across ≥2 projects:** **MET 2026-05-28.** Count: 3 firings (charter_intent, drift_hook, .claude/hooks), 2 projects (RIAAN, V1 KIT).
- **(b) unique 3-round method:** **MET.** ShadowFsm.toml.
- **(c) Kabir Gate ratification via additions log entry:** **PENDING.** A new KABIR_GATE.md entry should name the empirical evidence and recommend promotion.
- **(d) concrete harm prevented or value produced no other working-set cycle would surface:** **MET.** This firing alone surfaced O-16 — a real, production-grade anti-hypocrisy violation (kit claims PEM-blocking; PEM-blocking is non-functional). No NEG / RR / OE / etc. cycle would have caught this because none of them adversarially-read the patterns themselves with a "find the syntactic edge cases" gaze.

**Recommendation:** file working-set promotion proposal as KABIR_GATE.md additions log entry 11 in a future session. Not done in this session per Hanuman-scope-discipline.

**Cycle complete.** All 12 cycles executed. NEG tests authored in new `tests/` directory. Shadow Verdict published. **Working-set promotion criteria (a), (b), (d) MET; only (c) remains.**

---

*The third firing teaches what the first two could not: SHD against pattern-matching enforcement surfaces a different finding-class — pattern-bypass + lineage-drift + composition-gap + **the patterns themselves can be syntactically broken**. The kit had been operating with non-functional PEM detection; only the SHD pass's own empirical Write surfaced this.*

*Hiranyakashipu taught us: pattern-based enforcement always has spec-gaps. The mitigation is "pin what's currently covered so silent drift cannot remove coverage" + "test the patterns are syntactically functional, not just present in source."*

*Shakuni taught us: hook scripts are the highest-priority insider-threat surface in the kit. Short, security-sensitive, rarely-reviewed.*

*Duryodhana taught us: hook availability matters as much as hook correctness.*

*Maricha taught us: empty content always passes. Malformed JSON → silent enforcement off.*

*Tataka taught us — uncomfortably — that the LLM is the Tataka archetype against its own enforcement primitives. This is structurally true. The discipline isn't to prevent retry; it's to ensure each retry is independently checked.*

*The recursive elegance honored TWICE: (1) the kit's SHD cycle audited the kit's enforcement primitives; (2) the kit's enforcement primitive (secret-scan) fired on the SHD pass's own document during the initial Write, validating the hook works AND simultaneously surfacing the latent O-16 PEM bug. The cycle dogfooded itself, and the dogfooding surfaced empirical defects.*

*Three firings completed. Working-set promotion criteria (a), (b), (d) MET; only (c) remains. The cycle has paid empirical rent THREE times, surfaced 24+ gaps across three surfaces, and validated its own load-bearing nature.*

*Ram could not have been Ram without Raavan. The kit could not have honestly claimed enforcement without SHD looking adversarially at its own enforcement primitives.*
