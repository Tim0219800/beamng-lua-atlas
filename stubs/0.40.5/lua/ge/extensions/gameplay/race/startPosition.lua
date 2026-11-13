---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/race/startPosition.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/race/startPosition.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_race_startPosition
local gameplay_race_startPosition = {}

---Source : lua/ge/extensions/gameplay/race/startPosition.lua:139
---@param vehId any
---@param lowPrecision any
function gameplay_race_startPosition:calculateVehiclePosRot(vehId, lowPrecision) end

---Source : lua/ge/extensions/gameplay/race/startPosition.lua:63
---@param drawMode any
---@param clr any
function gameplay_race_startPosition:drawDebug(drawMode, clr) end

---Source : lua/ge/extensions/gameplay/race/startPosition.lua:52
---@param width any
---@param length any
function gameplay_race_startPosition:getFrontCorners(width, length) end

---Source : lua/ge/extensions/gameplay/race/startPosition.lua:218
function gameplay_race_startPosition:getRoutePoint() end

---Source : lua/ge/extensions/gameplay/race/startPosition.lua:227
function gameplay_race_startPosition:getStaticRoutePoint() end

---Source : lua/ge/extensions/gameplay/race/startPosition.lua:7
---@param race any
---@param name any
function gameplay_race_startPosition:init(race, name) end

---Source : lua/ge/extensions/gameplay/race/startPosition.lua:170
---@param vehId any
---@param lowPrecision any
---@param repair any
function gameplay_race_startPosition:moveResetVehicleTo(vehId, lowPrecision, repair) end

---Source : lua/ge/extensions/gameplay/race/startPosition.lua:36
---@param data any
function gameplay_race_startPosition:onDeserialized(data) end

---Source : lua/ge/extensions/gameplay/race/startPosition.lua:25
function gameplay_race_startPosition:onSerialize() end

---Source : lua/ge/extensions/gameplay/race/startPosition.lua:47
---@param pos any
---@param rot any
function gameplay_race_startPosition:set(pos, rot) end

---Source : lua/ge/extensions/gameplay/race/startPosition.lua:211
---@param rp any
function gameplay_race_startPosition:setRoutePoint(rp) end

---Source : lua/ge/extensions/gameplay/race/startPosition.lua:222
---@param rp any
function gameplay_race_startPosition:setStaticRoutePoint(rp) end

---Source : lua/ge/extensions/gameplay/race/startPosition.lua:190
---@param vehId any
function gameplay_race_startPosition:setToVehicle(vehId) end

