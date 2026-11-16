---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C
local flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C = {}

--- Resets the timer, the cache and the proximity state to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua:59
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C:_executionStarted() end

--- Draws the plane and the debug markers via StagedCountdownUtils.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua:262
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C:drawDebugVisualization() end

--- Displays a progress bar of the timer.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua:87
---@param builder table Node constructor.
---@param style table Style.
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C:drawMiddle(builder, style) end

--- Returns the rally loop manager if gameplay_rallyLoop exists.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua:250
---@return table|nil  Manager.
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C:getRallyLoopManager() end

--- Initializes the timer and the cached proximity state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua:33
---@param mgr table Flowgraph manager.
---@param ... any
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C:init(mgr, ...) end

--- Returns the cached proximity state.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua:258
---@return boolean  Near the plane.
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C:isNearPlane() end

--- True if data.drawDebug or the rally loop's stopZones flag is active.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua:245
---@return boolean  Draw the debug.
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C:shouldDrawDebug() end

--- Computes signed distance to the plane, lateral distance, finite zone, stop, proximity, display distance and "staged" state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua:179
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C:updateProximityState() end

--- Advances the timer; when the duration is reached, stops the timer and emits the pulse.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua:78
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C:updateTimer() end

--- Updates the front position and speed of the tracked vehicle from map.objects.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua:99
---@return boolean  True if the data is valid.
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C:updateVehicleData() end

--- Every frame: reads pos/rot, updates the vehicle and the proximity, handles timer and reset, broadcasts the UI, fills flow and impulse.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua:272
---@param args table Flowgraph engine arguments (unused).
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C:work(args) end

