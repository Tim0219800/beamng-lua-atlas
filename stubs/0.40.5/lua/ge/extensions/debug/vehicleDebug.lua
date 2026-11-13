---@meta
-- tim19Atlas stub generated from lua/ge/extensions/debug/vehicleDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `debug_vehicleDebug` : `extensions.load("debug_vehicleDebug")`, puis la globale `debug_vehicleDebug`
---@class debug_vehicleDebug
---@field dependencies table
debug_vehicleDebug = {}

---Source : lua/ge/extensions/debug/vehicleDebug.lua:30
---@param vehId any
function debug_vehicleDebug.bdebugRequestViewportSize(vehId) end

---Source : lua/ge/extensions/debug/vehicleDebug.lua:21
function debug_vehicleDebug.getDebugEnabled() end

---Source : lua/ge/extensions/debug/vehicleDebug.lua:61
---@param serializedData any
function debug_vehicleDebug.onDeserialized(serializedData) end

---Source : lua/ge/extensions/debug/vehicleDebug.lua:67
function debug_vehicleDebug.onSerialize() end

---Source : lua/ge/extensions/debug/vehicleDebug.lua:38
---@param dt any
function debug_vehicleDebug.onUpdate(dt) end

---Source : lua/ge/extensions/debug/vehicleDebug.lua:25
---@param value any
function debug_vehicleDebug.setDebugEnabled(value) end

---Source : lua/ge/extensions/debug/vehicleDebug.lua:16
function debug_vehicleDebug.toggleDebugEnabled() end

