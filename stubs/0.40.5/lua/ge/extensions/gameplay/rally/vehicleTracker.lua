---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/vehicleTracker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/rally/vehicleTracker.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_rally_vehicleTracker
local gameplay_rally_vehicleTracker = {}

---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:185
function gameplay_rally_vehicleTracker:damage() end

---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:193
function gameplay_rally_vehicleTracker:didJustHaveDamage() end

---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:204
function gameplay_rally_vehicleTracker:drawDebugInfo() end

---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:54
function gameplay_rally_vehicleTracker:getVehicle() end

---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:48
function gameplay_rally_vehicleTracker:getVehicleId() end

---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:9
---@param damageThreshold any
function gameplay_rally_vehicleTracker:init(damageThreshold) end

--- function C:onUpdate(dt, raceData)
---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:70
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_rally_vehicleTracker:onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:151
function gameplay_rally_vehicleTracker:pos() end

---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:200
---@param enabled any
function gameplay_rally_vehicleTracker:setDebugDraw(enabled) end

---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:180
function gameplay_rally_vehicleTracker:speedMs() end

---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:115
function gameplay_rally_vehicleTracker:updateVehicleDamage() end

---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:145
---@param vehicleId any
function gameplay_rally_vehicleTracker:updateVehicleData(vehicleId) end

---Source : lua/ge/extensions/gameplay/rally/vehicleTracker.lua:168
function gameplay_rally_vehicleTracker:velocity() end

