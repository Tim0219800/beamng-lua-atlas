# `freeroam_bigMapMarkers`

*File: `lua/ge/extensions/freeroam/bigMapMarkers.lua` · VM: Game Engine (GE) · 333 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `freeroam_bigMapMarkers`: `extensions.load("freeroam_bigMapMarkers")`, then the global `freeroam_bigMapMarkers`

Manages the big map markers: groups the raw gameplay POIs (points of interest) from gameplay_rawPois that have a bigmapMarker into clusters according to a radius, creates one marker per cluster (gameplay/markers/bigmapMarker), updates/displays them every frame and detects which marker is hovered by the mouse or the reticle. Used by freeroam_bigMapMode; a modder does not normally touch it.

## Notes

- A "filter" (setupFilter) = grouping radius + list of valid POI ids. Its identifier is "radius#-concatenated ids"; old filters stay in memory and their markers are faded out then cleaned up.
- Clusters are recomputed when the generation of gameplay_rawPois increases (getAllClustersBySettings).
- Bug/inconsistency: M.buildPoiList = buildPoiList references a local variable that is never defined, so it is nil.
- displayBigMapMarkers starts with profilerPopEvent("BigMapMarkers parkingSpeedFactor") with no matching push in this file (leftover from old profiling code).
- The fields iconCounter, iconsById and printNext exist but are not used in this file (debug).
- In clusterBySettings, a POI never contains a .cluster before merging, so each cluster in practice only gets its starting POI (neighbors within the radius are only added if bmi.cluster is set); behavior to check in game.

## Functions

| Function | Description | Line |
|---|---|---|
| `freeroam_bigMapMarkers.clearMarkers()` | Destroys the render objects of all markers (current and old) and empties the lists. | 225 |
| `freeroam_bigMapMarkers.displayBigMapMarkers(dtReal)` | To be called every frame while the big map is displayed: updates all markers of the active filter's clusters (displayed) and of the previous filters (faded out), as well as the old markers that are disappearing. | 72 |
| `freeroam_bigMapMarkers.getAllClustersBySettings(settingsId)` | Returns (computing if needed) the POI clusters for a filter: POIs whose id is valid and that have a bigmapMarker, sorted by id, grouped by quadtree then merged via bigmapMarker.merge. | 314 |
| `freeroam_bigMapMarkers.getClusterMarker(cluster)` | Returns a cluster's marker, creating it if it does not exist (or reusing the old marker with the same id). | 191 |
| `freeroam_bigMapMarkers.getIdsFromHoveredPoiId(id)` | For a POI id, returns the ids of all the POIs in its cluster in the active filter. | 182 |
| `freeroam_bigMapMarkers.handleMouse(camMode, mouseMoved, poiIsSelected)` | Determines which cluster is hovered: casts a ray from the mouse (if it moved) or from the camera center, and tests the ray/icon distance with a sphere whose radius depends on the zoom (fov) and distance (or is fixed in an orthographic camera). Does nothing in gamepad mode when a POI is already selected. | 145 |
| `freeroam_bigMapMarkers.hideMarkers()` | Hides (fades out) all current and old markers, without destroying them. | 214 |
| `freeroam_bigMapMarkers.setNextMarkersFullAlphaInstant()` | Makes the active markers appear instantly at full opacity on the next update (only once). | 328 |
| `freeroam_bigMapMarkers.setupFilter(validIds, radius)` | Sets the active filter: the grouping radius is rounded to a multiple of 5 (20 by default), the ids are sorted, and the current markers are moved to the old list and hidden for a smooth transition. Invisible old markers are destroyed. | 23 |

### Parameter details

#### `freeroam_bigMapMarkers.displayBigMapMarkers(dtReal)`

To be called every frame while the big map is displayed: updates all markers of the active filter's clusters (displayed) and of the previous filters (faded out), as well as the old markers that are disappearing.

- `dtReal` (*number*) : Elapsed real time (s).

#### `freeroam_bigMapMarkers.getAllClustersBySettings(settingsId)`

Returns (computing if needed) the POI clusters for a filter: POIs whose id is valid and that have a bigmapMarker, sorted by id, grouped by quadtree then merged via bigmapMarker.merge.

- `settingsId` (*string*) : Filter identifier created by setupFilter (internally named currentClusterSettingsId).
- **returns**: table[] List of clusters (fields id, containedIds, containedIdsLookup...).

#### `freeroam_bigMapMarkers.getClusterMarker(cluster)`

Returns a cluster's marker, creating it if it does not exist (or reusing the old marker with the same id).

- `cluster` (*table*) : Cluster from getAllClustersBySettings.
- **returns**: table Big map marker object.

#### `freeroam_bigMapMarkers.getIdsFromHoveredPoiId(id)`

For a POI id, returns the ids of all the POIs in its cluster in the active filter.

- `id` (*string*) : POI id.
- **returns**: string[]|nil Ids contained in the cluster, nil if the POI is in no cluster.

#### `freeroam_bigMapMarkers.handleMouse(camMode, mouseMoved, poiIsSelected)`

Determines which cluster is hovered: casts a ray from the mouse (if it moved) or from the camera center, and tests the ray/icon distance with a sphere whose radius depends on the zoom (fov) and distance (or is fixed in an orthographic camera). Does nothing in gamepad mode when a POI is already selected.

- `camMode` (*table*) : Big map camera mode (uses camMode.manualzoom.fov).
- `mouseMoved` (*boolean*) : true if the ray comes from the mouse, false if from the camera.
- `poiIsSelected` (*boolean*) : true if a POI is already selected.
- **returns**: string|nil Id of the first POI of the hovered cluster, nil otherwise.

#### `freeroam_bigMapMarkers.setupFilter(validIds, radius)`

Sets the active filter: the grouping radius is rounded to a multiple of 5 (20 by default), the ids are sorted, and the current markers are moved to the old list and hidden for a smooth transition. Invisible old markers are destroyed.

- `validIds` (*string[]*) : POI ids to display (the table is sorted in place).
- `radius` (*number|nil*) : Grouping radius in world meters (20 by default).

## Fields

| Field | Type | Description |
|---|---|---|
| `buildPoiList` | nil | Always nil (reference to an undefined variable). ⚠ reference `buildPoiList` not defined in the file (probably nil) |
| `iconCounter` | number | Icon counter, initialized to 0 (not used in this file). |
| `iconsById` | table | Empty table reserved for debug. |
| `printNext` | boolean | Debug flag (commented-out prints), false. |

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/freeroam/bigMapMarkers.lua`.*
