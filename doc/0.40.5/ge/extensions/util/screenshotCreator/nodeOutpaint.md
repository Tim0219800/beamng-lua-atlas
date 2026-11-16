# `util_screenshotCreator_nodeOutpaint`

*File: `lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua` · VM: Game Engine (GE) · 581 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_screenshotCreator_nodeOutpaint`: `extensions.load("util_screenshotCreator_nodeOutpaint")`, then the global `util_screenshotCreator_nodeOutpaint`

Framing node "painting" tool for vehicle thumbnails. It lets you disable (or re-enable) vehicle nodes with a circular brush in the editor's 3D view, so that they are ignored by procedural framing (antennas, protruding parts…). The list of disabled nodes is saved per configuration (key "model/config") in /settings/thumbnailNodeOutpaintConfig.json, in the configs table. It also provides the node data used by framing/procedural (world position, name, ignoreForThumbnailFraming mark, automatic detection of external mirrors), the editor's undo/redo history and debug drawing functions.

## Example

```lua
local veh = getPlayerVehicle(0)
local key = util_screenshotCreator_nodeOutpaint.getVehicleOutpaintKey(veh)
local disabled = util_screenshotCreator_nodeOutpaint.getDisabledNodes(key) -- {["12"] = "node name", ...}
```

## Notes

- Config file format: {configs = {["model/config"] = {[cid as string] = node name}}}. A config with no disabled node is removed from the table.
- The config key is normalized: the last path segment, without the .pc or .jpg extension.
- The brush (updateBrush) acts only if the tab is active, the "Enable node brush" box is checked, no capture job is running and the mouse hovers the editor's 3D view; Ctrl + left click re-enables nodes. Radius: 4 to 80 px.
- Debug colors: cyan = active, red = manually disabled, purple = ignored by the part (ignoreForThumbnailFraming), orange = automatic external mirror.
- Changes go through editor.history (undo/redo) when the editor is loaded; the config is written to disk on every change.
- Nodes are tables {cid, key, name, ignoreForThumbnailFraming, automaticMirrorOutpaint, point}; key is the cid converted to a string.

**Dependencies (loaded first):** `ui_imgui`, `ui_imguiUtils`, `core_camera`, `core_vehicle_manager`, `util_screenshotCreator_settings`

## Functions

| Function | Description | Line |
|---|---|---|
| `util_screenshotCreator_nodeOutpaint.applySnapshot(configKey, snapshot)` | Replaces the disabled nodes of a config with a snapshot (or removes the entry if empty) and saves. Used by undo/redo. | 171 |
| `util_screenshotCreator_nodeOutpaint.beginUiFrame()` | Resets tabActive to false at the start of each UI frame; drawTab sets it back to true if the tab is displayed. *(internal)* | 424 |
| `util_screenshotCreator_nodeOutpaint.deserialize(data)` | Restores the brush state (also accepts the old keys nodeOutpaintEnabled and nodeOutpaintBrushRadius); radius clamped to 4..80. | 525 |
| `util_screenshotCreator_nodeOutpaint.drawFramingDebug(framingData, options)` | Draws the framing data as 3D debug: bounds box (orange), vehicle OOBB (cyan), center, look-at point, axes, framing points, mirror nodes and disabled nodes, with labels. Default options come from settings.getFramingContext().debug. | 433 |
| `util_screenshotCreator_nodeOutpaint.drawTab(options)` | Draws the tab's ImGui content: brush checkbox, radius, color legend, "Auto-frame vehicle" button (if options.autoFrame exists), list of disabled nodes with an Enable button and "Enable all". | 358 |
| `util_screenshotCreator_nodeOutpaint.drawVehicleNodes(vehicle, explicitConfigName)` | Draws a small debug sphere on each vehicle node, colored according to its state (ignored, disabled, mirror, active). | 499 |
| `util_screenshotCreator_nodeOutpaint.enableAll(vehicleOrKey, explicitConfigName)` | Re-enables all the nodes of a config (removes its entry) with history and saving. | 241 |
| `util_screenshotCreator_nodeOutpaint.finishStroke()` | Ends the brush stroke in progress: if it modified nodes, records the "Paint Thumbnail Framing Nodes" action in the history and saves. | 251 |
| `util_screenshotCreator_nodeOutpaint.getConfigPath()` | Returns the path of the configuration file (/settings/thumbnailNodeOutpaintConfig.json). | 543 |
| `util_screenshotCreator_nodeOutpaint.getControls()` | Returns the UI's ImGui pointers. | 566 |
| `util_screenshotCreator_nodeOutpaint.getDisabledNodes(vehicleOrKey, explicitConfigName, create)` | Returns the table of disabled nodes of a config ({cid string = name}). Returns an unregistered empty table if the config does not exist, unless create is true. | 67 |
| `util_screenshotCreator_nodeOutpaint.getDisabledNodesForKey(configKey, create)` | Shortcut of getDisabledNodes for a config key. | 551 |
| `util_screenshotCreator_nodeOutpaint.getVehicleNode(vehicle, nodeIdentifier)` | Looks up a vehicle node by key (cid as string), by name or by cid. | 162 |
| `util_screenshotCreator_nodeOutpaint.getVehicleNodeData(vehicle)` | Lists all the vehicle's physical nodes with their world position and marks. On the first call, runs the mirror detection selfCheck. | 118 |
| `util_screenshotCreator_nodeOutpaint.getVehicleOutpaintKey(vehicle, explicitConfigName)` | Computes the "model/config" key of a vehicle, from its jbeam and explicitConfigName or vehicle.partConfig (normalized). | 36 |
| `util_screenshotCreator_nodeOutpaint.isTabActive()` | Indicates whether the brush tab is active. | 559 |
| `util_screenshotCreator_nodeOutpaint.loadConfig(force)` | Loads the configuration file into memory (only once unless force); creates an empty table if the file is missing or invalid. | 45 |
| `util_screenshotCreator_nodeOutpaint.onDeserialized(data)` | Hook after reload; identical to deserialize. *(internal)* *(hook)* | 525 |
| `util_screenshotCreator_nodeOutpaint.onExtensionLoaded()` | Hook: loads the configuration when the extension is loaded. *(internal)* *(hook)* | 531 |
| `util_screenshotCreator_nodeOutpaint.onExtensionUnloaded()` | Hook: ends the brush stroke in progress on unload. *(internal)* *(hook)* | 535 |
| `util_screenshotCreator_nodeOutpaint.onSerialize()` | Serialization hook; identical to serialize. *(internal)* *(hook)* | 518 |
| `util_screenshotCreator_nodeOutpaint.onVehicleSpawned()` | Hook called when a vehicle spawns: ends the brush stroke in progress. *(internal)* *(hook)* | 539 |
| `util_screenshotCreator_nodeOutpaint.redo(actionData)` | Redoes a change: applies actionData.new. editor.history callback. *(internal)* | 188 |
| `util_screenshotCreator_nodeOutpaint.saveConfig()` | Writes the configuration to disk (jsonWriteFile, indented). | 57 |
| `util_screenshotCreator_nodeOutpaint.selfCheck()` | Assertion test of the external mirror detection. *(internal)* | 104 |
| `util_screenshotCreator_nodeOutpaint.serialize()` | Returns {enabled, brushRadius} for state saving. | 518 |
| `util_screenshotCreator_nodeOutpaint.setNodeDisabled(vehicleOrKey, node, disabled, explicitConfigName)` | Disables or re-enables a node for a config, with an undo/redo history entry and saving to disk. | 222 |
| `util_screenshotCreator_nodeOutpaint.setTabActive(value)` | Forces the "tab active" state; disabling it ends the brush stroke in progress. | 428 |
| `util_screenshotCreator_nodeOutpaint.undo(actionData)` | Undoes a change: applies actionData.old. editor.history callback. *(internal)* | 183 |
| `util_screenshotCreator_nodeOutpaint.updateBrush(options)` | Updates the brush every frame: draws the circle, colors the nodes in the 3D view (debugDrawer), and during a left click disables the nodes under the brush (Ctrl: re-enables them). The brush stroke is recorded as a history action at the end. | 263 |
| `util_screenshotCreator_nodeOutpaint.updateNodeOutpainting(options)` | Alias of updateBrush. | 263 |

### Parameter details

#### `util_screenshotCreator_nodeOutpaint.applySnapshot(configKey, snapshot)`

Replaces the disabled nodes of a config with a snapshot (or removes the entry if empty) and saves. Used by undo/redo.

- `configKey` (*string*) : "model/config" key.
- `snapshot` (*table|nil*) : Table {cid = name}.
- **returns**: boolean false if configKey is nil.

#### `util_screenshotCreator_nodeOutpaint.deserialize(data)`

Restores the brush state (also accepts the old keys nodeOutpaintEnabled and nodeOutpaintBrushRadius); radius clamped to 4..80.

- `data` (*table|nil*) : Saved state.

#### `util_screenshotCreator_nodeOutpaint.drawFramingDebug(framingData, options)`

Draws the framing data as 3D debug: bounds box (orange), vehicle OOBB (cyan), center, look-at point, axes, framing points, mirror nodes and disabled nodes, with labels. Default options come from settings.getFramingContext().debug.

- `framingData` (*table|nil*) : framingData returned by a framing mode.
- `options` (*table|nil*) : {drawBounds, drawOobb, drawInputs}.

#### `util_screenshotCreator_nodeOutpaint.drawTab(options)`

Draws the tab's ImGui content: brush checkbox, radius, color legend, "Auto-frame vehicle" button (if options.autoFrame exists), list of disabled nodes with an Enable button and "Enable all".

- `options` (*table|nil*) : {vehicle, configName, autoFrame = function}.

#### `util_screenshotCreator_nodeOutpaint.drawVehicleNodes(vehicle, explicitConfigName)`

Draws a small debug sphere on each vehicle node, colored according to its state (ignored, disabled, mirror, active).

- `vehicle` (*table*) : Vehicle object.
- `explicitConfigName` (*string|nil*) : Imposed config name.

#### `util_screenshotCreator_nodeOutpaint.enableAll(vehicleOrKey, explicitConfigName)`

Re-enables all the nodes of a config (removes its entry) with history and saving.

- `vehicleOrKey` (*table|string*) : Vehicle or config key.
- `explicitConfigName` (*string|nil*) : Imposed config name.
- **returns**: boolean false if there were no disabled nodes or no key.

#### `util_screenshotCreator_nodeOutpaint.getConfigPath()`

Returns the path of the configuration file (/settings/thumbnailNodeOutpaintConfig.json).

- **returns**: string File path.

#### `util_screenshotCreator_nodeOutpaint.getControls()`

Returns the UI's ImGui pointers.

- **returns**: table {enabled = BoolPtr, brushRadius = FloatPtr}.

#### `util_screenshotCreator_nodeOutpaint.getDisabledNodes(vehicleOrKey, explicitConfigName, create)`

Returns the table of disabled nodes of a config ({cid string = name}). Returns an unregistered empty table if the config does not exist, unless create is true.

- `vehicleOrKey` (*table|string*) : Vehicle or "model/config" key.
- `explicitConfigName` (*string|nil*) : Imposed config name when the first argument is a vehicle.
- `create` (*boolean|nil*) : true to create and register the config's table in memory.
- **returns**: table<string, string> Disabled nodes.

#### `util_screenshotCreator_nodeOutpaint.getDisabledNodesForKey(configKey, create)`

Shortcut of getDisabledNodes for a config key.

- `configKey` (*string*) : "model/config" key.
- `create` (*boolean|nil*) : true to create the table if absent.
- **returns**: table<string, string> Disabled nodes.

#### `util_screenshotCreator_nodeOutpaint.getVehicleNode(vehicle, nodeIdentifier)`

Looks up a vehicle node by key (cid as string), by name or by cid.

- `vehicle` (*table*) : Vehicle object.
- `nodeIdentifier` (*string|integer*) : Node key, name or cid.
- **returns**: table|nil Node found (see getVehicleNodeData), otherwise nil.

#### `util_screenshotCreator_nodeOutpaint.getVehicleNodeData(vehicle)`

Lists all the vehicle's physical nodes with their world position and marks. On the first call, runs the mirror detection selfCheck.

- `vehicle` (*table*) : Vehicle object.
- **returns**: table[] Array of {cid, key, name, ignoreForThumbnailFraming, automaticMirrorOutpaint, point (world vec3)}.

#### `util_screenshotCreator_nodeOutpaint.getVehicleOutpaintKey(vehicle, explicitConfigName)`

Computes the "model/config" key of a vehicle, from its jbeam and explicitConfigName or vehicle.partConfig (normalized).

- `vehicle` (*table*) : Vehicle object.
- `explicitConfigName` (*string|nil*) : Imposed config name (takes priority over partConfig).
- **returns**: string|nil "model/config" key, nil if the model or the config is missing.
- **returns**: string|nil Model name.
- **returns**: string|nil Normalized config name.

#### `util_screenshotCreator_nodeOutpaint.isTabActive()`

Indicates whether the brush tab is active.

- **returns**: boolean tabActive.

#### `util_screenshotCreator_nodeOutpaint.loadConfig(force)`

Loads the configuration file into memory (only once unless force); creates an empty table if the file is missing or invalid.

- `force` (*boolean|nil*) : true to reread the file even if it is already loaded.
- **returns**: table Config {configs = {...}}.

#### `util_screenshotCreator_nodeOutpaint.onDeserialized(data)`

Hook after reload; identical to deserialize.

- `data` (*table|nil*) : Saved state.

#### `util_screenshotCreator_nodeOutpaint.onSerialize()`

Serialization hook; identical to serialize.

- **returns**: table State.

#### `util_screenshotCreator_nodeOutpaint.redo(actionData)`

Redoes a change: applies actionData.new. editor.history callback.

- `actionData` (*table*) : {configKey, old, new}.

#### `util_screenshotCreator_nodeOutpaint.saveConfig()`

Writes the configuration to disk (jsonWriteFile, indented).

- **returns**: boolean Result of jsonWriteFile.

#### `util_screenshotCreator_nodeOutpaint.selfCheck()`

Assertion test of the external mirror detection.

- **returns**: boolean Always true (otherwise an assertion fails).

#### `util_screenshotCreator_nodeOutpaint.serialize()`

Returns {enabled, brushRadius} for state saving.

- **returns**: table Brush state.

#### `util_screenshotCreator_nodeOutpaint.setNodeDisabled(vehicleOrKey, node, disabled, explicitConfigName)`

Disables or re-enables a node for a config, with an undo/redo history entry and saving to disk.

- `vehicleOrKey` (*table|string*) : Vehicle or config key.
- `node` (*table*) : Node (with key and name), as returned by getVehicleNode.
- `disabled` (*boolean*) : true to disable, false to re-enable.
- `explicitConfigName` (*string|nil*) : Imposed config name.
- **returns**: boolean true if the state changed.

#### `util_screenshotCreator_nodeOutpaint.setTabActive(value)`

Forces the "tab active" state; disabling it ends the brush stroke in progress.

- `value` (*boolean*) : true if the tab is active.

#### `util_screenshotCreator_nodeOutpaint.undo(actionData)`

Undoes a change: applies actionData.old. editor.history callback.

- `actionData` (*table*) : {configKey, old, new}.

#### `util_screenshotCreator_nodeOutpaint.updateBrush(options)`

Updates the brush every frame: draws the circle, colors the nodes in the 3D view (debugDrawer), and during a left click disables the nodes under the brush (Ctrl: re-enables them). The brush stroke is recorded as a history action at the end.

- `options` (*table|nil*) : {active, workerRunning, vehicle, configName}.

#### `util_screenshotCreator_nodeOutpaint.updateNodeOutpainting(options)`

Alias of updateBrush.

- `options` (*table|nil*) : See updateBrush.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before: ui_imgui, ui_imguiUtils, core_camera, core_vehicle_manager, util_screenshotCreator_settings. |

## Calls into the engine (C++)

- `debugDrawer:` `drawLineInstance`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua`.*
