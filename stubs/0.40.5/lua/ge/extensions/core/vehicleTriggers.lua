---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicleTriggers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Handles the player's interaction with vehicle triggers (door handles, hood, etc. defined in the JBeam): raycast from the cursor or the crosshair, hover, display of the crosshair and action labels in the UI, then execution of action links (vehicle inputActions or common actions) when the player presses triggerAction0/1/2. Also handles split-screen mode (one ray per player) and enables or disables the C++ trigger rendering system (VehicleTrigger). A modder mostly uses it to fire a trigger by script (triggerEvent), test whether interaction is possible (isEnabled) or listen to the onVehicleTriggerActionLabel and onVehicleTriggersExecuteLink hooks.
--- Access: extension `core_vehicleTriggers`: `extensions.load("core_vehicleTriggers")`, then the global `core_vehicleTriggers`
---@class core_vehicleTriggers
---@field dependencies string[] Extensions loaded before this one: core_vehicle_triggerLabelPlacement and core_input_actionFilter.
core_vehicleTriggers = {}

--- Disables the triggers debug mode: unloads the core_vehicleTriggersDebug extension (no effect if already disabled).
---Source: lua/ge/extensions/core/vehicleTriggers.lua:1557
function core_vehicleTriggers.disableDebugUI() end

--- Enables debug mode: sets state.debugEnabled to true and loads the core_vehicleTriggersDebug extension ("Vehicle event debug" window). Also enables extra logs when executing links.
---Source: lua/ge/extensions/core/vehicleTriggers.lua:1553
function core_vehicleTriggers.enableDebugUI() end

--- Cursor position in the window's client area, as a fraction from 0 to 1.
---Source: lua/ge/extensions/core/vehicleTriggers.lua:357
---@return table|nil  {x, y} between 0 and 1, or nil if the position is not available.
function core_vehicleTriggers.getCursorPercent01() end

--- Maximum raycast distance for a player: 3 m for a walker (unicycle) or an occupant camera, 50 m otherwise.
---Source: lua/ge/extensions/core/vehicleTriggers.lua:420
---@param player integer|nil Player index (0 by default).
---@return number  Distance in meters.
function core_vehicleTriggers.getTriggerRaycastDistance(player) end

--- Indicates whether interaction with triggers is allowed at this moment (see notes) and updates state.allowInteraction.
---Source: lua/ge/extensions/core/vehicleTriggers.lua:788
---@return boolean  true if interaction is allowed.
function core_vehicleTriggers.isEnabled() end

--- Called by the input actions triggerAction0, 1 and 2. On release (value 0), releases the held trigger; otherwise performs a raycast for the player, and executes the hit trigger's links through triggerEvent. Remembers the held trigger as long as the key stays pressed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleTriggers.lua:1517
---@param actionNumber integer Action number (0, 1 or 2); becomes the string 'action0', etc.
---@param inputValue number Input value (0 = released, non-zero = pressed).
---@param player integer|nil Player index (0 by default).
---@return boolean|nil  false if interaction is disabled, true if no trigger is hit, otherwise nil.
function core_vehicleTriggers.onActionEvent(actionNumber, inputValue, player) end

--- Hook called when the CEF interface is shown or hidden. Remembers the state; if it is hidden, removes the VehicleInteraction action maps and hides the crosshair.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleTriggers.lua:1544
---@param cefVisible boolean true if the interface is visible.
function core_vehicleTriggers.onCefVisibilityChanged(cefVisible) end

--- Hook called when cursor visibility changes; the cursor is considered permanently visible if VehicleTrigger.debug is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleTriggers.lua:720
---@param visible boolean true if the cursor is visible.
function core_vehicleTriggers.onCursorVisibilityChanged(visible) end

--- Hook called after an extensions reload: clears the action map's player masks and restores the debug state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleTriggers.lua:1570
---@param data table|nil Data returned by onSerialize ({debugEnabled}).
function core_vehicleTriggers.onDeserialized(data) end

--- Hook called on unload: removes the interaction action maps, clears the masks and turns off VehicleTrigger.renderingEnabled and VehicleTrigger.enabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleTriggers.lua:1577
function core_vehicleTriggers.onExtensionUnloaded() end

--- Hook called when input bindings change: forces recomputation of the player controlling the mouse.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleTriggers.lua:1584
function core_vehicleTriggers.onInputBindingsChanged() end

--- Hook called when the mouse is locked or released (e.g. free camera); a locked mouse disables interaction.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleTriggers.lua:725
---@param locked boolean true if the mouse is locked.
function core_vehicleTriggers.onMouseLocked(locked) end

--- Hook called with devices sorted by recent activity; the last non-keyboard device of the mouse player (mouse or gamepad) decides whether they aim with the cursor or the crosshair.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleTriggers.lua:1590
---@param recentDevices string[] Device names, most recent first.
function core_vehicleTriggers.onRecentDevicesChanged(recentDevices) end

--- Hook called before an extensions reload: removes the action maps and the crosshair, returns {debugEnabled}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleTriggers.lua:1561
---@return table  {debugEnabled = boolean}
function core_vehicleTriggers.onSerialize() end

--- Hook called when the split-screen layout changes: clears the center and view rectangle caches.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleTriggers.lua:1261
function core_vehicleTriggers.onSplitScreenLayoutChanged() end

--- Hook called every frame. Refreshes the context, computes whether interaction is allowed, enables or disables VehicleTrigger (enabled, renderingEnabled, proximityRenderingEnabled), looks for the hovered trigger, updates labels, key legend, crosshair delay and UI stream. In split-screen, delegates to a per-player version.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleTriggers.lua:1382
---@param dtReal number Elapsed real time (s).
---@param dtSim number Simulation elapsed time (s).
---@param dtRaw number Raw elapsed time (s).
function core_vehicleTriggers.onUpdate(dtReal, dtSim, dtRaw) end

--- Executes all links associated with a trigger's action in vdata.triggerEventLinksDict[triggerId][actionStr]. Each link fires the onVehicleTriggersExecuteLink hook then a vehicle input command or a common action. Does nothing if the trigger or action has no link.
---Source: lua/ge/extensions/core/vehicleTriggers.lua:1488
---@param actionStr string Action name: 'action0', 'action1' or 'action2'.
---@param actionValue number Value sent (1 = press, 0 = release).
---@param triggerId string|integer Trigger identifier in the JBeam (inferred from code: key of triggerEventLinksDict).
---@param vehicleId integer Vehicle object identifier.
---@param vdata table Vehicle data (core_vehicle_manager.getVehicleData(id).vdata) containing triggerEventLinksDict and inputActions.
---@param player integer|nil Index of the player that originated the action.
function core_vehicleTriggers.triggerEvent(actionStr, actionValue, triggerId, vehicleId, vdata, player) end

--- Variant of triggerEvent that retrieves vdata itself from vehicleId. Called by C++ (typically virtual reality controllers).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleTriggers.lua:1509
---@param actionNum integer Action number (0, 1 or 2).
---@param actionValue number Value sent.
---@param triggerId string|integer Trigger identifier.
---@param vehicleId integer Vehicle identifier.
---@param player integer|nil Player index.
function core_vehicleTriggers.triggerEventWithoutVdata(actionNum, actionValue, triggerId, vehicleId, player) end

--- Projects a world position onto the screen with the active camera, as a fraction 0 to 1 (origin at top left).
---Source: lua/ge/extensions/core/vehicleTriggers.lua:396
---@param worldPos vec3 World position.
---@param out table|nil Table reused for the result (created if absent).
---@return table|nil  {x, y}; nil if the point is behind the camera or if the camera context is unavailable.
function core_vehicleTriggers.worldPosToScreenPercent01(worldPos, out) end

