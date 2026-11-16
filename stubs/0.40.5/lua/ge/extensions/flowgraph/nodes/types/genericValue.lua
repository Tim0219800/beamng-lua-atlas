---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/types/genericValue.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_types_genericValue_C
local flowgraph_nodes_types_genericValue_C = {}

--- Restores getter/global and recreates the pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/genericValue.lua:57
---@param nodeData any saved data
function flowgraph_nodes_types_genericValue_C:_onDeserialized(nodeData) end

--- Saves the node's state in the given table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/genericValue.lua:52
---@param res any save table
function flowgraph_nodes_types_genericValue_C:_onSerialize(res) end

--- "Use Project as Source" and "Is Getter" checkboxes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/genericValue.lua:82
function flowgraph_nodes_types_genericValue_C:drawCustomProperties() end

--- getter = true, global = true and getter pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/genericValue.lua:24
function flowgraph_nodes_types_genericValue_C:init() end

--- Switches to "Generic Getter" mode: output pin val.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/genericValue.lua:67
function flowgraph_nodes_types_genericValue_C:setupGetPins() end

--- Switches to "Generic Setter" mode: input pin val.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/genericValue.lua:74
function flowgraph_nodes_types_genericValue_C:setupSetPins() end

--- Chooses the variables table, builds the name, then reads (target:get) or writes (target:change) the variable.
---Source: lua/ge/extensions/flowgraph/nodes/types/genericValue.lua:30
function flowgraph_nodes_types_genericValue_C:work() end

