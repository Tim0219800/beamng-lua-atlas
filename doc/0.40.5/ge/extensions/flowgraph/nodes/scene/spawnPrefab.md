# `flowgraph_nodes_scene_spawnPrefab`

*File: `lua/ge/extensions/flowgraph/nodes/scene/spawnPrefab.lua` · VM: Game Engine (GE) · 121 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/spawnPrefab")` (file under extensions/ but not a regular extension)

Flowgraph node "Spawn Prefab" (author BeamNG, behaviour once). Loads a prefab (.prefab.json or old .prefab) at a position via spawnPrefab, adds it to the MissionGroup and registers it in the flowgraph prefab module. Inputs: flow, reset, resetVeh, path, name, pos, useGlobalTranslation, silent. Outputs: flow, created (impulse), id, origVehId (player vehicle before spawn), success.

## Notes

- The prefab's objects are not deleted by this node: the prefab module takes care of it at the end (except Keep Prefab).
- Loading a prefab with vehicles changes the player's vehicle; origVehId allows finding it again.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Forgets the objects on stop. | 81 |
| `C:clearObjects()` | Empties the object list (without deleting the prefab from the scene). | 85 |
| `C:createObject()` | Resolves the path (with possible extensions), creates the prefab (canSave = false), puts it in MissionGroup and in modules.prefab; on failure, objects = {'failed'}. | 45 |
| `C:destroy()` | Called when the node is destroyed: forgets the objects. | 116 |
| `C:init(mgr, ...)` | Initializes the object list and origPositions. | 33 |
| `C:onClientEndMission()` | End-of-mission hook: forgets the objects. | 112 |
| `C:postInit()` | Restricts the path pin to .prefab.json and .prefab files. | 38 |
| `C:work()` | Handles reset (forgets the prefab), resetVeh (restores the vehicle positions) and creates the prefab only once per flow; writes created, flow and success. | 89 |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/spawnPrefab.lua`.*
