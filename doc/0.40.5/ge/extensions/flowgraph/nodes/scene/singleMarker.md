# `flowgraph_nodes_scene_singleMarker`

*File: `lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua` · VM: Game Engine (GE) · 153 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/singleMarker")` (file under extensions/ but not a regular extension)

Flowgraph node "Single Marker" (author BeamNG). Displays a race marker (scenario/race_marker) at a position with a radius. Must be reset manually (reset pin); camera-dependent transparency is only updated with a continuous flow. Marker types: overhead, ringMarker, sideColumnMarker, sideMarker, cylinderMarker, attention, sideHologramMarker, singleHologramMarker. Inputs: flow, reset, position, radius, markerType, color, fadeNearDist, fadeFarDist; output: flow.

## Notes

- Bug: _afterTrigger tests self.shown which is never set to true: the marker is not hidden when the flow drops, only reset deletes it.
- Old pin name: clear -> reset (legacyPins).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_afterTrigger()` | After the trigger: if flow is false and the marker is shown, tries to hide it. | 61 |
| `C:_executionStarted()` | Resets the position/radius cache. | 73 |
| `C:_executionStopped()` | Hides the marker on stop. | 67 |
| `C:blend()` | Empty (unused). | 100 |
| `C:destroy()` | Called when the node is destroyed: cleans up the created objects. | 148 |
| `C:fillFields()` | Reads position (+ data.zOffset on z), radius (2 by default, 1st component if table) and color; returns true if position or radius changed. | 76 |
| `C:hideMarker()` | Clears the marker (clearMarkers) and forgets it. | 54 |
| `C:init(mgr, ...)` | Initializes the state; data.zOffset = 0. | 36 |
| `C:onClientEndMission()` | End-of-mission hook: cleans up the objects created by the node. | 144 |
| `C:onDrawOnMinimap(td)` | Draws a circle with an edge pointer on the minimap as long as the marker exists. | 138 |
| `C:postInit()` | Offers the marker types as templates for the markerType pin. | 45 |
| `C:work()` | On reset, hides the marker; on flow, creates the marker if needed, updates it (setToCheckpoint, color, update) and sets flow to active on output. | 106 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua`.*
