---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/groundmarkers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_groundmarkers_C
local flowgraph_nodes_gameplay_groundmarkers_C = {}

--- Forgets the last target.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/groundmarkers.lua:134
function flowgraph_nodes_gameplay_groundmarkers_C:_executionStarted() end

--- Calls core_groundMarkers.resetAll().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/groundmarkers.lua:128
function flowgraph_nodes_gameplay_groundmarkers_C:_executionStopped() end

--- Compares the pin target to the previous one (types, length, numeric values with the threshold threshold, strings).
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/groundmarkers.lua:47
---@return boolean  true if the target has changed
function flowgraph_nodes_gameplay_groundmarkers_C:hasNewTarget() end

--- Sets data.fadeStart and data.fadeEnd.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/groundmarkers.lua:34
---@param mgr table Flowgraph manager
---@param ... any
function flowgraph_nodes_gameplay_groundmarkers_C:init(mgr, ...) end

--- Handles clear (resetAll) then, if flow and target are present and the target has changed, calls core_groundMarkers.setPath(target, options).
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/groundmarkers.lua:98
---@param args table Flowgraph arguments
function flowgraph_nodes_gameplay_groundmarkers_C:work(args) end

