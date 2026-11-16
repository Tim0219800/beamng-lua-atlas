# `controller_drivingDynamics_actuators_adaptiveTorsionBars`

*File: `lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua` · VM: Vehicle · 125 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `drivingDynamics/actuators/adaptiveTorsionBars` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Driving Dynamics Suite actuator: variable-stiffness torsion bars (anti-roll). It groups torsion bars by name and, according to a named mode, applies multiplicative coefficients to their jbeam stiffness and damping via `obj:setTorsionbarSpringDamp`. The mode is chosen with `setParameters({torsionBarMode = "name"})`, typically from a `driveModes` mode of type "controller". Call order: `defaultOrder = 80`.

## Example

```lua
controller.getControllerSafe("drivingDynamics/adaptiveTorsionBars").setParameters({torsionBarMode = "stiff"})
```

## Notes

- jbeam keys read by init: `torsionBarNames` (list of jbeam bar names), `modes` (header table: `name`, `springCoef`, `dampCoef`, 1 by default), `name`.
- The coefficients multiply the base values of `v.data.torsionbars` (spring, damp): the change is not cumulative from one mode to the next.
- No periodic update; an unknown mode name is logged as an error. `shutdown` sets isActive to false and removes update/updateGFX (nil) without restoring the base values.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_drivingDynamics_actuators_adaptiveTorsionBars.getConfig()` | Returns a copy of the parameters. | 103 |
| `controller_drivingDynamics_actuators_adaptiveTorsionBars.init(jbeamData)` | Finds the torsion bars by name and reads the modes. *(internal)* | 43 |
| `controller_drivingDynamics_actuators_adaptiveTorsionBars.initLastStage()` | Empty. *(internal)* | 76 |
| `controller_drivingDynamics_actuators_adaptiveTorsionBars.registerCMU(cmu)` | Called by the CMU to give it a reference to itself. *(internal)* | 83 |
| `controller_drivingDynamics_actuators_adaptiveTorsionBars.reset()` | Empty (the bars are not restored to their initial state). *(internal)* | 40 |
| `controller_drivingDynamics_actuators_adaptiveTorsionBars.sendConfigData()` | Sends the parameters to the CMU in a config debug packet. *(internal)* | 107 |
| `controller_drivingDynamics_actuators_adaptiveTorsionBars.setConfig(configTable)` | Replaces the parameter table (no effect on the modes). *(internal)* | 99 |
| `controller_drivingDynamics_actuators_adaptiveTorsionBars.setDebugMode(debugEnabled)` | Stores the debug mode (no other effect). *(internal)* | 79 |
| `controller_drivingDynamics_actuators_adaptiveTorsionBars.setParameters(parameters)` | Applies a stiffness mode if `parameters.torsionBarMode` is provided. | 93 |
| `controller_drivingDynamics_actuators_adaptiveTorsionBars.shutdown()` | Stops the actuator (isActive = false). *(internal)* | 87 |

### Parameter details

#### `controller_drivingDynamics_actuators_adaptiveTorsionBars.getConfig()`

Returns a copy of the parameters.

- **returns**: table Deep copy ({isEnabled = true} by default).

#### `controller_drivingDynamics_actuators_adaptiveTorsionBars.init(jbeamData)`

Finds the torsion bars by name and reads the modes.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_drivingDynamics_actuators_adaptiveTorsionBars.registerCMU(cmu)`

Called by the CMU to give it a reference to itself.

- `cmu` (*table*) : CMU module.

#### `controller_drivingDynamics_actuators_adaptiveTorsionBars.setConfig(configTable)`

Replaces the parameter table (no effect on the modes).

- `configTable` (*table*) : New parameters.

#### `controller_drivingDynamics_actuators_adaptiveTorsionBars.setDebugMode(debugEnabled)`

Stores the debug mode (no other effect).

- `debugEnabled` (*boolean*) : Debug mode state.

#### `controller_drivingDynamics_actuators_adaptiveTorsionBars.setParameters(parameters)`

Applies a stiffness mode if `parameters.torsionBarMode` is provided.

- `parameters` (*table*) : Field: torsionBarMode (name of a mode defined in `modes`).

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultOrder` | number | 80. |
| `isActing` | boolean | false: never modified in this file. |
| `isActive` | boolean | true after init. |
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `setTorsionbarSpringDamp`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/drivingDynamics/actuators/adaptiveTorsionBars.lua`.*
