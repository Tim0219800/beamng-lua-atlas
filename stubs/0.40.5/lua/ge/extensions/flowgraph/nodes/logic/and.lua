---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/and.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_logic_and_C
local flowgraph_nodes_logic_and_C = {}

--- Reads count back (2 by default) and recreates the corresponding pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/and.lua:84
---@param res any
function flowgraph_nodes_logic_and_C:_onDeserialized(res) end

--- Saves count in the serialized data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/and.lua:80
---@param res any
function flowgraph_nodes_logic_and_C:_onSerialize(res) end

--- Editor properties panel: integer field 'Count' that changes the number of input pins (minimum 1). Returns the reason for the change.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/and.lua:33
function flowgraph_nodes_logic_and_C:drawCustomProperties() end

--- Initializes the input counter to 2.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/and.lua:30
function flowgraph_nodes_logic_and_C:init() end

--- Adds or deletes the flow_i input pins to go from old to new; also deletes the links that pointed to the removed pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/and.lua:50
---@param old integer old number of inputs
---@param new integer new number of inputs
function flowgraph_nodes_logic_and_C:updatePins(old, new) end

--- Sets the flow output to true only if all flow_1..flow_count inputs are true, otherwise false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/and.lua:71
function flowgraph_nodes_logic_and_C:work() end

