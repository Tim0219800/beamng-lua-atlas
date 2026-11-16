# `controller_mechanics_beamLengthTrigger`

*File: `lua/vehicle/controller/mechanics/beamLengthTrigger.lua` · VM: Vehicle · 127 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `mechanics/beamLengthTrigger` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Mechanics controller (type "auxiliary") that sets an electrics value to a trigger value when the length of one or more beams (by tag) becomes shorter or longer than a threshold, otherwise to 0.

## Notes

- jbeam keys (default): triggerBeamTag (required), triggerLengthThreshold (number in m, required), comparison ("shorter" or "longer", required), aggregation (if several beams: "average" by default, "minimum" or "maximum"), electricsName ("<controllerName>_trigger"), electricsTriggerValue (1).
- In case of an invalid configuration, an error is logged and updateGFX stays nil (controller inactive).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_mechanics_beamLengthTrigger.init(jbeamData)` | Reads the configuration, finds the beams and chooses the comparison and aggregation functions. *(internal)* | 71 |
| `controller_mechanics_beamLengthTrigger.reset(jbeamData)` | Resets the electrics value to 0. *(internal)* | 65 |
| `controller_mechanics_beamLengthTrigger.updateGFX(dt)` | Writes the electrics value according to the measured length. (dynamically assigned) *(internal)* | dyn |

### Parameter details

#### `controller_mechanics_beamLengthTrigger.init(jbeamData)`

Reads the configuration, finds the beams and chooses the comparison and aggregation functions.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_mechanics_beamLengthTrigger.reset(jbeamData)`

Resets the electrics value to 0.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_mechanics_beamLengthTrigger.updateGFX(dt)`

Writes the electrics value according to the measured length. (dynamically assigned)

- `dt` (*number*) : Time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `getBeamLength`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/mechanics/beamLengthTrigger.lua`.*
