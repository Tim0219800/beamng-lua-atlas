# `flowgraph_nodes_activity_autoStarGoals`

*File: `lua/ge/extensions/flowgraph/nodes/activity/autoStarGoals.lua` · VM: Game Engine (GE) · 72 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/activity/autoStarGoals")` (file under extensions/ but not a regular extension)

Flowgraph node "Auto Star Goals" (category once_instant, tag activity). Automatically creates the Tasklist app's objectives from the mission's active stars: sends the guihook SetTasklistHeader (mission name) then one SetTasklistTask per active star (type goal, id = star key, label from starLabels). Hardcoded input pin "addMissionTitle" (bool).

## Notes

- The addMissionTitle pin is declared but never read: the header is always sent.
- A string label becomes {txt, context} with the context taken from the string/number fields of missionTypeData; a function label is called with the mission.
- Crashes without an associated activity (self.mgr.activity is nil).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty. | 25 |
| `C:workOnce()` | Sends SetTasklistHeader then a SetTasklistTask (done/fail false, active true) for each star of careerSetup.starsActive. | 39 |

**UI events (guihooks.trigger):** `SetTasklistHeader`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/activity/autoStarGoals.lua`.*
