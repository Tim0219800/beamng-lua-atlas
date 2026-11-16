---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/obstaclePlacer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Places the obstacles of a Track Builder track. The predefined-shape obstacles (sharp1, sharp2, obstacle1, obstacle2: .dae files from the GridMap level) are TSStatic objects that are reused and resized dynamically. The procedural obstacles (ring, cube, cylinder, cone, bump, ramp) are ProceduralMesh objects created by proceduralPrimitives, one or more per segment.
--- Access: extension `util_trackBuilder_obstaclePlacer`: `extensions.load("util_trackBuilder_obstaclePlacer")`, then the global `util_trackBuilder_obstaclePlacer`
---@class util_trackBuilder_obstaclePlacer
util_trackBuilder_obstaclePlacer = {}

--- Forgets the stored obstacle TSStatic objects (empties the lists without deleting the objects from the scene). Call when the scene is cleared.
---Source: lua/ge/extensions/util/trackBuilder/obstaclePlacer.lua:172
function util_trackBuilder_obstaclePlacer.clearReferences() end

--- Places all the predefined obstacles of the track (creating or deleting TSStatic objects as needed), then calls placeProceduralObstacles for each segment.
---Source: lua/ge/extensions/util/trackBuilder/obstaclePlacer.lua:135
---@param track table[] Ordered list of segments/pieces with their obstacles, points, markerInfo, startLength, endLength fields.
function util_trackBuilder_obstaclePlacer.placeObstacles(track) end

--- Creates, adjusts or deletes a segment's obstacle ProceduralMesh objects, generates their mesh according to the type (ring, cube, cylinder, cone, bump, ramp), positions and orients them. Does nothing if segment.obstaclesChanged is false.
---Source: lua/ge/extensions/util/trackBuilder/obstaclePlacer.lua:72
---@param segment table Segment with obstacles, obstaclesChanged, index, procObstacles, procObstacleIndexes.
function util_trackBuilder_obstaclePlacer.placeProceduralObstacles(segment) end

