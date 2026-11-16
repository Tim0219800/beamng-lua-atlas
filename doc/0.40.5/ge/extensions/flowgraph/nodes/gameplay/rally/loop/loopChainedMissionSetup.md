# `flowgraph_nodes_gameplay_rally_loop_loopChainedMissionSetup`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopChainedMissionSetup.lua` · VM: Game Engine (GE) · 43 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/loop/loopChainedMissionSetup")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Loop Chained Mission Setup" (category once_instant, tag rally, no pin). Prepares the next mission of the rally loop after an execution transfer: sets the transfer flag to false (gameplay_rallyLoop.setMissionExecutionTransferFlag(false)) then calls gameplay_rallyLoop.setupForNewMission(). When the graph stops, unloads the rally loop extension unless an execution transfer is in progress.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Unloads the rally loop extension if it is loaded and no mission execution transfer is signaled. | 21 |
| `C:workOnce()` | Resets the transfer flag and calls setupForNewMission if gameplay_rallyLoop exists. | 33 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopChainedMissionSetup.lua`.*
