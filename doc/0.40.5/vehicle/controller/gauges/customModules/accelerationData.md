# `controller_gauges_customModules_accelerationData`

*File: `lua/vehicle/controller/gauges/customModules/accelerationData.lua` · VM: Vehicle · 48 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `gauges/customModules/accelerationData` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Data module for genericGauges (type "auxiliary"): provides the vehicle sensor's accelerations. To be referenced in displayData.customModules with the module name accelerationData.

## Notes

- The units are those of sensors.gx/gy/gz (not specified in this file).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_gauges_customModules_accelerationData.init(jbeamData)` | Does nothing. *(internal)* | 37 |
| `controller_gauges_customModules_accelerationData.reset()` | Resets the module's internal state. *(internal)* | 34 |
| `controller_gauges_customModules_accelerationData.setupGaugeData(properties)` | Called by genericGauges with the properties requested in displayData.customModules: acceleration (x, y, z = sensors.gx/gy/gz) and accelerationSmooth (xSmooth, ySmooth, zSmooth = sensors.gx2/gy2/gz2). *(internal)* | 29 |
| `controller_gauges_customModules_accelerationData.updateGFX(dt)` | Does nothing (the update is done by updateGaugeData). *(internal)* | 13 |
| `controller_gauges_customModules_accelerationData.updateGaugeData(moduleData, dt)` | Called by genericGauges before each send: fills moduleData with the requested values. *(internal)* | 16 |

### Parameter details

#### `controller_gauges_customModules_accelerationData.init(jbeamData)`

Does nothing.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_gauges_customModules_accelerationData.setupGaugeData(properties)`

Called by genericGauges with the properties requested in displayData.customModules: acceleration (x, y, z = sensors.gx/gy/gz) and accelerationSmooth (xSmooth, ySmooth, zSmooth = sensors.gx2/gy2/gz2).

- `properties` (*table<string, boolean>*) : Set of requested properties (key = name, value = true).

#### `controller_gauges_customModules_accelerationData.updateGFX(dt)`

Does nothing (the update is done by updateGaugeData).

- `dt` (*number*) : Time step (s).

#### `controller_gauges_customModules_accelerationData.updateGaugeData(moduleData, dt)`

Called by genericGauges before each send: fills moduleData with the requested values.

- `moduleData` (*table*) : Module data table, then sent to the HTML page.
- `dt` (*number*) : Time elapsed since the last send (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/gauges/customModules/accelerationData.lua`.*
