# `flowgraph_nodes_gameplay_race_imRaceTimes`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/race/imRaceTimes.lua` · VM: Game Engine (GE) · 46 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/race/imRaceTimes")` (file under extensions/ but not a regular extension)

Flowgraph node "im Race Times" (category repeat_instant, tag scenario). Draws in imgui the race times of a vehicle by calling race:inDrawTimes(vehId, im, detailed) on the received raceData object. Inputs: raceData ('raceData' table) and vehId (number). If the function returns true (click in the UI), the data.detailed option is toggled.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Empty: no drawing in the node body. | 26 |
| `C:init(mgr, ...)` | Initializes data.detailed to false. | 22 |
| `C:work(args)` | If raceData is present, draws the vehicle's times and toggles detailed mode when inDrawTimes returns true. | 30 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/race/imRaceTimes.lua`.*
