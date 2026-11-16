# `controller_gauges_customModules_electricMotorData`

*File: `lua/vehicle/controller/gauges/customModules/electricMotorData.lua` · VM: Vehicle · 120 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `gauges/customModules/electricMotorData` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Data module for genericGauges: computes the displayed power, the power and torque, the remaining range and a consumption graph for electric motors.

## Notes

- The motors are the devices of type "electricMotor"; the batteries are their registered energy storages. Range = stored energy * 0.0278 / average consumption per 100 km.
- The consumption is smoothed and only changes if the vehicle is moving (> 0.5 m/s). updateGaugeData reads electrics.values.wheelspeed without a default.
- setupGaugeData adds the batteries without clearing the previous list (a second call duplicates them).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_gauges_customModules_electricMotorData.init(jbeamData)` | Does nothing. *(internal)* | 109 |
| `controller_gauges_customModules_electricMotorData.reset()` | Resets the module's internal state. *(internal)* | 105 |
| `controller_gauges_customModules_electricMotorData.setupGaugeData(properties)` | Called by genericGauges with the properties requested in displayData.customModules: powerDisplay (electricPowerDisplay: average throttle minus regeneration), currentPower (currentPower and averagePower in hp, currentTorque in N·m), remainingRange, consumptionGraph (averageConsumption, sent every 5 s, otherwise nil). *(internal)* | 92 |
| `controller_gauges_customModules_electricMotorData.updateGFX(dt)` | Does nothing (the update is done by updateGaugeData). *(internal)* | 33 |
| `controller_gauges_customModules_electricMotorData.updateGaugeData(moduleData, dt)` | Called by genericGauges before each send: fills moduleData with the requested values. *(internal)* | 36 |

### Parameter details

#### `controller_gauges_customModules_electricMotorData.init(jbeamData)`

Does nothing.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_gauges_customModules_electricMotorData.setupGaugeData(properties)`

Called by genericGauges with the properties requested in displayData.customModules: powerDisplay (electricPowerDisplay: average throttle minus regeneration), currentPower (currentPower and averagePower in hp, currentTorque in N·m), remainingRange, consumptionGraph (averageConsumption, sent every 5 s, otherwise nil).

- `properties` (*table<string, boolean>*) : Set of requested properties (key = name, value = true).

#### `controller_gauges_customModules_electricMotorData.updateGFX(dt)`

Does nothing (the update is done by updateGaugeData).

- `dt` (*number*) : Time step (s).

#### `controller_gauges_customModules_electricMotorData.updateGaugeData(moduleData, dt)`

Called by genericGauges before each send: fills moduleData with the requested values.

- `moduleData` (*table*) : Module data table, then sent to the HTML page.
- `dt` (*number*) : Time elapsed since the last send (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/gauges/customModules/electricMotorData.lua`.*
