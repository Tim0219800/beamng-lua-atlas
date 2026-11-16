# `gameplay_markers_missionMarker`

*File: `lua/ge/extensions/gameplay/markers/missionMarker.lua` · VM: Game Engine (GE) · 534 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_markers_missionMarker`: `extensions.load("gameplay_markers_missionMarker")`, then the global `gameplay_markers_missionMarker`

Mission marker in play mode: an icon (exclamation mark by default) floating above a point, linked to the ground by a line, plus two ground decals (a dot and a ring). When the player approaches, the icon fades in; when their vehicle touches the marker's sphere (fixed radius 1.2 m), the ring lights up and the marker becomes interactive (list of the cluster's missions). Several nearby missions (less than 3 m) are merged into a single cluster with a numbered icon. The module returns {create, cluster}.

## Notes

- Two icon renderings: the C++ icon renderer (default) or render_skiaIcons if the local variable useSkiaIcons is true; it is false in this file, so the Skia path is inactive; changing it only takes effect when markers are created.
- Fixed radius hardcodedRadius = 1.2 m for the zone and the presence test; cluster merging uses a radius of 1.5 m (two POIs merge if squared distance < (1.5 + 1.5)^2).
- merge: sorts the POIs by descending date (data.date), icon = mission_no-NN_triangle (NN = min(count, 9)) if several; if the iconFontIcon values differ, markerText = number of missions ("9+" beyond 9). visibleBySetting = "showMissionMarkers"; visibilityRadius = radius + 5.
- POIs must provide markerInfo.missionMarker.{pos, rot, icon, iconFontIcon} and data.
- Display distances: icon up to 50 m (100 m if the cluster is in focus), decals up to 40 m; everything fades out when the big map is active or when a mission is in the foreground (globalAlpha).
- isInAreaChanged ("in"/"out") is only updated when the player is walking (data.isWalking); the vehicle triggers the interaction via interactInPlayMode.
- The icon mesh (iconMesh / createObject) is present but its call in createObjects is commented out: iconMeshId stays nil.
- setVisibilityInBigmap and instantFade are empty methods.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_markers_missionMarker.cluster(pois, allClusters)` | Groups overlapping missionMarker POIs (quadtree, radius 1.5 m) and adds one merged cluster per group to allClusters. *(internal)* | 488 |
| `gameplay_markers_missionMarker.create(...)` | Builds a mission marker (instance of C). | 436 |

### Parameter details

#### `gameplay_markers_missionMarker.cluster(pois, allClusters)`

Groups overlapping missionMarker POIs (quadtree, radius 1.5 m) and adds one merged cluster per group to allClusters.

- `pois` (*table[]*) : POIs with markerInfo.missionMarker.
- `allClusters` (*table[]*) : List of clusters completed in place.

#### `gameplay_markers_missionMarker.create(...)`

Builds a mission marker (instance of C).

- `...` (*any*) : Arguments passed to C:init (unused).
- **returns**: table Marker instance.

## Class `C`

Mission marker with icon, line and decals.

| Method | Description | Line |
|---|---|---|
| `C:clearObjects()` | Frees the icon (Skia or icon renderer), removes the mesh if any and clears the references. | 387 |
| `C:createObject(shapeName, objectName)` | Creates and registers a TSStatic object with instance color; utility not used by default. | 318 |
| `C:createObjects()` | Cleans up existing objects (the mesh creation is commented out). | 333 |
| `C:drawOnMinimap(td, dpi)` | Draws a blue triangle marker on the minimap (GAMEPLAY_MARKERS layer). | 428 |
| `C:hide()` | Becomes invisible, resets the smoothers and makes the icon transparent immediately. | 345 |
| `C:init()` | Assigns an id, default radius 1.2 m and creates the smoothers; visible = true. | 61 |
| `C:instantFade(visible)` | Does nothing. | 380 |
| `C:interactInPlayMode(interactData, interactableElements)` | If canInteract and the vehicle touches the sphere, adds the data (elemData) of the cluster's missions to the interactive elements. | 414 |
| `C:playerIsInArea(data)` | Tests whether the oriented bounding box of the player's vehicle overlaps the marker's sphere (overlapsOBB_Sphere). | 86 |
| `C:setVisibilityInBigmap(vis, instant)` | Does nothing. | 383 |
| `C:setup(cluster)` | Stores pos and cluster, creates the icon (cluster.icon or poi_exclamationmark; or Skia icon), initializes the smoothers and creates groundDecalData (dot_128 dot and outline_512 ring). | 250 |
| `C:show()` | Becomes visible again. | 375 |
| `C:update(data)` | Every frame: computes distances, hides the icon behind geometry (ray), animates the icon's opacity and height, draws the line to the ground, drives the opacity of the ground dot and ring and updates isInAreaChanged. | 100 |

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawLineInstance`
- `obj:` `registerObject`, `setField`, `setPosition`
- `scenetree.` `findObjectById`

**Loads extensions:** `render_skiaIcons`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/markers/missionMarker.lua`.*
