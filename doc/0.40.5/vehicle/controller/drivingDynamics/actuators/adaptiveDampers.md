# `controller_drivingDynamics_actuators_adaptiveDampers`

*File: `lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua` · VM: Vehicle · 132 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `drivingDynamics/actuators/adaptiveDampers` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Driving Dynamics Suite actuator: variable-damping dampers. It groups damper beams (by name) and, according to a named mode (Comfort, Sport...), applies multiplicative coefficients to their jbeam damping values via `obj:setBoundedBeamDamp`. The mode is chosen with `setParameters({damperMode = "name"})`, typically from a `driveModes` mode of type "controller". Call order: `defaultOrder = 80`.

## Example

```lua
controller.getControllerSafe("drivingDynamics/adaptiveDampers").setParameters({damperMode = "sport"})
```

## Notes

- jbeam keys read by init: `dampBeamNames` (list of jbeam beam names), `modes` (header table: `name`, `beamDampCoef`, `beamDampFastCoef`, `beamDampReboundCoef`, `beamDampReboundFastCoef`, `beamDampVelocitySplitCoef`, all 1 by default), `name`.
- The coefficients multiply the base values of `v.data.beams` (beamDamp, beamDampRebound, beamDampFast, beamDampReboundFast, beamDampVelocitySplit): the change is therefore not cumulative from one mode to the next. The same speed threshold value (VelocitySplit) is used for compression and rebound.
- No periodic update: neither update nor updateGFX. `controlParameters.isEnabled` is not used. An unknown mode name is logged as an error.
- `shutdown` sets isActive to false and removes update/updateGFX (nil) but does not restore the damping.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_drivingDynamics_actuators_adaptiveDampers.getConfig()` | Returns a copy of the parameters. | 110 |
| `controller_drivingDynamics_actuators_adaptiveDampers.init(jbeamData)` | Finds the damper beams by name and reads the modes. *(internal)* | 47 |
| `controller_drivingDynamics_actuators_adaptiveDampers.initLastStage()` | Empty. *(internal)* | 83 |
| `controller_drivingDynamics_actuators_adaptiveDampers.registerCMU(cmu)` | Called by the CMU to give it a reference to itself. *(internal)* | 90 |
| `controller_drivingDynamics_actuators_adaptiveDampers.reset()` | Empty (the damping is not restored to its initial state). *(internal)* | 44 |
| `controller_drivingDynamics_actuators_adaptiveDampers.sendConfigData()` | Sends the parameters to the CMU in a config debug packet. *(internal)* | 114 |
| `controller_drivingDynamics_actuators_adaptiveDampers.setConfig(configTable)` | Replaces the parameter table (no effect on the modes). *(internal)* | 106 |
| `controller_drivingDynamics_actuators_adaptiveDampers.setDebugMode(debugEnabled)` | Stores the debug mode (no other effect). *(internal)* | 86 |
| `controller_drivingDynamics_actuators_adaptiveDampers.setParameters(parameters)` | Applies a damping mode if `parameters.damperMode` is provided. | 100 |
| `controller_drivingDynamics_actuators_adaptiveDampers.shutdown()` | Stops the actuator (isActive = false). *(internal)* | 94 |

### Parameter details

#### `controller_drivingDynamics_actuators_adaptiveDampers.getConfig()`

Returns a copy of the parameters.

- **returns**: table Deep copy ({isEnabled = true} by default).

#### `controller_drivingDynamics_actuators_adaptiveDampers.init(jbeamData)`

Finds the damper beams by name and reads the modes.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_actuators_adaptiveDampers.registerCMU(cmu)`

Called by the CMU to give it a reference to itself.

- `cmu` (*table*) : CMU module.

#### `controller_drivingDynamics_actuators_adaptiveDampers.setConfig(configTable)`

Replaces the parameter table (no effect on the modes).

- `configTable` (*table*) : New parameters.

#### `controller_drivingDynamics_actuators_adaptiveDampers.setDebugMode(debugEnabled)`

Stores the debug mode (no other effect).

- `debugEnabled` (*boolean*) : Debug mode state.

#### `controller_drivingDynamics_actuators_adaptiveDampers.setParameters(parameters)`

Applies a damping mode if `parameters.damperMode` is provided.

- `parameters` (*table*) : Field: damperMode (name of a mode defined in `modes`).

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultOrder` | number | 80. |
| `isActing` | boolean | false: never modified in this file. |
| `isActive` | boolean | true after init. |
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `setBoundedBeamDamp`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/drivingDynamics/actuators/adaptiveDampers.lua`.*
