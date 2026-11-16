# `flowgraph_nodes_gameplay_allowWalking`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/allowWalking.lua` · VM: Game Engine (GE) · 42 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/allowWalking")` (file under extensions/ but not a regular extension)

Flowgraph node "Allow Walking" (default category, depends on gameplay_walk). Allows or forbids walking mode, and therefore entering and exiting vehicles. Input pins: flow, allow, deny, set (hidden) and enable (hidden bool, used with set). Output: flow, copy of the input. Calls gameplay_walk.enableToggling.

**Dependencies (loaded first):** `gameplay_walk`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work(args)` | If flow is active: allow enables walking mode, deny disables it, set applies it according to enable. Copies flow to the output. | 25 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/allowWalking.lua`.*
