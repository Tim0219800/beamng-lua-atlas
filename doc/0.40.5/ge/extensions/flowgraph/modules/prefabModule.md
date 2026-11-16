# `flowgraph_modules_prefabModule`

*File: `lua/ge/extensions/flowgraph/modules/prefabModule.lua` · VM: Game Engine (GE) · 340 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/modules/prefabModule")` (file under extensions/ but not a regular extension)

Flowgraph module (moduleOrder 50) that spawns, tracks and deletes prefabs (groups of scene objects, .prefab.json) during a project. When a prefab is added, it lists all child objects by class, stores the vehicles' transforms, detects whether colliders or waypoints / roads (navgraph) are contained, then reloads the collision (be:reloadCollision) and the navgraph (map.reset) at the right time. On stop, it deletes all prefabs not marked dontDelete.

## Notes

- spawnPrefab resolves <name>/<name>.prefab.json relative to the project, places the prefab at (0,0,0), canSave = false, in MissionGroup.
- During level loading, reloads go through mgr.modules.level:delayOrInstantFunction; otherwise they are done in afterTrigger via flags.
- If a BeamNGGameplayArea is part of the prefab, collision and navgraph are reloaded immediately ('hacky' workaround commented in the code).
- Non-vehicle objects with a Name generate a warning: use Internal Name. Vehicles named 'clone...' too.
- moreData accepts skipCollisionReload and skipNavgraphReload.

## Functions

| Function | Description | Line |
|---|---|---|
| `flowgraph_modules_prefabModule.addPrefab(id, moreData)` | Tracks an existing prefab in the scene: lists its children, its vehicles, detects colliders and navgraph and schedules the necessary reloads. (dynamically assigned) | dyn |
| `flowgraph_modules_prefabModule.afterTrigger()` | Called after the graph tick: reloads the collision and rebuilds the navgraph (map.reset, except during loading) if the flags are raised. (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_prefabModule.clear()` | Clears prefabs, flags and sortedIds. (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_prefabModule.deletePrefab(id, force)` | Deletes the prefab (except dontDelete without force), removes it from tracking and schedules a collision reload if it contained any. (dynamically assigned) | dyn |
| `flowgraph_modules_prefabModule.executionStopped()` | Called when the project stops: deletes all tracked prefabs not marked dontDelete, reloads collision and navgraph if needed, then calls clear(). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_prefabModule.getPrefab(id)` | Returns the data of the tracked prefab, or an empty table. (dynamically assigned) | dyn |
| `flowgraph_modules_prefabModule.getVehicleIdsForPrefab(id)` | Returns the ids of the vehicles contained in the prefab, sorted. (dynamically assigned) | dyn |
| `flowgraph_modules_prefabModule.init()` | Creates the tables prefabs, sortedIds, flags then calls clear(). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_prefabModule.originalVehicleTransforms(data)` | Computes {pos, rot, up} for each vehicle (BeamNGVehicle) of the prefab and adds them to the manager's vehicle module. (dynamically assigned) | dyn |
| `flowgraph_modules_prefabModule.restoreVehiclePositions(id)` | Puts the prefab's vehicles back at their original position and rotation and resets the physics and the deformations. (dynamically assigned) | dyn |
| `flowgraph_modules_prefabModule.setKeepPrefab(id, keep)` | Marks the prefab as to be kept when the project stops (dontDelete). Warns if the prefab is not tracked. (dynamically assigned) | dyn |
| `flowgraph_modules_prefabModule.setUnpackVehiclesBeforeDeletion(id, set)` | Indicates whether the vehicles must be extracted before the prefab is deleted. (dynamically assigned) | dyn |
| `flowgraph_modules_prefabModule.spawnPrefab(fileName)` | Creates a prefab from <name>.prefab.json (path relative to the project), adds it to MissionGroup and tracks it via addPrefab. (dynamically assigned) | dyn |
| `flowgraph_modules_prefabModule.unpackPrefabAndDelete(id, obj)` | Explodes the prefab (obj:explode), deletes the prefab then reinserts its vehicles into MissionGroup at their current position before deleting the remaining group. (dynamically assigned) | dyn |

### Parameter details

#### `flowgraph_modules_prefabModule.addPrefab(id, moreData)`

Tracks an existing prefab in the scene: lists its children, its vehicles, detects colliders and navgraph and schedules the necessary reloads. (dynamically assigned)

- `id` (*integer*) : prefab id in the scene
- `moreData` (*table|nil*) : fields copied into the data; skipCollisionReload, skipNavgraphReload

#### `flowgraph_modules_prefabModule.deletePrefab(id, force)`

Deletes the prefab (except dontDelete without force), removes it from tracking and schedules a collision reload if it contained any. (dynamically assigned)

- `id` (*integer*) : prefab id
- `force` (*boolean|nil*) : ignore dontDelete

#### `flowgraph_modules_prefabModule.getPrefab(id)`

Returns the data of the tracked prefab, or an empty table. (dynamically assigned)

- `id` (*integer*) : prefab id
- **returns**: table prefab data

#### `flowgraph_modules_prefabModule.getVehicleIdsForPrefab(id)`

Returns the ids of the vehicles contained in the prefab, sorted. (dynamically assigned)

- `id` (*integer*) : prefab id
- **returns**: integer[] ids

#### `flowgraph_modules_prefabModule.originalVehicleTransforms(data)`

Computes {pos, rot, up} for each vehicle (BeamNGVehicle) of the prefab and adds them to the manager's vehicle module. (dynamically assigned)

- `data` (*table*) : prefab data, with allChildrenIds
- **returns**: table<integer, table> transforms by vehicle id

#### `flowgraph_modules_prefabModule.restoreVehiclePositions(id)`

Puts the prefab's vehicles back at their original position and rotation and resets the physics and the deformations. (dynamically assigned)

- `id` (*integer*) : prefab id

#### `flowgraph_modules_prefabModule.setKeepPrefab(id, keep)`

Marks the prefab as to be kept when the project stops (dontDelete). Warns if the prefab is not tracked. (dynamically assigned)

- `id` (*integer*) : prefab id
- `keep` (*boolean*) : keep

#### `flowgraph_modules_prefabModule.setUnpackVehiclesBeforeDeletion(id, set)`

Indicates whether the vehicles must be extracted before the prefab is deleted. (dynamically assigned)

- `id` (*integer*) : prefab id
- `set` (*boolean*) : extract the vehicles

#### `flowgraph_modules_prefabModule.spawnPrefab(fileName)`

Creates a prefab from <name>.prefab.json (path relative to the project), adds it to MissionGroup and tracks it via addPrefab. (dynamically assigned)

- `fileName` (*string*) : prefab name (without extension)
- **returns**: integer prefab object id

#### `flowgraph_modules_prefabModule.unpackPrefabAndDelete(id, obj)`

Explodes the prefab (obj:explode), deletes the prefab then reinserts its vehicles into MissionGroup at their current position before deleting the remaining group. (dynamically assigned)

- `id` (*integer*) : prefab id
- `obj` (*userdata*) : prefab object in the scene

## Class `C`

| Method | Description | Line |
|---|---|---|
| `C:addPrefab(id, moreData)` |  | 152 |
| `C:afterTrigger()` |  | 20 |
| `C:clear()` |  | 14 |
| `C:deletePrefab(id, force)` |  | 284 |
| `C:executionStopped()` |  | 307 |
| `C:getPrefab(id)` |  | 135 |
| `C:getVehicleIdsForPrefab(id)` |  | 239 |
| `C:init()` |  | 7 |
| `C:originalVehicleTransforms(data)` |  | 92 |
| `C:restoreVehiclePositions(id)` |  | 225 |
| `C:setKeepPrefab(id, keep)` |  | 277 |
| `C:setUnpackVehiclesBeforeDeletion(id, set)` |  | 271 |
| `C:spawnPrefab(fileName)` |  | 139 |
| `C:unpackPrefabAndDelete(id, obj)` |  | 248 |

## Calls into the engine (C++)

- `Sim.` `upcast`
- `be:` `reloadCollision`
- `obj:` `at`, `delete`, `explode`, `getChildrenObjectIds`, `getClassName`, `getId`, `isSubClassOf`, `size`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/modules/prefabModule.lua`.*
