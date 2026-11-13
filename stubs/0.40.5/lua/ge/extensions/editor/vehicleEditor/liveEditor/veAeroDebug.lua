---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_vehicleEditor_liveEditor_veAeroDebug` : `extensions.load("editor_vehicleEditor_liveEditor_veAeroDebug")`, puis la globale `editor_vehicleEditor_liveEditor_veAeroDebug`
---@class editor_vehicleEditor_liveEditor_veAeroDebug
---@field dependencies table
---@field menuEntry string
editor_vehicleEditor_liveEditor_veAeroDebug = {}

---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua:175
---@param data any
function editor_vehicleEditor_liveEditor_veAeroDebug.onDeserialized(data) end

---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua:166
function editor_vehicleEditor_liveEditor_veAeroDebug.onEditorActivated() end

---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua:160
function editor_vehicleEditor_liveEditor_veAeroDebug.onEditorDeactivated() end

---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua:169
function editor_vehicleEditor_liveEditor_veAeroDebug.onSerialize() end

--- public interface
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua:61
---@param dt any
function editor_vehicleEditor_liveEditor_veAeroDebug.onUpdate(dt) end

--- Disable aeroDebug on old vehicle
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua:150
---@param oldVehicle any
---@param newVehicle any
---@param player any
function editor_vehicleEditor_liveEditor_veAeroDebug.onVehicleSwitched(oldVehicle, newVehicle, player) end

--- helper function to open the window
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua:145
function editor_vehicleEditor_liveEditor_veAeroDebug.open() end

