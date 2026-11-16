# `flowgraph_nodes_scene_spawnLight`

*File: `lua/ge/extensions/flowgraph/nodes/scene/spawnLight.lua` · VM: Game Engine (GE) · 140 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/spawnLight")` (file under extensions/ but not a regular extension)

Flowgraph node "SpotLight" (repeat_instant, author BeamNG). Creates a SpotLight object (worldEditorCppApi.createObject) and updates it. Inputs: update (flow), clear (impulse), position, rotation, range (20), innerAngle (15), outerAngle (45), color, brightness (1). Outputs: created (impulse), lastId. data.maxObjectCount (1) limits the number of objects.

## Notes

- The name built in createObject is never used (no registerObject).
- The color pin must contain 4 components, otherwise the concatenation fails.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Deletes the lights on stop. | 76 |
| `C:clearObjects()` | Deletes all created lights. | 79 |
| `C:createObject(objectName)` | Creates the light with the pin values (canSave = false), adds it to the list, writes lastId and notifies the editor. | 38 |
| `C:destroy()` | Called when the node is destroyed: cleans up the created objects. | 134 |
| `C:init(mgr, ...)` | Initializes the object list and data.maxObjectCount = 1. | 33 |
| `C:onClientEndMission()` | End-of-mission hook: cleans up the objects created by the node. | 129 |
| `C:work()` | On clear, deletes; otherwise creates the light if the maximum is not reached (created = true) and, with update, updates it (position, rotation, angles, brightness, range, color). | 92 |

## Calls into the engine (C++)

- `obj:` `delete`, `getId`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/spawnLight.lua`.*
