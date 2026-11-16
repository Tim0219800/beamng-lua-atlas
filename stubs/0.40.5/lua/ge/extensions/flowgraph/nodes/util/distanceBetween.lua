---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/distanceBetween.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_util_distanceBetween_C
local flowgraph_nodes_util_distanceBetween_C = {}

--- Returns a position: for a number, the vehicle's position (getObjectByID) or a zero vec3 if not found; for a table, a converted vec3; nil if the input is empty.
---Source: lua/ge/extensions/flowgraph/nodes/util/distanceBetween.lua:36
---@param pinInput number|table|nil Vehicle id or position.
function flowgraph_nodes_util_distanceBetween_C:getPosition(pinInput) end

--- Resolves the two positions via getPosition and writes the distance to the distance pin.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/distanceBetween.lua:24
function flowgraph_nodes_util_distanceBetween_C:work() end

