# `flowgraph_nodes_gameplay_missionDefaults`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/missionDefaults.lua` · VM: Game Engine (GE) · 32 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/missionDefaults")` (file under extensions/ but not a regular extension)

Flowgraph node "Mission Defaults" (category provider). Provides default values common to missions: markerInactive (light orange RGBA color {232,132,52}/255), markerActive (light green RGBA color {156,229,61}/255, for the 3D markers of the Parking Markers node) and fadeTransitionTime (0.75 s). The values are set only once when execution starts.

## Notes

- The pin descriptions say "Inactive" for both colors (copy-paste in the code); markerActive is indeed the green color.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Writes the values of the three output pins when the graph starts. | 23 |
| `C:init()` | Disables clearOutPinsOnStart so that the outputs keep their values. | 19 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/missionDefaults.lua`.*
