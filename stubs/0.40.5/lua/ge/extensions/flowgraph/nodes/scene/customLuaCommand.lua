---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/customLuaCommand.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_scene_customLuaCommand_C
local flowgraph_nodes_scene_customLuaCommand_C = {}

--- Resets the return pin to nil when the graph starts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/customLuaCommand.lua:25
function flowgraph_nodes_scene_customLuaCommand_C:_executionStarted() end

--- Compatibility: converts the old data.func into the hard-coded string pin 'func'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/customLuaCommand.lua:38
---@param data any saved node data
function flowgraph_nodes_scene_customLuaCommand_C:_onDeserialized(data) end

--- Disables clearing the output pins at start (clearOutPinsOnStart = false).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/customLuaCommand.lua:21
function flowgraph_nodes_scene_customLuaCommand_C:init() end

--- Compiles and runs the text of the func pin; writes flow = pcall success and return = returned value.
---Source: lua/ge/extensions/flowgraph/nodes/scene/customLuaCommand.lua:29
function flowgraph_nodes_scene_customLuaCommand_C:workOnce() end

