# `gameplay_crawl_boundary`

*File: `lua/ge/extensions/gameplay/crawl/boundary.lua` · VM: Game Engine (GE) · 512 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_crawl_boundary`: `extensions.load("gameplay_crawl_boundary")`, then the global `gameplay_crawl_boundary`

Zone boundary management for "crawl" mode (slow traversal). It spawns flags (TSStatic flagMarker.dae) along a zone's outline, animates them (appearing with scaling and fade, disappearing with fade) when an active crawler or the camera is within visibilityRadius meters, via a 2D quadtree, and checks whether a crawler has left the zone. An exit is recorded; if the crawler moves at least 10 m away from the exit point (all corners outside), the 'dnf' penalty is applied only once via gameplay_crawl_utils.applyPenalty; otherwise onBoundaryViolation is called.

## Notes

- Distances in meters, animation durations in seconds. Default values: visibilityRadius 100, animationDuration 0.5, fadeIn 0.3, fadeOut 0.2, scaleUp 0.4, scale from 0.1 to 1.0.
- Probable bug: setVisibilityRadius(nil) resets to 200 while the initial value is 100.
- Probable bug: getQuadtreeStats and the buildBoundaryQuadtree log use #boundaryObjects; boundaryObjects is keyed by object id (not a sequence), so # can be 0 or a wrong value.
- checkBoundary calls gameplay_crawl_utils.onBoundaryViolation without testing that gameplay_crawl_utils exists in some branches (error if the module is not loaded).
- In checkBoundary, without available corners (currentCorners empty), the bbCenter position is tested with site:containsPoint2D; returns true as long as the crawler is not disqualified.
- A marker is only placed if the terrain normal has a dot product >= 0.5 with the Z axis.
- The marker objects are in a 'BoundaryMarkers' SimGroup added to MissionGroup, with canSave = false.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_crawl_boundary.checkBoundary(site, crawler, crawlStates)` | Tests whether a crawler is in the zone (vehicle corners or center of its box). Records the exit point, applies the 'dnf' penalty (once) if all corners are outside at 10 m or more from the exit point, or reports a boundary violation. | 318 |
| `gameplay_crawl_boundary.cleanupBoundaryMarkers()` | Deletes the markers group and empties the tracking. | 306 |
| `gameplay_crawl_boundary.clearAllExitPoints()` | Clears all exit points and DNF flags. | 431 |
| `gameplay_crawl_boundary.clearCrawlerExitPoint(crawlerId)` | Clears a crawler's exit point and DNF flag. | 422 |
| `gameplay_crawl_boundary.getCrawlerExitPoint(crawlerId)` | Returns the point where the crawler left the zone. | 417 |
| `gameplay_crawl_boundary.getQuadtreeStats()` | Returns the quadtree state for debug. | 460 |
| `gameplay_crawl_boundary.rebuildQuadtree()` | Rebuilds the quadtree from the tracked flags (useful if these objects change). | 455 |
| `gameplay_crawl_boundary.resetBoundaryObjects()` | Hides all tracked flags (hidden, minimum scale, transparent color) then empties the tracking table. | 189 |
| `gameplay_crawl_boundary.setAnimationTiming(duration, fadeIn, fadeOut, scaleUp)` | Sets the flags' animation durations (default values if nil). | 444 |
| `gameplay_crawl_boundary.setVisibilityRadius(radius)` | Sets the radius (m) within which the flags are visible. | 438 |
| `gameplay_crawl_boundary.spawnBoundaryMarkers(boundary, spacing)` | Removes the previous markers, then creates flags along the outline (one every spacing meters, placed on the terrain and oriented along the segment) and builds the visibility quadtree. The flags start hidden. | 204 |
| `gameplay_crawl_boundary.triggerAppearingAnimation()` | Restarts the appearance animation for the flags that are currently not hidden. | 473 |
| `gameplay_crawl_boundary.updateBoundaryAnimations(dtSim, crawlStates)` | Updates the visibility and animation of the boundary flags: those close to an active crawler (or to the camera if none is active) appear, the others disappear. To be called every frame. | 63 |

### Parameter details

#### `gameplay_crawl_boundary.checkBoundary(site, crawler, crawlStates)`

Tests whether a crawler is in the zone (vehicle corners or center of its box). Records the exit point, applies the 'dnf' penalty (once) if all corners are outside at 10 m or more from the exit point, or reports a boundary violation.

- `site` (*table*) : Zone with the containsPoint2D(pos) method.
- `crawler` (*table*) : Crawler: id, dynamicData (currentCorners, bbCenter).
- `crawlStates` (*table<any, table>*) : Crawler states keyed by id (active field).
- **returns**: boolean false if the crawler is inactive, disqualified (DNF) or if no site is given; true otherwise.

#### `gameplay_crawl_boundary.clearCrawlerExitPoint(crawlerId)`

Clears a crawler's exit point and DNF flag.

- `crawlerId` (*any*) : Crawler id.

#### `gameplay_crawl_boundary.getCrawlerExitPoint(crawlerId)`

Returns the point where the crawler left the zone.

- `crawlerId` (*any*) : Crawler id.
- **returns**: vec3|nil Exit point, or nil if the crawler is in the zone.

#### `gameplay_crawl_boundary.getQuadtreeStats()`

Returns the quadtree state for debug.

- **returns**: table {built, objectCount, bounds?} (see notes about objectCount).

#### `gameplay_crawl_boundary.setAnimationTiming(duration, fadeIn, fadeOut, scaleUp)`

Sets the flags' animation durations (default values if nil).

- `duration` (*number|nil*) : Total appearance duration (s), 0.5 by default.
- `fadeIn` (*number|nil*) : Fade-in duration (s), 0.3 by default.
- `fadeOut` (*number|nil*) : Fade-out duration (s), 0.2 by default.
- `scaleUp` (*number|nil*) : Scale-up duration (s), 0.4 by default.

#### `gameplay_crawl_boundary.setVisibilityRadius(radius)`

Sets the radius (m) within which the flags are visible.

- `radius` (*number|nil*) : Radius in meters; 200 if nil.

#### `gameplay_crawl_boundary.spawnBoundaryMarkers(boundary, spacing)`

Removes the previous markers, then creates flags along the outline (one every spacing meters, placed on the terrain and oriented along the segment) and builds the visibility quadtree. The flags start hidden.

- `boundary` (*table*) : Outline with vertices (at least 3), each with pos (vec3) and optionally next.
- `spacing` (*number|nil*) : Distance between flags in meters (2.0 by default).
- **returns**: integer|nil Id of the markers SimGroup; nil if the outline is invalid.

#### `gameplay_crawl_boundary.updateBoundaryAnimations(dtSim, crawlStates)`

Updates the visibility and animation of the boundary flags: those close to an active crawler (or to the camera if none is active) appear, the others disappear. To be called every frame.

- `dtSim` (*number*) : Simulation time delta (s).
- `crawlStates` (*table<any, table>|nil*) : Crawler states (active, crawlerData.dynamicData.vehPos).

## Calls into the engine (C++)

- `Sim.` `getUniqueName`
- `be:` `getSurfaceHeightBelow`
- `obj:` `setField`, `setScale`, `updateInstanceRenderData`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/crawl/boundary.lua`.*
