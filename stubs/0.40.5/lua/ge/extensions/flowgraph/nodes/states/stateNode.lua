---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/states/stateNode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/nodes/states/stateNode.lua
---@class flowgraph_nodes_states_stateNode_C
local flowgraph_nodes_states_stateNode_C = {}

---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:146
function flowgraph_nodes_states_stateNode_C:EndPin() end

--- Deserialize (loading) custo fields from data here.
---  self.data will be restored automatically.
---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:159
---@param data any
function flowgraph_nodes_states_stateNode_C:_onDeserialized(data) end

--- Serialize (saving) custom fields into res here.
---  You dont need to serialize fields in self.data
---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:151
---@param res any
function flowgraph_nodes_states_stateNode_C:_onSerialize(res) end

---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:185
function flowgraph_nodes_states_stateNode_C:_onSerializeState() end

---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:163
function flowgraph_nodes_states_stateNode_C:_postDeserialize() end

---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:113
function flowgraph_nodes_states_stateNode_C:doubleClicked() end

--- write custom imgui code here that gets displayed in the property window when the node is selected.
---  return a string so a history point will be created (redo/undo)
---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:64
function flowgraph_nodes_states_stateNode_C:drawCustomProperties() end

---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:121
---@param builder any
---@param style any
function flowgraph_nodes_states_stateNode_C:drawMiddle(builder, style) end

---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:104
function flowgraph_nodes_states_stateNode_C:getTransitionNames() end

--- This gets called when the node has been created for the first time. Init field here
---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:37
---@param mgr any
function flowgraph_nodes_states_stateNode_C:init(mgr) end

---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:176
---@param name any
function flowgraph_nodes_states_stateNode_C:onCustomNameChanged(name) end

---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:31
function flowgraph_nodes_states_stateNode_C:representsGraph() end

---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:57
---@param val any
function flowgraph_nodes_states_stateNode_C:setAutoStart(val) end

---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:43
---@param graph any
function flowgraph_nodes_states_stateNode_C:setTargetGraph(graph) end

