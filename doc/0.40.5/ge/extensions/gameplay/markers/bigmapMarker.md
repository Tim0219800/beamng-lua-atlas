# `gameplay_markers_bigmapMarker`

*File: `lua/ge/extensions/gameplay/markers/bigmapMarker.lua` · VM: Game Engine (GE) · 283 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_markers_bigmapMarker`: `extensions.load("gameplay_markers_bigmapMarker")`, then the global `gameplay_markers_bigmapMarker`

Marker type used by the big map (bigmap): for each POI cluster, displays an icon and a column (icon renderer icons) that fade in when the big map is active and that grow on hover or selection. The module returns a table {createMarker, merge}: createMarker creates the marker object (class C), merge merges several nearby POIs into a single cluster with a numbered icon.

## Notes

- This file does not define containsAnyMission / containsAnyDelivery fields on the module: they are local variables of merge (the automatic page wrongly reports them as fields).
- merge: cluster position = average of the POI positions; id = idPrefix.. '#' followed by the POI ids; default icon = that of the last POI; if count > 1, numbered icon poi_no-NN_round_orange_green (NN = min(count, 9)), _orange_blue if all POIs are missions or all of type logisticsParking, _orange if a POI has data.hasPlayerCargo.
- Default cluster icon: mission_primary_triangle; column: marker_column; icon size 20; column height 3.5 m.
- POIs must provide markerInfo.bigmapMarker.{pos, icon} and data.type; the cluster object provides containedIdsLookup, used to know whether the selected or hovered POI is in the cluster.
- setHidden and instantFade are empty methods (present to satisfy the marker interface).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_markers_bigmapMarker.createMarker(...)` | Builds a big map marker object (instance of class C) and calls its init. | 235 |
| `gameplay_markers_bigmapMarker.merge(pois, idPrefix)` | Merges a list of POIs into a single big map cluster (average position, contained ids, numbered icon if several). | 242 |

### Parameter details

#### `gameplay_markers_bigmapMarker.createMarker(...)`

Builds a big map marker object (instance of class C) and calls its init.

- `...` (*any*) : Arguments passed to C:init (unused).
- **returns**: table Marker instance.

#### `gameplay_markers_bigmapMarker.merge(pois, idPrefix)`

Merges a list of POIs into a single big map cluster (average position, contained ids, numbered icon if several).

- `pois` (*table[]*) : POIs to merge (with markerInfo.bigmapMarker and data).
- `idPrefix` (*string*) : Prefix of the cluster id.
- **returns**: table Cluster {id, containedIds, containedIdsLookup, pos, icon}.

## Fields

| Field | Type | Description |
|---|---|---|
| `containsAnyDelivery` | boolean |  |
| `containsAnyMission` | boolean |  |

## Class `C`

Big map marker: an icon plus a column, whose opacity follows the big map state.

| Method | Description | Line |
|---|---|---|
| `C:clearObjects()` | Removes the icons from the icon renderer and resets the internal references. | 214 |
| `C:hide()` | Marks the marker invisible (the opacity fades out). | 199 |
| `C:init()` | Initializes the id, the opacity smoother and visible = true, without creating an object. | 29 |
| `C:instantFade(visible)` | Does nothing (common marker interface). | 208 |
| `C:setFullAlphaInstant()` | Sets the smoother's opacity to 1 immediately. | 191 |
| `C:setHidden(value)` | Does nothing (common marker interface). | 196 |
| `C:setup(cluster)` | Associates the marker with a cluster: stores pos and cluster, adds the icon (cluster.icon) and the column in the gameplay_playmodeMarkers icon renderer, and resets the opacity to 0. | 156 |
| `C:show()` | Marks the marker visible. | 203 |
| `C:update(data)` | Called every frame: smooths the opacity (fade in over 0.2 s when the big map is active and without transition), places the icon and column in front of the camera (or in orthographic projection), enlarges the icon to 1.5 if the cluster is hovered or selected. | 77 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/markers/bigmapMarker.lua`.*
