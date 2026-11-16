# `flowgraph_nodes_gameplay_race_racePacenoteReached`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/race/racePacenoteReached.lua` · VM: Game Engine (GE) · 51 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/race/racePacenoteReached")` (file under extensions/ but not a regular extension)

Flowgraph node "Race Pacenote Reached" (category logic, tag scenario). Lets a pulse through when a vehicle reaches a pacenote of the race (events.pacenoteReached). Outputs: flow (pulse) and note (pacenote text, race.path.pacenotes.objects[id].note).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Empty. | 29 |
| `C:init(mgr, ...)` | Initializes data.detailed = false (unused). | 25 |
| `C:work(args)` | Sets flow and note according to the vehicle's events. | 33 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/race/racePacenoteReached.lua`.*
