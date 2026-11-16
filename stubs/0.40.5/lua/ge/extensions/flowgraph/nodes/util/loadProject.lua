---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/loadProject.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_util_loadProject_C
local flowgraph_nodes_util_loadProject_C = {}

--- Stops the target (setRunning(false)) and removes it on the next frame via core_flowgraphManager.removeNextFrame if destroyTargetOnStop.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/loadProject.lua:32
function flowgraph_nodes_util_loadProject_C:_executionStopped() end

--- Enables destroyTargetOnStop and clears the target.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/loadProject.lua:21
---@param mgr any
---@param ... any
function flowgraph_nodes_util_loadProject_C:init(mgr, ...) end

--- Restricts the file picker of the filepath pin to .flow.json files.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/loadProject.lua:25
function flowgraph_nodes_util_loadProject_C:postInit() end

--- Resolves the path (tries the raw name, +.flow.json, flowgraphEditor/<name>.flow.json), loads the manager (core_flowgraphManager.loadManager) then starts it right away or on the next frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/loadProject.lua:41
function flowgraph_nodes_util_loadProject_C:workOnce() end

