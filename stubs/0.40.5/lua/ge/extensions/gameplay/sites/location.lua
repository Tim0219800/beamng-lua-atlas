---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/sites/location.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Location object. Fields: sites, id, name, color (vec3), pos (vec3), radius, customFields (gameplay/util/customFields).
---@class gameplay_sites_location
local gameplay_sites_location = {}

--- Draws a debug sphere (and the name if the mode is not 'faded'). In 'highlight' mode, also draws the closest road. Nothing beyond the view distance (300 m, or the editor preference).
---Source: lua/ge/extensions/gameplay/sites/location.lua:45
---@param drawMode string|nil 'none', 'faded', 'normal' or 'highlight'; default self._drawMode.
---@param clr table|nil Color {r,g,b}; default the location's color.
function gameplay_sites_location:drawDebug(drawMode, clr) end

--- Looks for the closest road segment via map.findClosestRoad and returns the point projected onto that segment, with the interpolated radius. Nodes a and b are swapped so that a is the closest.
---Source: lua/ge/extensions/gameplay/sites/location.lua:81
---@return table|nil  {name_a, name_b, a, b, distance, pos, radius} or nil if no road / map missing.
function gameplay_sites_location:findClosestRoadInfo() end

--- Constructor called by the module. Takes a unique identifier from the sites object if forceId is absent, default name "Location <id>".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/sites/location.lua:8
---@param sites table Parent sites object (provides getNextUniqueIdentifier).
---@param name string|nil Displayed name.
---@param forceId integer|nil Forced identifier (used on deserialization).
function gameplay_sites_location:init(sites, name, forceId) end

--- Restores name, color, position, radius and custom fields from a serialized table.
---Source: lua/ge/extensions/gameplay/sites/location.lua:32
---@param data table Table produced by onSerialize.
function gameplay_sites_location:onDeserialized(data) end

--- Returns a serializable table (name, pos, radius, color, oldId, customFields).
---Source: lua/ge/extensions/gameplay/sites/location.lua:20
---@return table  JSON-compatible data.
function gameplay_sites_location:onSerialize() end

--- Sets the position and radius of the location.
---Source: lua/ge/extensions/gameplay/sites/location.lua:40
---@param pos vec3 World position (copied).
---@param radius number Radius in meters.
function gameplay_sites_location:set(pos, radius) end

