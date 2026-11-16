# `gameplay_markers_inspectVehicleMarker`

*File: `lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua` · VM: Game Engine (GE) · 274 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_markers_inspectVehicleMarker`: `extensions.load("gameplay_markers_inspectVehicleMarker")`, then the global `gameplay_markers_inspectVehicleMarker`

"Inspect a vehicle" marker in play mode (for example a vehicle to examine at a dealer): a floating icon (poi_parking_rect by default) linked to the ground by a line, which rises above the player's vehicle when it is within the radius. In the zone, the marker makes its POI interactive (the POI's data). A "focus" version stays visible from afar with a small bounce. The module returns {create, cluster}.

## Notes

- cluster: one cluster per POI (no merging), id 'inspectVehicleMarker#<poi.id>', data = poi.data; reads poi.markerInfo.inspectVehicleMarker.{pos, radius, icon, focus}; visibilityRadius = 0.
- Distances: the icon only appears within 60 m (farDist) when not in focus; it rises from 15 m (nearDist); in focus, the size decreases from 1 to 0.65 between 100 and 1000 m, the opacity drops to 0.35 below 750 m if the icon is hidden.
- If the free camera is active, distances are measured from the camera, otherwise from the player's position.
- The icon is hidden by static obstacles between the camera and the icon (castRayStatic).
- isInAreaChanged is "in" or "out" for one frame when the inside/outside state changes.
- The constants smallScaleDist/bigScaleDist/iconHeightBottom are used by update; the function distanceToHeight calls linearScale(dist, 15, 700, 1.0, 500).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_markers_inspectVehicleMarker.cluster(pois, allClusters)` | Turns each inspectVehicleMarker POI into a distinct cluster and adds it to allClusters. *(internal)* | 248 |
| `gameplay_markers_inspectVehicleMarker.create(...)` | Builds a vehicle inspection marker (instance of C). | 239 |

### Parameter details

#### `gameplay_markers_inspectVehicleMarker.cluster(pois, allClusters)`

Turns each inspectVehicleMarker POI into a distinct cluster and adds it to allClusters.

- `pois` (*table[]*) : POIs with markerInfo.inspectVehicleMarker.
- `allClusters` (*table[]*) : List of clusters completed in place.

#### `gameplay_markers_inspectVehicleMarker.create(...)`

Builds a vehicle inspection marker (instance of C).

- `...` (*any*) : Arguments passed to C:init (unused).
- **returns**: table Marker instance.

## Class `C`

Vehicle inspection marker with animated icon.

| Method | Description | Line |
|---|---|---|
| `C:clearObjects()` | Removes the icon from the icon renderer. | 42 |
| `C:createObjects()` | Cleans up existing objects (does not create any). | 38 |
| `C:hide()` | Becomes invisible and sets the icon opacity to 0. | 52 |
| `C:init()` | Assigns an id and creates the smoothers (position, cruising, opacity, distance); visible = true. | 26 |
| `C:interactInPlayMode(interactData, interactableElements)` | If canInteract and the player is in the zone, adds cluster.data to the interactive elements. | 231 |
| `C:setup(cluster)` | Stores cluster, pos, radius, focus, resets the smoothers and creates the icon with initial opacity 0. | 202 |
| `C:show()` | Becomes visible again. | 63 |
| `C:update(data)` | Every frame: computes the distance, animates the icon's height (above the player's vehicle if it is inside), handles perspective in focus mode, adjusts size and opacity, draws the line to the ground (debugDrawer) and updates _inside and isInAreaChanged. | 86 |

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawLineInstance`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua`.*
