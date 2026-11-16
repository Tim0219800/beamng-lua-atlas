---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/stageRuntimeState.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_rally_stageRuntimeState_C
local flowgraph_nodes_gameplay_rally_stageRuntimeState_C = {}

--- Resets lastTime to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/stageRuntimeState.lua:28
function flowgraph_nodes_gameplay_rally_stageRuntimeState_C:_executionStarted() end

--- Initializes lastTime to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/stageRuntimeState.lua:24
function flowgraph_nodes_gameplay_rally_stageRuntimeState_C:init() end

--- Every frame: resets the outputs to zero then fills them from the rally manager.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/stageRuntimeState.lua:39
function flowgraph_nodes_gameplay_rally_stageRuntimeState_C:work() end

