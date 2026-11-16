# `flowgraph_nodes_gameplay_isWalkingEnabled`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/isWalkingEnabled.lua` · VM: Game Engine (GE) · 29 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/isWalkingEnabled")` (file under extensions/ but not a regular extension)

Flowgraph node "Is Walking Enabled" (category repeat_instant). Indicates whether the player is allowed to enter or exit a vehicle themselves, according to gameplay_walk.isTogglingEnabled(). Outputs: allowed (flow if allowed), denied (flow otherwise) and value (bool, hidden). Runs every frame.

**Dependencies (loaded first):** `gameplay_walk`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work(args)` | Every frame: reads gameplay_walk.isTogglingEnabled() and updates value, allowed and denied. | 22 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/isWalkingEnabled.lua`.*
