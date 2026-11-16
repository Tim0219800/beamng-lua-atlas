---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/fitPoly.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utility that orders an unordered set of objects into a polyline. For each possible starting point, it builds a greedy path (nearest point, bonus if the direction continues), then keeps the path with the best score (direction smoothing, short length). Useful for editor tools that receive selected objects without order.
--- Access: extension `editor_toolUtilities_fitPoly`: `extensions.load("editor_toolUtilities_fitPoly")`, then the global `editor_toolUtilities_fitPoly`
---@class editor_toolUtilities_fitPoly
editor_toolUtilities_fitPoly = {}

--- Reorders the components to form the best polyline. Each component must have an obj field with getPosition(). Returns components as is if there are fewer than two.
---Source: lua/ge/extensions/editor/toolUtilities/fitPoly.lua:118
---@param components table[] List of tables { obj = object with getPosition() }.
---@return table[]  New list of the same components, in polyline order.
function editor_toolUtilities_fitPoly.fitPoly(components) end

