# `flowgraph_nodes_gameplay_sites_posInZone`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/sites/posInZone.lua` · VM: Game Engine (GE) · 60 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/sites/posInZone")` (file under extensions/ but not a regular extension)

Flowgraph node "Position in Zone" (category repeat_instant). Tests in 2D (zone:containsPoint2D) whether a position is inside a Sites zone. Outputs: inside, outside, and enter/exit pulses when the state changes between two frames.

## Notes

- Prints dump("No zone data!") every frame if the zone or the position is missing.
- enter and exit are only written from the 2nd frame onward (self._lastInside not nil).

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Called when the flowgraph project execution starts; resets the node's internal state. | 29 |
| `C:init(mgr, ...)` | Initializes the node's internal state at creation (called by the flowgraph engine). | 26 |
| `C:work(args)` | Computes inside/outside and detects entering or leaving by comparing with the previous frame's state. | 33 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/sites/posInZone.lua`.*
