---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/sites/parkingspot.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_sites_parkingspot_C
local flowgraph_nodes_gameplay_sites_parkingspot_C = {}

--- Called when the flowgraph project execution starts; resets the node's internal state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/parkingspot.lua:106
function flowgraph_nodes_gameplay_sites_parkingspot_C:_executionStarted() end

--- Restores the node's own settings from the saved data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/parkingspot.lua:135
---@param nodeData table saved node data
function flowgraph_nodes_gameplay_sites_parkingspot_C:_onDeserialized(nodeData) end

--- Adds the node's own settings to the `res` table when saving the graph.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/parkingspot.lua:131
---@param res table serialization table to fill
function flowgraph_nodes_gameplay_sites_parkingspot_C:_onSerialize(res) end

--- Draws the node's custom properties in the flowgraph editor panel (ImGui).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/parkingspot.lua:66
function flowgraph_nodes_gameplay_sites_parkingspot_C:drawCustomProperties() end

--- Initializes the node's internal state at creation (called by the flowgraph engine).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/parkingspot.lua:27
---@param mgr table flowgraph manager
---@param ... any
function flowgraph_nodes_gameplay_sites_parkingspot_C:init(mgr, ...) end

--- Called after the node's pins are created; used to adjust the pins (value templates, file filters, dynamic keys).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/parkingspot.lua:32
function flowgraph_nodes_gameplay_sites_parkingspot_C:postInit() end

--- Rebuilds the dynamic output pins from the node's options list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/parkingspot.lua:36
function flowgraph_nodes_gameplay_sites_parkingspot_C:updateKeys() end

--- Copies the spot's name, position, rotation and scale to the outputs, applies fixedHeight if > 0 and reads the custom fields.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/parkingspot.lua:110
---@param args table arguments passed by the engine (unused)
function flowgraph_nodes_gameplay_sites_parkingspot_C:work(args) end

