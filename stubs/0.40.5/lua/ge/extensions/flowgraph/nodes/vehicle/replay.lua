---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/replay.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_replay_C
local flowgraph_nodes_vehicle_replay_C = {}

--- Stops the current replay.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/replay.lua:46
function flowgraph_nodes_vehicle_replay_C:_executionStopped() end

--- "Load Replays" button and dropdown list to choose a recording.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/replay.lua:50
function flowgraph_nodes_vehicle_replay_C:drawCustomProperties() end

--- Displays the replay name and the internal flags.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/replay.lua:82
---@param builder any Editor node builder (builder:Middle()).
---@param style any Editor ImGui style.
function flowgraph_nodes_vehicle_replay_C:drawMiddle(builder, style) end

--- Constructor; configures the timeline (5 to 10) and `replayName`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/replay.lua:28
function flowgraph_nodes_vehicle_replay_C:init() end

--- Called at the start of the timeline segment; requests the replay start.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/replay.lua:72
---@param globalTime number Global timeline time.
---@param localTime number Local time of the segment.
function flowgraph_nodes_vehicle_replay_C:onTimelineBegin(globalTime, localTime) end

--- Called at the end of the segment; requests the replay stop.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/replay.lua:77
---@param globalTime number Global timeline time.
---@param localTime number Local time of the segment.
function flowgraph_nodes_vehicle_replay_C:onTimelineEnd(globalTime, localTime) end

--- Loads the replay (relative path of `filename`) if `startReplay`, or stops it if `stopReplay`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/replay.lua:33
function flowgraph_nodes_vehicle_replay_C:work() end

