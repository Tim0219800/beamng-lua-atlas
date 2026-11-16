---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the drift spots of free roaming (and of career): start/finish zones as lines (lineOne/lineTwo), to be crossed while drifting. It detects the start (the player drifts in a line's rectangle, in the direction of startDir), switches to the inFreeroamChallenge context, configures the bounds (gameplay_drift_bounds) and the route (gameplay_drift_destination), then detects a clean end (finish line crossed against its startDir) or an unclean one (wrong way, off road, stop, vehicle reset). Records the score (top 10), validates the objectives and exposes the spots as POIs on the map.
--- Access: extension `gameplay_drift_freeroam_driftSpots`: `extensions.load("gameplay_drift_freeroam_driftSpots")`, then the global `gameplay_drift_freeroam_driftSpots`
---@class gameplay_drift_freeroam_driftSpots
---@field dependencies string[] gameplay_drift_general, gameplay_drift_drift, gameplay_drift_scoring, gameplay_drift_saveLoad.
gameplay_drift_freeroam_driftSpots = {}

--- Tests whether the player starts a spot through the given line: they must be in the line's rectangle, drive in the direction of startDir (dot product > 0) and be drifting. If so, starts the spot (inFreeroamChallenge context, bounds, route, onDriftSpotStarted hook, tasklist). No effect if already in a challenge, in multiseat or in a multiplayer gamemode. Logs an error if the line id is unknown.
---Source: lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:244
---@param lineId string Line id of the form spotId..lineName (key of the lines table).
function gameplay_drift_freeroam_driftSpots.detectStart(lineId) end

--- Returns {default=false, canBeChanged=true} for the drift debug window.
---Source: lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:379
---@return table  {default = false, canBeChanged = true}
function gameplay_drift_freeroam_driftSpots.getDriftDebugInfo() end

--- Returns the amount of garbage measured by the profiler (0 outside debug).
---Source: lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:387
---@return number  Garbage of the "Drift driftSpots" section.
function gameplay_drift_freeroam_driftSpots.getGC() end

--- Indicates whether a drift spot is in progress.
---Source: lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:391
---@return boolean  true during a spot challenge.
function gameplay_drift_freeroam_driftSpots.getIsInFreeroamChallenge() end

--- Indicates whether the spot is in its concluding phase (success or failure), during which the drift is frozen.
---Source: lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:383
---@return boolean  true during the ~2.5 s of conclusion.
function gameplay_drift_freeroam_driftSpots.getIsInTheConcludingPhase() end

--- Hook: level end; cleans up the tasklist and the state of the current spot.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:482
function gameplay_drift_freeroam_driftSpots.onClientEndMission() end

--- Hook: level start; empties the gameplay_drift_saveLoad cache and rebuilds the lines.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:491
function gameplay_drift_freeroam_driftSpots.onClientStartMission() end

--- Hook: if a spot was in progress before the reload, emits onDriftSpotForcedEnd then ends it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:497
---@param data table Table returned by onSerialize.
function gameplay_drift_freeroam_driftSpots.onDeserialized(data) end

--- Hook: at the end of a scored drift chain, updates the objectives tasklist and shows "New Highscore!" (once per spot) if the record is beaten.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:446
function gameplay_drift_freeroam_driftSpots.onDriftCompletedScored() end

--- Hook: reloads the level's lines then adds one POI per line (drift line marker); lineOne also adds a big map marker with name, preview, best score and teleport position.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:409
---@param levelIdentifier string Level identifier (unused).
---@param elements table List of raw POIs to fill.
function gameplay_drift_freeroam_driftSpots.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Hook: a multiplayer gamemode starts; forces the end of a spot in progress (onDriftSpotForcedEnd), disables the spots and empties the POIs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:468
function gameplay_drift_freeroam_driftSpots.onMultiplayerGamemodeStarted() end

--- Hook: end of the multiplayer gamemode; re-enables the spots and empties the POIs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:477
function gameplay_drift_freeroam_driftSpots.onMultiplayerGamemodeStopped() end

--- Hook: saves isInFreeroamChallenge and activeLine before a Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:504
---@return table  {isInFreeroamChallenge, activeLine}
function gameplay_drift_freeroam_driftSpots.onSerialize() end

--- Called every frame: updates the player's position/speed then, during a spot, checks the clean end and the unclean ends.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:358
---@param dtReal number Real time delta (unused).
---@param dtSim number Simulated time delta, used for the stop timer.
---@param dtRaw number Raw time delta (unused).
function gameplay_drift_freeroam_driftSpots.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook: if the vehicle put back in place is the drift vehicle during a spot, ends the spot as a failure (reason vehReset).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua:395
---@param id integer Vehicle id.
function gameplay_drift_freeroam_driftSpots.onVehicleResetted(id) end

