---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/template.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/nodes/util/template.lua
---@class flowgraph_nodes_util_template_C
local flowgraph_nodes_util_template_C = {}

--- gets called when the project of this node starts execution (before any work)
---Source : lua/ge/extensions/flowgraph/nodes/util/template.lua:121
function flowgraph_nodes_util_template_C:_executionStarted() end

--- gets called when the project of this node stops execution.
---Source : lua/ge/extensions/flowgraph/nodes/util/template.lua:130
function flowgraph_nodes_util_template_C:_executionStopped() end

--- gets called when the node needs to be cleared. usually before serialization, before starting etc. by default, calls the _executionStopped function.
---Source : lua/ge/extensions/flowgraph/nodes/util/template.lua:135
function flowgraph_nodes_util_template_C:_onClear() end

--- Deserialize (loading) custo fields from data here.
---  self.data will be restored automatically.
---Source : lua/ge/extensions/flowgraph/nodes/util/template.lua:189
---@param data any
function flowgraph_nodes_util_template_C:_onDeserialized(data) end

--- Serialize (saving) custom fields into res here.
---  You dont need to serialize fields in self.data
---Source : lua/ge/extensions/flowgraph/nodes/util/template.lua:182
---@param res any
function flowgraph_nodes_util_template_C:_onSerialize(res) end

--- This gets called when the node has been deleted.
---Source : lua/ge/extensions/flowgraph/nodes/util/template.lua:195
function flowgraph_nodes_util_template_C:destroy() end

---Source : lua/ge/extensions/flowgraph/nodes/util/template.lua:148
function flowgraph_nodes_util_template_C:drawCustomProperties() end

--- write custom imgui code here that gets displayed within the node.
---  always start with builder:Middle()
---Source : lua/ge/extensions/flowgraph/nodes/util/template.lua:166
---@param builder any
---@param style any
function flowgraph_nodes_util_template_C:drawMiddle(builder, style) end

--- called when the properties are no longer shown
---Source : lua/ge/extensions/flowgraph/nodes/util/template.lua:160
function flowgraph_nodes_util_template_C:hideProperties() end

--- This gets called when the node has been created for the first time. Init field here
---Source : lua/ge/extensions/flowgraph/nodes/util/template.lua:109
---@param mgr any
function flowgraph_nodes_util_template_C:init(mgr) end

--- called when the properties are shown
---Source : lua/ge/extensions/flowgraph/nodes/util/template.lua:141
function flowgraph_nodes_util_template_C:showProperties() end

--- This gets called when the node should execute it's actual function in the flowgraph.
---Source : lua/ge/extensions/flowgraph/nodes/util/template.lua:125
function flowgraph_nodes_util_template_C:work() end

