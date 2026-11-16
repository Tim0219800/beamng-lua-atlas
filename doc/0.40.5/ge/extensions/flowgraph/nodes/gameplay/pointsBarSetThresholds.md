# `flowgraph_nodes_gameplay_pointsBarSetThresholds`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/pointsBarSetThresholds.lua` · VM: Game Engine (GE) · 28 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/pointsBarSetThresholds")` (file under extensions/ but not a regular extension)

Flowgraph node "PointsBar Thresholds" (category repeat_instant, ui color/icon). Defines the bronze, silver and gold thresholds (number inputs) of the points bar via ui_apps_pointsBar.setThresholds({bronze, silver, gold}), then sets self.mgr.modules.ui.pointsBarChanged to true.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Calls ui_apps_pointsBar.setThresholds with the three thresholds and signals the change to the flowgraph ui module. | 22 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/pointsBarSetThresholds.lua`.*
