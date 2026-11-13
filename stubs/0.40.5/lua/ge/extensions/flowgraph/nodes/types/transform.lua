---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/types/transform.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/nodes/types/transform.lua
---@class flowgraph_nodes_types_transform_C
local flowgraph_nodes_types_transform_C = {}

---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:317
function flowgraph_nodes_types_transform_C:_executionStarted() end

---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:341
function flowgraph_nodes_types_transform_C:_executionStopped() end

---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:459
---@param nodeData any
function flowgraph_nodes_types_transform_C:_onDeserialized(nodeData) end

---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:448
---@param res any
function flowgraph_nodes_types_transform_C:_onSerialize(res) end

---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:392
---@param corner any
---@param x any
---@param y any
---@param z any
---@param clr any
function flowgraph_nodes_types_transform_C:drawAxisBox(corner, x, y, z, clr) end

---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:166
function flowgraph_nodes_types_transform_C:drawCustom() end

---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:123
function flowgraph_nodes_types_transform_C:drawCustomProperties() end

---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:346
---@param builder any
---@param style any
function flowgraph_nodes_types_transform_C:drawMiddle(builder, style) end

---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:42
function flowgraph_nodes_types_transform_C:gizmoBeginDrag() end

---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:48
function flowgraph_nodes_types_transform_C:gizmoDragging() end

---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:79
function flowgraph_nodes_types_transform_C:gizmoEndDrag() end

--- called when the properties are no longer shown
---  "destroying" the gizmo
---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:113
function flowgraph_nodes_types_transform_C:hideProperties() end

---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:24
function flowgraph_nodes_types_transform_C:init() end

--- called when the properties are shown
---  setting up the gizmo here
---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:85
function flowgraph_nodes_types_transform_C:showProperties() end

---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:153
function flowgraph_nodes_types_transform_C:updateTransform() end

---Source : lua/ge/extensions/flowgraph/nodes/types/transform.lua:321
function flowgraph_nodes_types_transform_C:work() end

