---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/aiParams.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_vehicle_ai_aiParams_C
local flowgraph_nodes_vehicle_ai_aiParams_C = {}

--- Configures the risk slider (0.1 to 2.0) and the templates of the routeMode pin (off, set, limit).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/aiParams.lua:33
function flowgraph_nodes_vehicle_ai_aiParams_C:postInit() end

--- Finds the vehicle (getObjectByID or getPlayerVehicle(0)) and sends the ai.* commands matching the filled pins every frame; handles nitro activation/deactivation (toggles the nitrousOxideInjection controller only if its armed state differs).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/aiParams.lua:48
function flowgraph_nodes_vehicle_ai_aiParams_C:work() end

