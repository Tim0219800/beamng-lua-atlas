# `flowgraph_nodes_activity_attemptStars`

*File: `lua/ge/extensions/flowgraph/nodes/activity/attemptStars.lua` · VM: Game Engine (GE) · 48 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/activity/attemptStars")` (file under extensions/ but not a regular extension)

Flowgraph node "Activity Attempt Stars" (category once_instant, tags activity/mission). Adds the completed stars to an attempt: each custom bool input pin (pin name = star key) is written into attempt.unlockedStars. Fixed input and output "attempt" (attemptData). Only the bool type is allowed for manual pins.

## Notes

- A nil value on a pin becomes false in unlockedStars. The attempt table is modified in place then returned.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Enables savePins and allowCustomInPins. | 27 |
| `C:workOnce()` | For each non-fixed, non-flow input pin, sets attempt.unlockedStars[name] = pin value (or false), then outputs attempt. | 32 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/activity/attemptStars.lua`.*
