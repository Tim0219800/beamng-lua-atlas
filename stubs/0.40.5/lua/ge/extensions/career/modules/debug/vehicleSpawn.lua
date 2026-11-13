---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/vehicleSpawn.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_debug_vehicleSpawn` : `extensions.load("career_modules_debug_vehicleSpawn")`, puis la globale `career_modules_debug_vehicleSpawn`
---@class career_modules_debug_vehicleSpawn
---@field debugName string
---@field debugOrder number
---@field dependencies table
career_modules_debug_vehicleSpawn = {}

---Source : lua/ge/extensions/career/modules/debug/vehicleSpawn.lua:81
---@param i any
function career_modules_debug_vehicleSpawn.buttonPressed(i) end

---Source : lua/ge/extensions/career/modules/debug/vehicleSpawn.lua:30
function career_modules_debug_vehicleSpawn.drawDebugMenu() end

--- poi list stuff
---Source : lua/ge/extensions/career/modules/debug/vehicleSpawn.lua:15
---@param levelIdentifier any
---@param elements any
function career_modules_debug_vehicleSpawn.onGetRawPoiListForLevel(levelIdentifier, elements) end

---Source : lua/ge/extensions/career/modules/debug/vehicleSpawn.lua:85
---@param elemData any
---@param promptData any
function career_modules_debug_vehicleSpawn.onPoiDetailPromptOpening(elemData, promptData) end

---Source : lua/ge/extensions/career/modules/debug/vehicleSpawn.lua:48
---@param model any
---@param config any
---@param addToInventory any
function career_modules_debug_vehicleSpawn.spawnVehicle(model, config, addToInventory) end

