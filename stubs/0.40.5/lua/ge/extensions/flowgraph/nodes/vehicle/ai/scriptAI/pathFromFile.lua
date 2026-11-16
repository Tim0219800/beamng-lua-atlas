---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathFromFile.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_vehicle_ai_scriptAI_pathFromFile_C
local flowgraph_nodes_vehicle_ai_scriptAI_pathFromFile_C = {}

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathFromFile.lua:30
function flowgraph_nodes_vehicle_ai_scriptAI_pathFromFile_C:_executionStopped() end

--- Restores the file name and recomputes the short name.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathFromFile.lua:72
---@param nodeData any
function flowgraph_nodes_vehicle_ai_scriptAI_pathFromFile_C:_onDeserialized(nodeData) end

--- Saves the file name.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathFromFile.lua:68
---@param res any
function flowgraph_nodes_vehicle_ai_scriptAI_pathFromFile_C:_onSerialize(res) end

--- Draws the "Refresh Files" button and the dropdown list of track files.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathFromFile.lua:33
function flowgraph_nodes_vehicle_ai_scriptAI_pathFromFile_C:drawCustomProperties() end

--- Displays the short file name and its loading state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathFromFile.lua:62
---@param builder table Node constructor.
---@param style table Node style.
function flowgraph_nodes_vehicle_ai_scriptAI_pathFromFile_C:drawMiddle(builder, style) end

--- Lists the track files (FS:findFiles) and initializes the name and loaded file.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathFromFile.lua:23
function flowgraph_nodes_vehicle_ai_scriptAI_pathFromFile_C:init() end

--- Loads the file with jsonReadFile if it is not loaded yet and publishes loadedFile.recording on path.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathFromFile.lua:54
function flowgraph_nodes_vehicle_ai_scriptAI_pathFromFile_C:work() end

