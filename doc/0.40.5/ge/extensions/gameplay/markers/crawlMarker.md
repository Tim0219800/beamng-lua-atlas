# `gameplay_markers_crawlMarker`

*File: `lua/ge/extensions/gameplay/markers/crawlMarker.lua` · VM: Game Engine (GE) · 276 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_markers_crawlMarker`: `extensions.load("gameplay_markers_crawlMarker")`, then the global `gameplay_markers_crawlMarker`

Crawling zone marker (rock crawling) in play mode: a floating icon above a spherical zone. The player's vehicle entering the sphere (center of its bounding box within radius, 2 m by default) raises the icon and makes it interactive (list of activities to accept). The module returns {create, cluster}: cluster groups the crawlMarker POIs, create builds the marker object (class C).

## Notes

- cluster groups the POIs with the same pos and the same iconPos (key = tostring(pos)..tostring(iconPos)); the default icon is mission_rockcrawling01_triangle.
- POIs must provide markerInfo.crawlMarker with pos, radius, iconPos and icon (optional); cluster.elemData takes poi.data of each POI.
- The icon is only visible if the camera is within 35 m and a static ray (castRayStatic) does not hit an obstacle; it is hidden when the big map is active.
- isInAreaChanged is "in" or "out" for one frame when entering/leaving a zone, otherwise nil.
- update does nothing if the player has no vehicle (data.veh nil); walking is not required.
- drawAxisBox draws a debug box (debugDrawer) but is not called anywhere in this file.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_markers_crawlMarker.cluster(pois, allClusters)` | Groups identical crawlMarker POIs (same pos and iconPos) into clusters and adds them to allClusters. *(internal)* | 245 |
| `gameplay_markers_crawlMarker.create(...)` | Builds a crawling marker object (instance of C) and calls init. | 236 |

### Parameter details

#### `gameplay_markers_crawlMarker.cluster(pois, allClusters)`

Groups identical crawlMarker POIs (same pos and iconPos) into clusters and adds them to allClusters.

- `pois` (*table[]*) : POIs with markerInfo.crawlMarker.
- `allClusters` (*table[]*) : List of clusters completed in place.

#### `gameplay_markers_crawlMarker.create(...)`

Builds a crawling marker object (instance of C) and calls init.

- `...` (*any*) : Arguments passed to C:init (unused).
- **returns**: table Marker instance.

## Class `C`

Crawling zone marker with animated icon.

| Method | Description | Line |
|---|---|---|
| `C:clearObjects()` | Removes the icon from the icon renderer and clears triggerArea. | 145 |
| `C:createObjects()` | Cleans up existing objects (does not create new ones). | 123 |
| `C:drawAxisBox(corner, x, y, z, clr)` | Draws an axis-aligned box (semi-transparent edges and faces) via debugDrawer; debug utility. | 170 |
| `C:drawOnMinimap(td)` | Draws a circle at the icon's position on the minimap (ui_apps_minimap_utils.simpleCircle). | 228 |
| `C:hide()` | Becomes invisible and sets the icon opacity to 0. | 127 |
| `C:init()` | Initializes visible = true. | 22 |
| `C:instantFade(visible)` | Does nothing. | 166 |
| `C:interactInPlayMode(interactData, interactableElements)` | If canInteract and the player is in the zone, adds the cluster's data (elemData) to the list of interactive elements. | 156 |
| `C:setup(cluster)` | Reads pos, rot, scl from the cluster and creates the icon (id <cluster.id>-gsIcon) with its smoothers; icon offset 0.5 m, lift 1.0 m. | 26 |
| `C:show()` | Becomes visible again. | 140 |
| `C:update(data)` | Every frame: tests entry into the sphere, animates the icon's height and opacity, draws a line when the icon is raised, updates isInAreaChanged, anyOverlap. | 65 |

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/markers/crawlMarker.lua`.*
