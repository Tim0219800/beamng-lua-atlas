# `flowgraph_nodes_career_onMissionRunstateChanged`

*File: `lua/ge/extensions/flowgraph/nodes/career/onMissionRunstateChanged.lua` · VM: Game Engine (GE) · 46 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/career/onMissionRunstateChanged")` (file under extensions/ but not a regular extension)

Flowgraph node "On Mission Start/Stop" (category repeat_instant, ui color/icon). Detects when the player starts (onMissionStartWithFade hook) or stops (onAnyMissionChanged with the 'stopped' state) a mission. Impulse outputs: started and stopped.

## Notes

- work() sets back to false only started; stopped is never explicitly set back to false after being raised (probably an oversight). An "abandoned" output is commented out.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Creates the flag table. | 22 |
| `C:onAnyMissionChanged(newState, mission)` | Hook: raises stopped when the new state is 'stopped'. | 39 |
| `C:onMissionStartWithFade(data)` | Hook: raises started. | 35 |
| `C:work(args)` | Every frame: started to false, applies then clears the flags. | 27 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/career/onMissionRunstateChanged.lua`.*
