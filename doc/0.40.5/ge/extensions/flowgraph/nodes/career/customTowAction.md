# `flowgraph_nodes_career_customTowAction`

*File: `lua/ge/extensions/flowgraph/nodes/career/customTowAction.lua` · VM: Game Engine (GE) · 38 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/career/customTowAction")` (file under extensions/ but not a regular extension)

Flowgraph node "On Custom Tow" (category repeat_instant, career color/icon). Detects when the player uses a custom tow action in the career tutorial. Output: tow (flow, impulse) true one frame after the onCareerCustomTowHook hook. The flowgraph must fade back in from black after the action.

## Notes

- Common event pattern: the hook sets a flag, work() turns it into a one-frame impulse then clears the flags.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Creates the flag table. | 21 |
| `C:onCareerCustomTowHook(poiId)` | Career hook: raises the tow flag. | 33 |
| `C:work(args)` | Every frame: sets tow to false, applies the received flags then clears them. | 25 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/career/customTowAction.lua`.*
