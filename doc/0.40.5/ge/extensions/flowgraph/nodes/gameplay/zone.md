# `flowgraph_nodes_gameplay_zone`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/zone.lua` · VM: Game Engine (GE) · 52 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/zone")` (file under extensions/ but not a regular extension)

Flowgraph node "In Zone" (repeat_instant, sites color). Detects whether a vehicle (vehId) is inside the zones of sitesData: tests points of the oriented spawn bounding box (getSpawnWorldOOBB) with sites:getZonesForPosition, publishes inside, and draws the zones in debug (pulsing red if outside, white if inside).

## Notes

- Bug: work reads self.pinIn.flow, but no input pin "flow" is declared in pinSchema; self.pinIn.flow is therefore nil and indexing it raises a Lua error.
- Bug: the loop `for i = 0, 8` always tests oobb:getPoint(0) instead of getPoint(i).
- The sitesData pin has no tableType.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Initializes the red and white drawing colors. | 46 |
| `C:work(args)` | Tests whether the vehicle is in a zone, draws the zones in debug and writes inside. | 19 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/zone.lua`.*
