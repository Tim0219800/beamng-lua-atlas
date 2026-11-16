# `controller_gauges_customModules_dynamicRedlineData`

*File: `lua/vehicle/controller/gauges/customModules/dynamicRedlineData.lua` · VM: Vehicle · 61 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `gauges/customModules/dynamicRedlineData` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Data module for genericGauges: computes a red/yellow tachometer zone that depends on the oil temperature (cold engine = reduced max RPM) and a shift light. The values are converted to an integer output scale (e.g. number of segments of an LED bar).

## Notes

- Module jbeam keys (default): minOutput (0), maxOutput (20), minOutputRPM (0), maxOutputRPM (10000), minOilTemp (50, °C), maxOilTemp (90), yellowOutputOffset (-2), coldOilRPMCoef (0.5).
- Adjusted red RPM = maxrpm * linear interpolation of the coefficient between coldOilRPMCoef (cold oil) and 1 (hot oil). shiftLight is true from 95% of this RPM, except in the last gear (gearIndex >= maxGearIndex).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_gauges_customModules_dynamicRedlineData.init(jbeamData)` | Reads the jbeam parameters of the output scale and the oil temperature. *(internal)* | 42 |
| `controller_gauges_customModules_dynamicRedlineData.reset()` | Resets the module's internal state. *(internal)* | 39 |
| `controller_gauges_customModules_dynamicRedlineData.setupGaugeData(properties)` | Called by genericGauges with the properties requested in displayData.customModules: no property is read; always produces yellow, red (integers) and shiftLight (boolean). *(internal)* | 36 |
| `controller_gauges_customModules_dynamicRedlineData.updateGFX(dt)` | Does nothing (the update is done by updateGaugeData). *(internal)* | 21 |
| `controller_gauges_customModules_dynamicRedlineData.updateGaugeData(moduleData, dt)` | Called by genericGauges before each send: fills moduleData with the requested values. *(internal)* | 24 |

### Parameter details

#### `controller_gauges_customModules_dynamicRedlineData.init(jbeamData)`

Reads the jbeam parameters of the output scale and the oil temperature.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_gauges_customModules_dynamicRedlineData.setupGaugeData(properties)`

Called by genericGauges with the properties requested in displayData.customModules: no property is read; always produces yellow, red (integers) and shiftLight (boolean).

- `properties` (*table<string, boolean>*) : Set of requested properties (key = name, value = true).

#### `controller_gauges_customModules_dynamicRedlineData.updateGFX(dt)`

Does nothing (the update is done by updateGaugeData).

- `dt` (*number*) : Time step (s).

#### `controller_gauges_customModules_dynamicRedlineData.updateGaugeData(moduleData, dt)`

Called by genericGauges before each send: fills moduleData with the requested values.

- `moduleData` (*table*) : Module data table, then sent to the HTML page.
- `dt` (*number*) : Time elapsed since the last send (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/gauges/customModules/dynamicRedlineData.lua`.*
