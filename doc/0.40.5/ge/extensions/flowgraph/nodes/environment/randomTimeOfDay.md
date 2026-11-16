# `flowgraph_nodes_environment_randomTimeOfDay`

*File: `lua/ge/extensions/flowgraph/nodes/environment/randomTimeOfDay.lua` · VM: Game Engine (GE) · 110 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/environment/randomTimeOfDay")` (file under extensions/ but not a regular extension)

Flowgraph node "Random Time of Day" (category repeat_instant, tags environment/tod/random). Picks a random time between two hours (0-23) and outputs it in the game format and as text. Inputs: fromHour (default 9), toHour (default 17), use24Hour (default false: 12 h AM/PM format). Outputs: time (0 to 1, where 0.5 = midnight, 0 = midday) and timeString ("HH:MM" or "H:MM AM/PM"). Handles the interval that crosses midnight (e.g. 22 to 2).

## Notes

- A new random pick is made every frame the node receives flow (category repeat_instant); for a stable value, trigger it only once.
- Conversion: time = (hour/24 + 0.5) mod 1.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:postInit()` | Configures the integer 0-23 sliders of fromHour and toHour in the editor. | 50 |
| `C:work()` | Clamps the hours, picks a random time (handling the midnight crossing), computes hour/minute and writes time and timeString. | 66 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/environment/randomTimeOfDay.lua`.*
