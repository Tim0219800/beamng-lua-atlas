# `flowgraph_nodes_scene_spawnTSStatic`

*File: `lua/ge/extensions/flowgraph/nodes/scene/spawnTSStatic.lua` · VM: Game Engine (GE) · 142 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/spawnTSStatic")` (file under extensions/ but not a regular extension)

Flowgraph node "Spawn TSStatic" (once_instant, author BeamNG). Creates a TSStatic object with shapeName, position, rotation and scale. Inputs: flow, reset, shapeName, position, rotation, scale. Outputs: flow, created (one-frame impulse), lastId. The object is deleted on stop, at the end of the mission or on destruction.

## Notes

- The code for an offset (pin offset) is commented out in createObject and has no effect.
- maxObjectCount is not used.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls onNodeReset. | 100 |
| `C:createObject(objectName)` | Creates the TSStatic (canSave = false), registers it under spawnedObj_<time>_<id>_<n>, writes lastId and notifies the editor. | 41 |
| `C:destroy()` | Called when the node is destroyed: cleans up the created objects. | 136 |
| `C:init(mgr, ...)` | Initializes the object list and data.maxObjectCount = 1. | 35 |
| `C:onClientEndMission()` | End-of-mission hook: cleans up the objects created by the node. | 132 |
| `C:onNodeReset()` | Deletes all created objects. | 104 |
| `C:work()` | Drops created back to false on the next frame. | 121 |
| `C:workOnce()` | Creates the object and raises created. | 116 |

## Calls into the engine (C++)

- `obj:` `delete`, `getId`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/spawnTSStatic.lua`.*
