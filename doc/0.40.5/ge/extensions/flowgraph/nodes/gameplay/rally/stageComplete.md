# `flowgraph_nodes_gameplay_rally_stageComplete`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/stageComplete.lua` · VM: Game Engine (GE) · 24 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/stageComplete")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Mode Stage Complete" (category once_instant, tag rally, no pin). Signals the end of the stage (vehicle stopped) by triggering extensions.hook('onRallyStageComplete').

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Emits the onRallyStageComplete hook. | 19 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onRallyStageComplete`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/stageComplete.lua`.*
