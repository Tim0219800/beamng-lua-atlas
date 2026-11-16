# `controller_mechanics_linearToAngularTransform`

*File: `lua/vehicle/controller/mechanics/linearToAngularTransform.lua` · VM: Vehicle · 94 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `mechanics/linearToAngularTransform` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Mechanics controller (type "auxiliary") that converts the displacement of a sensor beam into pulley rotation: the length change since the start, divided by an effective radius, gives an angle; the fraction of a turn (0..1, modulo 1) is multiplied by a factor (360 by default) and written into an electrics value to animate a rotating part.

## Notes

- jbeam keys (default): sensorBeamTag (required), effectiveRadius (m, required > 0), angularOutputElectricsName (required), angularOutputElectricsMultiplier (360).
- The code's error messages mention "beamSegments" and "pulleyRadius" (copy-paste) even though they concern this controller.
- Inconsistency: isActiveCoef and beamBroken serve no purpose (updateGFX does not check it); reset calls obj:getBeamLength(sensorBeamId) without checking that sensorBeamId exists.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_mechanics_linearToAngularTransform.beamBroken(id, energy)` | Hook: called when a beam breaks; marks the controller inactive if it is the sensor (no real effect, see notes). *(internal)* | 31 |
| `controller_mechanics_linearToAngularTransform.init(jbeamData)` | Finds the sensor beam and validates the configuration. *(internal)* | 46 |
| `controller_mechanics_linearToAngularTransform.reset(jbeamData)` | Stores the sensor's starting length and resets the output to 0. *(internal)* | 38 |
| `controller_mechanics_linearToAngularTransform.updateGFX(dt)` | Writes the converted fraction of a turn into the output electrics value. (dynamically assigned) *(internal)* | dyn |

### Parameter details

#### `controller_mechanics_linearToAngularTransform.beamBroken(id, energy)`

Hook: called when a beam breaks; marks the controller inactive if it is the sensor (no real effect, see notes).

- `id` (*integer*) : Identifier (cid) of the broken beam.
- `energy` (*number*) : Break energy.

#### `controller_mechanics_linearToAngularTransform.init(jbeamData)`

Finds the sensor beam and validates the configuration.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_mechanics_linearToAngularTransform.reset(jbeamData)`

Stores the sensor's starting length and resets the output to 0.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_mechanics_linearToAngularTransform.updateGFX(dt)`

Writes the converted fraction of a turn into the output electrics value. (dynamically assigned)

- `dt` (*number*) : Time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `getBeamLength`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/mechanics/linearToAngularTransform.lua`.*
