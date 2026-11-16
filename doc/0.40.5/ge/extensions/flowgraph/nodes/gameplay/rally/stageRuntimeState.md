# `flowgraph_nodes_gameplay_rally_stageRuntimeState`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/stageRuntimeState.lua` · VM: Game Engine (GE) · 78 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/stageRuntimeState")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Stage Runtime State" (category repeat_instant, tag rally). Reads the stage runtime state held by the RallyManager: puts the manager in 'tracker' authority mode, activates the stage (setStageRuntimeActive(true)) and sends onRallyDataUpdated with the stageActive state while flow is active. Outputs: flow, active (stage active), complete (tracking finished, via getStageObserverState().stageComplete) and time (stage time in s: currentSSTime or getStageRuntimeTime, last value kept).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets lastTime to 0. | 28 |
| `C:init()` | Initializes lastTime to 0. | 24 |
| `C:work()` | Every frame: resets the outputs to zero then fills them from the rally manager. | 39 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onRallyDataUpdated` — listened to by 2 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/stageRuntimeState.lua`.*
