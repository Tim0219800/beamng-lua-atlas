# `flowgraph_nodes_mission_clearLightsDragRace`

*File: `lua/ge/extensions/flowgraph/nodes/mission/clearLightsDragRace.lua` · VM: Game Engine (GE) · 91 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/mission/clearLightsDragRace")` (file under extensions/ but not a regular extension)

Flowgraph node 'Clear Lights Dragrace' (repeat_instant category). Hides the prestage/stage and countdown lights (scene objects Prestagelight_l/r, Stagelight_l/r, Amberlight1-3_L/R, Greenlight_L/R, Redlight_L/R) as well as the 20 digit displays (display_time_i / display_speed_i), at the end or abandonment of a drag race mission.

## Notes

- The input pin 'flow' is not tested: the node acts on every call of work.
- Crashes if the scene objects (lights, displays) do not exist.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Clears the lights table and sets flow to false. | 71 |
| `C:clearDigits()` | Hides the displays display_time_i_l/r and display_speed_i_l/r (i from 1 to 5). | 55 |
| `C:init()` | Same initialization. | 76 |
| `C:initLights()` | Searches the scene for the light objects and hides them all (setHidden(true)). | 18 |
| `C:work()` | Calls initLights and clearDigits on every frame of flow (no check of the input flow) and sets flow to true. | 81 |

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/mission/clearLightsDragRace.lua`.*
