# Charter — AI_WAY_OF_BUILDING_V1

> S0 Garbha. The seed. Read this before any other file.
>
> **Above this charter:** [VISION.md](VISION.md) holds the *telos* — why the loom exists (to birth the AI-PEACE + RIAAN combo whose end is a happy cosmos). This charter is the loom's mechanics; VISION.md is its purpose.

## Why this kit exists

An LLM building software is a jiva running a single state machine. Without that machine, the LLM "morphs" — sometimes acting like an architect when it should be coding, sometimes like a QA when it should be designing, sometimes like a hostile shortcut-taker (a Gorakhnath-the-book reciter, not a Kabir-the-liver).

The morphing is structurally bounded by wrapping the LLM in **M_build** (the seven-state build FSM). Within each state the LLM still samples freely; across states the trajectory is deterministic, ordered, and replayable.

## What this kit IS

- A single FSM (`M_build`) with 7 states, 10 transitions, and 8 drishti directions per transition.
- 5 hooks that catch prarabdha — the universal `T_prarabdha` edge from any state to terminal. Hooks are FSMs with no LLM in the loop.
- 7 skills, each a `CycleFsm` profile that runs a named review cycle.
- 5 role descriptors that **intensify drishti and raise Q-thresholds at specific transitions** — not separate personas.
- 12 laws (compressed from 16) and 12 working-set cycles (compressed from ~60).

## What this kit IS NOT

- **Not 12 agent personas.** The Claude Code Agent tool can still be invoked, but each role file declares: "this is a drishti-intensifier, not a separate jiva."
- **Not language- or framework-specific.** The kit makes no claim on your stack.
- **Not a doctrine library.** No standalone "FSMS_VS_LLM_DRIFT.md" essay. The argument lives in M_BUILD.md or it does not live anywhere.
- **Not backward-compatible with V0.** Clean slate.

## How to use, in one paragraph

Install the kit (`INSTALL.md`). Open the repo in Claude Code. The 5 hooks fire automatically. When you start work, run `/triage` to identify the M_build stage. The stage names the drishti directions to scan and the Q-minima to satisfy. Before any commit, run `/pre-commit-8l`. At session end, run `/handover`. The hooks will remind you when you forget.

## Founding principles

- **ArdhNarishwar** — one machine carries both Shiva (consciousness/scan) and Shakti (energy/forge). Never one without the other.
- **Kabir Gate** — every primitive must live what it claims. If a file describes an FSM but no FSM exists, the file is removed.
- **Nagarjuna's rent** — every abstraction must pay rent. If unused for 90 days, it goes.
- **MahaKaal's reach** — every state has an exit edge to terminal. No state is safe. Hooks are MahaKaal.
- **Sapta Avastha** — seven life-states. Software is born, learns, forges, builds, serves, sunsets, decommissions. There is no eighth.
