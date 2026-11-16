---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/disable.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_vehicle_ai_disable_C
local flowgraph_nodes_vehicle_ai_disable_C = {}

--- Initializes the node's three data fields to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/disable.lua:20
function flowgraph_nodes_vehicle_ai_disable_C:init() end

--- Sends ai:scriptStop(handBrake, straightenWheels) to the vehicle if useScriptStop, otherwise ai.setState({mode = "disabled"}).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/disable.lua:26
function flowgraph_nodes_vehicle_ai_disable_C:work() end

