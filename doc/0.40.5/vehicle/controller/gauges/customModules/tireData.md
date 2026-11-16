# `controller_gauges_customModules_tireData`

*File: `lua/vehicle/controller/gauges/customModules/tireData.lua` · VM: Vehicle · 57 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `gauges/customModules/tireData` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Data module for genericGauges: provides for each wheel a temperature color (fixed value) and the tire pressure.

## Notes

- The temperatures are constant "#ffffff" colors (no real temperature is computed in this file).
- Pressure = max((pressure group pressure - ambient pressure) * 0.001, 0); 0 if the wheel has no pressure group.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_gauges_customModules_tireData.init(jbeamData)` | Does nothing. *(internal)* | 46 |
| `controller_gauges_customModules_tireData.reset()` | Resets the module's internal state. *(internal)* | 43 |
| `controller_gauges_customModules_tireData.setupGaugeData(properties)` | Called by genericGauges with the properties requested in displayData.customModules: temperatures (table wheelName -> "#ffffff") and pressures (table wheelName -> pressure). *(internal)* | 38 |
| `controller_gauges_customModules_tireData.updateGFX(dt)` | Does nothing (the update is done by updateGaugeData). *(internal)* | 15 |
| `controller_gauges_customModules_tireData.updateGaugeData(moduleData, dt)` | Called by genericGauges before each send: fills moduleData with the requested values. *(internal)* | 18 |

### Parameter details

#### `controller_gauges_customModules_tireData.init(jbeamData)`

Does nothing.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_gauges_customModules_tireData.setupGaugeData(properties)`

Called by genericGauges with the properties requested in displayData.customModules: temperatures (table wheelName -> "#ffffff") and pressures (table wheelName -> pressure).

- `properties` (*table<string, boolean>*) : Set of requested properties (key = name, value = true).

#### `controller_gauges_customModules_tireData.updateGFX(dt)`

Does nothing (the update is done by updateGaugeData).

- `dt` (*number*) : Time step (s).

#### `controller_gauges_customModules_tireData.updateGaugeData(moduleData, dt)`

Called by genericGauges before each send: fills moduleData with the requested values.

- `moduleData` (*table*) : Module data table, then sent to the HTML page.
- `dt` (*number*) : Time elapsed since the last send (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `getEnvPressure`, `getGroupPressure`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/gauges/customModules/tireData.lua`.*
