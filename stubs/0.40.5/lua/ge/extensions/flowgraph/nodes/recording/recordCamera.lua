---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/recording/recordCamera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_recording_recordCamera_C
local flowgraph_nodes_recording_recordCamera_C = {}

--- Resets to the inactive state, empties the path and stores the start time.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/recording/recordCamera.lua:30
function flowgraph_nodes_recording_recordCamera_C:_executionStarted() end

--- Displays the state and the number of keys.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/recording/recordCamera.lua:88
---@param builder any
---@param style any
function flowgraph_nodes_recording_recordCamera_C:drawMiddle(builder, style) end

--- Creates the SimPath and the Markers (maker_N) from the recorded path, sets timeToNext and writes filename.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/recording/recordCamera.lua:36
function flowgraph_nodes_recording_recordCamera_C:finishUp() end

--- Duration state 'inactive' and empty path.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/recording/recordCamera.lua:25
function flowgraph_nodes_recording_recordCamera_C:init() end

--- State inactive: snap starts the recording. State started: snap adds a key; stop goes to 'finished' and calls finishUp.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/recording/recordCamera.lua:69
function flowgraph_nodes_recording_recordCamera_C:work() end

