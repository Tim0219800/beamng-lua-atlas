---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C
local flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C = {}

--- Sets self.done back to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua:133
function flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C:_executionStarted() end

--- Restores the node's own settings from the saved data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua:222
---@param data table saved node data
function flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C:_onDeserialized(data) end

--- Adds the node's own settings to the `res` table when saving the graph.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua:212
---@param res table serialization table to fill
function flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C:_onSerialize(res) end

--- Builds a 'custom' type group from the model_i / config_i pins.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua:137
function flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C:buildGroup() end

--- Draws the node's custom properties in the flowgraph editor panel (ImGui).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua:34
function flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C:drawCustomProperties() end

--- Builds a 'generator' type group from the chosen parameters (20 vehicles via core_multiSpawn.createGroup or copy from settings/world).
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua:149
function flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C:generateGroup() end

--- Initializes the node's internal state at creation (called by the flowgraph engine).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua:24
function flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C:init() end

--- Sets self.done back to false.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua:105
function flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C:onStateStarted() end

--- Resets the Parameters mode parameters to their default values.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua:30
function flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C:resetParams() end

--- Adds or removes the model_i / config_i pin pairs (Custom mode).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua:109
---@param old integer old number of pins
---@param new integer new number of pins
function flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C:updatePins(old, new) end

--- Once per run: generates the group (generateGroup or buildGroup) and publishes it on group.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua:192
function flowgraph_nodes_gameplay_traffic_trafficCustomGroup_C:work() end

