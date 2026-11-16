---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_mission_blacklistParkingSpots_C
local flowgraph_nodes_mission_blacklistParkingSpots_C = {}

--- Calls reset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua:33
function flowgraph_nodes_mission_blacklistParkingSpots_C:_executionStopped() end

--- Reads back count and recreates the pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua:148
---@param res any
function flowgraph_nodes_mission_blacklistParkingSpots_C:_onDeserialized(res) end

--- Saves count.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua:144
---@param res any
function flowgraph_nodes_mission_blacklistParkingSpots_C:_onSerialize(res) end

--- Panel: number of position pins (Count).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua:56
function flowgraph_nodes_mission_blacklistParkingSpots_C:drawCustomProperties() end

--- count=1, bannedSpots empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua:24
function flowgraph_nodes_mission_blacklistParkingSpots_C:init() end

--- Calls reset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua:37
function flowgraph_nodes_mission_blacklistParkingSpots_C:onNodeReset() end

--- Creates the pins pos_1..pos_count.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua:29
function flowgraph_nodes_mission_blacklistParkingSpots_C:postInit() end

--- Removes the 'banned' tag from the spots banned by this node and clears the list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua:41
function flowgraph_nodes_mission_blacklistParkingSpots_C:reset() end

--- Creates or deletes the pos_i pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua:73
---@param old integer old count
---@param new integer new count
function flowgraph_nodes_mission_blacklistParkingSpots_C:updatePins(old, new) end

--- Gathers the positions, looks for spots within the radius (default 5 m) with gameplay_parking.findParkingSpots, adds the 'banned' tag and forces the teleportation of the vehicles occupying them.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua:94
function flowgraph_nodes_mission_blacklistParkingSpots_C:workOnce() end

