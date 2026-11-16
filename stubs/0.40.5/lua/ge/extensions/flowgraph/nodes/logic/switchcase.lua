---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/switchcase.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_logic_switchcase_C
local flowgraph_nodes_logic_switchcase_C = {}

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/switchcase.lua:36
function flowgraph_nodes_logic_switchcase_C:_executionStarted() end

--- Reads back count (1 by default) and recreates the pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/switchcase.lua:100
---@param res any
function flowgraph_nodes_logic_switchcase_C:_onDeserialized(res) end

--- Saves count.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/switchcase.lua:96
---@param res any
function flowgraph_nodes_logic_switchcase_C:_onSerialize(res) end

--- Panel: number of cases (Count).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/switchcase.lua:40
function flowgraph_nodes_logic_switchcase_C:drawCustomProperties() end

--- Draws the middle of the node (empty).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/switchcase.lua:31
---@param builder any
---@param style any
function flowgraph_nodes_logic_switchcase_C:drawMiddle(builder, style) end

--- count=1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/switchcase.lua:26
function flowgraph_nodes_logic_switchcase_C:init() end

--- Creates or deletes the value_i and match_i pins and the associated links.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/switchcase.lua:57
---@param old integer old count
---@param new integer new count
function flowgraph_nodes_logic_switchcase_C:updatePins(old, new) end

--- flow=true; for each i, match_i = (value_i == value); none = no match.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/switchcase.lua:82
function flowgraph_nodes_logic_switchcase_C:work() end

