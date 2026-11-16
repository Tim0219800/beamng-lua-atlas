---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/listDescription.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_listDescription_C
local flowgraph_nodes_ui_listDescription_C = {}

--- Restores count.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/listDescription.lua:69
---@param res table Node save table to fill.
function flowgraph_nodes_ui_listDescription_C:_onDeserialized(res) end

--- Saves count.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/listDescription.lua:65
---@param res table Node save table to fill.
function flowgraph_nodes_ui_listDescription_C:_onSerialize(res) end

--- "List Item Count" field.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/listDescription.lua:29
function flowgraph_nodes_ui_listDescription_C:drawCustomProperties() end

--- count = 1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/listDescription.lua:21
function flowgraph_nodes_ui_listDescription_C:init() end

--- Creates the initial pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/listDescription.lua:25
function flowgraph_nodes_ui_listDescription_C:postInit() end

--- Adjusts the number of item_i pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/listDescription.lua:47
---@param old integer Old number of elements.
---@param new integer New number of elements.
function flowgraph_nodes_ui_listDescription_C:updatePins(old, new) end

--- Translates each element (core_locales.translateWithOrWithoutContext), builds the list and writes it to "value".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/listDescription.lua:74
function flowgraph_nodes_ui_listDescription_C:work() end

