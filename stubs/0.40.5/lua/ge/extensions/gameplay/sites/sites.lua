---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/sites/sites.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sites object. Fields: name, description, id, locations / zones / parkingSpots (gameplay/util/sortedList, with .sorted and .objects), tags, sortedTags, tagsToZones, tagsToLocations, quadtreeLocations, quadtreeZones, quadtreeParkingSpots, dir, filename.
---@class gameplay_sites_sites
local gameplay_sites_sites = {}

--- Draws all locations, zones and parking spots in debug.
---Source: lua/ge/extensions/gameplay/sites/sites.lua:26
function gameplay_sites_sites:drawDebug() end

--- To call after loading. Generates multiple spots, sorts, builds the name and tag indexes, attaches locations and spots to the zones that contain them (2D test) and builds the kd-trees.
---Source: lua/ge/extensions/gameplay/sites/sites.lua:59
function gameplay_sites_sites:finalizeSites() end

--- Parking spot closest to pos (3D kd-tree).
---Source: lua/ge/extensions/gameplay/sites/sites.lua:173
---@param pos vec3 Reference position.
---@return table|nil  parkingSpot object.
---@return number  Distance returned by the kd-tree's findNearest.
function gameplay_sites_sites:getClosestParkingSpot(pos) end

--- Increments and returns the global counter of sites object identifiers.
---Source: lua/ge/extensions/gameplay/sites/sites.lua:11
---@return integer  New identifier.
function gameplay_sites_sites:getNextUniqueIdentifier() end

--- Lists the locations whose 2D distance to pos is between minRadius and maxRadius.
---Source: lua/ge/extensions/gameplay/sites/sites.lua:135
---@param pos vec3 Search center.
---@param minRadius number Minimum distance in meters.
---@param maxRadius number Maximum distance in meters.
---@return table[]  Items {loc, squaredDistance} (squared distance).
function gameplay_sites_sites:getRadialLocations(pos, minRadius, maxRadius) end

--- Lists the parking spots whose 2D distance to pos is between minRadius and maxRadius.
---Source: lua/ge/extensions/gameplay/sites/sites.lua:155
---@param pos vec3 Search center.
---@param minRadius number Minimum distance in meters.
---@param maxRadius number Maximum distance in meters.
---@return table[]  Items {ps, squaredDistance} (squared distance).
function gameplay_sites_sites:getRadialParkingSpots(pos, minRadius, maxRadius) end

--- Gathers the tags of all zones that contain pos.
---Source: lua/ge/extensions/gameplay/sites/sites.lua:209
---@param pos vec3 Position to test.
---@return table<string, integer>  Set of tags (value 1).
---@return string[]  Tags sorted alphabetically.
function gameplay_sites_sites:getTagsForZonesAtPosition(pos) end

--- Zones whose 2D outline contains pos.
---Source: lua/ge/extensions/gameplay/sites/sites.lua:178
---@param pos vec3 Position to test.
---@return table[]  List of zone objects.
function gameplay_sites_sites:getZonesForPosition(pos) end

--- Constructor: creates the three sorted lists and a default name "Sites".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/sites/sites.lua:16
---@param name string|nil Name of the sites set.
function gameplay_sites_sites:init(name) end

--- Reloads the sites set from a serialized table (literal "\n" in the description become real line breaks).
---Source: lua/ge/extensions/gameplay/sites/sites.lua:45
---@param data table|nil Data of the .sites.json file.
---@param oldIdMap table|nil Old id -> new id mapping, filled by the lists.
function gameplay_sites_sites:onDeserialized(data, oldIdMap) end

--- Serializes name, description, the three lists, dir and filename.
---Source: lua/ge/extensions/gameplay/sites/sites.lua:32
---@return table  JSON-compatible data.
function gameplay_sites_sites:onSerialize() end

--- Generic iterator over the zones containing pos, to use in a for: for id, zone in sites:zonesForPositionIterator(pos) do. Avoids allocating a table; ctx can be reused.
---Source: lua/ge/extensions/gameplay/sites/sites.lua:201
---@param pos vec3 Position to test.
---@param ctx table|nil Reusable context table.
---@return function  Iterator function _anon(ctx) -> id, zone.
---@return table  Context.
function gameplay_sites_sites:zonesForPositionIterator(pos, ctx) end

