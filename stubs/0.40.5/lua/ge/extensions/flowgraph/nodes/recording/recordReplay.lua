---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/recording/recordReplay.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_recording_recordReplay_C
local flowgraph_nodes_recording_recordReplay_C = {}

--- Duration state 'inactive'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/recording/recordReplay.lua:28
function flowgraph_nodes_recording_recordReplay_C:_executionStarted() end

--- Displays the duration state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/recording/recordReplay.lua:63
---@param builder any
---@param style any
function flowgraph_nodes_recording_recordReplay_C:drawMiddle(builder, style) end

--- state = 'none'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/recording/recordReplay.lua:24
function flowgraph_nodes_recording_recordReplay_C:init() end

--- Hook called by the replay system when its state changes; while recording, stores the loaded file in 'filename'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/recording/recordReplay.lua:32
---@param state table replay state (state.state, state.loadedFile)
function flowgraph_nodes_recording_recordReplay_C:onReplayStateChanged(state) end

--- Builds a file name (prefix or 'Recording_<id>' followed by a number) but does not use it: the function does nothing useful.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/recording/recordReplay.lua:38
function flowgraph_nodes_recording_recordReplay_C:saveFile() end

--- State inactive: 'start' launches toggleRecording and goes to 'started'. State started: 'stop' launches toggleRecording again and goes to 'finished'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/recording/recordReplay.lua:45
function flowgraph_nodes_recording_recordReplay_C:work() end

