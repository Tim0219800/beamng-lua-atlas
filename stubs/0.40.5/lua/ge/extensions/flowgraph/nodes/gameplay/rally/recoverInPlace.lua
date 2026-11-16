---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverInPlace.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_rally_recoverInPlace_C
local flowgraph_nodes_gameplay_rally_recoverInPlace_C = {}

--- Calls onNodeReset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverInPlace.lua:43
function flowgraph_nodes_gameplay_rally_recoverInPlace_C:_executionStarted() end

--- Calls onNodeReset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverInPlace.lua:47
function flowgraph_nodes_gameplay_rally_recoverInPlace_C:_executionStopped() end

--- Calls onNodeReset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverInPlace.lua:39
function flowgraph_nodes_gameplay_rally_recoverInPlace_C:init() end

--- Clears the pending recovery and the fuel snapshot.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverInPlace.lua:51
function flowgraph_nodes_gameplay_rally_recoverInPlace_C:onNodeReset() end

--- Executes the pending recovery: teleports the vehicle, reapplies the fuel, emits the hooks.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverInPlace.lua:56
function flowgraph_nodes_gameplay_rally_recoverInPlace_C:runRecovery() end

--- Prepares the recovery (current position/rotation, repair choice); first requests the fuel snapshot if repairing, then launches runRecovery.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverInPlace.lua:85
function flowgraph_nodes_gameplay_rally_recoverInPlace_C:startRecovery() end

--- If flow is active, calls startRecovery.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverInPlace.lua:125
function flowgraph_nodes_gameplay_rally_recoverInPlace_C:work() end

