# `flowgraph_nodes_environment_getTimeOfDay`

*File: `lua/ge/extensions/flowgraph/nodes/environment/getTimeOfDay.lua` · VM: Game Engine (GE) · 28 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/environment/getTimeOfDay")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Time of Day" (category provider, tags environment/tod). Outputs the current time of day (core_environment.getTimeOfDay): time (0 to 1) and dayLength (duration of a day-night cycle in real seconds).

## Notes

- Documentation inconsistency in the game: this node says "0/1 is midnight, 0.5 noon", while Set Time of Day says "0/1 noon, 0.5 midnight" and Random Time of Day "0.5 midnight". The Set Time of Day templates (0 = Midday, 0.5 = Midnight) and the Random Time of Day conversions go in the 0.5 = midnight direction.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Every frame, writes time and dayLength to the outputs. | 21 |

## Calls into the engine (C++)

- `core_environment.` `getTimeOfDay`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/environment/getTimeOfDay.lua`.*
