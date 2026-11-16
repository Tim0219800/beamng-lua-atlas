# `gameplay_markers_vehicleTrigger`

*File: `lua/ge/extensions/gameplay/markers/vehicleTrigger.lua` · VM: Game Engine (GE) · 241 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_markers_vehicleTrigger`: `extensions.load("gameplay_markers_vehicleTrigger")`, then the global `gameplay_markers_vehicleTrigger`

"Doors" marker for vehicles (for example the entrance of a garage or workshop) in play mode. Each door is a pair of scene objects (zone, icon): when the bounding box of the player's vehicle overlaps a zone, the icon rises slightly, an optional 3D screen is displayed for 5 s with a career computer sound, and the marker becomes interactive. The module returns {create, cluster}.

## Notes

- cluster: one per POI (id 'vehicleTrigger#<poi.id>'). Reads poi.markerInfo.vehicleTrigger.{doors, icon, iconLift, iconOffsetHeight, pos, radius, screens}; default icon poi_exclamationmark_round, default radius 6 m.
- doors = list of {zoneObjectName, iconObjectName, maxVisibleDistance?}; default max visible distance 15 m. screens[idx] is the name of a scene object displayed next to door idx.
- The overlap test only applies to the player's vehicle (data.veh); if a door overlaps the vehicle, all doors are marked as overlapped (anyOverlap).
- The icon is only visible if the camera is close enough and without a static obstacle (castRayStatic); outside the big map.
- isInAreaChanged is "in"/"out" for one frame.
- Without prior setup (doors nil), several methods iterate over {} for safety; hide() however assumes area.iconInfo exists when the icon renderer is available.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_markers_vehicleTrigger.cluster(pois, allClusters)` | Turns each vehicleTrigger POI into a distinct cluster and adds it to allClusters. *(internal)* | 216 |
| `gameplay_markers_vehicleTrigger.create(...)` | Builds a doors marker (instance of C). | 208 |

### Parameter details

#### `gameplay_markers_vehicleTrigger.cluster(pois, allClusters)`

Turns each vehicleTrigger POI into a distinct cluster and adds it to allClusters.

- `pois` (*table[]*) : POIs with markerInfo.vehicleTrigger.
- `allClusters` (*table[]*) : List of clusters completed in place.

#### `gameplay_markers_vehicleTrigger.create(...)`

Builds a doors marker (instance of C).

- `...` (*any*) : Arguments passed to C:init (unused).
- **returns**: table Marker instance.

## Class `C`

Doors marker for vehicles.

| Method | Description | Line |
|---|---|---|
| `C:clearObjects()` | Removes the icons, hides the screens and clears the door list. | 171 |
| `C:createObjects()` | Cleans up existing objects (does not create any). | 144 |
| `C:drawOnMinimap(td)` | Draws a circle on the minimap at the position of each door icon. | 202 |
| `C:hide()` | Becomes invisible, makes the icons transparent and hides the screens. | 148 |
| `C:init()` | Initializes visible = true. | 19 |
| `C:instantFade(visible)` | Does nothing. | 195 |
| `C:interactInPlayMode(interactData, interactableElements)` | If canInteract and a door overlaps the vehicle, adds the cluster's data (elemData) to the interactive elements. | 187 |
| `C:setHidden(value)` | Does nothing. | 198 |
| `C:setup(cluster)` | For each door, finds the zone object and the icon object in the scene, computes the zone's box, hides the associated screen and creates the icon (id <cluster.id>-vtIcon-<idx>). | 23 |
| `C:show()` | Becomes visible again. | 166 |
| `C:update(data)` | Every frame: tests the OBB/OBB overlap with the vehicle, handles the timer and the display of screens, animates the icons' height and opacity, draws a line, updates isInAreaChanged and anyOverlap. | 79 |

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/markers/vehicleTrigger.lua`.*
