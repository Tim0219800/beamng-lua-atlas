---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controller.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_traffic_signals_controller_C
local flowgraph_nodes_gameplay_traffic_signals_controller_C = {}

--- Restores the node's own settings from the saved data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controller.lua:74
---@param res table serialization table to fill
function flowgraph_nodes_gameplay_traffic_signals_controller_C:_onDeserialized(res) end

--- Adds the node's own settings to the `res` table when saving the graph.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controller.lua:70
---@param res table serialization table to fill
function flowgraph_nodes_gameplay_traffic_signals_controller_C:_onSerialize(res) end

--- Draws the node's custom properties in the flowgraph editor panel (ImGui).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controller.lua:32
function flowgraph_nodes_gameplay_traffic_signals_controller_C:drawCustomProperties() end

--- Initializes the node's internal state at creation (called by the flowgraph engine).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controller.lua:24
function flowgraph_nodes_gameplay_traffic_signals_controller_C:init() end

--- Called after the node's pins are created; used to adjust the pins (value templates, file filters, dynamic keys).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controller.lua:28
function flowgraph_nodes_gameplay_traffic_signals_controller_C:postInit() end

--- Adds or removes the stateName_i / stateDuration_i pins and deletes their links.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controller.lua:50
---@param old integer old number of pins
---@param new integer new number of pins
function flowgraph_nodes_gameplay_traffic_signals_controller_C:updatePins(old, new) end

--- Copies type, state count, total duration and the name/duration of each state to the outputs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controller.lua:79
---@param args table arguments passed by the engine (unused)
function flowgraph_nodes_gameplay_traffic_signals_controller_C:work(args) end

