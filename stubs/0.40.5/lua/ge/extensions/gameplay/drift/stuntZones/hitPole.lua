---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- hitPole zone. Fields: data = {id, zoneData = {pos}}, marker (race marker), activeData = {veh (pole), hitPole, lastFrameHitPole, available, resetFlag}.
---@class gameplay_drift_stuntZones_hitPole
local gameplay_drift_stuntZones_hitPole = {}

--- Success: removes the marker, makes the zone unavailable and emits onAnyStuntZoneAccomplished (sub-hook onHitPoleAccomplished).
---Source: lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua:77
function gameplay_drift_stuntZones_hitPole:accomplish() end

--- Removes the pole vehicle and its marker.
---Source: lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua:6
function gameplay_drift_stuntZones_hitPole:clear() end

--- Removes the race marker if it exists.
---Source: lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua:13
function gameplay_drift_stuntZones_hitPole:clearMarker() end

--- Creates an "overhead" race marker (radius 5) 2.5 m above the pole.
---Source: lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua:20
function gameplay_drift_stuntZones_hitPole:createMarker() end

--- Called when the player drifts: calls accomplish if the pole was just hit.
---Source: lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua:96
function gameplay_drift_stuntZones_hitPole:detectStunt() end

--- Internal constructor: stores the data, spawns the delineator pole (pole.pc) at zoneData.pos without making the player enter it, creates the marker.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua:62
---@param data table {id, zoneData = {pos}, nearDist}.
function gameplay_drift_stuntZones_hitPole:init(data) end

--- Returns whether the pole can still earn points.
---Source: lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua:129
---@return boolean  true as long as it has not been hit.
function gameplay_drift_stuntZones_hitPole:isAvailable() end

--- Called every frame: updates the marker, stores the previous collision state and detects a collision between the drift vehicle and the pole.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua:102
---@param dtReal number Real-time delta.
---@param dtSim number Simulated time delta.
function gameplay_drift_stuntZones_hitPole:onUpdate(dtReal, dtSim) end

--- If the destroyed vehicle is the pole, forgets the pole and removes the zone from the manager.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua:122
---@param vehId integer Destroyed vehicle.
function gameplay_drift_stuntZones_hitPole:onVehicleDestroyed(vehId) end

--- Puts the pole back in place (physics and mesh reset), reinitializes the data, then recreates the marker after 0.1 s via a job.
---Source: lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua:41
function gameplay_drift_stuntZones_hitPole:reset() end

--- Resets activeData (available = true, no collision), losing the reference to the pole.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua:31
function gameplay_drift_stuntZones_hitPole:resetData() end

