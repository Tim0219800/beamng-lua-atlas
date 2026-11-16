# `flowgraph_nodes_gameplay_dragRace_getRacerData`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/getRacerData.lua` · VM: Game Engine (GE) · 85 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/dragRace/getRacerData")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Drag Racer Data" (category repeat_instant, LEGACY). Convenience node that gives the state of a driver (vehId): isPlayable, lane, isDesqualified, desqualifiedReason, isFinished. The code recommends "Get Drag Racer Status" and "Get Drag Racer Spawn Point" instead.

## Notes

- Writes the outputs only if they are used (isUsed).
- If the data is not ready, the outputs keep their previous value.
- The spelling "desqualified" (without i) is the game's.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Clears data and dragData. | 27 |
| `C:work()` | Reads dragBridge.getData and getRacerData(vehId), then feeds the used pins. | 32 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/getRacerData.lua`.*
