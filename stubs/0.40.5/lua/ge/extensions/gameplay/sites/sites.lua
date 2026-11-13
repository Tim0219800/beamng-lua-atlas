---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/sites/sites.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/sites/sites.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_sites_sites
local gameplay_sites_sites = {}

--- Debug and Serialization
---Source : lua/ge/extensions/gameplay/sites/sites.lua:26
function gameplay_sites_sites:drawDebug() end

---Source : lua/ge/extensions/gameplay/sites/sites.lua:59
function gameplay_sites_sites:finalizeSites() end

---Source : lua/ge/extensions/gameplay/sites/sites.lua:173
---@param pos any
function gameplay_sites_sites:getClosestParkingSpot(pos) end

---Source : lua/ge/extensions/gameplay/sites/sites.lua:11
function gameplay_sites_sites:getNextUniqueIdentifier() end

--- gets a list of all locations within a min/max distance around a position.
---Source : lua/ge/extensions/gameplay/sites/sites.lua:135
---@param pos any
---@param minRadius any
---@param maxRadius any
function gameplay_sites_sites:getRadialLocations(pos, minRadius, maxRadius) end

--- gets a list of all parking spots within a min/max distance around a position.
---Source : lua/ge/extensions/gameplay/sites/sites.lua:155
---@param pos any
---@param minRadius any
---@param maxRadius any
function gameplay_sites_sites:getRadialParkingSpots(pos, minRadius, maxRadius) end

---Source : lua/ge/extensions/gameplay/sites/sites.lua:209
---@param pos any
function gameplay_sites_sites:getTagsForZonesAtPosition(pos) end

---Source : lua/ge/extensions/gameplay/sites/sites.lua:178
---@param pos any
function gameplay_sites_sites:getZonesForPosition(pos) end

---Source : lua/ge/extensions/gameplay/sites/sites.lua:16
---@param name any
function gameplay_sites_sites:init(name) end

---Source : lua/ge/extensions/gameplay/sites/sites.lua:45
---@param data any
---@param oldIdMap any
function gameplay_sites_sites:onDeserialized(data, oldIdMap) end

---Source : lua/ge/extensions/gameplay/sites/sites.lua:32
function gameplay_sites_sites:onSerialize() end

---Source : lua/ge/extensions/gameplay/sites/sites.lua:201
---@param pos any
---@param ctx any
function gameplay_sites_sites:zonesForPositionIterator(pos, ctx) end

