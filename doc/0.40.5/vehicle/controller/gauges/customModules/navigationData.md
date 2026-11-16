# `controller_gauges_customModules_navigationData`

*File: `lua/vehicle/controller/gauges/customModules/navigationData.lua` · VM: Vehicle · 48 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `gauges/customModules/navigationData` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Data module for genericGauges: feeds a navigation map in the HTML page. At setup it asks ui_uiNavi (game engine) to initialize the dashboard map; at each update it sends the vehicle's position (x, y) and orientation (degrees) via streamJS("updateMap").

## Notes

- setupGaugeData receives as its second argument the HTML texture provided by genericGauges; it is required.
- moduleData is not filled: the data goes directly into the updateMap stream {x, y, rotation}.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_gauges_customModules_navigationData.init(jbeamData)` | Does nothing. *(internal)* | 37 |
| `controller_gauges_customModules_navigationData.reset()` | Resets the module's internal state. *(internal)* | 34 |
| `controller_gauges_customModules_navigationData.setupGaugeData(properties, htmlTexture)` | Called by genericGauges with the properties requested in displayData.customModules: no property is read. *(internal)* | 29 |
| `controller_gauges_customModules_navigationData.updateGFX(dt)` | Does nothing (the update is done by updateGaugeData). *(internal)* | 19 |
| `controller_gauges_customModules_navigationData.updateGaugeData(moduleData, dt)` | Called by genericGauges before each send: fills moduleData with the requested values. *(internal)* | 22 |

### Parameter details

#### `controller_gauges_customModules_navigationData.init(jbeamData)`

Does nothing.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_gauges_customModules_navigationData.setupGaugeData(properties, htmlTexture)`

Called by genericGauges with the properties requested in displayData.customModules: no property is read.

- `properties` (*table*) : Requested properties (unused).
- `htmlTexture` (*table*) : Dashboard HTML texture (htmlTexture.new).

#### `controller_gauges_customModules_navigationData.updateGFX(dt)`

Does nothing (the update is done by updateGaugeData).

- `dt` (*number*) : Time step (s).

#### `controller_gauges_customModules_navigationData.updateGaugeData(moduleData, dt)`

Called by genericGauges before each send: fills moduleData with the requested values.

- `moduleData` (*table*) : Module data table, then sent to the HTML page.
- `dt` (*number*) : Time elapsed since the last send (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `getDirectionVector`, `getID`, `getPositionXYZ`, `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/gauges/customModules/navigationData.lua`.*
