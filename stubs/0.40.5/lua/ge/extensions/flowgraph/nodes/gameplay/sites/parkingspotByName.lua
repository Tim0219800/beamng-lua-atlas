---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/sites/parkingspotByName.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_sites_parkingspotByName_C
local flowgraph_nodes_gameplay_sites_parkingspotByName_C = {}

--- Called when the flowgraph project execution starts; resets the node's internal state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/parkingspotByName.lua:45
function flowgraph_nodes_gameplay_sites_parkingspotByName_C:_executionStarted() end

--- Draws the node's custom properties in the flowgraph editor panel (ImGui).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/parkingspotByName.lua:27
function flowgraph_nodes_gameplay_sites_parkingspotByName_C:drawCustomProperties() end

--- Draws the central content of the node in the flowgraph editor (ImGui).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/parkingspotByName.lua:66
---@param builder table editor node constructor (builder:Middle())
---@param style table node drawing style
function flowgraph_nodes_gameplay_sites_parkingspotByName_C:drawMiddle(builder, style) end

--- Initializes the node's internal state at creation (called by the flowgraph engine).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/parkingspotByName.lua:23
---@param mgr table flowgraph manager
---@param ... any
function flowgraph_nodes_gameplay_sites_parkingspotByName_C:init(mgr, ...) end

--- Looks up the spot by name, publishes spot and activates flow/exists if it exists and is not missing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/parkingspotByName.lua:49
---@param args table arguments passed by the engine (unused)
function flowgraph_nodes_gameplay_sites_parkingspotByName_C:work(args) end

