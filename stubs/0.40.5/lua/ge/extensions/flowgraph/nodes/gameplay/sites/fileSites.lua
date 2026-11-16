---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/sites/fileSites.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_sites_fileSites_C
local flowgraph_nodes_gameplay_sites_fileSites_C = {}

--- Called when the flowgraph project execution stops; releases the internal state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/fileSites.lua:55
function flowgraph_nodes_gameplay_sites_fileSites_C:_executionStopped() end

--- Draws the node's custom properties in the flowgraph editor panel (ImGui).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/fileSites.lua:33
function flowgraph_nodes_gameplay_sites_fileSites_C:drawCustomProperties() end

--- Initializes the node's internal state at creation (called by the flowgraph engine).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/fileSites.lua:22
---@param mgr table flowgraph manager
---@param ... any
function flowgraph_nodes_gameplay_sites_fileSites_C:init(mgr, ...) end

--- Forgets the loaded sites to force a new load.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/fileSites.lua:51
function flowgraph_nodes_gameplay_sites_fileSites_C:onNodeReset() end

--- Called after the node's pins are created; used to adjust the pins (value templates, file filters, dynamic keys).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/fileSites.lua:27
function flowgraph_nodes_gameplay_sites_fileSites_C:postInit() end

--- On the first call, resolves the path (with or without .sites.json extension), loads and finalizes the sites, then publishes the table on sitesData. Subsequent calls do nothing as long as self.sites is set.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/fileSites.lua:59
---@param args table arguments passed by the engine (unused)
function flowgraph_nodes_gameplay_sites_fileSites_C:work(args) end

