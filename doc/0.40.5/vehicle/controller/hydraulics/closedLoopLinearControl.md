# `controller_hydraulics_closedLoopLinearControl`

*File: `lua/vehicle/controller/hydraulics/closedLoopLinearControl.lua` · VM: Vehicle · 82 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `hydraulics/closedLoopLinearControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Closed-loop regulator of a linear hydraulic cylinder (type "auxiliary"). A PID compares the average extension of the cylinders (powertrain hydraulic consumers) to a target and writes the valve command into electrics.values. A modder sets the target with setCylinderTargetExtendPercent.

## Example

```lua
local c = controller.getControllerSafe('hydraulics/closedLoopLinearControl')
c.setCylinderTargetExtendPercent(0.5)
```

## Notes

- jbeam keys (default): cylinders (list of hydraulic consumer names), cylinderValveElectricsName ("cylinderValve"), cylinderPositionMin (0), cylinderPositionMax (1), targetExtendPercentInitial (0), cylinderPIDKp (0.5), cylinderPIDKi (0.3), cylinderPIDKd (0.01).
- PID output bounded to -1..1 and reset to 0 below 0.001. If no cylinder is found, updateFixedStep is set to nil.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_hydraulics_closedLoopLinearControl.init(jbeamData)` | Creates the PID, finds the cylinders and reads the parameters. *(internal)* | 47 |
| `controller_hydraulics_closedLoopLinearControl.reset(jbeamData)` | Resets the valve to 0, the target to the initial value and the PID to zero. *(internal)* | 41 |
| `controller_hydraulics_closedLoopLinearControl.setCylinderTargetExtendPercent(extendPercent)` | Sets the target extension of the cylinders. | 20 |
| `controller_hydraulics_closedLoopLinearControl.updateFixedStep(dt)` | Computes the valve command from the average extension of the cylinders and writes it into electrics.values. *(internal)* | 24 |

### Parameter details

#### `controller_hydraulics_closedLoopLinearControl.init(jbeamData)`

Creates the PID, finds the cylinders and reads the parameters.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_hydraulics_closedLoopLinearControl.reset(jbeamData)`

Resets the valve to 0, the target to the initial value and the PID to zero.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_hydraulics_closedLoopLinearControl.setCylinderTargetExtendPercent(extendPercent)`

Sets the target extension of the cylinders.

- `extendPercent` (*number*) : Extension 0..1, bounded by cylinderPositionMin/Max.

#### `controller_hydraulics_closedLoopLinearControl.updateFixedStep(dt)`

Computes the valve command from the average extension of the cylinders and writes it into electrics.values.

- `dt` (*number*) : Time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/hydraulics/closedLoopLinearControl.lua`.*
