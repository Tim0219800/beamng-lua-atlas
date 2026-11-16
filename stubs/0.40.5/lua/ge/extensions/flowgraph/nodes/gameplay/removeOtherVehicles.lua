---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/removeOtherVehicles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_removeOtherVehicles_C
local flowgraph_nodes_gameplay_removeOtherVehicles_C = {}

--- Restores the node's own settings from the saved data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/removeOtherVehicles.lua:133
---@param data table saved node data
function flowgraph_nodes_gameplay_removeOtherVehicles_C:_onDeserialized(data) end

--- Adds the node's own settings to the `res` table when saving the graph.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/removeOtherVehicles.lua:127
---@param res table serialization table to fill
function flowgraph_nodes_gameplay_removeOtherVehicles_C:_onSerialize(res) end

--- Draws the node's custom properties in the flowgraph editor panel (ImGui).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/removeOtherVehicles.lua:27
function flowgraph_nodes_gameplay_removeOtherVehicles_C:drawCustomProperties() end

--- Initializes the node's internal state at creation (called by the flowgraph engine).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/removeOtherVehicles.lua:21
function flowgraph_nodes_gameplay_removeOtherVehicles_C:init() end

--- Adds or removes idToIgnore_i input pins to go from old to new; deletes the links of removed pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/removeOtherVehicles.lua:62
---@param old integer old number of pins
---@param new integer new number of pins
function flowgraph_nodes_gameplay_removeOtherVehicles_C:updatePins(old, new) end

--- Executed only once (once_* category) when the node is triggered: reads the input pins and applies the effect.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/removeOtherVehicles.lua:81
function flowgraph_nodes_gameplay_removeOtherVehicles_C:workOnce() end

