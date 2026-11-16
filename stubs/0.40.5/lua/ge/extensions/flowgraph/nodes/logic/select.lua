---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/select.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_logic_select_C
local flowgraph_nodes_logic_select_C = {}

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/select.lua:38
function flowgraph_nodes_logic_select_C:_executionStarted() end

--- Reads back mode ('first' by default) and count, recreates the pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/select.lua:128
---@param res any
function flowgraph_nodes_logic_select_C:_onDeserialized(res) end

--- Saves mode and count.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/select.lua:123
---@param res any
function flowgraph_nodes_logic_select_C:_onSerialize(res) end

--- Panel: number of choices (Count) and dropdown of merge functions (excluding 'readOnly') with tooltip.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/select.lua:42
function flowgraph_nodes_logic_select_C:drawCustomProperties() end

--- Displays the merge mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/select.lua:32
---@param builder any
---@param style any
function flowgraph_nodes_logic_select_C:drawMiddle(builder, style) end

--- count=1, mode='first'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/select.lua:27
function flowgraph_nodes_logic_select_C:init() end

--- Creates or deletes the select_i / value_i pin pairs and the associated links.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/select.lua:74
---@param old integer old count
---@param new integer new count
function flowgraph_nodes_logic_select_C:updatePins(old, new) end

--- Initializes the merge, merges the value_i whose select_i is active (if flow), finalizes. If at least one choice: flow=true and value=result; otherwise flow follows the input and value=nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/select.lua:100
function flowgraph_nodes_logic_select_C:work() end

