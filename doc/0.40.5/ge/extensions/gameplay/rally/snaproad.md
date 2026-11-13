# `gameplay_rally_snaproad`

*Fichier : `lua/ge/extensions/gameplay/rally/snaproad.lua` · VM : Game Engine (GE) · 1648 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/snaproad")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_rally_snaproad")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_allPoints()` |  | 562 |
| `C:_applySnapLocationToWaypoint(wp, loc)` |  | 748 |
| `C:_clearPointCachedPartitions()` |  | 1323 |
| `C:_clrSnaproad()` |  | 302 |
| `C:_drawDebugCornerCalls()` |  | 524 |
| `C:_drawDebugDefault(adjustH, clrOverride, prismWidth, drawOnTop)` |  | 370 |
| `C:_drawDebugPartition(adjustH, prismWidth, drawOnTop)` |  | 334 |
| `C:_drawDebugPartitionAllPrisms(partition, clr, prismWidth, drawOnTop)` |  | 161 |
| `C:_drawDebugPartitionsAll(prismWidth, drawOnTop)` | this is used for Ctrl+click to create new pacenote. | 258 |
| `C:_drawDebugPointPrisms(points, clr, alpha, adjustH, globalOpacity, prismWidth, fromLocation, toLocation, drawOnTop)` |  | 122 |
| `C:_drawDebugPoints(points, clr, alpha, radius, adjustH, globalOpacity)` |  | 205 |
| `C:_drawDebugPointsCyl(points, clr, alpha, radius, adjustH, globalOpacity, h)` |  | 233 |
| `C:_indexForPoints(useAllPoints)` |  | 587 |
| `C:_invalidateFilterPointIndex()` |  | 583 |
| `C:_operativePoints()` |  | 570 |
| `C:_partitionPoints(fromPoint, toPoint, fromLoc, toLoc)` |  | 1206 |
| `C:_rebuildAllPointIndex()` |  | 578 |
| `C:_repairPacenoteProjectionEntries(entries)` |  | 757 |
| `C:_snapshotWaypoint(snapshotPn, key, fallbackWp)` |  | 739 |
| `C:advanceAlongRoute(pos, meters, fwd, limitPoints, useAllPoints)` |  | 712 |
| `C:clearAll()` |  | 1314 |
| `C:clearFilter()` |  | 1409 |
| `C:clearPartition()` |  | 1196 |
| `C:closestSnapPoint(source_pos, useAllPoints)` | source_pos - should be a vec3 | 954 |
| `C:closestSnapPos(source_pos)` |  | 959 |
| `C:closestSnapResult(source_pos, useAllPoints)` |  | 875 |
| `C:compareRouteLocations(a, b)` |  | 628 |
| `C:distanceBackwards(fromPoint, meters, limitPoints)` |  | 1043 |
| `C:distanceBackwardsResult(fromPos, meters, limitPoints)` |  | 1070 |
| `C:distanceBetweenPositions(posA, posB, useAllPoints)` |  | 733 |
| `C:distanceBetweenRouteLocations(a, b)` |  | 637 |
| `C:distanceForwards(fromPoint, meters, limitPoints)` |  | 1074 |
| `C:distanceForwardsResult(fromPos, meters, limitPoints)` |  | 1106 |
| `C:drawDebugCameraPlaying()` |  | 399 |
| `C:drawDebugPartitionsAllWindow(window, prismWidth, drawOnTop)` |  | 282 |
| `C:drawDebugRecceApp()` |  | 391 |
| `C:drawDebugSnaproad(clrOverride, prismWidth, drawOnTop)` |  | 379 |
| `C:driveline()` |  | 558 |
| `C:firstSnapPoint()` |  | 1113 |
| `C:forwardNormalVec(point)` |  | 997 |
| `C:groupPointsByCornerCall(points)` |  | 464 |
| `C:init(driveline)` |  | 68 |
| `C:measurePartition()` |  | 362 |
| `C:minAdjacentWaypointDistance()` |  | 601 |
| `C:nextSnapPoint(srcPos)` |  | 1143 |
| `C:nextSnapPos(srcPos)` |  | 1139 |
| `C:normalAlignPoints(point)` |  | 987 |
| `C:normalForSnapResult(result)` |  | 643 |
| `C:partitionAllEnabled()` |  | 1629 |
| `C:partitionAllPacenotes(notebook)` |  | 1329 |
| `C:playCameraPath()` |  | 1621 |
| `C:pointsBackwards(fromPoint, steps, limitPoints)` |  | 1001 |
| `C:pointsForCameraPath(bufferBeforeMeters, bufferAfterMeters)` |  | 1576 |
| `C:pointsForwards(fromPoint, steps, limitPoints)` |  | 1022 |
| `C:positionAtDistanceAlongRoute(distanceAlongRoute, useAllPoints)` |  | 659 |
| `C:prevSnapPoint(srcPos)` |  | 1121 |
| `C:prevSnapPos(srcPos)` |  | 1117 |
| `C:reprojectPacenoteWaypoints(notebook, previousSnaproad, snapshot)` |  | 843 |
| `C:reprojectPacenoteWaypointsFromSnapshot(notebook, snapshot)` |  | 799 |
| `C:routeLocationForPoint(point)` |  | 610 |
| `C:setFilter(wp)` |  | 1455 |
| `C:setFilterPartitionPoint(point)` |  | 1435 |
| `C:setFilterToAllPartitions()` |  | 1417 |
| `C:setGlobalOpacity(globalOpacity)` |  | 112 |
| `C:setPartitionToFilter()` |  | 1565 |
| `C:setPartitionToPacenote(pn)` |  | 1183 |
| `C:stopCameraPath()` |  | 1625 |
| `C:toggleCornerCalls()` |  | 1633 |
| `C:totalRouteLength()` |  | 605 |
| `C:updateHalfpoint(pn)` |  | 1161 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/snaproad.lua`.*
