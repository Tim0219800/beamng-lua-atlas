# `util_trackBuilder_obstaclePlacer`

*File: `lua/ge/extensions/util/trackBuilder/obstaclePlacer.lua` · VM: Game Engine (GE) · 180 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_trackBuilder_obstaclePlacer`: `extensions.load("util_trackBuilder_obstaclePlacer")`, then the global `util_trackBuilder_obstaclePlacer`

Places the obstacles of a Track Builder track. The predefined-shape obstacles (sharp1, sharp2, obstacle1, obstacle2: .dae files from the GridMap level) are TSStatic objects that are reused and resized dynamically. The procedural obstacles (ring, cube, cylinder, cone, bump, ramp) are ProceduralMesh objects created by proceduralPrimitives, one or more per segment.

## Notes

- An obstacle o is a table with: value (type), variant, scale (vec3), position (vec3), rotation (quat), anchor, offset (0 to 1 along the segment, 1 = end marker), material, and extra (vec3) for bump and ramp. An obstacle is predefined if shapeNames[o.value..o.variant] exists.
- The position is computed from markerInfo (offset == 1 or no points), the first point (offset 0) or the point matching the interpolated length; width/2*(anchor-1) shifts it laterally.
- For predefined shapes, the scale is swapped to vec3(scale.y, scale.x, scale.z) and a 90° rotation around Z is applied.
- Objects are created with canSave = false and registered under the names '<type>Obstacle<n>' and 'procObstacle<index>x<n>'.
- placeProceduralObstacles does nothing if segment.obstaclesChanged is false. Detail: the flag is reset to false only if at least one procedural obstacle exists (procCount > 0), so it stays true otherwise.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_trackBuilder_obstaclePlacer.clearReferences()` | Forgets the stored obstacle TSStatic objects (empties the lists without deleting the objects from the scene). Call when the scene is cleared. | 172 |
| `util_trackBuilder_obstaclePlacer.placeObstacles(track)` | Places all the predefined obstacles of the track (creating or deleting TSStatic objects as needed), then calls placeProceduralObstacles for each segment. | 135 |
| `util_trackBuilder_obstaclePlacer.placeProceduralObstacles(segment)` | Creates, adjusts or deletes a segment's obstacle ProceduralMesh objects, generates their mesh according to the type (ring, cube, cylinder, cone, bump, ramp), positions and orients them. Does nothing if segment.obstaclesChanged is false. | 72 |

### Parameter details

#### `util_trackBuilder_obstaclePlacer.placeObstacles(track)`

Places all the predefined obstacles of the track (creating or deleting TSStatic objects as needed), then calls placeProceduralObstacles for each segment.

- `track` (*table[]*) : Ordered list of segments/pieces with their obstacles, points, markerInfo, startLength, endLength fields.

#### `util_trackBuilder_obstaclePlacer.placeProceduralObstacles(segment)`

Creates, adjusts or deletes a segment's obstacle ProceduralMesh objects, generates their mesh according to the type (ring, cube, cylinder, cone, bump, ramp), positions and orients them. Does nothing if segment.obstaclesChanged is false.

- `segment` (*table*) : Segment with obstacles, obstaclesChanged, index, procObstacles, procObstacleIndexes.

## Calls into the engine (C++)

- `obj:` `registerObject`, `setField`, `setPosition`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/trackBuilder/obstaclePlacer.lua`.*
