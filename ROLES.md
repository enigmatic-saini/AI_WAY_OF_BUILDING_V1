# Roles — The 6 Drishti-Intensifiers

> A role is **not a separate jiva**. The LLM is one. A role file modifies what the jiva scans (drishti) and what Q-thresholds it must hit at a named transition. This file is the prose; the formal type lives in [`fsms/RoleDescriptor.toml`](fsms/RoleDescriptor.toml); the runtime descriptors live in [`.claude/agents/*.md`](.claude/agents/).

The human (business person, stakeholder, end-user) is the upstream jiva. `analyst` is the role that meets them there.

## The set

| Role | Attaches to | Drishti raised | Q raised | Use when |
|---|---|---|---|---|
| `analyst` | pre-T₀ (inside S0, before `charter_signed`) | `present`, `silence`, `future`, `left` | `mtv`, `rkm` | A human arrives with a feeling, not a charter |
| `architect` | T₀, T₁ | `up`, `future`, `silence` | `mtv`, `ngj` | Genesis or new module (charter already exists) |
| `engineer` | T₂, T₃, T_loop | `present`, `down`, `right` | `ngj`, `lkq` | Implementation work |
| `qa` | T₂, T₃ | `down`, `past` | `lkq`, `endurance` | 8L gate, pre-release |
| `security` | T₂, T₃, T_prarabdha | `up`, `silence`, `past` | `mtv`, `lkq` | Sensitive transitions, incidents |
| `reviewer` | T₃ | `left`, `right`, `up` | `mtv`, `endurance` | Second opinion on any MR |

## Why 6 and not more?

V0 carried 12 personas. The Anti-Hypocrisy Review (Kabir) found that 7 of them were costumes — labels for prompts that did not structurally differ. Of the 5 that survived, the kit later recognised one missing role: `analyst`, attaching to pre-T₀ (the work inside S0 Seed that produces the charter so T₀ can fire). Without `analyst`, the kit silently assumed a human shows up with a pre-articulated charter — which they rarely do. `analyst` is the only legitimate role addition since the V0→V1 collapse; it passes the Kabir Gate because it attaches to a distinct phase, intensifies a distinct drishti pattern, raises a distinct Q-axis (`rkm`), and produces a distinct artifact (`CHARTER.md`).

Removed (from V0's 12), with the role's work absorbed into:
- `tech-lead` → folded into `architect` for design questions; into `reviewer` for technical-direction MR comments.
- `devops` → folded into `engineer` (CI/CD code) + `security` (secret rotation) + `/release` (canary / rollback).
- `data-engineer` → folded into `architect` (schema design) + `engineer` (migration code) + `qa` (data tests).
- `designer` → folded into `engineer` (front-end code) + `reviewer` (UX critique). Project-specific design systems live in `ui-guidelines/` if present.
- `product-manager` → **outside the kit.** Backlog / scope belongs to the human. The human uses the neighbor [YATRA](../YATRA/) webapp (a read-only viewer over the kit's markdown docs) for visibility — backlog, in-flight, ADR ledger, postmortem ledger, status snapshot.
- `engineering-manager` → **outside the kit.** Sprint health belongs to the human. Same YATRA viewer; the viewer reads the same TODO/STATUS/HANDOVER docs the engineer already writes.
- `on-call` → folded into `security` + `/incident` skill.

**Why PM/EM are not drishti-intensifiers:** they do not modify what the LLM scans or which Q-thresholds it must hit at any M_build transition. Their work is *consumption of artifacts*, not *modification of the build*. Adding them as roles would re-introduce the very persona-fragmentation the V1 collapse removed. The viewer ([../YATRA/](../YATRA/) or any other reader of the [DASHBOARD.md](DASHBOARD.md) frontmatter contract) is the right tool for them.

This is Nagarjuna's rent test made concrete: the 7 removed roles did not attach to a distinct M_build transition with a distinct drishti / Q profile. They were duplicate operators on the same transition.

## How a role is invoked

Two equivalent paths:

1. **Via the Claude Code `Agent` tool** — `Agent(subagent_type: "engineer", prompt: ...)`. The harness loads the role file as a sub-prompt with the declared tool whitelist.
2. **By the LLM reading the role file directly** — the same modifier applied as in-context guidance. Useful when the work doesn't warrant a sub-agent (e.g., a single-file change reviewed in-line).

Either path produces the same result: the jiva scans the named drishti directions harder and refuses to ship below the named Q-thresholds.

## Per-role detail

Each role's full descriptor lives in `.claude/agents/<role>.md`. The role files all begin with the same disclaimer line:

> *"This is NOT a separate jiva. The LLM is one. This file modifies what the jiva scans and what Q-thresholds it must satisfy when attached to ..."*

The disclaimer is a Kabir-Gate invariant. If a role file lacks it, the Anti-Hypocrisy Review removes the role.

## Proposing a new role

To propose a new role, you must:
1. Name the transition it attaches to (must be one of M_build's 10 transitions).
2. Name the drishti directions it intensifies (subset of 8).
3. Name the Q-axes it raises to τ_high (subset of 8).
4. Name the artifact it produces (no role exists without an artifact).
5. Demonstrate that no existing role covers this transition with the same drishti / Q profile (otherwise: extend the existing role, do not duplicate).
6. Submit via an MR that touches `fsms/RoleDescriptor.toml`, `ROLES.md`, and `.claude/agents/<new-role>.md`.

The Anti-Hypocrisy Review will run on the new role at the next quarterly cycle.

## Anti-patterns

- **Inventing a role mid-conversation** to handle a one-off task. Do the work as the existing jiva; don't manufacture a label.
- **Spawning 12 parallel `Agent` calls.** Violates LAW 6 (max 5 parallel). Also signals you are masquerading as a team instead of being one careful operator.
- **Stamping "LGTM" as `reviewer`** without file:line evidence. That is precisely the ceremony the Kabir Gate exists to delete.
