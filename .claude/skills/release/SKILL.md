---
name: release
description: Release captain's procedure per SDLC §8. Runs the RH3 (Pre-Release Battle-Readiness) pass, confirms STATUS.md honesty, drafts release notes, proposes the tag, sets up canary watch, and prepares the rollback gate. Use for any tagged release to production. This is the formal guard on T₃ (build → service).
---

# /release — the T₃ guard

7-cycle skill. Co-owned by `architect` (tag approval), `qa` (release veto), `security` (if sensitive), `engineer` (canary), `reviewer` (second eye on tag).

## Procedure

### 0. SHD — Shadow Deep (mandatory for sensitive-trigger diffs)

**Trigger:** the release includes any diff touching **auth / PII / payment / IaC / public-API** per SDLC §5 reviewer-routing.

**When triggered, you MUST run `SHD` (Shadow Deep cycle) BEFORE step 1 (RH3).** `SHD` is the open-world adversary-imagination cycle: it asks "what guard did I forget to write?" — distinct from RH3 / NEG, which test known guards.

**Process:**
- Adopt each of the 6 adversary archetypes in turn (APT / insider-threat / spec-gap-exploit / protocol-abuse / phishing / automated-scanner) and walk the 3x4 Shadow Matrix against the diff's surface — see [ATLAS.md Shadow Deep section](../../../ATLAS.md#shadow-deep-cycle--open-world-adversary-drishti--red-team-analysis-tag-shd) for the full method.
- Produce `SHADOW_PASS_YYYY-MM-DD_<area>.md` in the project (consuming-project location, not in the kit).
- Author at least one new NEG test for the gaps SHD surfaced. **This is the binding contract: the SHD pass does not close until at least one new NEG test is merged.**
- Update the project's `threat-model.md` (or create if absent) with the SHD verdict's delta.

**If SHD surfaces P0 gaps with no merged NEG test:** stop. Do not advance to step 1. The release is blocked until the new NEG tests are authored and merged.

**If no sensitive-trigger present:** skip this step and proceed to step 1. (SHD remains optional / recommended for non-sensitive diffs.)

### 1. RH3 — Pre-Release Battle-Readiness
- Can the system handle real traffic, real users, real edge cases right now?
- Security hardening, input validation, rate limiting, auth boundaries.
- Rollback procedures, feature flags, kill switches.

If FAIL: stop. Do not tag. Fix and re-run.

### 2. STATUS.md honesty
- `BUILT` section accurately reflects what compiles, runs, produces output.
- Anything moved from `DESIGNED` → `BUILT` has proof (tests passing, demo working).
- No claims about working features that don't.

### 3. Draft release notes
Format:
```
## v<major>.<minor>.<patch> — YYYY-MM-DD

### Added
- ...

### Changed
- ...

### Fixed
- ...

### Security
- (if any) ...

### Migration / breaking changes
- (if any) ...

### Known issues
- (if any) ...
```

### 4. Propose tag
Format: `v{major}.{minor}.{patch}` (SemVer).
Bump rules:
- Breaking change → major.
- New feature, backward-compatible → minor.
- Fix only → patch.

### 5. Canary watch
- Deploy to canary slice (e.g., 5% traffic).
- Watch error rate, latency p95, business metrics for ≥1 hour.
- If any regresses → roll back (step 6) and re-cycle.

### 6. Rollback gate
- Pre-stage the rollback command. Test it works.
- Document: "Roll back with `<command>` if `<metric>` breaches `<threshold>`."

### 7. Tag
- `git tag -a v<...> -m "Release <...>"`
- `git push origin v<...>`
- Publish release notes.

## Output template

```
SHD:        PASS @ <SHADOW_PASS_*.md path> + <N> new NEG tests merged | SKIPPED (no sensitive trigger) | BLOCKED (P0 gap, no NEG test)
RH3:        PASS | FAIL
STATUS:     honest | drift detected (fix before tag)
NOTES:      <link or block>
TAG:        v<...>
CANARY:     PASS @ <duration> | regressed (rolled back)
ROLLBACK:   <command staged>
RESULT:     released v<...> | aborted (reason: ...)
```
