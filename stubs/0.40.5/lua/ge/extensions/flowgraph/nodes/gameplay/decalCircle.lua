---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/decalCircle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_decalCircle_C
local flowgraph_nodes_gameplay_decalCircle_C = {}

--- Resets the decal pool and the color caches.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/decalCircle.lua:59
function flowgraph_nodes_gameplay_decalCircle_C:_executionStarted() end

--- Sets data.snapToTerrain = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/decalCircle.lua:41
function flowgraph_nodes_gameplay_decalCircle_C:init() end

--- Updates the color caches, computes the position, direction, color and scale of each decal on the circle and submits them to the renderer.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/decalCircle.lua:74
function flowgraph_nodes_gameplay_decalCircle_C:work() end

