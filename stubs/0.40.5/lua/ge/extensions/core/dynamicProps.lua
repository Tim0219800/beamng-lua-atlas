---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/dynamicProps.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Swaps Forest objects (theForest) on the fly with real physical "prop" vehicles (e.g. street lamp, trash bin) when the player gets close, so they can be hit and deformed. A pool of deactivated vehicles is created; every frame, the forest slots closest to the player (within spawnInViewRange) receive a vehicle from the pool and the forest object is moved under the map (z = -999); slots that are too far are given back to the forest. Experimental module: it contains debugging dump() calls.
--- Access: extension `core_dynamicProps`: `extensions.load("core_dynamicProps")`, then the global `core_dynamicProps`
---@class core_dynamicProps
core_dynamicProps = {}

--- Creates a dynamic props manager: indexes the forest objects named forestItemName in a quadtree, spawns poolSize deactivated vehicles (setActive(0)), reloads collision (be:reloadCollision) and adds it to the list updated by onUpdate.
---Source: lua/ge/extensions/core/dynamicProps.lua:91
---@param data table forestItemName, propName, poolSize, spawnInViewRange, spawnOffset, name, artifacts (see notes). An empty table is rejected (error log, no object created).
function core_dynamicProps.createDynamicProps(data) end

--- Per-frame hook: stores the camera and player 0 positions, then updates each manager (swaps forest objects <-> props).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/dynamicProps.lua:278
function core_dynamicProps.onUpdate() end

--- Puts all swapped forest objects back in place, deletes the pool's prop vehicles and reloads collision (see notes on the retained state).
---Source: lua/ge/extensions/core/dynamicProps.lua:286
function core_dynamicProps.unloadAll() end

--- Preset for West Coast USA: replaces "postbox_blue" with the "trashbin" vehicle (pool 9, range 150 m).
---Source: lua/ge/extensions/core/dynamicProps.lua:306
function core_dynamicProps.westCoastBin() end

--- Preset for West Coast USA: replaces "pole_city1" with the "streetlight" vehicle (pool 1, range 100 m, z offset -0.22).
---Source: lua/ge/extensions/core/dynamicProps.lua:296
function core_dynamicProps.westCoastPole() end

--- A dynamic props manager (pool) for one forest object type. Fields: name, forestItemName, propName, poolSize, spawnInViewRange, spawnOffset, props (table<vehId, boolean>: true = used), locationsInfo (list of locations {forestItem, switched, originPos, distance, linkedPropId, id}), forestQt (quadtree).
---@class core_dynamicProps_DynamicProps
local core_dynamicProps_DynamicProps = {}

--- Text "Pool name : ... Forest item : ... Prop Item : ...".
---Source: lua/ge/extensions/core/dynamicProps.lua:63
function core_dynamicProps_DynamicProps:__tostring() end

--- Resets the vehicle to new condition (resetBrokenFlexMesh), deactivates it and puts the forest object back at its original position.
---Source: lua/ge/extensions/core/dynamicProps.lua:164
---@param locationInfo table location currently swapped
function core_dynamicProps_DynamicProps:despawnProp(locationInfo) end

--- Looks up the "theForest" object, lists its items whose data name equals forestItemName and builds the locations quadtree (logs if there is no forest).
---Source: lua/ge/extensions/core/dynamicProps.lua:111
function core_dynamicProps_DynamicProps:findForestItems() end

--- Takes the first free vehicle of the pool and marks it used.
---Source: lua/ge/extensions/core/dynamicProps.lua:139
---@return integer|nil  vehicle id, nil if the pool is exhausted
function core_dynamicProps_DynamicProps:getFirstPropAvailable() end

--- Constructor; returns nil (error log) if data is empty.
---Source: lua/ge/extensions/core/dynamicProps.lua:67
---@param data table same keys as createDynamicProps
---@return DynamicProps|nil  created object
function core_dynamicProps_DynamicProps:new(data) end

--- Selects the locations within the player's range, sorts them by distance, gives back to the forest those that leave the range or exceed the pool, and gives a vehicle to the closest ones.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/dynamicProps.lua:178
function core_dynamicProps_DynamicProps:onUpdate() end

--- Hides the forest object (moves it under the map), activates the vehicle and places it at the origin position + spawnOffset with the forest object's rotation.
---Source: lua/ge/extensions/core/dynamicProps.lua:149
---@param locationInfo table locationsInfo location
---@param propId integer pool vehicle id
function core_dynamicProps_DynamicProps:spawnProp(locationInfo, propId) end

--- Spawns poolSize propName vehicles (named propName..i, deactivated, without entering them) and marks them free.
---Source: lua/ge/extensions/core/dynamicProps.lua:99
function core_dynamicProps_DynamicProps:spawnProps() end

--- Gives back all swapped locations then deletes the pool's vehicles (also removes from the editor if present).
---Source: lua/ge/extensions/core/dynamicProps.lua:254
function core_dynamicProps_DynamicProps:unload() end

