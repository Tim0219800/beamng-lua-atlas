---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/goToEndLine.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_vehicle_ai_goToEndLine_C
local flowgraph_nodes_vehicle_ai_goToEndLine_C = {}

--- Calls onNodeReset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/goToEndLine.lua:39
function flowgraph_nodes_vehicle_ai_goToEndLine_C:_executionStopped() end

--- Returns the vehicle whose id is given as input, or the player's vehicle (getPlayerVehicle(0)) without input.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/goToEndLine.lua:43
function flowgraph_nodes_vehicle_ai_goToEndLine_C:getVeh() end

--- Enables autoDisableOnArrive and calls onNodeReset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/goToEndLine.lua:29
function flowgraph_nodes_vehicle_ai_goToEndLine_C:init() end

--- Resets complete and sentCommand to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/goToEndLine.lua:34
function flowgraph_nodes_vehicle_ai_goToEndLine_C:onNodeReset() end

--- Handles reset; if already arrived, activates flow. Otherwise computes the distance between the middle of the vehicle's front and endLinePosition, determines arrival (distance and speed) and disables the AI if autoDisableOnArrive; sends ai.setState manual once. Node error if no position is given.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/goToEndLine.lua:53
function flowgraph_nodes_vehicle_ai_goToEndLine_C:work() end

