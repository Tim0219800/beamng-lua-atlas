# `controller_bypassDampers`

*File: `lua/vehicle/controller/bypassDampers.lua` · VM: Vehicle · 215 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `bypassDampers` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller for bypass-channel shock absorbers (bypass shocks, off-road/Trophy truck type): a beam's damping changes depending on its travel along successive zones. At each physics step it measures the damper beam's displacement relative to its rest length and applies via `obj:setBoundedBeamDamp` the coefficients of the corresponding zone. It also plays a valve sound when the direction of movement reverses. Call order: `defaultOrder = 80`.

## Notes

- Jbeam keys read by init: `dampers` (header table with `name`, `beamName`: jbeam name of the beam) and `zones` (header table with `zoneDistance`, `beamDamp`, `beamDampFast`, `beamDampRebound`, `beamDampReboundFast`, `beamDampVelocitySplit`, `beamDampVelocitySplitRebound`; all 1 by default, the last takes `beamDampVelocitySplit`). The zones are sorted by increasing `zoneDistance`; each zone extends to the start of the next (the last to infinity). `zoneDistance` is the displacement in m relative to the rest length (positive = compression).
- Keys read by initSounds: `emitValveSounds` (true), `valveSoundEventCompression` ("event:>Vehicle>Suspension>bypassShock_01>bypassShock_in"), `valveSoundEventRebound` ("...bypassShock_out"), `valveSoundMaxVolume` (0.5), `valveSoundMinVelocity` (0.05 m/s), `valveSoundMaxVelocity` (0.2 m/s).
- The sound is emitted at the beam's node id1, in updateGFX, from the measurements of update.
- The internal sound settings field is called `maxValocity` in the code (harmless typo).
- If a named beam is not found, init crashes on `v.data.beams[nil]`: the beam name must exist.
- `damperZones` is never emptied in init: a second init (without reloading the module) would duplicate the zones.
- initLastStage and reset are empty.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_bypassDampers.init(jbeamData)` | Finds the damper beams by name and builds the sorted list of damping zones. *(internal)* | 138 |
| `controller_bypassDampers.initLastStage()` | Empty. *(internal)* | 203 |
| `controller_bypassDampers.initSounds(jbeamData)` | Reads the valve sound settings from the jbeam. *(internal)* | 127 |
| `controller_bypassDampers.reset()` | Empty (nothing to reset). *(internal)* | 124 |
| `controller_bypassDampers.update(dt)` | Physics step: for each damper, computes displacement and velocity, detects the direction reversal (valve sound), finds the current zone and applies its damping coefficients if it changed. *(internal)* | 36 |
| `controller_bypassDampers.updateGFX(dt)` | Every frame: plays the valve sounds queued by update. *(internal)* | 105 |

### Parameter details

#### `controller_bypassDampers.init(jbeamData)`

Finds the damper beams by name and builds the sorted list of damping zones.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_bypassDampers.initSounds(jbeamData)`

Reads the valve sound settings from the jbeam.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_bypassDampers.update(dt)`

Physics step: for each damper, computes displacement and velocity, detects the direction reversal (valve sound), finds the current zone and applies its damping coefficients if it changed.

- `dt` (*number*) : Physics step in seconds.

#### `controller_bypassDampers.updateGFX(dt)`

Every frame: plays the valve sounds queued by update.

- `dt` (*number*) : Time step in seconds (unused).

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultOrder` | number | 80: default call rank. |
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `getBeamLength`, `getBeamRestLength`, `setBoundedBeamDamp`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/bypassDampers.lua`.*
