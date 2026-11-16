# `flowgraph_nodes_gameplay_traffic_pursuitParams`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitParams.lua` · VM: Game Engine (GE) · 61 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/pursuitParams")` (file under extensions/ but not a regular extension)

Flowgraph node "Pursuit Parameters" (once_instant). Sets the police parameters (gameplay_police.setPursuitVars): policeStrictness (strictness), arrestLimit (arrestTime), arrestRadius, evadeLimit (evadeTime), evadeRadius, suspectFrequency, roadblockFrequency. Only non-nil pins are applied.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:init()` | Initializes the node's internal state at creation (called by the flowgraph engine). | 27 |
| `C:workOnce()` | Builds the variables table from the non-nil pins and calls gameplay_police.setPursuitVars. | 31 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitParams.lua`.*
