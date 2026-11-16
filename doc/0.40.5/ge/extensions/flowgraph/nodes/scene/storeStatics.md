# `flowgraph_nodes_scene_storeStatics`

*File: `lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua` · VM: Game Engine (GE) · 329 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/storeStatics")` (file under extensions/ but not a regular extension)

Flowgraph node "Store Statics" (author BeamNG). Remembers the position, rotation, scale and shape of the TSStatics selected in the editor (stored in the node, saved with the graph) then spawns them on flow. In the editor, the panel allows storing the selection, spawning/despawning everything, selecting or clearing. Inputs: flow, reset; output: flow.

## Notes

- The node's description ("Creates and manages spawning TSStatic objects") is copied from Spawn TSStatic.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Detects whether stored objects already exist in the scene. | 224 |
| `C:_executionStopped()` | Deletes the objects unless they existed before start. | 233 |
| `C:_onDeserialized(nodeData)` | Restores storedObjects and forgets the current ids. | 321 |
| `C:_onSerialize(res)` | Saves storedObjects. | 317 |
| `C:clearObjects()` | Deletes all created objects and forgets their ids. | 239 |
| `C:createObject(pos, rot, scl, shape)` | Creates a TSStatic from the stored data and returns its id. | 194 |
| `C:destroy()` | Deletes the objects unless they existed before start. | 309 |
| `C:drawCustomProperties()` | Editor panel: list of stored objects, buttons Store Selected, Spawn All, Despawn All, Select All, Clear Storage. | 33 |
| `C:init(mgr, ...)` | Initializes objects and storedObjects. | 28 |
| `C:onClientEndMission()` | End-of-mission hook: cleans up the objects created by the node. | 305 |
| `C:spawnObjects(force)` | Creates all stored objects (if none exists or if force). | 265 |
| `C:updateStoredObjects(ids)` | Replaces the storage with the given TSStatics (captures their transform), deletes the originals then recreates them. | 145 |
| `C:work()` | On reset, deletes; on flow, spawns the stored objects and activates flow on output. | 292 |

## Calls into the engine (C++)

- `obj:` `delete`, `getId`, `getPosition`, `getRotation`, `getScale`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua`.*
