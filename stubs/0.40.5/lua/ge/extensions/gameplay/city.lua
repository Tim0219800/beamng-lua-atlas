---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/city.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension that loads the current level's city.sites.json file (via gameplay_sites_sitesManager) and offers queries on its zones and parking spots: highest-priority zone at a position, merged values of zones' custom fields, and drawing of two distant parking spots. A zone's priority is the custom field 'priority' (0 by default). The sites are loaded at level start and freed at the end.
--- Access: extension `gameplay_city`: `extensions.load("gameplay_city")`, then the global `gameplay_city`
---@class gameplay_city
---@field dependencies table<integer, string> Extensions loaded before: {"gameplay_sites_sitesManager"}.
gameplay_city = {}

--- Returns the first highest-priority zone that contains the position.
---Source: lua/ge/extensions/gameplay/city.lua:30
---@param pos vec3 World position.
---@return table|nil  Zone, or nil if no sites loaded or no zone.
function gameplay_city.getHighestPrioZone(pos) end

--- Should return the unique, sorted values of the custom fields fieldName (with suffixes '' to '4') of the highest-priority zone at the position. See notes: the implementation iterates over the result of getHighestPrioZone.
---Source: lua/ge/extensions/gameplay/city.lua:47
---@param pos vec3 World position.
---@param fieldName string Base name of the custom field (e.g. 'vehicleGroup').
---@return table  Sorted array of values; empty if pos or fieldName is missing.
function gameplay_city.getMergedFieldsFromZones(pos, fieldName) end

--- Draws two parking spots at random whose distance is at least minDist, and gives the highest-priority zone of each.
---Source: lua/ge/extensions/gameplay/city.lua:61
---@param minDist number|nil Minimum distance in meters (300 by default).
---@param startName string|nil Name imposed for the start spot, if it exists.
---@return string|nil  Start spot name.
---@return string  End spot name.
---@return string  Start zone name.
---@return string  End zone name.
function gameplay_city.getRandomParkingSpots(minDist, startName) end

--- Returns the currently loaded sites object.
---Source: lua/ge/extensions/gameplay/city.lua:112
---@return table|nil  Sites object, or nil.
function gameplay_city.getSites() end

--- Groups the zones containing the position by priority.
---Source: lua/ge/extensions/gameplay/city.lua:13
---@param pos vec3 World position.
---@return table<number, table[]>  Dictionary priority -> list of zones (the key -math.huge always exists, with an empty list).
---@return number  Highest priority found (-math.huge if none).
function gameplay_city.getZonesByPrioForPosition(pos) end

--- Loads a sites file via sitesManager.loadSites. With no argument, loads the current level's city.sites.json (unless already loaded).
---Source: lua/ge/extensions/gameplay/city.lua:97
---@param file string|nil Path of the .sites.json file.
function gameplay_city.loadSites(file) end

--- Hook called at the end of a level: calls reset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/city.lua:124
---@param levelPath string Level path.
function gameplay_city.onClientEndMission(levelPath) end

--- Hook called when a level starts: loads the default sites.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/city.lua:120
---@param levelPath string Level path.
function gameplay_city.onClientStartMission(levelPath) end

--- Forgets the loaded sites (sites = nil).
---Source: lua/ge/extensions/gameplay/city.lua:116
function gameplay_city.reset() end

