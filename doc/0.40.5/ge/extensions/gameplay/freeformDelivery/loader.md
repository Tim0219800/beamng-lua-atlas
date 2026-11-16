# `gameplay_freeformDelivery_loader`

*File: `lua/ge/extensions/gameplay/freeformDelivery/loader.lua` · VM: Game Engine (GE) · 251 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_freeformDelivery_loader`: `extensions.load("gameplay_freeformDelivery_loader")`, then the global `gameplay_freeformDelivery_loader`

Loads a freeform delivery definition file (JSON): reads the data, loads the sites file (sitesFile), spawns the prefabs (prefabFile or prefabFiles) at the world origin, indexes the vehicles they contain by their internalName, then reloads collision and the navgraph if the prefabs contain any. Used by gameplay_freeformDelivery_freeformDelivery.load.

## Notes

- Fields added to the returned table: _basePath (file path), sites (Sites object), _prefabIds (ids of spawned prefabs), _vehicleIndex (internalName -> vehicle id), _hasColliders. The vehicles and targetAreas fields are replaced by {} if missing.
- The file's relative paths are resolved by gameplay_freeformDelivery_utils.resolvePath.
- Prefabs are spawned with canSave = false, added to MissionGroup, and a systemYield() is done after each prefab (to be called in a job/coroutine).
- be:reloadCollision() is called if a TSStatic has a collisionType other than None; map.reset() is called if a BeamNGWaypoint (without excludeFromMap) or a DecalRoad with drivability > 0 is found. During level loading (core_gamestate.loading()), these reloads are only logged.
- Two vehicles with the same internalName: the last one overwrites the previous one (logged warning).
- In findAllObjectsRecursive, the obj.size test is done on a C++ object method: a loading error of a sub-object makes the whole loading fail (returns nil).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_freeformDelivery_loader.load(deliveryPath)` | Loads a delivery: returns the JSON data table enriched with sites, prefabs and vehicle index. Returns nil (logged error) if the file, the sites or a prefab cannot be loaded. | 142 |

### Parameter details

#### `gameplay_freeformDelivery_loader.load(deliveryPath)`

Loads a delivery: returns the JSON data table enriched with sites, prefabs and vehicle index. Returns nil (logged error) if the file, the sites or a prefab cannot be loaded.

- `deliveryPath` (*string*) : Path of the delivery's JSON file.
- **returns**: table|nil Delivery data (vehicles, targetAreas, sites, _prefabIds, _vehicleIndex, ...).

## Calls into the engine (C++)

- `be:` `reloadCollision`
- `obj:` `at`, `getClassName`, `getId`, `getInternalName`, `isSubClassOf`, `size`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/freeformDelivery/loader.lua`.*
