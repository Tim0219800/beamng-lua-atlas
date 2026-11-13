---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_rally_driveline_drivelineRoute
local gameplay_rally_driveline_drivelineRoute = {}

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:403
function gameplay_rally_driveline_drivelineRoute:_abortLoadRoute() end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:72
function gameplay_rally_driveline_drivelineRoute:_reset() end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:2085
function gameplay_rally_driveline_drivelineRoute:buildElevationProfile() end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1331
---@param callbackFn any
---@param ... any
function gameplay_rally_driveline_drivelineRoute:callPacenoteEventCallback(callbackFn, ...) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:123
---@param speedMph any
function gameplay_rally_driveline_drivelineRoute:codriverDelayForSpeed(speedMph) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1814
---@param drawRoute any
---@param drawPacenotes any
---@param drawLimit any
---@param monochrome any
---@param static any
---@param drawHiddenPathnodes any
---@param drawRoutePathnodes any
---@param drawPointI any
---@param drawPointMetadata any
---@param drawPacenoteText any
function gameplay_rally_driveline_drivelineRoute:drawDebugDrivelineRoute(drawRoute, drawPacenotes, drawLimit, monochrome, static, drawHiddenPathnodes, drawRoutePathnodes, drawPointI, drawPointMetadata, drawPacenoteText) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:2044
---@param dist any
function gameplay_rally_driveline_drivelineRoute:drawDebugDrivelineRouteShort(dist) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1787
function gameplay_rally_driveline_drivelineRoute:drawDebugTriggerPoint() end

--- effective spoken duration incl. structured overlap gaps, falling back to the raw sum
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:114
---@param pacenote any
function gameplay_rally_driveline_drivelineRoute:effectiveAudioLen(pacenote) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1501
---@param val any
function gameplay_rally_driveline_drivelineRoute:enableTrackMouseLikeVehicleMovement(val) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:60
function gameplay_rally_driveline_drivelineRoute:enableTriggerLogging() end

--- triggers needed
---  - cs - static
---  - ce - static
---  - half - static
---    - or make it % between cs and ce
---  - for hiding distance icon at the end of the straight - ce + N meters
---  - at? - static
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1095
---@param pacenote any
---@param speedMs any
function gameplay_rally_driveline_drivelineRoute:evaluatePacenoteEvents(pacenote, speedMs) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1389
---@param speedMs any
function gameplay_rally_driveline_drivelineRoute:evaluatePacenotesWindow(speedMs) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:147
function gameplay_rally_driveline_drivelineRoute:getAheadRoutePointPos() end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1586
function gameplay_rally_driveline_drivelineRoute:getDistanceKmString() end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1573
function gameplay_rally_driveline_drivelineRoute:getDistanceMeters() end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1546
function gameplay_rally_driveline_drivelineRoute:getFinishLineDistOffset() end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:831
---@param pos any
function gameplay_rally_driveline_drivelineRoute:getNearestRoutePoint(pos) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:143
function gameplay_rally_driveline_drivelineRoute:getNextPacenote() end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1033
---@param pacenote any
function gameplay_rally_driveline_drivelineRoute:getPacenoteEvent(pacenote) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:135
function gameplay_rally_driveline_drivelineRoute:getPacenotes() end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1671
---@param point any
function gameplay_rally_driveline_drivelineRoute:getPointDistanceFromStartKm(point) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1660
---@param point any
function gameplay_rally_driveline_drivelineRoute:getPointDistanceFromStartMeters(point) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1366
function gameplay_rally_driveline_drivelineRoute:getPosition() end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1595
function gameplay_rally_driveline_drivelineRoute:getRaceCompletionData() end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:892
---@param backoffDistance any
function gameplay_rally_driveline_drivelineRoute:getRecoveryDistToTarget(backoffDistance) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:875
function gameplay_rally_driveline_drivelineRoute:getRouteCorridorWidth() end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1337
function gameplay_rally_driveline_drivelineRoute:getSpeed() end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:859
function gameplay_rally_driveline_drivelineRoute:getStaticTrackerState() end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:882
function gameplay_rally_driveline_drivelineRoute:getTrackedDistToTarget() end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:28
function gameplay_rally_driveline_drivelineRoute:init() end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:68
function gameplay_rally_driveline_drivelineRoute:isLoaded() end

--- Load route from a recorded driveline
---  @param racePath: RacePath object
---  @param notebookPath: NotebookPath object
---  @param pointsList: PointList object containing recorded driveline points
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:412
---@param racePath any
---@param notebookPath any
---@param pointsList any
function gameplay_rally_driveline_drivelineRoute:loadRouteFromRecordedDriveline(racePath, notebookPath, pointsList) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1427
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_rally_driveline_drivelineRoute:onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1699
---@param targetDist any
function gameplay_rally_driveline_drivelineRoute:positionAtDistToTarget(targetDist) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:848
---@param pos any
---@param options any
function gameplay_rally_driveline_drivelineRoute:projectStaticRoute(pos, options) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:900
---@param options any
function gameplay_rally_driveline_drivelineRoute:recalculate(options) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:853
---@param pos any
function gameplay_rally_driveline_drivelineRoute:resetStaticTracker(pos) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1482
---@param options any
function gameplay_rally_driveline_drivelineRoute:setRecalcNeeded(options) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:869
---@param width any
function gameplay_rally_driveline_drivelineRoute:setRouteCorridorWidth(width) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:863
---@param enabled any
function gameplay_rally_driveline_drivelineRoute:setStaticTrackerDebugCapture(enabled) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1490
---@param val any
function gameplay_rally_driveline_drivelineRoute:setTrackMouseLikeVehicle(val) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:131
---@param vehicleTracker any
function gameplay_rally_driveline_drivelineRoute:setVehicleTracker(vehicleTracker) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1014
---@param speedMs any
---@param dtSim any
function gameplay_rally_driveline_drivelineRoute:updateDynamicTriggerSpeed(speedMs, dtSim) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1505
---@param dtSim any
function gameplay_rally_driveline_drivelineRoute:updateMouseLikeVehicle(dtSim) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:843
---@param pos any
---@param options any
function gameplay_rally_driveline_drivelineRoute:updateStaticTracker(pos, options) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1713
---@param pacenote any
---@param distBefore any
---@param tangentLookAhead any
function gameplay_rally_driveline_drivelineRoute:vehiclePlacementPosAndRotForPacenote(pacenote, distBefore, tangentLookAhead) end

---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1754
---@param backoffDistance any
---@param tangentLookAhead any
function gameplay_rally_driveline_drivelineRoute:vehiclePlacementPosAndRotForRecovery(backoffDistance, tangentLookAhead) end

