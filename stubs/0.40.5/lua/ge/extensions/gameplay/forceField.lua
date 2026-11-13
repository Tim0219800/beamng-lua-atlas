---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/forceField.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_forceField` : `extensions.load("gameplay_forceField")`, puis la globale `gameplay_forceField`
---@class gameplay_forceField
gameplay_forceField = {}

---Source : lua/ge/extensions/gameplay/forceField.lua:17
function gameplay_forceField.activate() end

---Source : lua/ge/extensions/gameplay/forceField.lua:24
---@param silent any
function gameplay_forceField.deactivate(silent) end

---Source : lua/ge/extensions/gameplay/forceField.lua:95
function gameplay_forceField.getForceMultiplier() end

---Source : lua/ge/extensions/gameplay/forceField.lua:74
function gameplay_forceField.isActive() end

---Source : lua/ge/extensions/gameplay/forceField.lua:85
---@param enabled any
function gameplay_forceField.onCareerActive(enabled) end

---Source : lua/ge/extensions/gameplay/forceField.lua:66
function gameplay_forceField.onClientEndMission() end

---Source : lua/ge/extensions/gameplay/forceField.lua:82
function gameplay_forceField.onDeserialized() end

---Source : lua/ge/extensions/gameplay/forceField.lua:78
function gameplay_forceField.onSerialize() end

---Source : lua/ge/extensions/gameplay/forceField.lua:45
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_forceField.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/forceField.lua:70
function gameplay_forceField.onVehicleSwitched() end

---Source : lua/ge/extensions/gameplay/forceField.lua:91
---@param factor any
function gameplay_forceField.setForceMultiplier(factor) end

---Source : lua/ge/extensions/gameplay/forceField.lua:36
function gameplay_forceField.toggleActive() end

