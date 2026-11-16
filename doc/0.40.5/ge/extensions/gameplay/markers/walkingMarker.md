# `gameplay_markers_walkingMarker`

*File: `lua/ge/extensions/gameplay/markers/walkingMarker.lua` · VM: Game Engine (GE) · 315 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_markers_walkingMarker`: `extensions.load("gameplay_markers_walkingMarker")`, then the global `gameplay_markers_walkingMarker`

"Doors" marker for the player on foot (building entrances, for example). Same principle as vehicleTrigger: each door is a pair of scene objects (zone, icon); the icon rises when the character enters the zone, an optional 3D screen is displayed for 5 s, and the marker becomes interactive. Unlike vehicleTrigger, the overlap is only tested if the player is walking (data.isWalking) and below the cruising speed. The module returns {create, cluster}.

## Notes

- cluster groups the POIs whose door name pairs (zone name + icon name, sorted) are identical; id 'walkingMarker#<concatenated names>'. Reads poi.markerInfo.walkingMarker.{doors, icon, iconLift, iconOffsetHeight, pos, radius, screens}; default icon poi_exclamationmark_round; elemData groups the poi.data.
- The cluster does not fill in pos or radius: only visibilityPos and visibilityRadius are defined, so setup uses the default null position for self.pos (used by the screen's sound).
- Icon ids are of the form <cluster.id>-gsIcon-<idx> (prefix reused from the gas station, no functional consequence).
- Each door is evaluated separately (overlap per door), unlike vehicleTrigger where the global result is applied to all doors.
- drawAxisBox is an unused debug utility.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_markers_walkingMarker.cluster(pois, allClusters)` | Groups the walkingMarker POIs with the same door names and adds one cluster per group to allClusters. *(internal)* | 278 |
| `gameplay_markers_walkingMarker.create(...)` | Builds a doors marker for pedestrians (instance of C). | 269 |

### Parameter details

#### `gameplay_markers_walkingMarker.cluster(pois, allClusters)`

Groups the walkingMarker POIs with the same door names and adds one cluster per group to allClusters.

- `pois` (*table[]*) : POIs with markerInfo.walkingMarker.
- `allClusters` (*table[]*) : List of clusters completed in place.

#### `gameplay_markers_walkingMarker.create(...)`

Builds a doors marker for pedestrians (instance of C).

- `...` (*any*) : Arguments passed to C:init (unused).
- **returns**: table Marker instance.

## Class `C`

Doors marker for the player on foot.

| Method | Description | Line |
|---|---|---|
| `C:clearObjects()` | Removes the icons, hides the screens and clears the door list. | 174 |
| `C:createObjects()` | Cleans up existing objects (does not create any). | 147 |
| `C:drawAxisBox(corner, x, y, z, clr)` | Draws a debug box (edges and faces) via debugDrawer; not used here. | 204 |
| `C:drawOnMinimap(td)` | Draws a circle on the minimap at the position of each door icon. | 262 |
| `C:hide()` | Becomes invisible, makes the icons transparent and hides the screens. | 151 |
| `C:init()` | Initializes visible = true. | 21 |
| `C:instantFade(visible)` | Does nothing. | 200 |
| `C:interactInPlayMode(interactData, interactableElements)` | If canInteract and the player is in a door, adds the cluster's data (elemData) to the interactive elements. | 190 |
| `C:setup(cluster)` | For each door, finds the zone object and the icon object, computes the zone's box, hides the associated screen and creates the icon. | 25 |
| `C:show()` | Becomes visible again. | 169 |
| `C:update(data)` | Every frame: tests, per door, the OBB/OBB overlap (only if the player is walking and below the cruising speed), handles screens, sound, icons and debug line, then updates isInAreaChanged and anyOverlap. | 83 |

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawTriSolid`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/markers/walkingMarker.lua`.*
