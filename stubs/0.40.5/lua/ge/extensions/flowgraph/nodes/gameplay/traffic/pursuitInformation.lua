---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitInformation.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_traffic_pursuitInformation_C
local flowgraph_nodes_gameplay_traffic_pursuitInformation_C = {}

--- Calls reset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitInformation.lua:40
function flowgraph_nodes_gameplay_traffic_pursuitInformation_C:_executionStopped() end

--- Calls reset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitInformation.lua:36
function flowgraph_nodes_gameplay_traffic_pursuitInformation_C:init() end

--- Hook called by the police system; remembers 'arrest' or 'evade' if id matches the tracked vehicle.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitInformation.lua:79
---@param id any id of the vehicle concerned
---@param action any pursuit action ('arrest' or 'evade')
---@param data table data associated with the action
function flowgraph_nodes_gameplay_traffic_pursuitInformation_C:onPursuitAction(id, action, data) end

--- Resets the vehicle, the flow outputs and the flags.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitInformation.lua:44
function flowgraph_nodes_gameplay_traffic_pursuitInformation_C:reset() end

--- Reads the pursuit data and updates the outputs; emits arrest/evade for one frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitInformation.lua:53
function flowgraph_nodes_gameplay_traffic_pursuitInformation_C:work() end

