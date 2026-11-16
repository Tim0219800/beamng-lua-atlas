---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/veRawData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 'Raw Vehicle Data' window of the live Vehicle Editor: displays as a recursive imgui tree the entire vEditor.vehData table (data of the current vehicle, including the jbeam vdata) via imguiUtils.addRecursiveTreeTable. Useful to a modder to inspect the resolved jbeam structure.
--- Access: extension `editor_vehicleEditor_liveEditor_veRawData`: `extensions.load("editor_vehicleEditor_liveEditor_veRawData")`, then the global `editor_vehicleEditor_liveEditor_veRawData`
---@class editor_vehicleEditor_liveEditor_veRawData
---@field menuEntry string 'Raw Vehicle Data': menu label read by editor_veMain.
editor_vehicleEditor_liveEditor_veRawData = {}

--- Restores the open state of the window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veRawData.lua:36
---@param data table onSerialize table.
function editor_vehicleEditor_liveEditor_veRawData.onDeserialized(data) end

--- Returns {windowOpen} to restore the state after Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veRawData.lua:30
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_liveEditor_veRawData.onSerialize() end

--- Called every frame: draws the window and the data tree if it is open.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veRawData.lua:15
function editor_vehicleEditor_liveEditor_veRawData.onUpdate() end

--- Opens the window (used by the Vehicle Editor menu).
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veRawData.lua:26
function editor_vehicleEditor_liveEditor_veRawData.open() end

