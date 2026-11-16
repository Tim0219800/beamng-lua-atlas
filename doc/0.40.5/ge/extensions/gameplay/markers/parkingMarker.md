# `gameplay_markers_parkingMarker`

*File: `lua/ge/extensions/gameplay/markers/parkingMarker.lua` · VM: Game Engine (GE) · 544 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_markers_parkingMarker`: `extensions.load("gameplay_markers_parkingMarker")`, then the global `gameplay_markers_parkingMarker`

Parking spot marker in play mode (for example to deliver or drop off a vehicle): a striped decal on the ground, a 3D outline (park_outline_marker.dae) whose height and opacity depend on speed, and a floating icon (poi_parking_rect by default). The player's vehicle is "parked" when its bounding box overlaps (overlap mode) or is contained in (contained mode) the spot, within 15 m and below about 20 km/h; the marker then becomes interactive. The module returns {create, cluster}.

## Notes

- mode of a cluster: "overlap" (default, the vehicle's box touches a centered 1 m x 1 m box) or "contained" (the vehicle must fit entirely in the spot enlarged by 1 m in x/y).
- cluster groups the POIs by path (markerInfo.parkingMarker.path); without a path, they go in the "noPath" group. The POIs take pos, rot, scl, mode, icon, focus from the first POI of the group; visibilityRadius = 5.
- Bug: cluster computes count = #poisByPath on a string-keyed table: the value is always 0, so the condition count > 1 is false and the numbered icon (poi_no-0N) is never used.
- Bug: C:setup reads the global variable parkDelay, never defined in this file: self.stopTimer is nil.
- distance is a local variable of the module shared by all markers (updated by checkParking just before update); distanceToHeight ignores its argument and reads this variable.
- Distances: the icon appears within 60 m (farDist) when not in focus and rises above the vehicle within 15 m (nearDist); with focus it stays displayed from afar with a bounce.
- The ground decal is provided in groundDecalData (texture parkDecalStripes.png) and drawn by the marker manager; its fade distance grows by 20 m when the vehicle is parked.
- isInAreaChanged is "in"/"out" for one frame; the drawAxisBox function and the old hexagonal version of drawOnMinimap (commented out) are not used.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_markers_parkingMarker.cluster(pois, allClusters)` | Groups the parkingMarker POIs by identical path and adds one cluster per group to allClusters. *(internal)* | 497 |
| `gameplay_markers_parkingMarker.create(...)` | Builds a parking spot marker (instance of C). | 487 |

### Parameter details

#### `gameplay_markers_parkingMarker.cluster(pois, allClusters)`

Groups the parkingMarker POIs by identical path and adds one cluster per group to allClusters.

- `pois` (*table[]*) : POIs with markerInfo.parkingMarker {path, pos, rot, scl, mode, icon, focus}.
- `allClusters` (*table[]*) : List of clusters completed in place.

#### `gameplay_markers_parkingMarker.create(...)`

Builds a parking spot marker (instance of C).

- `...` (*any*) : Arguments passed to C:init (unused).
- **returns**: table Marker instance.

## Class `C`

Parking spot marker.

| Method | Description | Line |
|---|---|---|
| `C:checkParking(data)` | Computes the player/camera distance to the spot and determines overlap (and parked) according to the mode, within 15 m and below the cruising speed; sets the distance to 0 if parked. | 257 |
| `C:clearObjects()` | Removes the outline (notifies the editor if present) and the floating icon. | 329 |
| `C:createObject(shapeName, objectName)` | Creates and registers a TSStatic with instance color (used for the outline). | 288 |
| `C:createObjects()` | Cleans up existing objects (does not create new ones; the outline is created in setup). | 302 |
| `C:drawAxisBox(corner, x, y, z, clr)` | Draws a debug box (edges and faces) via debugDrawer; not used here. | 430 |
| `C:drawOnMinimap(td)` | Draws a blue circle at the spot's position on the minimap. | 368 |
| `C:hide()` | Becomes invisible, makes the outline and the icon transparent. | 306 |
| `C:init()` | Assigns a numId and creates the smoothers (icon position, cruising, opacity, distance, overlap); visible = true. | 26 |
| `C:instantFade(visible)` | Does nothing. | 360 |
| `C:interactInPlayMode(interactData, interactableElements)` | If canInteract and the vehicle is parked, adds the cluster's data (elemData) to the interactive elements. | 352 |
| `C:setup(cluster)` | Reads pos, rot, scl, mode from the cluster, computes the half-axes of the test box, creates the outline object (TSStatic) positioned and scaled on the spot, the icon and the ground decal. | 41 |
| `C:show()` | Becomes visible again and forces the outline update. | 323 |
| `C:update(data)` | Every frame: calls checkParking, animates the icon's height and opacity, draws the line to the ground, adjusts the outline's height and opacity, updates isInAreaChanged and the decal's fade distance. | 135 |

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawLineInstance`, `drawTriSolid`
- `obj:` `registerObject`, `setField`, `setPosition`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/markers/parkingMarker.lua`.*
