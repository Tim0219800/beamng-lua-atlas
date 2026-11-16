# `flowgraph_nodes_gameplay_groundmarkers`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/groundmarkers.lua` · VM: Game Engine (GE) · 139 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/groundmarkers")` (file under extensions/ but not a regular extension)

Flowgraph node "Groundmarkers" (category repeat_instant, depends on core_groundMarkers). Creates ground markers that show the path to a target. Input pins: clear (reset pulse), target (waypoint name, vec3 position or list), color (deprecated), cutOffDrivability, penaltyAboveCutoff, penaltyBelowCutoff, threshold (target change threshold, 0.1). Calls core_groundMarkers.setPath when the target changes; resetAll on stop.

## Notes

- data.fadeStart = 100 and data.fadeEnd = 150 are defined but unused in this file.
- Old pins pos, waypoint -> target and reset -> clear (legacyPins).

**Dependencies (loaded first):** `core_groundMarkers`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Forgets the last target. | 134 |
| `C:_executionStopped()` | Calls core_groundMarkers.resetAll(). | 128 |
| `C:hasNewTarget()` | Compares the pin target to the previous one (types, length, numeric values with the threshold threshold, strings). | 47 |
| `C:init(mgr, ...)` | Sets data.fadeStart and data.fadeEnd. | 34 |
| `C:work(args)` | Handles clear (resetAll) then, if flow and target are present and the target has changed, calls core_groundMarkers.setPath(target, options). | 98 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/groundmarkers.lua`.*
