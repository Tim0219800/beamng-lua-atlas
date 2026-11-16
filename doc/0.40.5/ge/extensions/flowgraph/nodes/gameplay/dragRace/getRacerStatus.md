# `flowgraph_nodes_gameplay_dragRace_getRacerStatus`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/getRacerStatus.lua` · VM: Game Engine (GE) · 99 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/dragRace/getRacerStatus")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Drag Racer Status" (category repeat_instant). Gives the state of a driver (vehId pin): isPlayable, lane, isDesqualified, desqualifiedReason, isFinished. When data is missing, the used outputs are false, 0 or empty string.

## Notes

- The spelling "desqualified" is the game's.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Clears data and dragData. | 26 |
| `C:work()` | Reads dragBridge.getData and getRacerData(vehId) then writes the used pins. | 31 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/getRacerStatus.lua`.*
