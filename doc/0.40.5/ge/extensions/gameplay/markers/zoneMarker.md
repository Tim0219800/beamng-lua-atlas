# `gameplay_markers_zoneMarker`

*File: `lua/ge/extensions/gameplay/markers/zoneMarker.lua` · VM: Game Engine (GE) · 77 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_markers_zoneMarker`: `extensions.load("gameplay_markers_zoneMarker")`, then the global `gameplay_markers_zoneMarker`

Zone marker without visual: makes a POI interactive when the player's vehicle (the four ground corners of its bounding box) is entirely inside one of the given zone polygons. No icon or decal is drawn. The module returns {create, cluster}; each zoneMarker POI forms its own cluster.

## Notes

- cluster: one per POI (id 'zoneMarker#<poi.id>'). Reads poi.markerInfo.zoneMarker.{zones, pos, radius}; elemData = {poi.data}.
- interactInPlayMode does nothing if the player is walking (interactData.isWalking). The vehicle's 2D distance to the center must be <= radius + 2 m, then points 1, 4, 5 and 8 of bbPoints (bottom or top corners of the box, inferred from code) must all be in a zone (containsPoint2D).
- The 'inside' result is evaluated even without canInteract; adding to the interactive elements requires canInteract.
- All the other methods (update, hide, show, createObjects, clearObjects, setHidden, instantFade) are empty.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_markers_zoneMarker.cluster(pois, allClusters)` | Turns each zoneMarker POI into a distinct cluster (no merging) and adds it to allClusters. *(internal)* | 57 |
| `gameplay_markers_zoneMarker.create(...)` | Builds a zone marker (instance of C). | 48 |

### Parameter details

#### `gameplay_markers_zoneMarker.cluster(pois, allClusters)`

Turns each zoneMarker POI into a distinct cluster (no merging) and adds it to allClusters.

- `pois` (*table[]*) : POIs with markerInfo.zoneMarker {zones, pos, radius}.
- `allClusters` (*table[]*) : List of clusters completed in place.

#### `gameplay_markers_zoneMarker.create(...)`

Builds a zone marker (instance of C).

- `...` (*any*) : Arguments passed to C:init (unused).
- **returns**: table Marker instance.

## Class `C`

Zone marker without rendering.

| Method | Description | Line |
|---|---|---|
| `C:clearObjects()` | Does nothing. | 24 |
| `C:createObjects()` | Does nothing. | 20 |
| `C:hide()` | Does nothing. | 21 |
| `C:init()` | Does nothing. | 7 |
| `C:instantFade(visible)` | Does nothing. | 23 |
| `C:interactInPlayMode(interactData, interactableElements)` | Adds the cluster's data (elemData) to the interactive elements if the vehicle is entirely in a zone and canInteract is true; no effect on foot. | 27 |
| `C:setHidden(value)` | Does nothing. | 19 |
| `C:setup(cluster)` | Stores zones, cluster, 2D center (visibilityPos with z = 0) and radius (visibilityRadius). | 12 |
| `C:show()` | Does nothing. | 22 |
| `C:update(data)` | Does nothing. | 9 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/markers/zoneMarker.lua`.*
