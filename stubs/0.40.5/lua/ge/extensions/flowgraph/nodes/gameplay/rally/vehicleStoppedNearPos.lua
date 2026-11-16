---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos_C
local flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos_C = {}

--- Resets timer, state and cache to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua:40
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos_C:_executionStarted() end

--- Draws the stop zone sphere if the stopZones debug flag is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua:130
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos_C:drawDebugStopZone() end

--- Draws the vehicle's guide point (color depending on inside/outside) if stopZones is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua:136
---@param inside boolean Vehicle in the zone.
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos_C:drawDebugVehiclePoint(inside) end

--- Displays a progress bar of the timer.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua:56
---@param builder table Node constructor.
---@param style table Style.
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos_C:drawMiddle(builder, style) end

--- Initializes timer, target and hook interval (0.1 s, unused afterwards).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua:31
---@param mgr table Flowgraph manager.
---@param ... any
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos_C:init(mgr, ...) end

--- Tests whether the vehicle's front center is within the radius of the target position.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua:111
---@return boolean  In the zone.
---@return number|nil  Distance in m.
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos_C:isNearPosition() end

--- True if the vehicle speed is below 0.1 m/s.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua:103
---@return boolean  Vehicle stopped.
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos_C:isStopped() end

--- Advances the timer (dtReal); when the duration is reached, stops the timer and emits the pulse.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua:47
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos_C:updateTimer() end

--- Updates the front position and speed of the tracked vehicle from map.objects.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua:84
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos_C:updateVehicleData2() end

--- Handles reset and timer, broadcasts the proximity to the UI and updates flow/impulse.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua:144
---@param args table Flowgraph engine arguments (unused).
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos_C:work(args) end

