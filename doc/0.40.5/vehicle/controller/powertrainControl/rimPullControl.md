# `controller_powertrainControl_rimPullControl`

*File: `lua/vehicle/controller/powertrainControl/rimPullControl.lua` · VM: Vehicle · 48 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `powertrainControl/rimPullControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary "rim pull" controller (rim traction command, e.g. rail vehicles/tractors): an input axis input.rimPull (0..1) progressively reduces the torque converter's turbine clutch (from 1 to 0.2 between 0 and 0.5) then adds braking (from 0 to 1 between 0.5 and 1). It runs before vehicleController (defaultOrder 40) to modify input.brake before it is used.

## Notes

- jbeam key read: torqueConverterName ("torqueConverter").
- If the converter is not found, log D and updateGFX becomes nop.
- input.rimPull is read but no input action in this file feeds it; it must come from the actions/bindings.
- The controller modifies input.brake (max with the brake output) and relevantTorqueConverter.impellerClutchCoef.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_powertrainControl_rimPullControl.init(jbeamData)` | Gets the torque converter (jbeam torqueConverterName). *(internal)* | 34 |
| `controller_powertrainControl_rimPullControl.reset(jbeamData)` | Does nothing. *(internal)* | 31 |
| `controller_powertrainControl_rimPullControl.updateGFX(dt)` | Every frame: converts input.rimPull into a turbine clutch target and additional braking. *(internal)* | 16 |

### Parameter details

#### `controller_powertrainControl_rimPullControl.init(jbeamData)`

Gets the torque converter (jbeam torqueConverterName).

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_powertrainControl_rimPullControl.reset(jbeamData)`

Does nothing.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_powertrainControl_rimPullControl.updateGFX(dt)`

Every frame: converts input.rimPull into a turbine clutch target and additional braking.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultOrder` | number | Execution order (40). |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/powertrainControl/rimPullControl.lua`.*
