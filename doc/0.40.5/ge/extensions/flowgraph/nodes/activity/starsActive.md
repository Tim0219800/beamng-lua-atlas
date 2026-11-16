# `flowgraph_nodes_activity_starsActive`

*File: `lua/ge/extensions/flowgraph/nodes/activity/starsActive.lua` · VM: Game Engine (GE) · 64 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/activity/starsActive")` (file under extensions/ but not a regular extension)

Flowgraph node "Stars Active" (category repeat_instant, tags activity/mission). Each custom flow output pin (pin name = star key) lets the flow through if the corresponding star is active for the mission's current user settings (gameplay_missions_missionScreen.getActiveStarsForUserSettings). The list is computed only once (expensive) then cached until the next graph start. Without input flow, all pins are false.

## Notes

- Without an associated activity, does nothing. A key absent from starInfo gives false (self.activeStars[pin.name] tested beforehand).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Clears the cache of active stars. | 28 |
| `C:init()` | Enables savePins and allowCustomOutPins. | 23 |
| `C:work()` | Computes (once) starInfo then sets each flow output pin to the enabled value of the corresponding star. | 33 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/activity/starsActive.lua`.*
