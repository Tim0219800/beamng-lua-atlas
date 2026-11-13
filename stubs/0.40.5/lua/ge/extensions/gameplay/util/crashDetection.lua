---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/util/crashDetection.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_util_crashDetection` : `extensions.load("gameplay_util_crashDetection")`, puis la globale `gameplay_util_crashDetection`
---@class gameplay_util_crashDetection
---@field dependencies table
gameplay_util_crashDetection = {}

---Source : lua/ge/extensions/gameplay/util/crashDetection.lua:633
---@param vehId_ any
---@param crashSettings any
---@param owner any
function gameplay_util_crashDetection.addTrackedVehicleById(vehId_, crashSettings, owner) end

---Source : lua/ge/extensions/gameplay/util/crashDetection.lua:728
---@param vehId any
function gameplay_util_crashDetection.isVehCrashing(vehId) end

---Source : lua/ge/extensions/gameplay/util/crashDetection.lua:733
---@param vehId any
function gameplay_util_crashDetection.isVehTracked(vehId) end

---Source : lua/ge/extensions/gameplay/util/crashDetection.lua:745
---@param data any
function gameplay_util_crashDetection.onDeserialized(data) end

---Source : lua/ge/extensions/gameplay/util/crashDetection.lua:737
function gameplay_util_crashDetection.onSerialize() end

---Source : lua/ge/extensions/gameplay/util/crashDetection.lua:599
---@param dtReal any
---@param _dtSim any
function gameplay_util_crashDetection.onUpdate(dtReal, _dtSim) end

---Source : lua/ge/extensions/gameplay/util/crashDetection.lua:751
---@param vehId any
function gameplay_util_crashDetection.onVehicleDestroyed(vehId) end

---Source : lua/ge/extensions/gameplay/util/crashDetection.lua:718
---@param vehId any
function gameplay_util_crashDetection.removeTrackedVehicleById(vehId) end

---Source : lua/ge/extensions/gameplay/util/crashDetection.lua:73
---@param vehId any
function gameplay_util_crashDetection.resetCrashData(vehId) end

---Source : lua/ge/extensions/gameplay/util/crashDetection.lua:724
---@param _debug any
function gameplay_util_crashDetection.setDebug(_debug) end

