# `flowgraph_nodes_mission_getSetupData`

*File: `lua/ge/extensions/flowgraph/nodes/mission/getSetupData.lua` · VM: Game Engine (GE) · 43 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/mission/getSetupData")` (file under extensions/ but not a regular extension)

Flowgraph node 'Get Mission Setup Data' (provider category). Exposes on its outputs the values of the mission setup modules (self.mgr.activity.setupModules): use of the player's original vehicle, chosen model/config, and traffic settings (active, previous traffic, amount, active amount, respawn rate).

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:work()` | If an activity with setupModules exists, copies data.vehicles.* and data.traffic.* to the pins (booleans forced, default values '' or 0). | 25 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/mission/getSetupData.lua`.*
