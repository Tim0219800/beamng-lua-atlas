# `core_groundMarkers`

*File: `lua/ge/extensions/core/groundMarkers.lua` · VM: Game Engine (GE) · 447 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_groundMarkers`: `extensions.load("core_groundMarkers")`, then the global `core_groundMarkers`

GE extension `core_groundMarkers`: ground navigation. Computes a route (route planner) from the player vehicle to one or more points, draws blue arrow decals on the road ahead of the vehicle (rendered by DynamicDecalMgr), updates the floating arrows at intersections (core_groundMarkerArrows) and sends the path to the UI (navigation app). A modder uses it to guide the player to a destination: setPath(points).

## Example

```lua
-- guide to a world position then clear the path on arrival
core_groundMarkers.setPath(vec3(100, 200, 30), {clearPathOnReachingTarget = true})
-- several waypoints, asynchronous computation
core_groundMarkers.setPath({vec3(0,0,0), vec3(500,0,0)}, {async = true, onComplete = function() print('ready') end})
core_groundMarkers.setPath(nil)   -- clears
```

## Notes

- setPath(wp, options): wp can be a vec3, a road map node name (string), a table {x,y,z} (3 elements), or a list of these elements. wp nil or an empty list clears the path and the arrows. Unknown node names are ignored with a warning.
- Recognized options: step (decal spacing in m, default 3), color ({r,g,b} 0..1; default the color set M.colorSet = 'blue' (0,0.4,1) or 'green'), cutOffDrivability, penaltyAboveCutoff, penaltyBelowCutoff, dirMult, wD, wZ (router parameters: setRouteParams), renderDecals (false = no decals), lockFixedNodes, clearPathOnReachingTarget, async (true = computed by a job, the path is only available at the callback), onComplete (called when the path is ready).
- Rendering: decals drawn in the zone M.decalDrawingDistance = 120 m ahead of the vehicle; opacity increasing from 0 (at 1 m, decalBlendOffset) to 1 (at 10 m, decalBlendStart), full up to 100 m (decalBlendEnd), then decreasing until 120 m. Regenerated when the vehicle has moved more than 1 m, or continuously if the big map is open. Nothing is drawn in photo mode.
- User settings read: showNavigationGroundmarkers (decals) and showNavigationArrows (floating arrows).
- The UI receives 'NavigationGroundMarkersUpdate' {markers = [x1,y1,x2,y2,…], color = '#RRGGBBFF'} on a new path and every 0.25 s during rendering.
- The path is cleared at level end (onClientEndMission), when the extension is unloaded and at the start/stop of any mission (onAnyMissionChanged 'started' or 'stopped').
- Inconsistencies: deprecationWarning uses a variable `logTag` which is not defined in this file (nil); onSerialize returns nothing (only clears the arrows), so the path is not kept after an extensions reload; M.stepDistance, M.endWP, M.color, M.activeDecalCount are only initialized by setPath; setFocus is deprecated (setPath).

**Dependencies (loaded first):** `core_groundMarkerArrows`

## Functions

| Function | Description | Line |
|---|---|---|
| `core_groundMarkers.currentlyHasTarget()` | Indicates whether a path is active. | 396 |
| `core_groundMarkers.generateRouteDecals(startPos)` | Fills the decal pool along the path from the given position (up to decalDrawingDistance) with the computed opacity, then updates the floating arrows if the setting is enabled. Called on every render by onPreRender. | 142 |
| `core_groundMarkers.getPathLength()` | Remaining path length to the destination, from distToTarget of the first point. | 45 |
| `core_groundMarkers.getTargetPos()` | First remaining destination as provided to setPath. | 399 |
| `core_groundMarkers.onAnyMissionChanged(state)` | Mission state change hook: clears the path when the state is 'started' or 'stopped'. *(internal)* *(hook)* | 426 |
| `core_groundMarkers.onClientEndMission()` | Level end hook: calls resetAll. *(internal)* *(hook)* | 384 |
| `core_groundMarkers.onExtensionUnloaded()` | Extension unload hook: calls resetAll. *(internal)* *(hook)* | 388 |
| `core_groundMarkers.onPreRender(dt)` | Render hook: tracks the vehicle on the path, regenerates the decals if needed, draws the debug, adds the decals to Engine.Render.DynamicDecalMgr and sends the path to the UI every 0.25 s. Does nothing without a destination or in photo mode. *(internal)* *(hook)* | 185 |
| `core_groundMarkers.onSerialize()` | Hook before extensions reload: removes the arrows; returns nothing. *(internal)* *(hook)* | 392 |
| `core_groundMarkers.onSettingsChanged()` | Settings change hook: creates or removes the floating arrows according to showNavigationArrows and forces the decals to regenerate according to showNavigationGroundmarkers. *(internal)* *(hook)* | 405 |
| `core_groundMarkers.resetAll()` | Clears the path (setPath(nil)), resets the router parameters and removes the arrows. | 367 |
| `core_groundMarkers.sendToApp()` | Sends the current path to the UI: guihooks 'NavigationGroundMarkersUpdate' {markers = flat x,y, color = '#RRGGBBFF'}. | 234 |
| `core_groundMarkers.setFocus(wp, step, _fadeStart, _fadeEnd, _endPos, _disableVeh, _color, _cutOffDrivability, _penaltyAboveCutoff, _penaltyBelowCutoff, _renderDecals)` | Deprecated: old API converted to options for setPath (warning logged once). The parameters _fadeStart, _fadeEnd, _endPos, _disableVeh are ignored. | 354 |
| `core_groundMarkers.setPath(wp, options)` | Sets (or clears) the navigation route to one or more points. Resets the decal pool, computes the path from the player vehicle's (or camera's) position, creates the arrows and notifies the UI. | 249 |
| `core_groundMarkers.unflagFirstFixedNode()` | Removes the first destination from the list (waypoint reached) and the corresponding fixed node marking in the router; if there are none left, clears everything. | 333 |

### Parameter details

#### `core_groundMarkers.currentlyHasTarget()`

Indicates whether a path is active.

- **returns**: boolean true if a destination is set.

#### `core_groundMarkers.generateRouteDecals(startPos)`

Fills the decal pool along the path from the given position (up to decalDrawingDistance) with the computed opacity, then updates the floating arrows if the setting is enabled. Called on every render by onPreRender.

- `startPos` (*vec3*) : Start position (player vehicle or camera).

#### `core_groundMarkers.getPathLength()`

Remaining path length to the destination, from distToTarget of the first point.

- **returns**: number Meters; math.huge if an asynchronous computation is in progress; 0 if there is no path.

#### `core_groundMarkers.getTargetPos()`

First remaining destination as provided to setPath.

- **returns**: vec3|string|table|nil Destination (may be a node name) or nil.

#### `core_groundMarkers.onAnyMissionChanged(state)`

Mission state change hook: clears the path when the state is 'started' or 'stopped'.

- `state` (*string*) : Mission state.

#### `core_groundMarkers.onPreRender(dt)`

Render hook: tracks the vehicle on the path, regenerates the decals if needed, draws the debug, adds the decals to Engine.Render.DynamicDecalMgr and sends the path to the UI every 0.25 s. Does nothing without a destination or in photo mode.

- `dt` (*number*) : Render time delta in seconds.

#### `core_groundMarkers.setFocus(wp, step, _fadeStart, _fadeEnd, _endPos, _disableVeh, _color, _cutOffDrivability, _penaltyAboveCutoff, _penaltyBelowCutoff, _renderDecals)`

Deprecated: old API converted to options for setPath (warning logged once). The parameters _fadeStart, _fadeEnd, _endPos, _disableVeh are ignored.

- `wp` (*any*) : Destination(s), like setPath.
- `step` (*number|nil*) : Decal spacing.
- `_fadeStart` (*any*) : Ignored.
- `_fadeEnd` (*any*) : Ignored.
- `_endPos` (*any*) : Ignored.
- `_disableVeh` (*any*) : Ignored.
- `_color` (*number[]|nil*) : RGB color.
- `_cutOffDrivability` (*number|nil*) : See setPath.
- `_penaltyAboveCutoff` (*number|nil*) : See setPath.
- `_penaltyBelowCutoff` (*number|nil*) : See setPath.
- `_renderDecals` (*boolean|nil*) : See setPath.

#### `core_groundMarkers.setPath(wp, options)`

Sets (or clears) the navigation route to one or more points. Resets the decal pool, computes the path from the player vehicle's (or camera's) position, creates the arrows and notifies the UI.

- `wp` (*vec3|string|table|table[]|nil*) : Destination(s): vec3, map node name, {x,y,z}, or list of these. nil clears.
- `options` (*table|nil*) : See notes: step, color, cutOffDrivability, penaltyAboveCutoff, penaltyBelowCutoff, dirMult, wD, wZ, renderDecals, lockFixedNodes, clearPathOnReachingTarget, async, onComplete.

#### `core_groundMarkers.unflagFirstFixedNode()`

Removes the first destination from the list (waypoint reached) and the corresponding fixed node marking in the router; if there are none left, clears everything.

- **returns**: boolean false if there was no active path, otherwise true.

## Fields

| Field | Type | Description |
|---|---|---|
| `colorSet` | string | Active color set: 'blue' (default) or 'green' (keys of colorSets). |
| `colorSets` | table<string, {decals: number[], arrows: number[]}> | RGB colors 0..1 of the decals and arrows: blue {0,0.4,1}/{0,0.48,0.77}, green {0,1,0}/{0,1,0}. |
| `debugPath` | boolean | true = draws the path points (spheres, prisms, numbers) on each render. False by default. |
| `decalBlendEnd` | number | 100 m: distance from which opacity decreases toward 0 at decalDrawingDistance. |
| `decalBlendOffset` | number | 1 m: distance under which the decals are invisible. |
| `decalBlendStart` | number | 10 m: distance from which opacity is full. |
| `decalDrawingDistance` | number | 120: maximum distance of the decals ahead of the vehicle, in meters. |
| `decalPool` | table[] | Pool of decal data reused every frame (fields texture, position, forwardVec, color, scale, fadeStart, fadeEnd). |
| `decalPoolCount` | integer | Number of entries in decalPool. |
| `dependencies` | string[] | {'core_groundMarkerArrows'}. |
| `routePlanner` | table | Instance of gameplay/route/route (path computation, trackVehicle, path[] with pos, distToTarget, wp, linkCount). |

**UI events (guihooks.trigger):** `NavigationGroundMarkersUpdate`

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/groundMarkers.lua`.*
