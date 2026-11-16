# `flowgraph_nodes_gameplay_dragRace_getDragWinners`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/getDragWinners.lua` · VM: Game Engine (GE) · 73 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/dragRace/getDragWinners")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Drag Race Winner Data" (category repeat_instant). Gives the player's result at the end of a drag race. Outputs: playerWin, playerPos (position), dialDiff (player's ET + RT minus their dial), threshold (best opponent minus player in ET + RT; positive if the player crosses the line first). Source: dragBridge.getPlayerRaceResult or getWinnersData.

## Notes

- If the winners are unavailable or empty, a node error is set and the outputs are not modified.
- dialDiff and threshold are only filled if getPlayerRaceResult exists.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Clears data and result. | 25 |
| `C:work()` | Reads the bridge result and feeds the used outputs. | 30 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/getDragWinners.lua`.*
