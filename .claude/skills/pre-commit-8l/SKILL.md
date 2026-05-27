---
name: pre-commit-8l
description: Run the 12-point pre-commit review (8 Engine Laws + 4 cross-cutting concerns) before any git commit. Non-negotiable per LAW 8. Use BEFORE `git commit`, never after. If any of the 12 checks fails, do not commit; fix the underlying issue. This is the formal guard on T₂ (forge → build).
---

# /pre-commit-8l — the T₂ guard

The 8 Engine Laws (architectural invariants) plus 4 cross-cutting concerns. Twelve checks. Sequential.

## When to use

- Before EVERY `git commit`. No exceptions.
- After `/commit` invokes you automatically (preferred path).

## The 8 Engine Laws (cycles 1–8)

For each, state PASS or FAIL with file:line evidence.

1. **FSM transitions are traced** — every transition writes a record (DB or log). Evidence: file:line of the trace call.
2. **LLM proposes, humans approve** — no auto-saved FSM configs without a human gate. Evidence: human-approval path.
3. **Messages are persisted** — every message written to the durable store. Evidence: write call.
4. **Pluggable backends** — adapter pattern; no hard-wired vendors. Evidence: trait/interface name.
5. **Config lineage** — every FSM has `parent` + `version` fields. Evidence: TOML lines.
6. **Health gates govern action** — unhealthy FSM produces untrusted output. Evidence: health-check.
7. **The engine doesn't know domains** — knowledge lives in config, not code. Evidence: config load path.
8. **Knowledge-first** — project's own `shastras/` (if present) and existing internal modules checked before pulling external libs. Evidence: import diff.

## The 4 cross-cutting concerns (cycles 9–12)

9. **Security** — injection, unsafe input, secret exposure. Evidence: input sanitization.
10. **Thread safety** — `Rc` vs `Arc`, `Send` bounds, deadlocks (or language equivalent). Evidence: concurrency primitive.
11. **Data-loss risks** — overwrites, missing error handling, silent drops. Evidence: error-propagation.
12. **UI consistency** — properties wired, callbacks connected end-to-end. Evidence: wiring.

## Output template

```
PRE-COMMIT 8L — verdict
=======================
1. FSM Trace:        PASS | FAIL — <file:line>
2. LLM-Proposes:     PASS | FAIL — <file:line>
3. Msg Persist:      PASS | FAIL — <file:line>
4. Pluggable:        PASS | FAIL — <file:line>
5. Config Lineage:   PASS | FAIL — <file:line>
6. Health Gate:      PASS | FAIL — <file:line>
7. Engine-Agnostic:  PASS | FAIL — <file:line>
8. Knowledge-First:  PASS | FAIL — <file:line>
9. Security:         PASS | FAIL — <file:line>
10. Thread Safety:   PASS | FAIL — <file:line>
11. Data-Loss:       PASS | FAIL — <file:line>
12. UI Consistency:  PASS | FAIL — <file:line or N/A>

OVERALL:  PASS  →  proceed to /commit
          FAIL  →  fix the FAIL(s) and re-run; do NOT commit
```

## Closing rule

Governance protects those who protect governance. If you bypass `/pre-commit-8l`, you forfeit the right to claim the commit is correct. The `block-dangerous-bash` hook will refuse `--no-verify`.
