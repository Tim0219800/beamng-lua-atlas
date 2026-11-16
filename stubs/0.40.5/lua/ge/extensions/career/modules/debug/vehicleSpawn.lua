---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/vehicleSpawn.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Vehicle Spawn" debug tool: adds a point-of-interest marker to the 'debugParking' parking of west_coast_usa (facilities.sites.json) whose detail window offers to spawn a 'rented' vehicle or trailer (sunburst/race_M, boxutility/loaded_200), optionally added to the inventory (owned = false). spawnVehicle chains fade to black, spawn, initPartConditions, wait, then fade back in via util_stepHandler.
--- Access: extension `career_modules_debug_vehicleSpawn`: `extensions.load("career_modules_debug_vehicleSpawn")`, then the global `career_modules_debug_vehicleSpawn`
---@class career_modules_debug_vehicleSpawn
---@field debugName string 'Vehicle Spawn'.
---@field debugOrder number Sort order (12).
---@field dependencies string[] {"gameplay_sites_sitesManager"}.
career_modules_debug_vehicleSpawn = {}

--- Runs buttonOptions[i](); this table is never filled in the module.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/vehicleSpawn.lua:81
---@param i integer Button index.
function career_modules_debug_vehicleSpawn.buttonPressed(i) end

--- On the first frame loads the west_coast_usa sites and gets 'debugParking'; draws the 'Vehicle Spawn' window with a 'Spawn and rent a vehicle' button (sunburst/race_M, added to the inventory).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/vehicleSpawn.lua:30
function career_modules_debug_vehicleSpawn.drawDebugMenu() end

--- POI list hook: if the 'debugParking' parking is loaded, adds a 'debugVehicleSpawn' element with a parking marker (path, pos, rot, scl).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/vehicleSpawn.lua:15
---@param levelIdentifier string Level identifier.
---@param elements table[] POI list to complete.
function career_modules_debug_vehicleSpawn.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Hook: if the element is 'debugVehicleSpawn', adds to promptData an 'Open Debug Menu' button that shows a dialog (guihooks 'showConfirmationDialog') with three spawn choices.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/vehicleSpawn.lua:85
---@param elemData table[] POI elements concerned.
---@param promptData table[] Prompt button list to complete.
function career_modules_debug_vehicleSpawn.onPoiDetailPromptOpening(elemData, promptData) end

--- Spawns a vehicle with a fade to black, initializes its part conditions, waits for the vehicle's response (ping) then fades back in; if addToInventory is true, adds it to the inventory with owned = false.
---Source: lua/ge/extensions/career/modules/debug/vehicleSpawn.lua:48
---@param model string JBeam model (e.g. 'sunburst').
---@param config string Configuration name (e.g. 'race_M').
---@param addToInventory boolean|nil Adds the vehicle to the inventory (not owned).
function career_modules_debug_vehicleSpawn.spawnVehicle(model, config, addToInventory) end

