---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/multiSpawn.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_multiSpawn`: generation and placement of vehicle groups. It can build a random group from the installed vehicles (with population weights, filters, country, year), spawn it in a formation (road ahead/behind, race grid, traffic, lines), or teleport existing vehicles into a new formation. Spawning is done via a job, one vehicle per frame, and only one group at a time (subsequent ones are queued). Used notably by the UI traffic app and by gameplay code (onVehicleGroupSpawned is listened to by 5 modules).
--- Access: extension `core_multiSpawn`: `extensions.load("core_multiSpawn")`, then the global `core_multiSpawn`
---@class core_multiSpawn
---@field startEngines boolean true by default: vehicles of a group spawn with the engine started (via onSpawnCCallback).
---@field useFullData boolean false by default. If true, createGroup adds modelPop and configPop to each entry of the group.
core_multiSpawn = {}

--- Creates a random group of `amount` vehicles (10 by default) from the installed vehicles, according to the filters and populations.
---Source: lua/ge/extensions/core/multiSpawn.lua:291
---@param amount integer|nil Group size (10 by default).
---@param params table|nil { allMods, allConfigs, filters, country, modelPopPower, configPopPower, popDecreaseFactor, minPop, maxYear }.
---@return table[]  Entries { model, config }; {} if no vehicle matches.
function core_multiSpawn.createGroup(amount, params) end

--- Computes `amount` formation positions/rotations according to options.mode (see notes), starting from the player, the camera or options.pos.
---Source: lua/ge/extensions/core/multiSpawn.lua:509
---@param amount integer|nil Number of positions (20 by default).
---@param options table|nil { mode, gap, pos, dir, rot, startIndex, func }.
---@return table[]  Elements { pos = vec3, rot = quat }.
function core_multiSpawn.createSpawnPositions(amount, options) end

--- Deletes vehicles created via this module (those with the vehicleGroup field), starting from the end of the list, with optional limit and group name. Used by the traffic app.
---Source: lua/ge/extensions/core/multiSpawn.lua:847
---@param amount integer|nil Max number to delete; nil = all.
---@param groupName string|nil Only deletes this group; nil = any group.
function core_multiSpawn.deleteVehicles(amount, groupName) end

--- Adjusts a group to `amount` elements, in place: duplicates entries in a loop if it is too small, truncates if it is too large.
---Source: lua/ge/extensions/core/multiSpawn.lua:703
---@param group table[] Group (modified).
---@param amount integer|nil Target size.
---@return table[]  The same group.
function core_multiSpawn.fitGroup(group, amount) end

--- Walks through the installed models and configs (core_vehicles) and builds the base table used to draw a group: per model { model, country, popBase, popFactor, configData = [{ config, popBase, popFactor }] }, plus countryCounts. By default only official content is taken (allMods = false).
---Source: lua/ge/extensions/core/multiSpawn.lua:140
---@param params table|nil { allMods, allConfigs, filters, minPop, maxYear, country }. filters defaults to { Type = { car = 1, truck = 1 } }. Note: if params is provided without allConfigs, only the default config of each model is kept.
---@return table  List of models with a countryCounts field.
function core_multiSpawn.getInstalledVehicleData(params) end

--- Hook called when a vehicle is created on the C++ side: during a group spawn, asks the vehicle to spawn with the engine running (according to startEngines).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/multiSpawn.lua:863
---@param id integer Id of the created vehicle.
function core_multiSpawn.onSpawnCCallback(id) end

--- Teleports existing vehicles into a new formation (one per 0.02 s interval via a job, or immediately if options.instant). Positions are corrected by the reference node offset unless ignoreAdjust; safeTeleport is used unless ignoreSafe.
---Source: lua/ge/extensions/core/multiSpawn.lua:685
---@param vehIds integer[] Ids of the vehicles to place.
---@param options table|nil { mode, gap, pos, dir, rot, startIndex, func, customTransforms, instant, ignoreAdjust, ignoreSafe }.
function core_multiSpawn.placeGroup(vehIds, options) end

--- Prepares the spawn data from a group: copies, adjusts to the requested size (fitGroup), fills in the default config, resolves paints (including random ones). A model that is not found is replaced by the default 'pickup' model (error logged).
---Source: lua/ge/extensions/core/multiSpawn.lua:727
---@param group table[] Vehicle group.
---@param amount integer|nil Requested size; nil keeps the group's size.
---@return table[]|nil  Spawn data, nil if the group is empty.
function core_multiSpawn.setVehicleSpawnData(group, amount) end

--- Deprecated: creates a random group then spawns it. Use spawnGroup.
---Source: lua/ge/extensions/core/multiSpawn.lua:842
---@param amount integer Number of vehicles.
---@param shuffle boolean|nil Shuffles the order.
---@param spawnMode string|nil Formation mode.
---@param spawnGap number|nil Spacing in meters.
---@return integer|nil  Group id.
function core_multiSpawn.setupVehicles(amount, shuffle, spawnMode, spawnGap) end

--- Spawns a vehicle group in formation. If a group is already in progress, the request is queued. Empty group: creates a default one; amount <= 0: does nothing.
---Source: lua/ge/extensions/core/multiSpawn.lua:796
---@param group table[]|nil Vehicle group.
---@param amount integer Number of vehicles.
---@param options table|nil { name ('custom'), mode ('roadAhead'), gap (15), shuffle, randomPaints, cling, ignoreAdjust, canSpawnAnotherVehicleCheck, pos, dir, rot, startIndex, func, customTransforms }.
---@return integer|nil  Unique group identifier (nil if queued, refused, or scene without MissionGroup).
function core_multiSpawn.spawnGroup(group, amount, options) end

--- Low-level step of spawnGroup: assigns positions and rotations to the spawn data already prepared by setVehicleSpawnData, sanitizes them (sanitizeVehicleSpawnOptions) and starts the creation job (one vehicle per frame).
---Source: lua/ge/extensions/core/multiSpawn.lua:617
---@param spawnData table[] Output of setVehicleSpawnData.
---@param spawnOptions table Same options as spawnGroup (name, mode, gap, cling, ...).
---@return integer|nil  New group identifier, nil if no MissionGroup or empty data.
function core_multiSpawn.spawnProcessedGroup(spawnData, spawnOptions) end

--- Converts all vehicles currently in the scene (getAllVehiclesByType) into a group, with optional exclusions.
---Source: lua/ge/extensions/core/multiSpawn.lua:339
---@param ignorePlayer boolean|nil Excludes the player vehicle 0.
---@param ignoreTraffic boolean|nil Excludes traffic or parked vehicles.
---@return table[]  Group entries.
function core_multiSpawn.spawnedVehsToGroup(ignorePlayer, ignoreTraffic) end

--- Alias of placeGroup.
---Source: lua/ge/extensions/core/multiSpawn.lua:685
---@param vehIds integer[] Vehicle ids.
---@param options table|nil See placeGroup.
function core_multiSpawn.teleportGroup(vehIds, options) end

--- Converts existing vehicles into group entries (model, config, paints; paint names are '(Custom)').
---Source: lua/ge/extensions/core/multiSpawn.lua:316
---@param vehIds integer[]|nil Vehicle ids.
---@return table[]  Group entries.
function core_multiSpawn.vehIdsToGroup(vehIds) end

