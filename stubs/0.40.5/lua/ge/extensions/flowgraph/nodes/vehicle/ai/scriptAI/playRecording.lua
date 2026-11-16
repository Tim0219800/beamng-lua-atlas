---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/playRecording.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_vehicle_ai_scriptAI_playRecording_C
local flowgraph_nodes_vehicle_ai_scriptAI_playRecording_C = {}

--- Displays a Load button, the state and the recording info (vehicle, level, number of points, duration); draws the path if renderDebug.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/playRecording.lua:96
---@param builder table Node constructor.
---@param style table Node style.
function flowgraph_nodes_vehicle_ai_scriptAI_playRecording_C:drawMiddle(builder, style) end

--- Returns the vehicle whose id is given as input, or the player's vehicle (getPlayerVehicle(0)) without input.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/playRecording.lua:44
function flowgraph_nodes_vehicle_ai_scriptAI_playRecording_C:getVeh() end

--- Initializes recording=nil, data.renderDebug=false and running=false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/playRecording.lua:32
function flowgraph_nodes_vehicle_ai_scriptAI_playRecording_C:init() end

--- Reads the JSON file trying three locations (relative to the project, tracks folder, tracks folder + extension) and stores it.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/playRecording.lua:76
function flowgraph_nodes_vehicle_ai_scriptAI_playRecording_C:loadRecording() end

--- Loads the recording, sets loopCount and loopType "firstOnlyTeleport" then sends ai.startFollowing(recording).
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/playRecording.lua:54
function flowgraph_nodes_vehicle_ai_scriptAI_playRecording_C:play() end

--- Restricts the file picker of fileName to .track.json files.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/playRecording.lua:38
function flowgraph_nodes_vehicle_ai_scriptAI_playRecording_C:postInit() end

--- Sets running to false and sends ai.stopFollowing() to the vehicle.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/playRecording.lua:67
function flowgraph_nodes_vehicle_ai_scriptAI_playRecording_C:stop() end

--- Calls play on the start pulse, or stop on the stop pulse.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/playRecording.lua:88
function flowgraph_nodes_vehicle_ai_scriptAI_playRecording_C:work() end

