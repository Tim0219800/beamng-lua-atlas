---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Driveline V2 returned by the constructor. Main attributes: racePath, notebookPath, route, routeStatic, staticTracker, vehicleTracker, events, eventLog, loaded, nextPacenoteIdxForEval, splitDataList, pathnodeObservationList, raceCompletionData, onPacenote*Hit callbacks.
---@class gameplay_rally_driveline_drivelineRoute
local gameplay_rally_driveline_drivelineRoute = {}

--- Aborts a load in progress (calls _reset).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:403
function gameplay_rally_driveline_drivelineRoute:_abortLoadRoute() end

--- Resets the loading and tracking state: routes, trackers, events, trigger thresholds (0.1 m, 1 mph, 2 s, smoothing 0.25 s) and mouse tracking.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:72
function gameplay_rally_driveline_drivelineRoute:_reset() end

--- Builds the elevation profile: one element {x, y, z, distFromStart, splitLabel, isRacePathnode} per static route point up to and including the finish line.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:2085
---@return table[]  Profile.
function gameplay_rally_driveline_drivelineRoute:buildElevationProfile() end

--- Calls a note event callback, unless it is nil or a recalculation is pending.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1331
---@param callbackFn function|nil Callback.
---@param ... any Arguments passed on.
function gameplay_rally_driveline_drivelineRoute:callPacenoteEventCallback(callbackFn, ...) end

--- Co-driver delay for a given speed, with the settings of the active voice pack (speed scaling, offset) via gameplay_rally_codriverTiming.delayForSpeed.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:123
---@param speedMph number Speed in mph.
---@return number  Timeout in seconds.
function gameplay_rally_driveline_drivelineRoute:codriverDelayForSpeed(speedMph) end

--- Draws the route (dynamic or static): rainbow spheres and prisms, point indices, metadata, race pathnodes and note labels (at most drawLimit labels).
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1814
---@param drawRoute boolean|nil Draw the route.
---@param drawPacenotes boolean|nil Draw the notes' Cs/Ce labels.
---@param drawLimit integer|nil Maximum number of note labels (4 by default).
---@param monochrome boolean|nil Route in dark gray raised by 2 m.
---@param static boolean|nil Use the static route.
---@param drawHiddenPathnodes boolean|nil Also show hidden pathnodes.
---@param drawRoutePathnodes boolean|nil Show pathnode and split labels.
---@param drawPointI boolean|nil Show the point indices.
---@param drawPointMetadata boolean|nil Show the point metadata.
---@param drawPacenoteText boolean|nil Add the note text preview.
function gameplay_rally_driveline_drivelineRoute:drawDebugDrivelineRoute(drawRoute, drawPacenotes, drawLimit, monochrome, static, drawHiddenPathnodes, drawRoutePathnodes, drawPointI, drawPointMetadata, drawPacenoteText) end

--- Draws the static route ahead of the vehicle in green over a given distance.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:2044
---@param dist number|nil Drawn length in m (100 by default).
function gameplay_rally_driveline_drivelineRoute:drawDebugDrivelineRouteShort(dist) end

--- Draws an orange sphere where the next note will trigger at the current speed.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1787
function gameplay_rally_driveline_drivelineRoute:drawDebugTriggerPoint() end

--- Effective spoken duration of a note, with the structured overlap gaps (AudioManager:pacenoteEffectiveAudioLen); otherwise the raw total duration pacenote:audioLenTotal().
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:114
---@param pacenote table Note.
---@return number  Seconds.
function gameplay_rally_driveline_drivelineRoute:effectiveAudioLen(pacenote) end

--- Allows moving the mouse position (Shift + click) in debug mode.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1501
---@param val boolean State.
function gameplay_rally_driveline_drivelineRoute:enableTrackMouseLikeVehicleMovement(val) end

--- Indicates whether the detailed trigger log is active (gameplay_rally.getDebugLogging()).
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:60
---@return boolean  true if active.
function gameplay_rally_driveline_drivelineRoute:enableTriggerLogging() end

--- Evaluates a note's triggers: dynamic (time before Cs < co-driver delay + spoken duration), immediate, static Cs, -40 m offset and 50% between Cs and Ce, -5 m offset and static Ce. Calls the matching callbacks with shouldTriggerAudio (true only once, for the note's trigger type). Returns true if the note's audio was just triggered.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1095
---@param pacenote table Note to evaluate.
---@param speedMs number Smoothed speed in m/s.
---@return boolean|nil  true if the note is marked as played this tick.
function gameplay_rally_driveline_drivelineRoute:evaluatePacenoteEvents(pacenote, speedMs) end

--- Evaluates the notes in the window [next - 5, next]; advances nextPacenoteIdxForEval each time audio is triggered.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1389
---@param speedMs number Smoothed speed in m/s.
function gameplay_rally_driveline_drivelineRoute:evaluatePacenotesWindow(speedMs) end

--- Position of the second point of the dynamic route (point ahead of the vehicle).
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:147
---@return vec3|nil  Position.
function gameplay_rally_driveline_drivelineRoute:getAheadRoutePointPos() end

--- Race length formatted as '%.2f km', or 'N/A'.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1586
---@return string  Text.
function gameplay_rally_driveline_drivelineRoute:getDistanceKmString() end

--- Length of the race (from start to finish line) in meters; -1 if the finish line is unknown; nil without a route or racePath.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1573
---@return number|nil  Meters.
function gameplay_rally_driveline_drivelineRoute:getDistanceMeters() end

--- distToTarget of the static route point of the last pathnode (finish line); nil if unavailable.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1546
---@return number|nil  Meters.
function gameplay_rally_driveline_drivelineRoute:getFinishLineDistOffset() end

--- Position projected on the static route of the closest segment (via kd-tree), if the projection is ahead of the segment start (xnorm > 0).
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:831
---@param pos vec3 Position.
---@return vec3|nil  Position on the route.
function gameplay_rally_driveline_drivelineRoute:getNearestRoutePoint(pos) end

--- Next note to evaluate.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:143
---@return table|nil  Note.
function gameplay_rally_driveline_drivelineRoute:getNextPacenote() end

--- Returns a note's stored event or creates one: disabledByRecalc, csDynamicHit, csImmediateHit, csStaticHit, csMeterOffsetHit[-40], cornerPercentHit[0.5], ceStaticHit, ceMeterOffsetHit[-5], audioTriggerComplete.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1033
---@param pacenote table Note.
---@return table  Event.
function gameplay_rally_driveline_drivelineRoute:getPacenoteEvent(pacenote) end

--- Sorted list of the loaded notebook's notes ({} if no notebook).
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:135
---@return table[]  Notes.
function gameplay_rally_driveline_drivelineRoute:getPacenotes() end

--- Distance from the start to a route point, in kilometers.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1671
---@param point table Road point.
---@return number  Kilometers.
function gameplay_rally_driveline_drivelineRoute:getPointDistanceFromStartKm(point) end

--- Distance from the start to a route point, in meters (0 without a route).
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1660
---@param point table Route point with distToTarget.
---@return number  Meters.
function gameplay_rally_driveline_drivelineRoute:getPointDistanceFromStartMeters(point) end

--- Vehicle position (or the mouse's in debug mode).
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1366
---@return vec3|nil  Position.
function gameplay_rally_driveline_drivelineRoute:getPosition() end

--- Race progress: returns a shared table {distM, distPct, distKm, totalDistM} (distance covered, fraction, text '%.2fkm', total length). Values are 0 if the finish line is unknown.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1595
---@return table|nil  Progress data (reused table).
function gameplay_rally_driveline_drivelineRoute:getRaceCompletionData() end

--- Remaining distance at which to reposition the vehicle after going off the road (static tracker; otherwise tracked distance).
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:892
---@param backoffDistance number|nil Backoff in meters.
---@return number|nil  distToTarget.
function gameplay_rally_driveline_drivelineRoute:getRecoveryDistToTarget(backoffDistance) end

--- Current half-width of the corridor.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:875
---@return number|nil  Meters.
function gameplay_rally_driveline_drivelineRoute:getRouteCorridorWidth() end

--- Vehicle speed in m/s (or the mouse's in debug mode). 0 without a vehicle tracker, nil without a vehicle.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1337
---@return number|nil  m/s.
function gameplay_rally_driveline_drivelineRoute:getSpeed() end

--- State of the static tracker (see RallyRouteTracker:getState).
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:859
---@return table|nil  State.
function gameplay_rally_driveline_drivelineRoute:getStaticTrackerState() end

--- Remaining distance to the end of the route: that of the static tracker; otherwise that of the first point of the dynamic route.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:882
---@return number|nil  Meters.
function gameplay_rally_driveline_drivelineRoute:getTrackedDistToTarget() end

--- Initializes the callbacks (nil), the mouse debug options, the split lists and the internal state (_reset).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:28
function gameplay_rally_driveline_drivelineRoute:init() end

--- Indicates whether a route was loaded successfully.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:68
---@return boolean  State.
function gameplay_rally_driveline_drivelineRoute:isLoaded() end

--- Loads the route from a recorded driveline: builds the list of points (driveline, start position, stop zone, pathnodes, Cs/Ce waypoints of the notes), removes those before the start and after the stop, creates the dynamic route and the static route, the static tracker, the note lengths and the splits/pathnodes data. Returns false (and resets itself) if prerequisites are missing.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:412
---@param racePath table RacePath object.
---@param notebookPath table NotebookPath object.
---@param pointsList table PointList of the recorded points.
---@return boolean  true if the route is loaded.
function gameplay_rally_driveline_drivelineRoute:loadRouteFromRecordedDriveline(racePath, notebookPath, pointsList) end

--- Called every frame: updates the mouse in debug mode, the speed, the static tracker and the smoothed trigger speed; runs a recalculation if requested, otherwise evaluates the notes if the speed exceeds 1 mph and 2 s have elapsed since the last recalculation. Ignores speeds > 1000 mph.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1427
---@param dtReal number Real time (s).
---@param dtSim number Simulation time (s).
---@param dtRaw number Raw time (s).
function gameplay_rally_driveline_drivelineRoute:onUpdate(dtReal, dtSim, dtRaw) end

--- Position on the static route for a given remaining distance (linear interpolation between points).
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1699
---@param targetDist number distToTarget in meters.
---@return vec3|nil  Position, nil off the route.
function gameplay_rally_driveline_drivelineRoute:positionAtDistToTarget(targetDist) end

--- Projects a position onto the static route without changing state.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:848
---@param pos vec3 Position.
---@param options table|nil {forceFullSearch}.
---@return table|nil  Projection.
function gameplay_rally_driveline_drivelineRoute:projectStaticRoute(pos, options) end

--- Recomputes the route from the current position: finds the next corner start waypoint (Cs) and the next pathnode, disables the events of notes already passed (disabledByRecalc), sets nextPacenoteIdxForEval, calls route:recalculateRouteWithOriginalPositions and resets the static tracker (unless preserveStaticTracker).
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:900
---@param options table|nil {preserveStaticTracker = boolean}.
---@return boolean  true.
function gameplay_rally_driveline_drivelineRoute:recalculate(options) end

--- Resets the static tracker, optionally at a position.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:853
---@param pos vec3|nil Initial position.
function gameplay_rally_driveline_drivelineRoute:resetStaticTracker(pos) end

--- Requests a route recalculation at the next onUpdate.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1482
---@param options table|nil {preserveStaticTracker = boolean}.
function gameplay_rally_driveline_drivelineRoute:setRecalcNeeded(options) end

--- Sets the half-width of the static tracker's route corridor.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:869
---@param width number Meters (clamped to [0.1; 15] by the tracker).
function gameplay_rally_driveline_drivelineRoute:setRouteCorridorWidth(width) end

--- Enables diagnostic capture on the static tracker.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:863
---@param enabled boolean true to enable.
function gameplay_rally_driveline_drivelineRoute:setStaticTrackerDebugCapture(enabled) end

--- Enables/disables mouse tracking as if it were the vehicle (debug). Disabling clears the mouse data.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1490
---@param val boolean State.
function gameplay_rally_driveline_drivelineRoute:setTrackMouseLikeVehicle(val) end

--- Sets the object that provides the vehicle's position and speed (methods getVehicle, speedMs, pos).
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:131
---@param vehicleTracker table Vehicle tracker.
function gameplay_rally_driveline_drivelineRoute:setVehicleTracker(vehicleTracker) end

--- Smooths the speed used for triggers (exponential filter with 0.25 s constant); initializes it to the current speed if it is nil or if dtSim is invalid.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1014
---@param speedMs number|nil Speed in m/s.
---@param dtSim number|nil Simulation time step in s.
---@return number|nil  Smoothed speed in m/s.
function gameplay_rally_driveline_drivelineRoute:updateDynamicTriggerSpeed(speedMs, dtSim) end

--- Updates the mouse's simulated position and speed (camera raycast, smoothing 0.02) in debug mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1505
---@param dtSim number Simulation time (s).
function gameplay_rally_driveline_drivelineRoute:updateMouseLikeVehicle(dtSim) end

--- Updates the static route tracker with the position (RallyRouteTracker:update).
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:843
---@param pos vec3 Position.
---@param options table|nil {allowJump, forceFullSearch}.
---@return table|nil  Projection.
function gameplay_rally_driveline_drivelineRoute:updateStaticTracker(pos, options) end

--- Position and orientation to reposition the vehicle distBefore meters before a note's corner start (Cs), heading taken toward a point tangentLookAhead meters further along the route.
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1713
---@param pacenote table Note.
---@param distBefore number|nil Distance before Cs in m (10 by default).
---@param tangentLookAhead number|nil Look-ahead distance in m (min(distBefore, 5) by default).
---@return vec3|nil  Position.
---@return quat|nil  Orientation.
---@return vec3|nil  Normalized forward direction.
function gameplay_rally_driveline_drivelineRoute:vehiclePlacementPosAndRotForPacenote(pacenote, distBefore, tangentLookAhead) end

--- Position and orientation to recover the vehicle after going off the road (the tracker's recovery distance, clamped to the start of the route).
---Source: lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1754
---@param backoffDistance number|nil Backoff in m.
---@param tangentLookAhead number|nil Look-ahead distance in m (5 by default).
---@return vec3|nil  Position.
---@return quat|nil  Orientation.
---@return string|nil  Error message on failure.
---@return vec3|nil  Forward direction.
---@return number|nil  Placement distToTarget.
function gameplay_rally_driveline_drivelineRoute:vehiclePlacementPosAndRotForRecovery(backoffDistance, tangentLookAhead) end

