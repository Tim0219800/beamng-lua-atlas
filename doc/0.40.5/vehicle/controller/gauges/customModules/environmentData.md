# `controller_gauges_customModules_environmentData`

*File: `lua/vehicle/controller/gauges/customModules/environmentData.lua` · VM: Vehicle · 35 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `gauges/customModules/environmentData` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Data module for genericGauges: provides the outside temperature and the system time.

## Notes

- temperatureEnv in °C (obj:getEnvTemperature() - 273.15); time = "HH:MM" string of the computer's real local time (os.date), not the game time.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_gauges_customModules_environmentData.init(jbeamData)` | Does nothing. *(internal)* | 24 |
| `controller_gauges_customModules_environmentData.reset()` | Resets the module's internal state. *(internal)* | 21 |
| `controller_gauges_customModules_environmentData.setupGaugeData(properties)` | Called by genericGauges with the properties requested in displayData.customModules: no property is read; always produces temperatureEnv and time. *(internal)* | 18 |
| `controller_gauges_customModules_environmentData.updateGFX(dt)` | Does nothing (the update is done by updateGaugeData). *(internal)* | 10 |
| `controller_gauges_customModules_environmentData.updateGaugeData(moduleData, dt)` | Called by genericGauges before each send: fills moduleData with the requested values. *(internal)* | 13 |

### Parameter details

#### `controller_gauges_customModules_environmentData.init(jbeamData)`

Does nothing.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_gauges_customModules_environmentData.setupGaugeData(properties)`

Called by genericGauges with the properties requested in displayData.customModules: no property is read; always produces temperatureEnv and time.

- `properties` (*table<string, boolean>*) : Set of requested properties (key = name, value = true).

#### `controller_gauges_customModules_environmentData.updateGFX(dt)`

Does nothing (the update is done by updateGaugeData).

- `dt` (*number*) : Time step (s).

#### `controller_gauges_customModules_environmentData.updateGaugeData(moduleData, dt)`

Called by genericGauges before each send: fills moduleData with the requested values.

- `moduleData` (*table*) : Module data table, then sent to the HTML page.
- `dt` (*number*) : Time elapsed since the last send (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `getEnvTemperature`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/gauges/customModules/environmentData.lua`.*
