---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/traffic/roadTracking.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- A vehicle's road tracking object. Main fields: vehId, pos/dirVec/vel (vec3), speed, n1/n2 (road node names), linkData, speedLimit, speedRatio, alignment (~1 if parallel to the road), roadOffset, roadXnorm/roadYnorm (0 to 1), halfWidth, isOnRoad, isNearRoad, isPublicRoad, isOneWay, isReverse, legalSide, faults, timers, collisionIds, collisionCount, currSignal, signalAction, signalFault.
---@class gameplay_traffic_roadTracking
local gameplay_traffic_roadTracking = {}

--- Computes the vehicle's position on the n1-n2 segment: normalized longitudinal and lateral position, interpolated half-width, alignment, offset from the centerline, and isOnRoad.
---Source: lua/ge/extensions/gameplay/traffic/roadTracking.lua:109
---@return boolean  true if the current segment is still valid; false if the vehicle has left it or the direction has changed (a new segment must then be searched).
function gameplay_traffic_roadTracking:calcVehOnRoad() end

--- Initializes the object: measures the vehicle's footprint (initialNodePosBB), computes vehBasicRadius (minimum half-width or half-length), sets the speed thresholds, then calls refresh.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/roadTracking.lua:16
---@param vehId integer Id of the vehicle to track.
function gameplay_traffic_roadTracking:init(vehId) end

--- Restores the configuration from the table produced by onSerialize.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/roadTracking.lua:338
---@param data table Data produced by onSerialize.
function gameplay_traffic_roadTracking:onDeserialized(data) end

--- Serializes the configuration (vehId, speedLimitFloor, speedLimitCoef, highFrequency, fullStats).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/traffic/roadTracking.lua:328
---@return table  Serializable data table.
function gameplay_traffic_roadTracking:onSerialize() end

--- Per-frame update: refreshes vehicle and road, accumulates collisions, then evolves the fault scores (speeding, wrong direction/side, reckless driving) and tracks traffic signals (red light, stop) to fill in signalAction and signalFault.
---Source: lua/ge/extensions/gameplay/traffic/roadTracking.lua:193
---@param dt number Delta time in seconds.
function gameplay_traffic_roadTracking:onUpdate(dt) end

--- Resets all tables and values (faults, timers, collisions, road), recalculates the legal side (right- or left-hand driving according to map.getRoadRules()), then, if the vehicle is in map.objects, updates the vehicle and the current road.
---Source: lua/ge/extensions/gameplay/traffic/roadTracking.lua:38
function gameplay_traffic_roadTracking:refresh() end

--- Resets the active tracking values to their neutral values (speed ratio, alignment, offset, faults, timers, signal, collisions).
---Source: lua/ge/extensions/gameplay/traffic/roadTracking.lua:68
function gameplay_traffic_roadTracking:resetValues() end

--- Looks for the best road segment (map.findBestRoad) for the current position and direction, updates speed limit, one-way, public road and centerline (from the lane string '+'/'-'), orients n1->n2 in the direction of travel, then calls calcVehOnRoad. If no road is nearby: isNearRoad = false and values reset.
---Source: lua/ge/extensions/gameplay/traffic/roadTracking.lua:152
function gameplay_traffic_roadTracking:updateCurrentRoad() end

--- Updates the ground position (OOBB center lowered by half the height), the direction, the speed (m/s) and isReverse (speed of at least 1 m/s in the direction opposite to the vehicle's front).
---Source: lua/ge/extensions/gameplay/traffic/roadTracking.lua:97
function gameplay_traffic_roadTracking:updateVehicle() end

