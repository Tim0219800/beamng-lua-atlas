# `flowgraph_nodes_gameplay_rally_sessionStart`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/sessionStart.lua` · VM: Game Engine (GE) · 129 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/sessionStart")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Mode Session Start" (category once_instant, tag rally). Loads what rally mode needs: extensions gameplay_rally, rally loop bridge (extRallyLoop) and gameplay_rallyStartClock; determines the mission (via the rally loop manager if loaded, otherwise RallyUtil.detectMissionIdHelper); calls gameplay_rally.loadMission(missionId, missionDir, nil, voicepackPick, {owner = 'mission'}); if disableOnStart, disables pacenote processing; in loop mode, calls gameplay_rallyLoop.setupForNewMission() and outputs the loop prefab path (loopPrefab, rm:getLoopPrefabPath()). If fireEvents, triggers the onRallySessionStart hook. Inputs: fireEvents (default true), disableOnStart (default false). Output: loopPrefab (string).

## Notes

- When the graph stops, unloads gameplay_rallyStartClock and gameplay_rally (and the loop bridge if it was loaded by this node and no loop manager exists) then triggers onRallySessionEnd if fireEvents.
- If the mission is not detected, an error box is logged and nothing is loaded.
- The loopPrefab pin is declared with type string and default = false (inconsistent).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Unloads the rally extensions and emits onRallySessionEnd if fireEvents. | 25 |
| `C:loadExt()` | Loads the gameplay_rally extension if needed. | 47 |
| `C:loadRallyLoopBridge()` | Loads the rally loop bridge if it is not loaded and remembers whether this node loaded it. | 54 |
| `C:unloadExt()` | Unloads gameplay_rallyStartClock, gameplay_rally and, under conditions, the rally loop bridge. | 33 |
| `C:workOnce()` | Executes the session start sequence described in the module description. | 63 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onRallySessionEnd` — listened to by 1 module(s)
- `onRallySessionStart`

**Loads extensions:** `gameplay_rally`, `gameplay_rallyStartClock`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/sessionStart.lua`.*
