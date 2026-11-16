---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/sites/location.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_sites_location_C
local flowgraph_nodes_gameplay_sites_location_C = {}

--- Called when the flowgraph project execution starts; resets the node's internal state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/location.lua:118
function flowgraph_nodes_gameplay_sites_location_C:_executionStarted() end

--- Restores the node's own settings from the saved data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/location.lua:156
---@param nodeData table saved node data
function flowgraph_nodes_gameplay_sites_location_C:_onDeserialized(nodeData) end

--- Adds the node's own settings to the `res` table when saving the graph.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/location.lua:152
---@param res table serialization table to fill
function flowgraph_nodes_gameplay_sites_location_C:_onSerialize(res) end

--- Draws the node's custom properties in the flowgraph editor panel (ImGui).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/location.lua:69
function flowgraph_nodes_gameplay_sites_location_C:drawCustomProperties() end

--- Initializes the node's internal state at creation (called by the flowgraph engine).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/location.lua:30
---@param mgr table flowgraph manager
---@param ... any
function flowgraph_nodes_gameplay_sites_location_C:init(mgr, ...) end

--- Called after the node's pins are created; used to adjust the pins (value templates, file filters, dynamic keys).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/location.lua:34
function flowgraph_nodes_gameplay_sites_location_C:postInit() end

--- Rebuilds the dynamic output pins from the node's options list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/location.lua:38
function flowgraph_nodes_gameplay_sites_location_C:updateKeys() end

--- When the input location changes, fills the outputs (name, position, road info via findClosestRoadInfo, custom fields).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/location.lua:122
---@param args table arguments passed by the engine (unused)
function flowgraph_nodes_gameplay_sites_location_C:work(args) end

