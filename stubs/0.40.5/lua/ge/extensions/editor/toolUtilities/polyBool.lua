---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/polyBool.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- In-house 2D polygon booleans (union, difference), Martinez-like, adapted from the polybooljs approach (MIT). A polygon is a table { regions = { ring, ... }, inverted = bool } where each ring is a list of {x,y} points. Computations are done in a local frame near the origin so that the absolute epsilon does not get crushed at world coordinates. areas then sorts a list of rings into outer rings with their holes, ready for triangulation.
--- Access: extension `editor_toolUtilities_polyBool`: `extensions.load("editor_toolUtilities_polyBool")`, then the global `editor_toolUtilities_polyBool`
---@class editor_toolUtilities_polyBool
editor_toolUtilities_polyBool = {}

--- Sorts the flat list of rings of a boolean result into outer rings each carrying their holes. Nesting is deduced from containment depth: even = solid, odd = hole. Outer rings oriented CCW, holes CW. Each hole is attached to the deepest ring that contains it.
---Source: lua/ge/extensions/editor/toolUtilities/polyBool.lua:829
---@param regions table List of {x,y} rings (e.g. result.regions from difference).
---@return table  List of { ring = ring, holes = { ring, ... } }.
function editor_toolUtilities_polyBool.areas(regions) end

--- Boolean difference: subject minus clip. Works in a local frame like unionMany.
---Source: lua/ge/extensions/editor/toolUtilities/polyBool.lua:774
---@param subject table Polygon, ring or list of rings to subtract from.
---@param clip table Polygon, ring or list of rings to subtract.
---@return table  Result polygon { regions, inverted }.
function editor_toolUtilities_polyBool.difference(subject, clip) end

--- Merges several polygons into one. Returns an empty polygon if the list is empty.
---Source: lua/ge/extensions/editor/toolUtilities/polyBool.lua:744
---@param polys table List of polygons { regions = {ring,...}, inverted = bool }.
---@return table  Result polygon { regions, inverted } in world coordinates.
function editor_toolUtilities_polyBool.unionMany(polys) end

