# `flowgraph_nodes_scene_idByName`

*File: `lua/ge/extensions/flowgraph/nodes/scene/idByName.lua` · VM: Game Engine (GE) · 68 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/idByName")` (file under extensions/ but not a regular extension)

Flowgraph node "ID by Name" (simple category). Finds the id of the first scene object with a given name (scenetree.findObject). Input: name (string, hidden; otherwise the name is in self.data.name). Outputs: objID (number) and exist (bool, hidden). The found id is remembered until the start/end of a mission or the start of the graph.

## Notes

- Once the id is found, it is kept even if the pin's name later changes and the object is no longer found.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Forgets the remembered id when the graph starts. | 56 |
| `C:drawMiddle(builder, style)` | Displays the current name and id in the middle of the node. | 60 |
| `C:init()` | Empty name and objID nil. | 24 |
| `C:onClientEndMission()` | End-of-mission hook: forgets the remembered id. | 48 |
| `C:onClientStartMission()` | Start-of-mission hook: forgets the remembered id. | 52 |
| `C:work()` | Uses the name pin if it is connected, looks up the object and writes objID and exist. | 29 |

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/idByName.lua`.*
