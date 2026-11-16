---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopInit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_rally_loop_loopInit_C
local flowgraph_nodes_gameplay_rally_loop_loopInit_C = {}

--- Unloads the rally loop extension if loaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopInit.lua:30
function flowgraph_nodes_gameplay_rally_loop_loopInit_C:_executionStopped() end

--- Loads the rally loop extension if it is not loaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopInit.lua:45
function flowgraph_nodes_gameplay_rally_loop_loopInit_C:loadExt() end

--- Unloads the rally loop extension if it is loaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopInit.lua:38
function flowgraph_nodes_gameplay_rally_loop_loopInit_C:unloadExt() end

--- Reloads the extension, detects the mission, configures the environment and launches gameplay_rallyLoop.setup; sets success or failed to true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopInit.lua:52
function flowgraph_nodes_gameplay_rally_loop_loopInit_C:workOnce() end

