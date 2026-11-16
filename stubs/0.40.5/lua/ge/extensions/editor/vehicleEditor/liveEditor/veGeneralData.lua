---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/veGeneralData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 'General Data' window of the live Vehicle Editor. Every frame, it sends the vehicle VM a command that returns (via obj:queueGameEngineLua) a table in vEditor.generalData: position, rotation, direction, roll/pitch/yaw, speed, accelerations (sensors.gx2/gy2/gz2), air/ground speed, temperature, pressure, air density and damage. It displays them with readable units.
--- Access: extension `editor_vehicleEditor_liveEditor_veGeneralData`: `extensions.load("editor_vehicleEditor_liveEditor_veGeneralData")`, then the global `editor_vehicleEditor_liveEditor_veGeneralData`
---@class editor_vehicleEditor_liveEditor_veGeneralData
---@field menuEntry string 'General Data'.
editor_vehicleEditor_liveEditor_veGeneralData = {}

--- Restores the open state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veGeneralData.lua:101
---@param data table onSerialize table.
function editor_vehicleEditor_liveEditor_veGeneralData.onDeserialized(data) end

--- Returns {windowOpen}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veGeneralData.lua:95
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_liveEditor_veGeneralData.onSerialize() end

--- Called every frame: requests the data from the vehicle and draws the two-column table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veGeneralData.lua:20
function editor_vehicleEditor_liveEditor_veGeneralData.onUpdate() end

--- Opens the window.
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veGeneralData.lua:91
function editor_vehicleEditor_liveEditor_veGeneralData.open() end

