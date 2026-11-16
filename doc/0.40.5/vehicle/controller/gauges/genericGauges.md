# `controller_gauges_genericGauges`

*File: `lua/vehicle/controller/gauges/genericGauges.lua` · VM: Vehicle · 260 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `gauges/genericGauges` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller that displays an HTML dashboard on a 3D material (htmlTexture) and continuously sends it data: electrics values, powertrain device properties and custom module data (controllers in gauges/customModules/). A modder uses it to create an HTML instrument cluster by declaring the controller in the jbeam with materialName, htmlPath, displayWidth/displayHeight and displayData. Data is only sent if a player is seated in the vehicle and the engine's UI update flag is raised.

## Example

```lua
-- jbeam (excerpt):
-- "controller": [["fileName"], ["gauges/genericGauges", {
--   "configuration": {"materialName": "@dash_screen", "htmlPath": "local://local/vehicles/xyz/dash.html", "displayWidth": 1024, "displayHeight": 512, "hasPopupMessageSupport": true},
--   "displayData": {
--     "electrics": ["rpmTacho", "wheelspeed"],
--     "powertrain": [["deviceName", "property"], ["mainEngine", "outputTorque1"]],
--     "customModules": [["moduleName", "property"], ["tireData", "pressure"]]
--   }}]]
local g = controller.getControllerSafe('gauges/genericGauges')
if g then g.displayPopupMessage('Hello', 'info', 3, '#ff0000') end
```

## Notes

- jbeam keys read: configuration (table) merged with any key named "configuration_xxx" (allows adding pieces from sub-parts); configuration.materialName (required), htmlPath (required), displayWidth, displayHeight, hasPopupMessageSupport (default false); displayData.electrics (list of electrics value names), displayData.powertrain (header table: deviceName, property), displayData.customModules (header table: moduleName, property optional).
- The interface units (uiUnitLength, uiUnitTemperature, uiUnitWeight, uiUnitTorque, uiUnitPower, uiUnitEnergy, uiUnitConsumptionRate, uiUnitVolume, uiUnitPressure, uiUnitDate) come from the player's settings and are sent to the HTML page by the "setup" JS call with the rest of the configuration; the page must define setup, updateData, updateMode and optionally messageQueue, messageClearById, messageClearAll.
- A custom module must expose setupGaugeData(properties, htmlTexture) and updateGaugeData(dataTable, dt); otherwise an error is logged ("Can't find controller").
- Missing electrics values or properties are sent as 0. Data is sent with streamJS("updateData"); the dt passed to the updates is the time accumulated since the last send.
- M.init = nop uses the global nop function provided by the game's Lua environment (not defined in this file). Fragility: initSecondStage reads displayData.electrics without a guard, so a Lua error occurs if displayData is missing from the jbeam.
- setPartCondition and getPartCondition are defined locally but not exported; setPartCondition writes a global odometerOffset (leftover from odometer code).
- initSecondStage does not check that gaugeHTMLTexture exists for setParameters/displayPopupMessage: only call them after a successful initialization.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_gauges_genericGauges.clearAllPopupMessages()` | Removes all popup messages (JS call messageClearAll). | 54 |
| `controller_gauges_genericGauges.clearPopupMessage(msgId)` | Removes a popup message by identifier (JS call messageClearById). | 47 |
| `controller_gauges_genericGauges.displayPopupMessage(message, iconId, timeout, highlightColor)` | Queues a popup message in the HTML page (JS call messageQueue). No effect if hasPopupMessageSupport is false. | 30 |
| `controller_gauges_genericGauges.initSecondStage(jbeamData)` | Reads the configuration, creates the HTML texture (htmlTexture.new at 60 FPS), prepares the electrics/powertrain/customModules lists and sends the configuration (UI units + jbeam configuration) to the page via callJS("setup"). *(internal)* | 164 |
| `controller_gauges_genericGauges.reset()` | Does nothing. *(internal)* | 161 |
| `controller_gauges_genericGauges.setParameters(parameters)` | If parameters contains modeName and modeColor, passes the parameters to the HTML page (JS call updateMode). | 229 |
| `controller_gauges_genericGauges.updateGFX(dt)` | Every graphics frame: if a player is seated and the UI needs updating, refreshes the electrics, powertrain and module data then sends them to the HTML page. *(internal)* | 81 |

### Parameter details

#### `controller_gauges_genericGauges.clearPopupMessage(msgId)`

Removes a popup message by identifier (JS call messageClearById).

- `msgId` (*string*) : Identifier returned by displayPopupMessage.

#### `controller_gauges_genericGauges.displayPopupMessage(message, iconId, timeout, highlightColor)`

Queues a popup message in the HTML page (JS call messageQueue). No effect if hasPopupMessageSupport is false.

- `message` (*string*) : Message text.
- `iconId` (*string*) : Icon identifier (inferred from code).
- `timeout` (*number*) : Display duration in seconds (durationSec).
- `highlightColor` (*string*) : Highlight color (inferred from code).
- **returns**: string|nil Message identifier ("test" + random number), nil if popups are not supported.

#### `controller_gauges_genericGauges.initSecondStage(jbeamData)`

Reads the configuration, creates the HTML texture (htmlTexture.new at 60 FPS), prepares the electrics/powertrain/customModules lists and sends the configuration (UI units + jbeam configuration) to the page via callJS("setup").

- `jbeamData` (*table*) : jbeam data (see notes).

#### `controller_gauges_genericGauges.setParameters(parameters)`

If parameters contains modeName and modeColor, passes the parameters to the HTML page (JS call updateMode).

- `parameters` (*table*) : Table with at least modeName and modeColor.

#### `controller_gauges_genericGauges.updateGFX(dt)`

Every graphics frame: if a player is seated and the UI needs updating, refreshes the electrics, powertrain and module data then sends them to the HTML page.

- `dt` (*number*) : Graphics time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `init` | function | Alias of nop (nothing to do at init). |
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `getUpdateUIflag`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/gauges/genericGauges.lua`.*
