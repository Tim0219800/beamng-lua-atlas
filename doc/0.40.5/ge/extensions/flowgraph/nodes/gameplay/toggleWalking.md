# `flowgraph_nodes_gameplay_toggleWalking`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/toggleWalking.lua` · VM: Game Engine (GE) · 47 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/toggleWalking")` (file under extensions/ but not a regular extension)

Flowgraph node "Toggle Walking" (category repeat_instant, depends on gameplay_walk). Input pulses enterWalking (switches to walking mode, with optional pos/rot) and exitWalking (enters the nearest vehicle). Output pulses success / fail. When entering walking mode, the vehicle left behind is added to the flowgraph vehicle module (ignoreReadyUp).

**Dependencies (loaded first):** `gameplay_walk`

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:work(args)` | Calls gameplay_walk.setWalkingMode(true, pos, rot) or (false) depending on the received pulse, then writes success/fail. | 24 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/toggleWalking.lua`.*
