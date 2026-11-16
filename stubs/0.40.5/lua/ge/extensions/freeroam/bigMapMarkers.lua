---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/bigMapMarkers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the big map markers: groups the raw gameplay POIs (points of interest) from gameplay_rawPois that have a bigmapMarker into clusters according to a radius, creates one marker per cluster (gameplay/markers/bigmapMarker), updates/displays them every frame and detects which marker is hovered by the mouse or the reticle. Used by freeroam_bigMapMode; a modder does not normally touch it.
--- Access: extension `freeroam_bigMapMarkers`: `extensions.load("freeroam_bigMapMarkers")`, then the global `freeroam_bigMapMarkers`
---@class freeroam_bigMapMarkers
---@field buildPoiList nil Always nil (reference to an undefined variable).
---@field iconCounter number Icon counter, initialized to 0 (not used in this file).
---@field iconsById table Empty table reserved for debug.
---@field printNext boolean Debug flag (commented-out prints), false.
freeroam_bigMapMarkers = {}

--- Destroys the render objects of all markers (current and old) and empties the lists.
---Source: lua/ge/extensions/freeroam/bigMapMarkers.lua:225
function freeroam_bigMapMarkers.clearMarkers() end

--- To be called every frame while the big map is displayed: updates all markers of the active filter's clusters (displayed) and of the previous filters (faded out), as well as the old markers that are disappearing.
---Source: lua/ge/extensions/freeroam/bigMapMarkers.lua:72
---@param dtReal number Elapsed real time (s).
function freeroam_bigMapMarkers.displayBigMapMarkers(dtReal) end

--- Returns (computing if needed) the POI clusters for a filter: POIs whose id is valid and that have a bigmapMarker, sorted by id, grouped by quadtree then merged via bigmapMarker.merge.
---Source: lua/ge/extensions/freeroam/bigMapMarkers.lua:314
---@param settingsId string Filter identifier created by setupFilter (internally named currentClusterSettingsId).
---@return table[]  List of clusters (fields id, containedIds, containedIdsLookup...).
function freeroam_bigMapMarkers.getAllClustersBySettings(settingsId) end

--- Returns a cluster's marker, creating it if it does not exist (or reusing the old marker with the same id).
---Source: lua/ge/extensions/freeroam/bigMapMarkers.lua:191
---@param cluster table Cluster from getAllClustersBySettings.
---@return table  Big map marker object.
function freeroam_bigMapMarkers.getClusterMarker(cluster) end

--- For a POI id, returns the ids of all the POIs in its cluster in the active filter.
---Source: lua/ge/extensions/freeroam/bigMapMarkers.lua:182
---@param id string POI id.
---@return string[]|nil  Ids contained in the cluster, nil if the POI is in no cluster.
function freeroam_bigMapMarkers.getIdsFromHoveredPoiId(id) end

--- Determines which cluster is hovered: casts a ray from the mouse (if it moved) or from the camera center, and tests the ray/icon distance with a sphere whose radius depends on the zoom (fov) and distance (or is fixed in an orthographic camera). Does nothing in gamepad mode when a POI is already selected.
---Source: lua/ge/extensions/freeroam/bigMapMarkers.lua:145
---@param camMode table Big map camera mode (uses camMode.manualzoom.fov).
---@param mouseMoved boolean true if the ray comes from the mouse, false if from the camera.
---@param poiIsSelected boolean true if a POI is already selected.
---@return string|nil  Id of the first POI of the hovered cluster, nil otherwise.
function freeroam_bigMapMarkers.handleMouse(camMode, mouseMoved, poiIsSelected) end

--- Hides (fades out) all current and old markers, without destroying them.
---Source: lua/ge/extensions/freeroam/bigMapMarkers.lua:214
function freeroam_bigMapMarkers.hideMarkers() end

--- Makes the active markers appear instantly at full opacity on the next update (only once).
---Source: lua/ge/extensions/freeroam/bigMapMarkers.lua:328
function freeroam_bigMapMarkers.setNextMarkersFullAlphaInstant() end

--- Sets the active filter: the grouping radius is rounded to a multiple of 5 (20 by default), the ids are sorted, and the current markers are moved to the old list and hidden for a smooth transition. Invisible old markers are destroyed.
---Source: lua/ge/extensions/freeroam/bigMapMarkers.lua:23
---@param validIds string[] POI ids to display (the table is sorted in place).
---@param radius number|nil Grouping radius in world meters (20 by default).
function freeroam_bigMapMarkers.setupFilter(validIds, radius) end

