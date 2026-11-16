# `flowgraph_nodes_ui_raceCheckpoints`

*File: `lua/ge/extensions/flowgraph/nodes/ui/raceCheckpoints.lua` · VM: Game Engine (GE) · 45 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/raceCheckpoints")` (file under extensions/ but not a regular extension)

Flowgraph node "Set UI Race Checkpoints" (category repeat_instant, author BeamNG, duration): updates the checkpoints UI app. Inputs: "cur" (nil = clears), "max". Sends 'WayPointChange' {current, count} and a "checkpoint" entry (text "cur / max") in ui_apps_genericMissionData (category raceCheckpoints, order 100); clears with 'WayPointReset'.

## Notes

- If max is nil, the concatenation of the "cur / max" text causes an error.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:work()` | Sends or clears the checkpoint counter in the UI. | 24 |

**UI events (guihooks.trigger):** `WayPointChange`, `WayPointReset`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/raceCheckpoints.lua`.*
