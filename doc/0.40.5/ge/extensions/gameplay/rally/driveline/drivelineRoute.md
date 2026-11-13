# `gameplay_rally_driveline_drivelineRoute`

*Fichier : `lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua` · VM : Game Engine (GE) · 2122 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/driveline/drivelineRoute")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_rally_driveline_drivelineRoute")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_abortLoadRoute()` |  | 403 |
| `C:_reset()` |  | 72 |
| `C:buildElevationProfile()` |  | 2085 |
| `C:callPacenoteEventCallback(callbackFn, ...)` |  | 1331 |
| `C:codriverDelayForSpeed(speedMph)` |  | 123 |
| `C:drawDebugDrivelineRoute(drawRoute, drawPacenotes, drawLimit, monochrome, static, drawHiddenPathnodes, drawRoutePathnodes, drawPointI, drawPointMetadata, drawPacenoteText)` |  | 1814 |
| `C:drawDebugDrivelineRouteShort(dist)` |  | 2044 |
| `C:drawDebugTriggerPoint()` |  | 1787 |
| `C:effectiveAudioLen(pacenote)` | effective spoken duration incl. structured overlap gaps, falling back to the raw sum | 114 |
| `C:enableTrackMouseLikeVehicleMovement(val)` |  | 1501 |
| `C:enableTriggerLogging()` |  | 60 |
| `C:evaluatePacenoteEvents(pacenote, speedMs)` | triggers needed<br> - cs - static<br> - ce - static<br> - half - static<br>   - or make it % between cs and ce<br> - for hiding distance icon at the end of the straight - ce + N meters<br> - at? - static | 1095 |
| `C:evaluatePacenotesWindow(speedMs)` |  | 1389 |
| `C:getAheadRoutePointPos()` |  | 147 |
| `C:getDistanceKmString()` |  | 1586 |
| `C:getDistanceMeters()` |  | 1573 |
| `C:getFinishLineDistOffset()` |  | 1546 |
| `C:getNearestRoutePoint(pos)` |  | 831 |
| `C:getNextPacenote()` |  | 143 |
| `C:getPacenoteEvent(pacenote)` |  | 1033 |
| `C:getPacenotes()` |  | 135 |
| `C:getPointDistanceFromStartKm(point)` |  | 1671 |
| `C:getPointDistanceFromStartMeters(point)` |  | 1660 |
| `C:getPosition()` |  | 1366 |
| `C:getRaceCompletionData()` |  | 1595 |
| `C:getRecoveryDistToTarget(backoffDistance)` |  | 892 |
| `C:getRouteCorridorWidth()` |  | 875 |
| `C:getSpeed()` |  | 1337 |
| `C:getStaticTrackerState()` |  | 859 |
| `C:getTrackedDistToTarget()` |  | 882 |
| `C:init()` |  | 28 |
| `C:isLoaded()` |  | 68 |
| `C:loadRouteFromRecordedDriveline(racePath, notebookPath, pointsList)` | Load route from a recorded driveline<br> @param racePath: RacePath object<br> @param notebookPath: NotebookPath object<br> @param pointsList: PointList object containing recorded driveline points | 412 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` |  | 1427 |
| `C:positionAtDistToTarget(targetDist)` |  | 1699 |
| `C:projectStaticRoute(pos, options)` |  | 848 |
| `C:recalculate(options)` |  | 900 |
| `C:resetStaticTracker(pos)` |  | 853 |
| `C:setRecalcNeeded(options)` |  | 1482 |
| `C:setRouteCorridorWidth(width)` |  | 869 |
| `C:setStaticTrackerDebugCapture(enabled)` |  | 863 |
| `C:setTrackMouseLikeVehicle(val)` |  | 1490 |
| `C:setVehicleTracker(vehicleTracker)` |  | 131 |
| `C:updateDynamicTriggerSpeed(speedMs, dtSim)` |  | 1014 |
| `C:updateMouseLikeVehicle(dtSim)` |  | 1505 |
| `C:updateStaticTracker(pos, options)` |  | 843 |
| `C:vehiclePlacementPosAndRotForPacenote(pacenote, distBefore, tangentLookAhead)` |  | 1713 |
| `C:vehiclePlacementPosAndRotForRecovery(backoffDistance, tangentLookAhead)` |  | 1754 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua`.*
