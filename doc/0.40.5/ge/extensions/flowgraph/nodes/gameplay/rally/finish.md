# `flowgraph_nodes_gameplay_rally_finish`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/finish.lua` · VM: Game Engine (GE) · 23 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/finish")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Mode Finish" (category once_instant, tag rally, no pin). When it receives flow, triggers once the hook extensions.hook('onRallyStageFlyingFinish') signaling that the vehicle has crossed the flying finish of the stage.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Calls extensions.hook('onRallyStageFlyingFinish'). | 18 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onRallyStageFlyingFinish`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/finish.lua`.*
