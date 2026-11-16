# `flowgraph_nodes_ui_raceLaps`

*File: `lua/ge/extensions/flowgraph/nodes/ui/raceLaps.lua` · VM: Game Engine (GE) · 45 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/raceLaps")` (file under extensions/ but not a regular extension)

Flowgraph node "Set UI Race Laps" (category repeat_instant, author BeamNG, duration): updates the laps UI app. Inputs: "cur" (nil = clears), "max". Sends 'RaceLapChange' {current, count} and the ui_apps_genericMissionData entry (category raceLaps, order 110); clears with 'RaceLapClear'.

## Notes

- If max is nil, the concatenation causes an error.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:work()` | Sends or clears the lap counter in the UI. | 24 |

**UI events (guihooks.trigger):** `RaceLapChange`, `RaceLapClear`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/raceLaps.lua`.*
