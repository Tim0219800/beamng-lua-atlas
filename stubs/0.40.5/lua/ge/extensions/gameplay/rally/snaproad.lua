---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/snaproad.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/rally/snaproad.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_rally_snaproad
local gameplay_rally_snaproad = {}

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:562
function gameplay_rally_snaproad:_allPoints() end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:748
---@param wp any
---@param loc any
function gameplay_rally_snaproad:_applySnapLocationToWaypoint(wp, loc) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1323
function gameplay_rally_snaproad:_clearPointCachedPartitions() end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:302
function gameplay_rally_snaproad:_clrSnaproad() end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:524
function gameplay_rally_snaproad:_drawDebugCornerCalls() end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:370
---@param adjustH any
---@param clrOverride any
---@param prismWidth any
---@param drawOnTop any
function gameplay_rally_snaproad:_drawDebugDefault(adjustH, clrOverride, prismWidth, drawOnTop) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:334
---@param adjustH any
---@param prismWidth any
---@param drawOnTop any
function gameplay_rally_snaproad:_drawDebugPartition(adjustH, prismWidth, drawOnTop) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:161
---@param partition any
---@param clr any
---@param prismWidth any
---@param drawOnTop any
function gameplay_rally_snaproad:_drawDebugPartitionAllPrisms(partition, clr, prismWidth, drawOnTop) end

--- this is used for Ctrl+click to create new pacenote.
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:258
---@param prismWidth any
---@param drawOnTop any
function gameplay_rally_snaproad:_drawDebugPartitionsAll(prismWidth, drawOnTop) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:122
---@param points any
---@param clr any
---@param alpha any
---@param adjustH any
---@param globalOpacity any
---@param prismWidth any
---@param fromLocation any
---@param toLocation any
---@param drawOnTop any
function gameplay_rally_snaproad:_drawDebugPointPrisms(points, clr, alpha, adjustH, globalOpacity, prismWidth, fromLocation, toLocation, drawOnTop) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:205
---@param points any
---@param clr any
---@param alpha any
---@param radius any
---@param adjustH any
---@param globalOpacity any
function gameplay_rally_snaproad:_drawDebugPoints(points, clr, alpha, radius, adjustH, globalOpacity) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:233
---@param points any
---@param clr any
---@param alpha any
---@param radius any
---@param adjustH any
---@param globalOpacity any
---@param h any
function gameplay_rally_snaproad:_drawDebugPointsCyl(points, clr, alpha, radius, adjustH, globalOpacity, h) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:587
---@param useAllPoints any
function gameplay_rally_snaproad:_indexForPoints(useAllPoints) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:583
function gameplay_rally_snaproad:_invalidateFilterPointIndex() end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:570
function gameplay_rally_snaproad:_operativePoints() end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1206
---@param fromPoint any
---@param toPoint any
---@param fromLoc any
---@param toLoc any
function gameplay_rally_snaproad:_partitionPoints(fromPoint, toPoint, fromLoc, toLoc) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:578
function gameplay_rally_snaproad:_rebuildAllPointIndex() end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:757
---@param entries any
function gameplay_rally_snaproad:_repairPacenoteProjectionEntries(entries) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:739
---@param snapshotPn any
---@param key any
---@param fallbackWp any
function gameplay_rally_snaproad:_snapshotWaypoint(snapshotPn, key, fallbackWp) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:712
---@param pos any
---@param meters any
---@param fwd any
---@param limitPoints any
---@param useAllPoints any
function gameplay_rally_snaproad:advanceAlongRoute(pos, meters, fwd, limitPoints, useAllPoints) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1314
function gameplay_rally_snaproad:clearAll() end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1409
function gameplay_rally_snaproad:clearFilter() end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1196
function gameplay_rally_snaproad:clearPartition() end

--- source_pos - should be a vec3
---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:954
---@param source_pos any
---@param useAllPoints any
function gameplay_rally_snaproad:closestSnapPoint(source_pos, useAllPoints) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:959
---@param source_pos any
function gameplay_rally_snaproad:closestSnapPos(source_pos) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:875
---@param source_pos any
---@param useAllPoints any
function gameplay_rally_snaproad:closestSnapResult(source_pos, useAllPoints) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:628
---@param a any
---@param b any
function gameplay_rally_snaproad:compareRouteLocations(a, b) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1043
---@param fromPoint any
---@param meters any
---@param limitPoints any
function gameplay_rally_snaproad:distanceBackwards(fromPoint, meters, limitPoints) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1070
---@param fromPos any
---@param meters any
---@param limitPoints any
function gameplay_rally_snaproad:distanceBackwardsResult(fromPos, meters, limitPoints) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:733
---@param posA any
---@param posB any
---@param useAllPoints any
function gameplay_rally_snaproad:distanceBetweenPositions(posA, posB, useAllPoints) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:637
---@param a any
---@param b any
function gameplay_rally_snaproad:distanceBetweenRouteLocations(a, b) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1074
---@param fromPoint any
---@param meters any
---@param limitPoints any
function gameplay_rally_snaproad:distanceForwards(fromPoint, meters, limitPoints) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1106
---@param fromPos any
---@param meters any
---@param limitPoints any
function gameplay_rally_snaproad:distanceForwardsResult(fromPos, meters, limitPoints) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:399
function gameplay_rally_snaproad:drawDebugCameraPlaying() end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:282
---@param window any
---@param prismWidth any
---@param drawOnTop any
function gameplay_rally_snaproad:drawDebugPartitionsAllWindow(window, prismWidth, drawOnTop) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:391
function gameplay_rally_snaproad:drawDebugRecceApp() end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:379
---@param clrOverride any
---@param prismWidth any
---@param drawOnTop any
function gameplay_rally_snaproad:drawDebugSnaproad(clrOverride, prismWidth, drawOnTop) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:558
function gameplay_rally_snaproad:driveline() end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1113
function gameplay_rally_snaproad:firstSnapPoint() end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:997
---@param point any
function gameplay_rally_snaproad:forwardNormalVec(point) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:464
---@param points any
function gameplay_rally_snaproad:groupPointsByCornerCall(points) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:68
---@param driveline any
function gameplay_rally_snaproad:init(driveline) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:362
function gameplay_rally_snaproad:measurePartition() end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:601
function gameplay_rally_snaproad:minAdjacentWaypointDistance() end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1143
---@param srcPos any
function gameplay_rally_snaproad:nextSnapPoint(srcPos) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1139
---@param srcPos any
function gameplay_rally_snaproad:nextSnapPos(srcPos) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:987
---@param point any
function gameplay_rally_snaproad:normalAlignPoints(point) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:643
---@param result any
function gameplay_rally_snaproad:normalForSnapResult(result) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1629
function gameplay_rally_snaproad:partitionAllEnabled() end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1329
---@param notebook any
function gameplay_rally_snaproad:partitionAllPacenotes(notebook) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1621
function gameplay_rally_snaproad:playCameraPath() end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1001
---@param fromPoint any
---@param steps any
---@param limitPoints any
function gameplay_rally_snaproad:pointsBackwards(fromPoint, steps, limitPoints) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1576
---@param bufferBeforeMeters any
---@param bufferAfterMeters any
function gameplay_rally_snaproad:pointsForCameraPath(bufferBeforeMeters, bufferAfterMeters) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1022
---@param fromPoint any
---@param steps any
---@param limitPoints any
function gameplay_rally_snaproad:pointsForwards(fromPoint, steps, limitPoints) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:659
---@param distanceAlongRoute any
---@param useAllPoints any
function gameplay_rally_snaproad:positionAtDistanceAlongRoute(distanceAlongRoute, useAllPoints) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1121
---@param srcPos any
function gameplay_rally_snaproad:prevSnapPoint(srcPos) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1117
---@param srcPos any
function gameplay_rally_snaproad:prevSnapPos(srcPos) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:843
---@param notebook any
---@param previousSnaproad any
---@param snapshot any
function gameplay_rally_snaproad:reprojectPacenoteWaypoints(notebook, previousSnaproad, snapshot) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:799
---@param notebook any
---@param snapshot any
function gameplay_rally_snaproad:reprojectPacenoteWaypointsFromSnapshot(notebook, snapshot) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:610
---@param point any
function gameplay_rally_snaproad:routeLocationForPoint(point) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1455
---@param wp any
function gameplay_rally_snaproad:setFilter(wp) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1435
---@param point any
function gameplay_rally_snaproad:setFilterPartitionPoint(point) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1417
function gameplay_rally_snaproad:setFilterToAllPartitions() end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:112
---@param globalOpacity any
function gameplay_rally_snaproad:setGlobalOpacity(globalOpacity) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1565
function gameplay_rally_snaproad:setPartitionToFilter() end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1183
---@param pn any
function gameplay_rally_snaproad:setPartitionToPacenote(pn) end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1625
function gameplay_rally_snaproad:stopCameraPath() end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1633
function gameplay_rally_snaproad:toggleCornerCalls() end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:605
function gameplay_rally_snaproad:totalRouteLength() end

---Source : lua/ge/extensions/gameplay/rally/snaproad.lua:1161
---@param pn any
function gameplay_rally_snaproad:updateHalfpoint(pn) end

