---@meta
-- tim19Atlas stub generated from lua/ge/extensions/debug/vehicleDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Debug display above each active vehicle: when enabled, onUpdate draws with debugDrawer the vehicle's id, its position and the rotation (quaternion) of its reference node, above its bounding box. The state change is signaled to the UI through the guihook vehicleDebugInfoEnabledChanged. The state is kept across a Lua reload.
--- Access: extension `debug_vehicleDebug`: `extensions.load("debug_vehicleDebug")`, then the global `debug_vehicleDebug`
---@class debug_vehicleDebug
---@field dependencies string[] {'ui_imgui'}.
debug_vehicleDebug = {}

--- Sends the vehicle the size of the main window (bdebug.receiveViewportSize(width, height)). No effect if the vehicle does not exist.
---Source: lua/ge/extensions/debug/vehicleDebug.lua:30
---@param vehId integer Vehicle id.
function debug_vehicleDebug.bdebugRequestViewportSize(vehId) end

--- Returns the display state.
---Source: lua/ge/extensions/debug/vehicleDebug.lua:21
---@return boolean  true if enabled.
function debug_vehicleDebug.getDebugEnabled() end

--- Lua reload hook: restores debugEnabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/debug/vehicleDebug.lua:61
---@param serializedData table|nil State returned by onSerialize.
function debug_vehicleDebug.onDeserialized(serializedData) end

--- Lua reload hook: returns {debugEnabled}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/debug/vehicleDebug.lua:67
---@return table  State to keep.
function debug_vehicleDebug.onSerialize() end

--- Update hook: draws each active vehicle's debug information if the display is enabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/debug/vehicleDebug.lua:38
---@param dt number Time delta (s).
function debug_vehicleDebug.onUpdate(dt) end

--- Enables or disables the display and notifies the UI.
---Source: lua/ge/extensions/debug/vehicleDebug.lua:25
---@param value boolean New state.
function debug_vehicleDebug.setDebugEnabled(value) end

--- Toggles the display state and notifies the UI (vehicleDebugInfoEnabledChanged).
---Source: lua/ge/extensions/debug/vehicleDebug.lua:16
function debug_vehicleDebug.toggleDebugEnabled() end

