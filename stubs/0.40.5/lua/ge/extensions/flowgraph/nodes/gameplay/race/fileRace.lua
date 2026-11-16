---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_race_fileRace_C
local flowgraph_nodes_gameplay_race_fileRace_C = {}

--- Resets race, started and vehicleChanged.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua:103
function flowgraph_nodes_gameplay_race_fileRace_C:_executionStarted() end

--- Calls race:stopRace() if a race exists, then forgets it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua:109
function flowgraph_nodes_gameplay_race_fileRace_C:_executionStopped() end

--- Rereads count (default 1) and recreates the pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua:99
---@param res table Serialized data.
function flowgraph_nodes_gameplay_race_fileRace_C:_onDeserialized(res) end

--- Saves count in the serialization table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua:95
---@param res table Result table to complete.
function flowgraph_nodes_gameplay_race_fileRace_C:_onSerialize(res) end

--- Editor field "Vehicle Count" that adds or removes vehId_i pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua:59
---@return string|nil  Change reason for the undo history.
function flowgraph_nodes_gameplay_race_fileRace_C:drawCustomProperties() end

--- Displays "Started" or "Stopped" in the node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua:115
---@param builder table imgui node constructor.
---@param style table Node style.
function flowgraph_nodes_gameplay_race_fileRace_C:drawMiddle(builder, style) end

--- Initializes the state (started, race, count = 1) and the data options.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua:45
---@param mgr table Flowgraph manager.
---@param ... any
function flowgraph_nodes_gameplay_race_fileRace_C:init(mgr, ...) end

--- Creates the vehId_i pins according to self.count.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua:55
function flowgraph_nodes_gameplay_race_fileRace_C:postInit() end

--- Changes the number of vehId_i pins from old to new: removes the extra pins (and their links) or creates new ones.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua:77
---@param old integer Current number of vehicles.
---@param new integer New number of vehicles.
function flowgraph_nodes_gameplay_race_fileRace_C:updatePins(old, new) end

--- Handles reset, starts the race on first flow, updates it every frame and fills the output pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua:120
---@param args table Flowgraph engine arguments (unused).
function flowgraph_nodes_gameplay_race_fileRace_C:work(args) end

