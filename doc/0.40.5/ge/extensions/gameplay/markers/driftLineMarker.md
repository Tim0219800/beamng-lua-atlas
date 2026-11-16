# `gameplay_markers_driftLineMarker`

*File: `lua/ge/extensions/gameplay/markers/driftLineMarker.lua` · VM: Game Engine (GE) · 134 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_markers_driftLineMarker`: `extensions.load("gameplay_markers_driftLineMarker")`, then the global `gameplay_markers_driftLineMarker`

Start line marker for freeroam drift challenges. It displays nothing itself: it makes the named scene objects (markerObjects) visible at setup, hides them at cleanup, and, when the player's vehicle enters the line's radius, calls gameplay_drift_freeroam_driftSpots.detectStart(lineId). The module returns {create, cluster}.

## Notes

- cluster: one cluster per POI (no merging), id 'driftLineMarker#<poi.id>'. Reads poi.markerInfo.driftLineMarker.{pos, radius, startDir, markerObjects} and poi.lineId; visibilityRadius = 0.
- setup assumes cluster.startDir is non-nil (computes the left and right of the line); without startDir, the function fails, whereas drawOnMinimap handles this case.
- interactWhileMoving is ignored when the player is walking (interactData.isWalking).
- The methods update, hide, show and createObjects are empty.
- clearObjects assumes self.cluster is defined (setup called beforehand).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_markers_driftLineMarker.cluster(pois, allClusters)` | Turns each driftLineMarker POI into a distinct cluster and adds it to allClusters. *(internal)* | 109 |
| `gameplay_markers_driftLineMarker.create(...)` | Builds a drift line marker (instance of C). | 100 |

### Parameter details

#### `gameplay_markers_driftLineMarker.cluster(pois, allClusters)`

Turns each driftLineMarker POI into a distinct cluster and adds it to allClusters.

- `pois` (*table[]*) : POIs with markerInfo.driftLineMarker.
- `allClusters` (*table[]*) : List of clusters completed in place.

#### `gameplay_markers_driftLineMarker.create(...)`

Builds a drift line marker (instance of C).

- `...` (*any*) : Arguments passed to C:init (unused).
- **returns**: table Marker instance.

## Class `C`

Drift start line marker.

| Method | Description | Line |
|---|---|---|
| `C:clearObjects()` | Hides (setHidden(true)) the scene objects listed in cluster.markerObjects. | 18 |
| `C:createObjects()` | Does nothing. | 14 |
| `C:drawOnMinimap(td)` | Draws on the minimap a line between the ends (or a circle if startDir is nil) in blue (72,125,249). | 90 |
| `C:hide()` | Does nothing. | 28 |
| `C:init()` | Assigns an incremental id to the instance. | 9 |
| `C:interactWhileMoving(interactData)` | Called every frame: if the player is in a vehicle within the radius, triggers gameplay_drift_freeroam_driftSpots.detectStart(lineId). | 75 |
| `C:setup(cluster)` | Stores cluster, pos, radius, lineId and startDir, computes the left and right ends of the line (at 0.7 times the radius) and makes the markerObjects visible. | 54 |
| `C:show()` | Does nothing. | 31 |
| `C:update()` | Does nothing (the debug drawing is commented out). | 35 |

## Calls into the engine (C++)

- `obj:` `setHidden`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/markers/driftLineMarker.lua`.*
