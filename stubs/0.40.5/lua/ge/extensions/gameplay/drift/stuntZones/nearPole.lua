---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- nearPole zone. Fields: data = {id, zoneData = {pos}}, marker, activeData = {veh, hitPole, lastFrameHitPole, available, resetFlag, lastFramePlDist, minCornerDist}.
---@class gameplay_drift_stuntZones_nearPole
local gameplay_drift_stuntZones_nearPole = {}

--- Success: removes the marker, makes the zone unavailable and emits onAnyStuntZoneAccomplished (sub-hook onNearPoleAccomplished with currDegAngle, closeness, points).
---Source: lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua:82
function gameplay_drift_stuntZones_nearPole:accomplish() end

--- Removes the pole vehicle and its marker.
---Source: lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua:8
function gameplay_drift_stuntZones_nearPole:clear() end

--- Removes the race marker if it exists.
---Source: lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua:15
function gameplay_drift_stuntZones_nearPole:clearMarker() end

--- Creates an "overhead" race marker (radius 5) 2.5 m above the pole.
---Source: lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua:22
function gameplay_drift_stuntZones_nearPole:createMarker() end

--- Iterates over the vehicle's 4 corners (getVehCorners), stores the minimum distance and marks the zone as accomplished when the vehicle moves away from the pole without having hit it.
---Source: lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua:104
function gameplay_drift_stuntZones_nearPole:detectStunt() end

--- Internal constructor: stores the data, spawns the striped pole at zoneData.pos, creates the marker.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua:67
---@param data table {id, zoneData = {pos}, nearDist}.
function gameplay_drift_stuntZones_nearPole:init(data) end

--- Returns whether the pole can still earn points.
---Source: lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua:159
---@return boolean  true as long as the zone has not been accomplished.
function gameplay_drift_stuntZones_nearPole:isAvailable() end

--- Called every frame: updates the marker and detects a collision between the drift vehicle and the pole.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua:132
---@param dtReal number Real-time delta.
---@param dtSim number Simulated time delta.
function gameplay_drift_stuntZones_nearPole:onUpdate(dtReal, dtSim) end

--- If the destroyed vehicle is the pole, forgets the pole and removes the zone from the manager.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua:152
---@param vehId integer Destroyed vehicle.
function gameplay_drift_stuntZones_nearPole:onVehicleDestroyed(vehId) end

--- Puts the pole back in place (physics and mesh reset), reinitializes the data, then recreates the marker after 0.1 s via a job.
---Source: lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua:46
function gameplay_drift_stuntZones_nearPole:reset() end

--- Resets activeData (available = true, distances to infinity).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua:33
function gameplay_drift_stuntZones_nearPole:resetData() end

