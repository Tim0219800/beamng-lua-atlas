---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/decalPath.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_decalPath_C
local flowgraph_nodes_gameplay_decalPath_C = {}

--- Resets the decal pool.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/decalPath.lua:44
function flowgraph_nodes_gameplay_decalPath_C:_executionStarted() end

--- Creates a decal (texture arrow_groundmarkers_1, scale 8x12x4, fade 400 to 500).
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/decalPath.lua:30
---@return table  Decal ready to be filled
function flowgraph_nodes_gameplay_decalPath_C:getNewDecal() end

--- Grows the decal pool up to max.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/decalPath.lua:49
---@param max integer Minimum number of decals
function flowgraph_nodes_gameplay_decalPath_C:increaseDecalPool(max) end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/decalPath.lua:27
function flowgraph_nodes_gameplay_decalPath_C:init() end

--- Computes the route, positions the spaced markers along the path and submits them to Engine.Render.DynamicDecalMgr.addDecals.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/decalPath.lua:58
function flowgraph_nodes_gameplay_decalPath_C:work() end

