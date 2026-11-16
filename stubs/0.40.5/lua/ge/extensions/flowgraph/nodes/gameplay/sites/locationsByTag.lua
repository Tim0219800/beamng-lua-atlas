---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationsByTag.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_sites_locationsByTag_C
local flowgraph_nodes_gameplay_sites_locationsByTag_C = {}

--- Restores the node's own settings from the saved data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationsByTag.lua:129
---@param res table serialization table to fill
function flowgraph_nodes_gameplay_sites_locationsByTag_C:_onDeserialized(res) end

--- Adds the node's own settings to the `res` table when saving the graph.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationsByTag.lua:125
---@param res table serialization table to fill
function flowgraph_nodes_gameplay_sites_locationsByTag_C:_onSerialize(res) end

--- Draws the node's custom properties in the flowgraph editor panel (ImGui).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationsByTag.lua:37
function flowgraph_nodes_gameplay_sites_locationsByTag_C:drawCustomProperties() end

--- Initializes the node's internal state at creation (called by the flowgraph engine).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationsByTag.lua:34
---@param mgr table flowgraph manager
---@param ... any
function flowgraph_nodes_gameplay_sites_locationsByTag_C:init(mgr, ...) end

--- Adds or removes the found_i / loc_i pin pairs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationsByTag.lua:53
---@param old integer old number of pins
---@param new integer new number of pins
function flowgraph_nodes_gameplay_sites_locationsByTag_C:updatePins(old, new) end

--- Builds the list of locations (by tag or by radius), shuffles it, keeps the first ones, sorts them by distance, then fills found_i, loc_i and count.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationsByTag.lua:77
function flowgraph_nodes_gameplay_sites_locationsByTag_C:workOnce() end

