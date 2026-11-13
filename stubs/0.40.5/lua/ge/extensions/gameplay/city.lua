---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/city.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_city` : `extensions.load("gameplay_city")`, puis la globale `gameplay_city`
---@class gameplay_city
---@field dependencies table
gameplay_city = {}

---Source : lua/ge/extensions/gameplay/city.lua:30
---@param pos any
function gameplay_city.getHighestPrioZone(pos) end

---Source : lua/ge/extensions/gameplay/city.lua:47
---@param pos any
---@param fieldName any
function gameplay_city.getMergedFieldsFromZones(pos, fieldName) end

---Source : lua/ge/extensions/gameplay/city.lua:61
---@param minDist any
---@param startName any
function gameplay_city.getRandomParkingSpots(minDist, startName) end

---Source : lua/ge/extensions/gameplay/city.lua:112
function gameplay_city.getSites() end

---Source : lua/ge/extensions/gameplay/city.lua:13
---@param pos any
function gameplay_city.getZonesByPrioForPosition(pos) end

---Source : lua/ge/extensions/gameplay/city.lua:97
---@param file any
function gameplay_city.loadSites(file) end

---Source : lua/ge/extensions/gameplay/city.lua:124
---@param levelPath any
function gameplay_city.onClientEndMission(levelPath) end

---Source : lua/ge/extensions/gameplay/city.lua:120
---@param levelPath any
function gameplay_city.onClientStartMission(levelPath) end

---Source : lua/ge/extensions/gameplay/city.lua:116
function gameplay_city.reset() end

