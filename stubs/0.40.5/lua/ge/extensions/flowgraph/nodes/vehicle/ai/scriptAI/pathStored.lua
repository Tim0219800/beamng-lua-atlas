---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathStored.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_vehicle_ai_scriptAI_pathStored_C
local flowgraph_nodes_vehicle_ai_scriptAI_pathStored_C = {}

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathStored.lua:26
function flowgraph_nodes_vehicle_ai_scriptAI_pathStored_C:_executionStopped() end

--- Restores aiPath (empty by default).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathStored.lua:94
---@param nodeData any
function flowgraph_nodes_vehicle_ai_scriptAI_pathStored_C:_onDeserialized(nodeData) end

--- Saves aiPath in the project.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathStored.lua:90
---@param res any
function flowgraph_nodes_vehicle_ai_scriptAI_pathStored_C:_onSerialize(res) end

--- Displays the number of elements, the debug path, the button to open ScriptAIManager, the recording selector and the load button.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathStored.lua:50
function flowgraph_nodes_vehicle_ai_scriptAI_pathStored_C:drawCustomProperties() end

--- Draws the stored path with debugDrawer:drawSquarePrism for the points close to the camera (100 to 200 m).
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathStored.lua:33
function flowgraph_nodes_vehicle_ai_scriptAI_pathStored_C:drawDebugPath() end

--- Displays the number of elements of the path.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathStored.lua:85
---@param builder table Node constructor.
---@param style table Node style.
function flowgraph_nodes_vehicle_ai_scriptAI_pathStored_C:drawMiddle(builder, style) end

--- Initializes an empty path and the identifier "Select...".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathStored.lua:21
function flowgraph_nodes_vehicle_ai_scriptAI_pathStored_C:init() end

--- Publishes {path = self.aiPath} on the path output.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathStored.lua:81
function flowgraph_nodes_vehicle_ai_scriptAI_pathStored_C:work() end

