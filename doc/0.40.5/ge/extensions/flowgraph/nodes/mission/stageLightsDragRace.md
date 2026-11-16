# `flowgraph_nodes_mission_stageLightsDragRace`

*File: `lua/ge/extensions/flowgraph/nodes/mission/stageLightsDragRace.lua` · VM: Game Engine (GE) · 76 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/mission/stageLightsDragRace")` (file under extensions/ but not a regular extension)

Flowgraph node 'Set Stage Lights' (repeat_instant category). Turns on the Pre Stage or Stage light of the drag race Christmas tree (scene objects Prestagelight_l/r and Stagelight_l/r) on side 'side' ('l' or 'r', default 'l'). 'light' is 'preStage' (default) or 'stage'. The 'reset' impulse hides all these lights.

## Notes

- The flow output is never written, and the flow input pin is not tested.
- Without a prior reset, self.lights is empty and work crashes when accessing the lights.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Empties the lights table. | 43 |
| `C:init()` | Empties the lights table. | 47 |
| `C:initLights()` | Searches the scene for the four light objects. | 32 |
| `C:postInit()` | Defines the offered values of the pins side (left/right) and light (Pre Stage/Stage). | 21 |
| `C:work()` | On reset: finds the lights again and hides them. Otherwise makes the chosen light visible. | 51 |

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/mission/stageLightsDragRace.lua`.*
