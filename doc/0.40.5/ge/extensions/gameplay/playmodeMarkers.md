# `gameplay_playmodeMarkers`

*File: `lua/ge/extensions/gameplay/playmodeMarkers.lua` · VM: Game Engine (GE) · 219 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_playmodeMarkers`: `extensions.load("gameplay_playmodeMarkers")`, then the global `gameplay_playmodeMarkers`

Manages game markers in freeroam/career (missions, parkings, zones, gas stations, etc.). It groups the raw POIs of gameplay_rawPois into clusters by marker type (factories in gameplay/markers/<type>.lua), creates a cluster's marker object on demand, and provides the two icon renderers (BeamNGWorldIconsRenderer) for the world and the big map. A 2D kd-tree is used to find the visible clusters around a position.

## Notes

- Clusters are invalidated as soon as gameplay_rawPois.getRawPoiGeneration() increases.
- Marker types handled: missionMarker, parkingMarker, zoneMarker, walkingMarker, gasStationMarker, driftLineMarker, invisibleTrigger, inspectVehicleMarker, crawlMarker, vehicleTrigger (hardcoded list).
- Both icon renderers are deleted at the end of the level and at serialization (Lua reload).
- The icon renderers are created lazily by the getters; the world renderer loads the core/art/gui/images/iconAtlas atlas.

**Dependencies (loaded first):** `gameplay_rawPois`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_playmodeMarkers.clear()` | Clears the clusters, the kd-tree and deletes the created marker objects. | 49 |
| `gameplay_playmodeMarkers.getBigmapRendererId()` | Id of the big map icon renderer 'bigmapIconRenderer' (created if needed). | 102 |
| `gameplay_playmodeMarkers.getBigmapRendererObj()` | Big map icon renderer object (created if needed). | 106 |
| `gameplay_playmodeMarkers.getIconRendererId()` | Id of the BeamNGWorldIconsRenderer object 'markerIconRenderer' (created if needed). | 94 |
| `gameplay_playmodeMarkers.getIconRendererObj()` | World icon renderer object (created if needed). | 98 |
| `gameplay_playmodeMarkers.getMarkerForCluster(cluster)` | Returns the cluster's marker object; creates it on the first call (cluster.create(), createObjects, setup). | 178 |
| `gameplay_playmodeMarkers.getPlaymodeClusters()` | List, sorted by id, of the marker clusters of the current level (computed then cached). Each cluster must have id, visibilityPos and visibilityRadius, otherwise an error is logged. | 153 |
| `gameplay_playmodeMarkers.getPlaymodeClustersAsQuadtree()` | 2D kd-tree (kdtreebox2d) of the clusters, indexed by a box enclosing visibilityPos ± visibilityRadius. | 164 |
| `gameplay_playmodeMarkers.isStateWithPlaymodeMarkers()` | Indicates whether the current game state is in validPlaymodeMarkersStates. | 196 |
| `gameplay_playmodeMarkers.onClientEndMission()` | Level end hook: clears clusters and markers, deletes the icon renderers. *(internal)* *(hook)* | 205 |
| `gameplay_playmodeMarkers.onClientStartMission()` | Level start hook: creates the two icon renderers. *(internal)* *(hook)* | 79 |
| `gameplay_playmodeMarkers.onSerialize()` | Hook before Lua reload: same cleanups as onClientEndMission. *(internal)* *(hook)* | 211 |

### Parameter details

#### `gameplay_playmodeMarkers.getBigmapRendererId()`

Id of the big map icon renderer 'bigmapIconRenderer' (created if needed).

- **returns**: integer Object id.

#### `gameplay_playmodeMarkers.getBigmapRendererObj()`

Big map icon renderer object (created if needed).

- **returns**: userdata|nil Scene object.

#### `gameplay_playmodeMarkers.getIconRendererId()`

Id of the BeamNGWorldIconsRenderer object 'markerIconRenderer' (created if needed).

- **returns**: integer Object id.

#### `gameplay_playmodeMarkers.getIconRendererObj()`

World icon renderer object (created if needed).

- **returns**: userdata|nil Scene object.

#### `gameplay_playmodeMarkers.getMarkerForCluster(cluster)`

Returns the cluster's marker object; creates it on the first call (cluster.create(), createObjects, setup).

- `cluster` (*table*) : Cluster from getPlaymodeClusters.
- **returns**: table Marker object.

#### `gameplay_playmodeMarkers.getPlaymodeClusters()`

List, sorted by id, of the marker clusters of the current level (computed then cached). Each cluster must have id, visibilityPos and visibilityRadius, otherwise an error is logged.

- **returns**: table[] Clusters.

#### `gameplay_playmodeMarkers.getPlaymodeClustersAsQuadtree()`

2D kd-tree (kdtreebox2d) of the clusters, indexed by a box enclosing visibilityPos ± visibilityRadius.

- **returns**: table Built kd-tree object.

#### `gameplay_playmodeMarkers.isStateWithPlaymodeMarkers()`

Indicates whether the current game state is in validPlaymodeMarkersStates.

- **returns**: boolean true if markers are allowed.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'gameplay_rawPois'}, extension loaded beforehand. |
| `validPlaymodeMarkersStates` | table<string, boolean> | Game states where markers are active: freeroam and career. Modifiable to add more. |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/playmodeMarkers.lua`.*
