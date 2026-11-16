---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rawPois.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Cache of "raw" points of interest (POI) per level. It collects POIs by emitting the hook `onGetRawPoiListForLevel(levelIdentifier, elements)` to all extensions, filters the list according to context (career/tutorial, test drive, delivery, discovery tutorials, multiseat) and caches the result with a generation number. A modder who adds POIs implements the hook in their extension and adds their elements to the received table.
--- Access: extension `gameplay_rawPois`: `extensions.load("gameplay_rawPois")`, then the global `gameplay_rawPois`
---@class gameplay_rawPois
---@field onModManagerReady function Alias of clear: the cache is cleared when the mod manager is ready.
---@field showMissionMarkersToggled function Alias of clear: the cache is cleared when the mission marker display changes.
gameplay_rawPois = {}

--- Clears the POI cache of all levels and increments the generation number (consumers thus detect that they must reload).
---Source: lua/ge/extensions/gameplay/rawPois.lua:11
function gameplay_rawPois.clear() end

--- Current generation number of the cache (after synchronizing the multiseat state).
---Source: lua/ge/extensions/gameplay/rawPois.lua:188
---@return integer  Generation.
function gameplay_rawPois.getRawPoiGeneration() end

--- Returns the filtered POI list of a level, building it (hook onGetRawPoiListForLevel) if it is not cached.
---Source: lua/ge/extensions/gameplay/rawPois.lua:75
---@param levelIdentifier string|nil Level identifier; if nil, returns an empty list.
---@return table[]  List of POI elements.
---@return integer  Generation number.
function gameplay_rawPois.getRawPoiListByLevel(levelIdentifier) end

