---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Framing node "painting" tool for vehicle thumbnails. It lets you disable (or re-enable) vehicle nodes with a circular brush in the editor's 3D view, so that they are ignored by procedural framing (antennas, protruding parts…). The list of disabled nodes is saved per configuration (key "model/config") in /settings/thumbnailNodeOutpaintConfig.json, in the configs table. It also provides the node data used by framing/procedural (world position, name, ignoreForThumbnailFraming mark, automatic detection of external mirrors), the editor's undo/redo history and debug drawing functions.
--- Access: extension `util_screenshotCreator_nodeOutpaint`: `extensions.load("util_screenshotCreator_nodeOutpaint")`, then the global `util_screenshotCreator_nodeOutpaint`
---@class util_screenshotCreator_nodeOutpaint
---@field dependencies string[] Extensions loaded before: ui_imgui, ui_imguiUtils, core_camera, core_vehicle_manager, util_screenshotCreator_settings.
util_screenshotCreator_nodeOutpaint = {}

--- Replaces the disabled nodes of a config with a snapshot (or removes the entry if empty) and saves. Used by undo/redo.
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:171
---@param configKey string "model/config" key.
---@param snapshot table|nil Table {cid = name}.
---@return boolean  false if configKey is nil.
function util_screenshotCreator_nodeOutpaint.applySnapshot(configKey, snapshot) end

--- Resets tabActive to false at the start of each UI frame; drawTab sets it back to true if the tab is displayed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:424
function util_screenshotCreator_nodeOutpaint.beginUiFrame() end

--- Restores the brush state (also accepts the old keys nodeOutpaintEnabled and nodeOutpaintBrushRadius); radius clamped to 4..80.
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:525
---@param data table|nil Saved state.
function util_screenshotCreator_nodeOutpaint.deserialize(data) end

--- Draws the framing data as 3D debug: bounds box (orange), vehicle OOBB (cyan), center, look-at point, axes, framing points, mirror nodes and disabled nodes, with labels. Default options come from settings.getFramingContext().debug.
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:433
---@param framingData table|nil framingData returned by a framing mode.
---@param options table|nil {drawBounds, drawOobb, drawInputs}.
function util_screenshotCreator_nodeOutpaint.drawFramingDebug(framingData, options) end

--- Draws the tab's ImGui content: brush checkbox, radius, color legend, "Auto-frame vehicle" button (if options.autoFrame exists), list of disabled nodes with an Enable button and "Enable all".
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:358
---@param options table|nil {vehicle, configName, autoFrame = function}.
function util_screenshotCreator_nodeOutpaint.drawTab(options) end

--- Draws a small debug sphere on each vehicle node, colored according to its state (ignored, disabled, mirror, active).
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:499
---@param vehicle table Vehicle object.
---@param explicitConfigName string|nil Imposed config name.
function util_screenshotCreator_nodeOutpaint.drawVehicleNodes(vehicle, explicitConfigName) end

--- Re-enables all the nodes of a config (removes its entry) with history and saving.
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:241
---@param vehicleOrKey table|string Vehicle or config key.
---@param explicitConfigName string|nil Imposed config name.
---@return boolean  false if there were no disabled nodes or no key.
function util_screenshotCreator_nodeOutpaint.enableAll(vehicleOrKey, explicitConfigName) end

--- Ends the brush stroke in progress: if it modified nodes, records the "Paint Thumbnail Framing Nodes" action in the history and saves.
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:251
function util_screenshotCreator_nodeOutpaint.finishStroke() end

--- Returns the path of the configuration file (/settings/thumbnailNodeOutpaintConfig.json).
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:543
---@return string  File path.
function util_screenshotCreator_nodeOutpaint.getConfigPath() end

--- Returns the UI's ImGui pointers.
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:566
---@return table  {enabled = BoolPtr, brushRadius = FloatPtr}.
function util_screenshotCreator_nodeOutpaint.getControls() end

--- Returns the table of disabled nodes of a config ({cid string = name}). Returns an unregistered empty table if the config does not exist, unless create is true.
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:67
---@param vehicleOrKey table|string Vehicle or "model/config" key.
---@param explicitConfigName string|nil Imposed config name when the first argument is a vehicle.
---@param create boolean|nil true to create and register the config's table in memory.
---@return table<string, string>  Disabled nodes.
function util_screenshotCreator_nodeOutpaint.getDisabledNodes(vehicleOrKey, explicitConfigName, create) end

--- Shortcut of getDisabledNodes for a config key.
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:551
---@param configKey string "model/config" key.
---@param create boolean|nil true to create the table if absent.
---@return table<string, string>  Disabled nodes.
function util_screenshotCreator_nodeOutpaint.getDisabledNodesForKey(configKey, create) end

--- Looks up a vehicle node by key (cid as string), by name or by cid.
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:162
---@param vehicle table Vehicle object.
---@param nodeIdentifier string|integer Node key, name or cid.
---@return table|nil  Node found (see getVehicleNodeData), otherwise nil.
function util_screenshotCreator_nodeOutpaint.getVehicleNode(vehicle, nodeIdentifier) end

--- Lists all the vehicle's physical nodes with their world position and marks. On the first call, runs the mirror detection selfCheck.
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:118
---@param vehicle table Vehicle object.
---@return table[]  Array of {cid, key, name, ignoreForThumbnailFraming, automaticMirrorOutpaint, point (world vec3)}.
function util_screenshotCreator_nodeOutpaint.getVehicleNodeData(vehicle) end

--- Computes the "model/config" key of a vehicle, from its jbeam and explicitConfigName or vehicle.partConfig (normalized).
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:36
---@param vehicle table Vehicle object.
---@param explicitConfigName string|nil Imposed config name (takes priority over partConfig).
---@return string|nil  "model/config" key, nil if the model or the config is missing.
---@return string|nil  Model name.
---@return string|nil  Normalized config name.
function util_screenshotCreator_nodeOutpaint.getVehicleOutpaintKey(vehicle, explicitConfigName) end

--- Indicates whether the brush tab is active.
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:559
---@return boolean  tabActive.
function util_screenshotCreator_nodeOutpaint.isTabActive() end

--- Loads the configuration file into memory (only once unless force); creates an empty table if the file is missing or invalid.
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:45
---@param force boolean|nil true to reread the file even if it is already loaded.
---@return table  Config {configs = {...}}.
function util_screenshotCreator_nodeOutpaint.loadConfig(force) end

--- Hook after reload; identical to deserialize.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:525
---@param data table|nil Saved state.
function util_screenshotCreator_nodeOutpaint.onDeserialized(data) end

--- Hook: loads the configuration when the extension is loaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:531
function util_screenshotCreator_nodeOutpaint.onExtensionLoaded() end

--- Hook: ends the brush stroke in progress on unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:535
function util_screenshotCreator_nodeOutpaint.onExtensionUnloaded() end

--- Serialization hook; identical to serialize.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:518
---@return table  State.
function util_screenshotCreator_nodeOutpaint.onSerialize() end

--- Hook called when a vehicle spawns: ends the brush stroke in progress.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:539
function util_screenshotCreator_nodeOutpaint.onVehicleSpawned() end

--- Redoes a change: applies actionData.new. editor.history callback.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:188
---@param actionData table {configKey, old, new}.
function util_screenshotCreator_nodeOutpaint.redo(actionData) end

--- Writes the configuration to disk (jsonWriteFile, indented).
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:57
---@return boolean  Result of jsonWriteFile.
function util_screenshotCreator_nodeOutpaint.saveConfig() end

--- Assertion test of the external mirror detection.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:104
---@return boolean  Always true (otherwise an assertion fails).
function util_screenshotCreator_nodeOutpaint.selfCheck() end

--- Returns {enabled, brushRadius} for state saving.
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:518
---@return table  Brush state.
function util_screenshotCreator_nodeOutpaint.serialize() end

--- Disables or re-enables a node for a config, with an undo/redo history entry and saving to disk.
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:222
---@param vehicleOrKey table|string Vehicle or config key.
---@param node table Node (with key and name), as returned by getVehicleNode.
---@param disabled boolean true to disable, false to re-enable.
---@param explicitConfigName string|nil Imposed config name.
---@return boolean  true if the state changed.
function util_screenshotCreator_nodeOutpaint.setNodeDisabled(vehicleOrKey, node, disabled, explicitConfigName) end

--- Forces the "tab active" state; disabling it ends the brush stroke in progress.
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:428
---@param value boolean true if the tab is active.
function util_screenshotCreator_nodeOutpaint.setTabActive(value) end

--- Undoes a change: applies actionData.old. editor.history callback.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:183
---@param actionData table {configKey, old, new}.
function util_screenshotCreator_nodeOutpaint.undo(actionData) end

--- Updates the brush every frame: draws the circle, colors the nodes in the 3D view (debugDrawer), and during a left click disables the nodes under the brush (Ctrl: re-enables them). The brush stroke is recorded as a history action at the end.
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:263
---@param options table|nil {active, workerRunning, vehicle, configName}.
function util_screenshotCreator_nodeOutpaint.updateBrush(options) end

--- Alias of updateBrush.
---Source: lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:263
---@param options table|nil See updateBrush.
function util_screenshotCreator_nodeOutpaint.updateNodeOutpainting(options) end

