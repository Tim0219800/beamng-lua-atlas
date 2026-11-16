---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/getMapObjectsDynField.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_util_getMapObjectsDynField_C
local flowgraph_nodes_util_getMapObjectsDynField_C = {}

--- Sets oldPos to nil (field unused afterwards).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/getMapObjectsDynField.lua:24
function flowgraph_nodes_util_getMapObjectsDynField_C:_executionStarted() end

--- Iterates over map.objects, reads object:getDynamicFields() and returns the ids for which a name matches.
---Source: lua/ge/extensions/flowgraph/nodes/util/getMapObjectsDynField.lua:28
---@param dynamicFieldName string Name of the dynamic field searched.
function flowgraph_nodes_util_getMapObjectsDynField_C:findObjectsWithDynField(dynamicFieldName) end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/getMapObjectsDynField.lua:20
---@param mgr any
function flowgraph_nodes_util_getMapObjectsDynField_C:init(mgr) end

--- If the name is provided, recomputes the list every frame and writes it to objects.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/getMapObjectsDynField.lua:41
function flowgraph_nodes_util_getMapObjectsDynField_C:work() end

