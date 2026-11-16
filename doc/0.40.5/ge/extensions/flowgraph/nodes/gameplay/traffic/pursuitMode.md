# `flowgraph_nodes_gameplay_traffic_pursuitMode`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitMode.lua` · VM: Game Engine (GE) · 41 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/pursuitMode")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Pursuit Mode" (once_instant). Sets the pursuit mode for a traffic vehicle: mode (0 off, 1 to 3 active, -1 arrested), targetId (default: player vehicle), policeId (default: all police). Does nothing if traffic is not 'on'; inserts the target into traffic if absent.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Displays "Traffic not active!" if traffic is not active. | 34 |
| `C:workOnce()` | If traffic is 'on', inserts the target into traffic if needed then calls gameplay_police.setPursuitMode(mode, vehId, policeId). | 23 |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitMode.lua`.*
