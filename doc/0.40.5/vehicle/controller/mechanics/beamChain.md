# `controller_mechanics_beamChain`

*File: `lua/vehicle/controller/mechanics/beamChain.lua` · VM: Vehicle · 78 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `mechanics/beamChain` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Mechanics controller (type "auxiliary") that links two beams in series: at each physics step, if the sum of their lengths exceeds their initial combined length, the excess is removed equally from both (obj:setBeamLength). Useful to simulate a chain or a cable with two sections. If one of the beams breaks, the other is broken too and the system disables itself.

## Notes

- jbeam key: beamTag (required), beam tag that must match exactly 2 beams (beamstate.tagBeamMap); otherwise an error is logged and the controller stays inactive (update and updateGFX stay nil).
- The beamBroken(id, energy) hook is called by the engine when a beam breaks.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_mechanics_beamChain.beamBroken(id, energy)` | Hook: called when a beam breaks; if it is one of the two, breaks the other and disables the chain. *(internal)* | 34 |
| `controller_mechanics_beamChain.init(jbeamData)` | Finds the two beams of the tag and stores their combined length. *(internal)* | 48 |
| `controller_mechanics_beamChain.reset(jbeamData)` | Reactivates the chain. *(internal)* | 44 |
| `controller_mechanics_beamChain.update(dt)` | Every physics step: removes the excess length equally from the two beams. (dynamically assigned) *(internal)* | dyn |
| `controller_mechanics_beamChain.updateGFX(dt)` | Does nothing. (dynamically assigned) *(internal)* | dyn |

### Parameter details

#### `controller_mechanics_beamChain.beamBroken(id, energy)`

Hook: called when a beam breaks; if it is one of the two, breaks the other and disables the chain.

- `id` (*integer*) : Identifier (cid) of the broken beam.
- `energy` (*number*) : Break energy.

#### `controller_mechanics_beamChain.init(jbeamData)`

Finds the two beams of the tag and stores their combined length.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_mechanics_beamChain.reset(jbeamData)`

Reactivates the chain.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_mechanics_beamChain.update(dt)`

Every physics step: removes the excess length equally from the two beams. (dynamically assigned)

- `dt` (*number*) : Time step (s).

#### `controller_mechanics_beamChain.updateGFX(dt)`

Does nothing. (dynamically assigned)

- `dt` (*number*) : Time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `breakBeam`, `getBeamLength`, `setBeamLength`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/mechanics/beamChain.lua`.*
