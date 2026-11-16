---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 'Vehicle Aero Debug' window of the live Vehicle Editor. Enables the `aeroDebug` vehicle extension (extensions.aeroDebug.enable()), reads getAeroData() and displays the total aerodynamic force and moment (world frame and vehicle frame), then the downforce of the front/rear axles. Lets you associate the 4 wheels (FL, FR, RL, RR) via combos; an automatic fill is attempted if the wheel names are FL/FR/RL/RR. Depends on editor_veMain.
--- Access: extension `editor_vehicleEditor_liveEditor_veAeroDebug`: `extensions.load("editor_vehicleEditor_liveEditor_veAeroDebug")`, then the global `editor_vehicleEditor_liveEditor_veAeroDebug`
---@class editor_vehicleEditor_liveEditor_veAeroDebug
---@field dependencies table<integer, string> {'editor_veMain'}.
---@field menuEntry string 'Aero Debug'.
editor_vehicleEditor_liveEditor_veAeroDebug = {}

--- Restores the open state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua:175
---@param data table onSerialize table.
function editor_vehicleEditor_liveEditor_veAeroDebug.onDeserialized(data) end

--- Called when entering the editor (does nothing).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua:166
function editor_vehicleEditor_liveEditor_veAeroDebug.onEditorActivated() end

--- Called when leaving the editor: disables aeroDebug on the current vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua:160
function editor_vehicleEditor_liveEditor_veAeroDebug.onEditorDeactivated() end

--- Returns {windowOpen}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua:169
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_liveEditor_veAeroDebug.onSerialize() end

--- Called every frame: enables/queries aeroDebug on the vehicle and draws the force tables and the axle configuration.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua:61
---@param dt number Time delta.
function editor_vehicleEditor_liveEditor_veAeroDebug.onUpdate(dt) end

--- Disables aeroDebug on the old vehicle and resets the aero data and the combos initialization.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua:150
---@param oldVehicle integer ID of the old vehicle.
---@param newVehicle integer ID of the new vehicle.
---@param player integer Player index.
function editor_vehicleEditor_liveEditor_veAeroDebug.onVehicleSwitched(oldVehicle, newVehicle, player) end

--- Opens the window.
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua:145
function editor_vehicleEditor_liveEditor_veAeroDebug.open() end

