---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/vePowerTrain.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 'Powertrain' window (Powertrain Inspector) of the live Vehicle Editor. Every frame it asks the vehicle for powertrain.serializeDevicesInfo() (stored in vEditor.powertrainDevices), offers a combo of the devices sorted by name, then displays their jbeam data and live data using powerTrainUtils. Depends on editor_veMain.
--- Access: extension `editor_vehicleEditor_liveEditor_vePowerTrain`: `extensions.load("editor_vehicleEditor_liveEditor_vePowerTrain")`, then the global `editor_vehicleEditor_liveEditor_vePowerTrain`
---@class editor_vehicleEditor_liveEditor_vePowerTrain
---@field dependencies table<integer, string> {'editor_veMain'}.
---@field menuEntry string 'Powertrain Inspector'.
editor_vehicleEditor_liveEditor_vePowerTrain = {}

--- Restores windowOpen and devicePtr (non-standard name).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/vePowerTrain.lua:74
---@param data table onSerialize table.
function editor_vehicleEditor_liveEditor_vePowerTrain.onDeserialize(data) end

--- Called on editor activation: forces the recomputation of the device list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/vePowerTrain.lua:96
function editor_vehicleEditor_liveEditor_vePowerTrain.onEditorActivated() end

--- Returns {windowOpen, devicePtr}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/vePowerTrain.lua:67
---@return table  {windowOpen = boolean, devicePtr = integer}
function editor_vehicleEditor_liveEditor_vePowerTrain.onSerialize() end

--- Called every frame: requests the device info from the vehicle and draws the combo, the jbeam data and the live data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/vePowerTrain.lua:20
---@param dt number Time delta.
function editor_vehicleEditor_liveEditor_vePowerTrain.onUpdate(dt) end

--- On vehicle change, if the editor is active, empties the device list and forces the recomputation of the name list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/vePowerTrain.lua:90
---@param oldVehicle integer ID of the old vehicle.
---@param newVehicle integer ID of the new vehicle.
---@param player integer Player index.
function editor_vehicleEditor_liveEditor_vePowerTrain.onVehicleSwitched(oldVehicle, newVehicle, player) end

--- Opens the window.
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/vePowerTrain.lua:79
function editor_vehicleEditor_liveEditor_vePowerTrain.open() end

