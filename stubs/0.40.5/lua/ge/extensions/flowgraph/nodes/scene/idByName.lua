---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/idByName.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_scene_idByName_C
local flowgraph_nodes_scene_idByName_C = {}

--- Forgets the remembered id when the graph starts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/idByName.lua:56
function flowgraph_nodes_scene_idByName_C:_executionStarted() end

--- Displays the current name and id in the middle of the node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/idByName.lua:60
---@param builder any imgui node builder
---@param style any node style
function flowgraph_nodes_scene_idByName_C:drawMiddle(builder, style) end

--- Empty name and objID nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/idByName.lua:24
function flowgraph_nodes_scene_idByName_C:init() end

--- End-of-mission hook: forgets the remembered id.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/idByName.lua:48
function flowgraph_nodes_scene_idByName_C:onClientEndMission() end

--- Start-of-mission hook: forgets the remembered id.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/idByName.lua:52
function flowgraph_nodes_scene_idByName_C:onClientStartMission() end

--- Uses the name pin if it is connected, looks up the object and writes objID and exist.
---Source: lua/ge/extensions/flowgraph/nodes/scene/idByName.lua:29
function flowgraph_nodes_scene_idByName_C:work() end

