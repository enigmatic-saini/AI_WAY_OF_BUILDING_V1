# atlas-fsms — Lineage FSM Reference

> 68 TOML descriptors for the divinity-named FSMs that [`../../ATLAS.md`](../../ATLAS.md) cycles draw on.

## What this directory is

`atlas-fsms/` is the **lineage FSM reference** inside V1 KIT. Each TOML here is a formal state-machine definition (states, transitions, guards, signals) of a cycle-divinity named in ATLAS.md — Brahma, Shiva, MahaKaal, ArdhNarishwar, Mira, Rukmini, Khatu Shyam, the 9 Nav Shakti, the 12 Bhakti saints, the Guru Council, the 8 Ashtabharya queens, AshtaRasa, Drishti.

These FSMs make the cycles described in prose in ATLAS.md *machine-readable* — so a future tool, agent, or shastra-validator can parse them programmatically without re-deriving the structure from the narrative.

## What this directory is NOT

- **Not part of V1 KIT's load-bearing contract.** The load-bearing files in `../` are `M_BUILD.toml`, `CycleFsm.toml`, `HookFsm.toml`, `RoleDescriptor.toml`, `SkillFsm.toml` — those are the 5 FSMs the kit *runs*. atlas-fsms is reference material that the cycles *describe*.
- **Not runtime-required.** V1 KIT operates without parsing any TOML in this directory. Deleting `atlas-fsms/` would not break any skill, role, or hook. It would only erode the lineage.
- **Not the place for project-specific FSMs.** Hardware FSMs, monitoring FSMs, audio/music FSMs, UI FSMs — those belong in the consuming project's own `fsms/` directory, not here. (See ATLAS.md's `Place in V1 KIT` section for the boundary.)

## Contract for adding a new FSM here

A new FSM enters `atlas-fsms/` only if it is named in [`../../ATLAS.md`](../../ATLAS.md) as a cycle-divinity. If a new cycle is added to ATLAS, its corresponding FSM may be added here. If an FSM here has no ATLAS cycle that names it, the Kabir Gate at quarterly review will prune it.

## Contract for removal

Removal is allowed when:
- The cycle it describes is itself pruned from ATLAS.md (lineage decay over 4+ quarters with no working-set use case), or
- It is replaced by a more accurate descriptor of the same divinity.

Never silent deletion — always paired with an ATLAS.md edit.

## How to use these

When a working-set cycle in `../../CYCLES.md` composes an atlas cycle (e.g., `IN` composes `RKM`, `SMR`, `NS3`, `KBD`, `MID`), the prose definition is in ATLAS.md and the formal state-machine definition — if needed — is here. Most day-to-day use of V1 KIT does not require opening these TOMLs; they exist for tooling, auditing, and lineage preservation.

## Inventory (68 files)

**Cycle divinities (Trimurti + extended):** Brahma, Vishnu, Shiva, Krishna, Radha, Ram, Sita, Hanuman, Arjuna, Narad, Lakshman, Ganesh, Saraswati, MahaKaal, ArdhNarishwar, Baglamukhi, KhatuShyam, Lakshmi, Shakti, Naad, Naada, Drishti

**Nav Shakti (9 + orchestrator):** Shailaputri, Brahmacharini, Chandraghanta, Kushmanda, Skandamata, Katyayani, Kaalratri, Mahagauri, Siddhidatri, NavShaktiOrchestrator

**Bhakti saints (12):** Prahlad, Haridas, Tansen, Surdas, Chaitanya, Tyagaraja, Ravidas, Andal, AkkaMahadevi, LalDed, Janabai, Mira

**Guru Council (14):** Ashtavakra, Buddha, Gorakhnath, Tulsidas, Osho, Chanakya, Patanjali, Kabir, Aryabhata, Sushruta, Nagarjuna, Thiruvalluvar, Dhanvantari, Vishwakarma

**Ashtabharya (8 + orchestrator):** Rukmini, Jambavati, Satyabhama, Kalindi, Nagnajiti, Mitravinda, LakshmanaQueen, Bhadra, AshtabharyaOrchestrator

**Cross-cutting:** AshtaRasa
