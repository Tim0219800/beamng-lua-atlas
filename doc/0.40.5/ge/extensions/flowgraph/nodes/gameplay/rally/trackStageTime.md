# `flowgraph_nodes_gameplay_rally_trackStageTime`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackStageTime.lua` · VM: Game Engine (GE) · 43 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/trackStageTime")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Track Stage Time" (category repeat, timer icon, tag rally). Every frame, emits the onRallyDataUpdated hook with {activeState = stageActive} to signal to the rally system that the stage is active. Copies flow to the output.

## Notes

- Despite its name, the node measures no time: stageTime = os.clockhp() is computed but never used.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init(mgr, ...)` | Empty. | 23 |
| `C:work(args)` | Emits onRallyDataUpdated (stageActive) and copies the flow. | 30 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onRallyDataUpdated` — listened to by 2 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackStageTime.lua`.*
