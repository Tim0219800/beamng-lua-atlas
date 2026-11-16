# `gameplay_markers_gasStationMarker`

*File: `lua/ge/extensions/gameplay/markers/gasStationMarker.lua` · VM: Game Engine (GE) · 253 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_markers_gasStationMarker`: `extensions.load("gameplay_markers_gasStationMarker")`, then the global `gameplay_markers_gasStationMarker`

Gas station marker (fuel or electric charging) in play mode. For each pump (pair of scene object names: zone, icon), it creates an icon (poi_fuel_round, or poi_charge_round for an electric station) that appears when the player's vehicle, driving slowly, overlaps the pump's zone (OBB/OBB test), and makes the station interactive. The module returns {create, cluster}.

## Notes

- cluster: one cluster per POI (id 'gasStationMarker#<poi.id>'). Reads poi.markerInfo.gasStationMarker.{pumps, electric, pos, radius}; pumps = list of {zoneName, iconName} pairs of scene objects.
- The overlap is only evaluated if data.cruisingSpeedFactor < 1, i.e. below about 20 km/h (hysteresis 20 to 30 km/h).
- Probable bug: setup builds the icon id with cluster.clusterId, a field that cluster() does not fill in (it sets id); all icon ids become "nil-gsIcon-N" and can collide between stations.
- The icon is hidden if a static obstacle is between the camera and the icon (castRayStatic).
- isInAreaChanged is "in"/"out" for one frame when the overlap changes, otherwise nil.
- drawAxisBox calls color(...) as a color constructor; the function is not used anywhere in this file.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_markers_gasStationMarker.cluster(pois, allClusters)` | Turns each gasStationMarker POI into a distinct cluster (no merging) and adds it to allClusters. *(internal)* | 233 |
| `gameplay_markers_gasStationMarker.create(...)` | Builds a gas station marker (instance of C). | 224 |

### Parameter details

#### `gameplay_markers_gasStationMarker.cluster(pois, allClusters)`

Turns each gasStationMarker POI into a distinct cluster (no merging) and adds it to allClusters.

- `pois` (*table[]*) : POIs with markerInfo.gasStationMarker.
- `allClusters` (*table[]*) : List of clusters completed in place.

#### `gameplay_markers_gasStationMarker.create(...)`

Builds a gas station marker (instance of C).

- `...` (*any*) : Arguments passed to C:init (unused).
- **returns**: table Marker instance.

## Class `C`

Gas station marker with one icon per pump.

| Method | Description | Line |
|---|---|---|
| `C:clearObjects()` | Removes the icons from the icon renderer and clears the pump list. | 135 |
| `C:createObjects()` | Cleans up existing objects (does not create any). | 113 |
| `C:drawAxisBox(corner, x, y, z, clr)` | Draws a debug box (edges and faces) via debugDrawer. | 159 |
| `C:drawOnMinimap(td)` | Draws a circle on the minimap for each pump. | 218 |
| `C:hide()` | Becomes invisible and sets the opacity of all icons to 0. | 117 |
| `C:init()` | Initializes visible = true. | 19 |
| `C:instantFade(visible)` | Does nothing. | 155 |
| `C:interactInPlayMode(interactData, interactableElements)` | If canInteract and the vehicle is on a pump, adds the cluster's data (elemData) to the interactive elements. | 145 |
| `C:setup(cluster)` | For each pump, finds the scene objects (zone and icon), computes the zone's box (position, scaled axes) and creates the icon with initial opacity 0. | 23 |
| `C:show()` | Becomes visible again. | 130 |
| `C:update(data)` | Every frame: tests the OBB/OBB overlap between the vehicle and each pump, raises the icon by 0.25 m and adjusts its opacity (visible if no obstacle), updates isInAreaChanged and anyOverlap. | 79 |

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawTriSolid`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/markers/gasStationMarker.lua`.*
