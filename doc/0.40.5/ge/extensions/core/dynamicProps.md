# `core_dynamicProps`

*File: `lua/ge/extensions/core/dynamicProps.lua` · VM: Game Engine (GE) · 324 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_dynamicProps`: `extensions.load("core_dynamicProps")`, then the global `core_dynamicProps`

Swaps Forest objects (theForest) on the fly with real physical "prop" vehicles (e.g. street lamp, trash bin) when the player gets close, so they can be hit and deformed. A pool of deactivated vehicles is created; every frame, the forest slots closest to the player (within spawnInViewRange) receive a vehicle from the pool and the forest object is moved under the map (z = -999); slots that are too far are given back to the forest. Experimental module: it contains debugging dump() calls.

## Example

```lua
extensions.load('core_dynamicProps')
core_dynamicProps.createDynamicProps({forestItemName = 'postbox_blue', propName = 'trashbin', poolSize = 9, spawnInViewRange = 150, spawnOffset = vec3(0,0,0)})
-- ... later
core_dynamicProps.unloadAll()
```

## Notes

- Parameters of createDynamicProps: name (default "DynamicPropsId<n>"), forestItemName (name of the forest data to replace), propName (vehicle model to spawn), poolSize (default 10), spawnInViewRange in meters (default 100), spawnOffset vec3 (default 0,0,0), artifacts (table, unused).
- onUpdate assumes player 0 has a vehicle (getPlayerVehicle(0):getPosition()) and that core_camera exists; without a player vehicle, Lua error.
- Bugs/inconsistencies: unloadAll sets tempCopy = deepcopy(...) then DynamicProps:unload does tempCopy[self] = nil (an object key that does not exist in a list); calling unload() after deepcopy rebuilds dynamicPropsObjs from that copy, so the state is not really cleared. spawnProp/despawnProp call dump("Spawning"/"Despawning") on every switch. checkVisibility (local, unused) is full of dump().
- Props are vehicles: they appear in the vehicle lists and are named <propName><i> (with identical licenseText).

## Functions

| Function | Description | Line |
|---|---|---|
| `core_dynamicProps.createDynamicProps(data)` | Creates a dynamic props manager: indexes the forest objects named forestItemName in a quadtree, spawns poolSize deactivated vehicles (setActive(0)), reloads collision (be:reloadCollision) and adds it to the list updated by onUpdate. | 91 |
| `core_dynamicProps.onUpdate()` | Per-frame hook: stores the camera and player 0 positions, then updates each manager (swaps forest objects <-> props). *(internal)* *(hook)* | 278 |
| `core_dynamicProps.unloadAll()` | Puts all swapped forest objects back in place, deletes the pool's prop vehicles and reloads collision (see notes on the retained state). | 286 |
| `core_dynamicProps.westCoastBin()` | Preset for West Coast USA: replaces "postbox_blue" with the "trashbin" vehicle (pool 9, range 150 m). | 306 |
| `core_dynamicProps.westCoastPole()` | Preset for West Coast USA: replaces "pole_city1" with the "streetlight" vehicle (pool 1, range 100 m, z offset -0.22). | 296 |

### Parameter details

#### `core_dynamicProps.createDynamicProps(data)`

Creates a dynamic props manager: indexes the forest objects named forestItemName in a quadtree, spawns poolSize deactivated vehicles (setActive(0)), reloads collision (be:reloadCollision) and adds it to the list updated by onUpdate.

- `data` (*table*) : forestItemName, propName, poolSize, spawnInViewRange, spawnOffset, name, artifacts (see notes). An empty table is rejected (error log, no object created).

## Class `DynamicProps`

A dynamic props manager (pool) for one forest object type. Fields: name, forestItemName, propName, poolSize, spawnInViewRange, spawnOffset, props (table<vehId, boolean>: true = used), locationsInfo (list of locations {forestItem, switched, originPos, distance, linkedPropId, id}), forestQt (quadtree).

| Method | Description | Line |
|---|---|---|
| `DynamicProps:__tostring()` | Text "Pool name : ... Forest item : ... Prop Item : ...". | 63 |
| `DynamicProps:despawnProp(locationInfo)` | Resets the vehicle to new condition (resetBrokenFlexMesh), deactivates it and puts the forest object back at its original position. | 164 |
| `DynamicProps:findForestItems()` | Looks up the "theForest" object, lists its items whose data name equals forestItemName and builds the locations quadtree (logs if there is no forest). | 111 |
| `DynamicProps:getFirstPropAvailable()` | Takes the first free vehicle of the pool and marks it used. | 139 |
| `DynamicProps:new(data)` | Constructor; returns nil (error log) if data is empty. | 67 |
| `DynamicProps:onUpdate()` | Selects the locations within the player's range, sorts them by distance, gives back to the forest those that leave the range or exceed the pool, and gives a vehicle to the closest ones. | 178 |
| `DynamicProps:spawnProp(locationInfo, propId)` | Hides the forest object (moves it under the map), activates the vehicle and places it at the origin position + spawnOffset with the forest object's rotation. | 149 |
| `DynamicProps:spawnProps()` | Spawns poolSize propName vehicles (named propName..i, deactivated, without entering them) and marks them free. | 99 |
| `DynamicProps:unload()` | Gives back all swapped locations then deletes the pool's vehicles (also removes from the editor if present). | 254 |

## Calls into the engine (C++)

- `be:` `reloadCollision`
- `debugDrawer:` `drawLine`
- `obj:` `findForestItems`, `spawnProps`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/dynamicProps.lua`.*
