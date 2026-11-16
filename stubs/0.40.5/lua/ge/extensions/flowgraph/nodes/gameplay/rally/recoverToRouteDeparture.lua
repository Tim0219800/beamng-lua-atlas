---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverToRouteDeparture.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_rally_recoverToRouteDeparture_C
local flowgraph_nodes_gameplay_rally_recoverToRouteDeparture_C = {}

--- Calls onNodeReset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverToRouteDeparture.lua:44
function flowgraph_nodes_gameplay_rally_recoverToRouteDeparture_C:_executionStarted() end

--- Calls onNodeReset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverToRouteDeparture.lua:48
function flowgraph_nodes_gameplay_rally_recoverToRouteDeparture_C:_executionStopped() end

--- Calls onNodeReset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverToRouteDeparture.lua:40
function flowgraph_nodes_gameplay_rally_recoverToRouteDeparture_C:init() end

--- Clears the pending recovery and the fuel snapshot.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverToRouteDeparture.lua:52
function flowgraph_nodes_gameplay_rally_recoverToRouteDeparture_C:onNodeReset() end

--- Calls rm:recoverVehicleToRouteDeparture then reapplies the fuel if repaired.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverToRouteDeparture.lua:57
function flowgraph_nodes_gameplay_rally_recoverToRouteDeparture_C:runRecovery() end

--- Prepares the pending recovery (vehicle, repair, backoffDistance) and launches it, after the fuel snapshot if needed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverToRouteDeparture.lua:91
function flowgraph_nodes_gameplay_rally_recoverToRouteDeparture_C:startRecovery() end

--- If flow is active, calls startRecovery.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverToRouteDeparture.lua:136
function flowgraph_nodes_gameplay_rally_recoverToRouteDeparture_C:work() end

