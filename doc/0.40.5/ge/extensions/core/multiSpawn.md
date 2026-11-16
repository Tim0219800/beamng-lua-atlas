# `core_multiSpawn`

*File: `lua/ge/extensions/core/multiSpawn.lua` · VM: Game Engine (GE) · 887 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_multiSpawn`: `extensions.load("core_multiSpawn")`, then the global `core_multiSpawn`

GE extension `core_multiSpawn`: generation and placement of vehicle groups. It can build a random group from the installed vehicles (with population weights, filters, country, year), spawn it in a formation (road ahead/behind, race grid, traffic, lines), or teleport existing vehicles into a new formation. Spawning is done via a job, one vehicle per frame, and only one group at a time (subsequent ones are queued). Used notably by the UI traffic app and by gameplay code (onVehicleGroupSpawned is listened to by 5 modules).

## Example

```lua
-- 10 random vehicles (cars and trucks) in front of the player
local group = core_multiSpawn.createGroup(10, {filters = {Type = {car = 1, truck = 0.4}}})
core_multiSpawn.spawnGroup(group, 10, {name = 'myGroup', mode = 'roadAhead', gap = 20})
-- later: delete this group
core_multiSpawn.deleteVehicles(nil, 'myGroup')
```

## Notes

- A group is an array of entries { model, config, paint, paint2, paint3, paintName, paintName2, paintName3, ... }. The old array format { model, config, paint, paint2, paint3 } is also accepted by setVehicleSpawnData. A nil or 'base' config becomes the model's default config. paintName '(Random)' requests random paints.
- Formation modes (options.mode): roadAhead (default), roadBehind, roadAheadAlt, roadBehindAlt, traffic, raceGrid, raceGridAlt, lineLeft, lineRight, lineBehind, lineAhead, lineAbove; 'road' is an alias of roadAhead. An unknown mode falls back to lineAhead. Road modes use the navigation map (map); if no road is found the fallback is lineAhead.
- Position options: pos (vec3) and dir (vec3) or rot (quat); otherwise the player vehicle (OOBB, slot 0 reserved for the player: numbering starts at 1), otherwise the camera. gap = spacing in meters (15 by default). startIndex shifts the first slot. func(funcData) allows a custom placement function returning pos, dir. customTransforms = imposed array of {pos, rot} (must have at least as many elements as vehicles).
- The first vehicle is always created; the following ones are refused (the group stops with a warning) if canSpawnAnotherVehicle() is false, unless options.canSpawnAnotherVehicleCheck == false.
- Each created vehicle receives the dynamic field 'vehicleGroup' = options.name (read by deleteVehicles) and possibly 'spawnMeta'. Hook onVehicleGroupSpawned(vehIds, groupId, name) at the end; onVehicleGroupRespawned(vehIds) at the end of a placeGroup.
- Population: a config without a Population field gets 10000 if the model or the config is a mod, 0 if both are official. The weight of a model/config is (popBase*popFactor)^popPower; models from countries other than `country` are penalized (0.25/number of models of the country). After each draw, the weight is multiplied by popDecreaseFactor (0.05 by default) to avoid repetitions. modelPopPower/configPopPower <= 0 or nil: uniform draw; popPower capped at 2. Filters: {Type = {car = 1, truck = 0.4, other = 0.1}}; a field absent from the filter gives factor 0 unless the key `other` exists. maxYear (<= 0 = current year) excludes newer configs and penalizes older ones.
- Probable bug in buildGroup: `if not modelPopPower then ... else modelIdx = getIndexRandomPop(...)` tests nil whereas the earlier sort also tests `<= 0`. With modelPopPower = 0, shuffledList is filled but ignored, and the draw is done via getIndexRandomPop on weights computed with popPower = 1 (inferred from code).
- Probable bug in spawnGroup: spawningBusy is set to true before spawnProcessedGroup is called. If the latter exits early (no MissionGroup, empty data), spawningBusy stays true, and all following groups stay in the queue indefinitely.
- onSpawnCCallback: while a group is spawning (spawningBusy), vehicles receive spawnWithEngineRunning = M.startEngines. This flag therefore also applies to any vehicle created during that time by other code.
- setupVehicles is deprecated (warning log): use spawnGroup. teleportGroup is an alias of placeGroup.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_multiSpawn.createGroup(amount, params)` | Creates a random group of `amount` vehicles (10 by default) from the installed vehicles, according to the filters and populations. | 291 |
| `core_multiSpawn.createSpawnPositions(amount, options)` | Computes `amount` formation positions/rotations according to options.mode (see notes), starting from the player, the camera or options.pos. | 509 |
| `core_multiSpawn.deleteVehicles(amount, groupName)` | Deletes vehicles created via this module (those with the vehicleGroup field), starting from the end of the list, with optional limit and group name. Used by the traffic app. | 847 |
| `core_multiSpawn.fitGroup(group, amount)` | Adjusts a group to `amount` elements, in place: duplicates entries in a loop if it is too small, truncates if it is too large. | 703 |
| `core_multiSpawn.getInstalledVehicleData(params)` | Walks through the installed models and configs (core_vehicles) and builds the base table used to draw a group: per model { model, country, popBase, popFactor, configData = [{ config, popBase, popFactor }] }, plus countryCounts. By default only official content is taken (allMods = false). | 140 |
| `core_multiSpawn.onSpawnCCallback(id)` | Hook called when a vehicle is created on the C++ side: during a group spawn, asks the vehicle to spawn with the engine running (according to startEngines). *(internal)* *(hook)* | 863 |
| `core_multiSpawn.placeGroup(vehIds, options)` | Teleports existing vehicles into a new formation (one per 0.02 s interval via a job, or immediately if options.instant). Positions are corrected by the reference node offset unless ignoreAdjust; safeTeleport is used unless ignoreSafe. | 685 |
| `core_multiSpawn.setVehicleSpawnData(group, amount)` | Prepares the spawn data from a group: copies, adjusts to the requested size (fitGroup), fills in the default config, resolves paints (including random ones). A model that is not found is replaced by the default 'pickup' model (error logged). | 727 |
| `core_multiSpawn.setupVehicles(amount, shuffle, spawnMode, spawnGap)` | Deprecated: creates a random group then spawns it. Use spawnGroup. | 842 |
| `core_multiSpawn.spawnGroup(group, amount, options)` | Spawns a vehicle group in formation. If a group is already in progress, the request is queued. Empty group: creates a default one; amount <= 0: does nothing. | 796 |
| `core_multiSpawn.spawnProcessedGroup(spawnData, spawnOptions)` | Low-level step of spawnGroup: assigns positions and rotations to the spawn data already prepared by setVehicleSpawnData, sanitizes them (sanitizeVehicleSpawnOptions) and starts the creation job (one vehicle per frame). | 617 |
| `core_multiSpawn.spawnedVehsToGroup(ignorePlayer, ignoreTraffic)` | Converts all vehicles currently in the scene (getAllVehiclesByType) into a group, with optional exclusions. | 339 |
| `core_multiSpawn.teleportGroup(vehIds, options)` | Alias of placeGroup. | 685 |
| `core_multiSpawn.vehIdsToGroup(vehIds)` | Converts existing vehicles into group entries (model, config, paints; paint names are '(Custom)'). | 316 |

### Parameter details

#### `core_multiSpawn.createGroup(amount, params)`

Creates a random group of `amount` vehicles (10 by default) from the installed vehicles, according to the filters and populations.

- `amount` (*integer|nil*) : Group size (10 by default).
- `params` (*table|nil*) : { allMods, allConfigs, filters, country, modelPopPower, configPopPower, popDecreaseFactor, minPop, maxYear }.
- **returns**: table[] Entries { model, config }; {} if no vehicle matches.

#### `core_multiSpawn.createSpawnPositions(amount, options)`

Computes `amount` formation positions/rotations according to options.mode (see notes), starting from the player, the camera or options.pos.

- `amount` (*integer|nil*) : Number of positions (20 by default).
- `options` (*table|nil*) : { mode, gap, pos, dir, rot, startIndex, func }.
- **returns**: table[] Elements { pos = vec3, rot = quat }.

#### `core_multiSpawn.deleteVehicles(amount, groupName)`

Deletes vehicles created via this module (those with the vehicleGroup field), starting from the end of the list, with optional limit and group name. Used by the traffic app.

- `amount` (*integer|nil*) : Max number to delete; nil = all.
- `groupName` (*string|nil*) : Only deletes this group; nil = any group.

#### `core_multiSpawn.fitGroup(group, amount)`

Adjusts a group to `amount` elements, in place: duplicates entries in a loop if it is too small, truncates if it is too large.

- `group` (*table[]*) : Group (modified).
- `amount` (*integer|nil*) : Target size.
- **returns**: table[] The same group.

#### `core_multiSpawn.getInstalledVehicleData(params)`

Walks through the installed models and configs (core_vehicles) and builds the base table used to draw a group: per model { model, country, popBase, popFactor, configData = [{ config, popBase, popFactor }] }, plus countryCounts. By default only official content is taken (allMods = false).

- `params` (*table|nil*) : { allMods, allConfigs, filters, minPop, maxYear, country }. filters defaults to { Type = { car = 1, truck = 1 } }. Note: if params is provided without allConfigs, only the default config of each model is kept.
- **returns**: table List of models with a countryCounts field.

#### `core_multiSpawn.onSpawnCCallback(id)`

Hook called when a vehicle is created on the C++ side: during a group spawn, asks the vehicle to spawn with the engine running (according to startEngines).

- `id` (*integer*) : Id of the created vehicle.

#### `core_multiSpawn.placeGroup(vehIds, options)`

Teleports existing vehicles into a new formation (one per 0.02 s interval via a job, or immediately if options.instant). Positions are corrected by the reference node offset unless ignoreAdjust; safeTeleport is used unless ignoreSafe.

- `vehIds` (*integer[]*) : Ids of the vehicles to place.
- `options` (*table|nil*) : { mode, gap, pos, dir, rot, startIndex, func, customTransforms, instant, ignoreAdjust, ignoreSafe }.

#### `core_multiSpawn.setVehicleSpawnData(group, amount)`

Prepares the spawn data from a group: copies, adjusts to the requested size (fitGroup), fills in the default config, resolves paints (including random ones). A model that is not found is replaced by the default 'pickup' model (error logged).

- `group` (*table[]*) : Vehicle group.
- `amount` (*integer|nil*) : Requested size; nil keeps the group's size.
- **returns**: table[]|nil Spawn data, nil if the group is empty.

#### `core_multiSpawn.setupVehicles(amount, shuffle, spawnMode, spawnGap)`

Deprecated: creates a random group then spawns it. Use spawnGroup.

- `amount` (*integer*) : Number of vehicles.
- `shuffle` (*boolean|nil*) : Shuffles the order.
- `spawnMode` (*string|nil*) : Formation mode.
- `spawnGap` (*number|nil*) : Spacing in meters.
- **returns**: integer|nil Group id.

#### `core_multiSpawn.spawnGroup(group, amount, options)`

Spawns a vehicle group in formation. If a group is already in progress, the request is queued. Empty group: creates a default one; amount <= 0: does nothing.

- `group` (*table[]|nil*) : Vehicle group.
- `amount` (*integer*) : Number of vehicles.
- `options` (*table|nil*) : { name ('custom'), mode ('roadAhead'), gap (15), shuffle, randomPaints, cling, ignoreAdjust, canSpawnAnotherVehicleCheck, pos, dir, rot, startIndex, func, customTransforms }.
- **returns**: integer|nil Unique group identifier (nil if queued, refused, or scene without MissionGroup).

#### `core_multiSpawn.spawnProcessedGroup(spawnData, spawnOptions)`

Low-level step of spawnGroup: assigns positions and rotations to the spawn data already prepared by setVehicleSpawnData, sanitizes them (sanitizeVehicleSpawnOptions) and starts the creation job (one vehicle per frame).

- `spawnData` (*table[]*) : Output of setVehicleSpawnData.
- `spawnOptions` (*table*) : Same options as spawnGroup (name, mode, gap, cling, ...).
- **returns**: integer|nil New group identifier, nil if no MissionGroup or empty data.

#### `core_multiSpawn.spawnedVehsToGroup(ignorePlayer, ignoreTraffic)`

Converts all vehicles currently in the scene (getAllVehiclesByType) into a group, with optional exclusions.

- `ignorePlayer` (*boolean|nil*) : Excludes the player vehicle 0.
- `ignoreTraffic` (*boolean|nil*) : Excludes traffic or parked vehicles.
- **returns**: table[] Group entries.

#### `core_multiSpawn.teleportGroup(vehIds, options)`

Alias of placeGroup.

- `vehIds` (*integer[]*) : Vehicle ids.
- `options` (*table|nil*) : See placeGroup.

#### `core_multiSpawn.vehIdsToGroup(vehIds)`

Converts existing vehicles into group entries (model, config, paints; paint names are '(Custom)').

- `vehIds` (*integer[]|nil*) : Vehicle ids.
- **returns**: table[] Group entries.

## Fields

| Field | Type | Description |
|---|---|---|
| `startEngines` | boolean | true by default: vehicles of a group spawn with the engine started (via onSpawnCCallback). |
| `useFullData` | boolean | false by default. If true, createGroup adds modelPop and configPop to each entry of the group. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onVehicleGroupRespawned`
- `onVehicleGroupSpawned` — listened to by 5 module(s)

## Calls into the engine (C++)

- `be:` `getObjectOOBBCenterXYZ`, `getPlayerVehicleID`, `getSurfaceHeightBelow`
- `obj:` `getInitialNodePosition`, `getRefNodeId`, `setPosRot`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/multiSpawn.lua`.*
