# `flowgraph_nodes_gameplay_pointsBarSetPoints`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/pointsBarSetPoints.lua` · VM: Game Engine (GE) · 27 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/pointsBarSetPoints")` (file under extensions/ but not a regular extension)

Flowgraph node "PointsBar Points" (category repeat_instant, ui color/icon). Sets the points and the label of the pointsBar UI app via ui_apps_pointsBar.setPoints(points, pointsLabel), then marks self.mgr.modules.ui.pointsBarChanged = true. Inputs: points (number, fill length of the bar) and pointsLabel (string, displayed text). Runs every frame it receives flow.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Calls ui_apps_pointsBar.setPoints with the points and pointsLabel pins and signals the change to the flowgraph ui module. | 21 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/pointsBarSetPoints.lua`.*
