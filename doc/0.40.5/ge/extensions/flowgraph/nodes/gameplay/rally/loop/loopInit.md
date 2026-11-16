# `flowgraph_nodes_gameplay_rally_loop_loopInit`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopInit.lua` · VM: Game Engine (GE) · 89 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/loop/loopInit")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Loop Init" (category once_instant, tag rally). Initializes the rally loop: reloads the loop extension (unload then load), detects the mission id and folder (RallyUtil.detectMissionIdHelper), applies the date and time of the mission environment if enabled (RallyLoopTime.applyCurrentDate, and RallyLoopTime.setPlaying(false, hour) if _rallyForceStatic), enables debug logging then calls gameplay_rallyLoop.setup(missionId, missionDir). Outputs: success (flow) or failed (flow) if no mission id is detected.

## Notes

- On failure, an error box in the log reminds to choose a rally stage in the mission editor and to open the race file.
- When the graph stops, the rally loop extension is unloaded.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Unloads the rally loop extension if loaded. | 30 |
| `C:loadExt()` | Loads the rally loop extension if it is not loaded. | 45 |
| `C:unloadExt()` | Unloads the rally loop extension if it is loaded. | 38 |
| `C:workOnce()` | Reloads the extension, detects the mission, configures the environment and launches gameplay_rallyLoop.setup; sets success or failed to true. | 52 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopInit.lua`.*
