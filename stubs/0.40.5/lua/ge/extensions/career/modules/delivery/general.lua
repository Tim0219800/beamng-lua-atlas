---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Core of the career delivery (logistics) system: delivery game clock, saving/loading of logisticsDatabase.json (parcels, vehicle offers, facilities, settings, progress), delivery mode (start/exit, cargo abandonment penalty), settings (automatic route, detailed drop-off), list of the cargo containers of nearby vehicles and update of their weight in the vehicle VM. Also contributes to the big map POIs and to the delivery mode permissions.
--- Access: extension `career_modules_delivery_general`: `extensions.load("career_modules_delivery_general")`, then the global `career_modules_delivery_general`
---@class career_modules_delivery_general
---@field dependencies string[] {"core_vehicleBridge"}.
career_modules_delivery_general = {}

--- Leaves delivery mode if there is neither cargo in vehicles nor a vehicle task left.
---Source: lua/ge/extensions/career/modules/delivery/general.lua:990
function career_modules_delivery_general.checkExitDeliveryMode() end

--- Leaves delivery mode: cancels the transient moves, deletes the cargos in vehicles (changeCargoLocation 'deleted'), applies the abandonment penalty (money/reputation, toast, sound), abandons the vehicle tasks, clears the big map focus, schedules the weight update, clears the tasklist and fires onDeliveryModeStopped.
---Source: lua/ge/extensions/career/modules/delivery/general.lua:957
function career_modules_delivery_general.exitDeliveryMode() end

--- Returns the base factor of the cargo abandonment penalty (0.1).
---Source: lua/ge/extensions/career/modules/delivery/general.lua:29
---@return number  Factor applied to the money reward of the abandoned cargo.
function career_modules_delivery_general.getDeliveryAbandonPenaltyFactor() end

--- Computes the penalty if the player abandons the cargos in vehicles: table of negative attributes (money and <organization>Reputation). Adds the vehicle tasks' fine unless onlyVehIdsAsKeys is provided.
---Source: lua/ge/extensions/career/modules/delivery/general.lua:1046
---@param onlyVehIdsAsKeys table<integer, boolean>|nil Limits the computation to the listed vehicles.
---@return table<string, number>  Penalty per attribute (values <= 0).
function career_modules_delivery_general.getDeliveryModePenalty(onlyVehIdsAsKeys) end

--- Last container list computed by getNearbyVehicleCargoContainers (refreshed about every second in onUpdate).
---Source: lua/ge/extensions/career/modules/delivery/general.lua:295
---@return table[]  Cargo containers.
function career_modules_delivery_general.getMostRecentCargoContainerData() end

--- Queries (asynchronous, 'getCargoContainers') the vehicles within 25 m of the player (excluding unicycle and unusable vehicles) and calls callback with the list, sorted (vehId then containerId), of the delivery containers: location, name, cargo types, total/used/transient/free slots, attachment status ('attached', 'nearby' or 'lost'), parcels present. Calls callback({}) if there is no vehicle.
---Source: lua/ge/extensions/career/modules/delivery/general.lua:192
---@param callback function Receives the containers table.
---@return table|nil  {} if core_vehicleBridge is missing.
function career_modules_delivery_general.getNearbyVehicleCargoContainers(callback) end

--- Returns the delivery settings table.
---Source: lua/ge/extensions/career/modules/delivery/general.lua:1030
---@return table  Settings (automaticRoute, detailedDropOff…).
function career_modules_delivery_general.getSettings() end

--- Translated name of a vehicle via the career inventory, or a fallback label containing the id.
---Source: lua/ge/extensions/career/modules/delivery/general.lua:171
---@param vehId integer Vehicle object id.
---@return string  Displayable name.
function career_modules_delivery_general.getVehicleName(vehId) end

--- Returns the 'automaticRoute' setting (automatic route to the next destination).
---Source: lua/ge/extensions/career/modules/delivery/general.lua:998
---@return boolean  true if enabled.
function career_modules_delivery_general.isAutomaticRouteEnabled() end

--- Indicates whether delivery mode is active.
---Source: lua/ge/extensions/career/modules/delivery/general.lua:1044
---@return boolean  true if active.
function career_modules_delivery_general.isDeliveryModeActive() end

--- Loads logisticsDatabase.json from the current profile (ignored if info.json is older than moduleVersion), initializes progress and parcelModProgress, settings (automaticRoute is true by default) and delivery time; clears the parcels if the save is more than one hour old.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/general.lua:37
function career_modules_delivery_general.loadSaveData() end

--- Hook: for a 'logisticsOffice' element, adds the activity prompt info (facility title, properties, 'inspect cargo' button).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/general.lua:642
---@param elemData table[] POI elements.
---@param activityData table[] Activity data to complete.
function career_modules_delivery_general.onActivityAcceptGatherData(elemData, activityData) end

--- Hook: leaves delivery mode when a mission starts (change == 'started').
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/general.lua:1111
---@param change string Mission change type.
function career_modules_delivery_general.onAnyMissionChanged(change) end

--- Hook: stores the other delivery modules (parcelManager, cargoScreen, generator, progress, vehicleTasks, tasklist, parcelMods, vehicleOfferManager, tutorial) and util_stepHandler.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/general.lua:10
function career_modules_delivery_general.onCareerActivated() end

--- Hook: on career activation, loads the data, ensures the map (map.assureLoad) and launches dGenerator.setup.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/general.lua:155
---@param active boolean true on activation.
function career_modules_delivery_general.onCareerActive(active) end

--- Hook: leaves delivery mode if painting starts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/general.lua:1090
function career_modules_delivery_general.onCareerPaintingStarted() end

--- Hook: leaves delivery mode if tuning starts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/general.lua:1097
function career_modules_delivery_general.onCareerTuningStarted() end

--- Hook: in delivery mode, if a requested tag is in the restricted activities table (e.g. mission interaction, towing to garage, vehicle purchase), adds a permission with a label explaining the penalty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/general.lua:939
---@param tags string[] Activity tags tested.
---@param permissions table[] List of permissions to complete.
function career_modules_delivery_general.onCheckPermission(tags, permissions) end

--- POI list hook: adds the visible (or targeted) delivery facilities with their interactive access points.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/general.lua:505
---@param levelIdentifier string Level id.
---@param elements table[] POI list to complete.
function career_modules_delivery_general.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Hook: before the vehicle object is removed from the inventory, deletes its cargos (with penalty) and checks for leaving delivery mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/general.lua:1152
---@param inventoryId integer Inventory id.
---@param vehId integer Vehicle object id.
function career_modules_delivery_general.onInventoryPreRemoveVehicleObject(inventoryId, vehId) end

--- Hook: leaves delivery mode if parts shopping starts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/general.lua:1083
function career_modules_delivery_general.onPartShoppingStarted() end

--- Hook: a vehicle repaired at the garage: deletes its cargos (with penalty) and checks for leaving delivery mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/general.lua:1147
---@param invVehId integer Inventory id of the vehicle.
function career_modules_delivery_general.onRepairInGarage(invVehId) end

--- Save hook: writes logisticsDatabase.json (time, penalty, progress, non-expired parcels in facilities, non-expired vehicle offers, facility data, settings).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/general.lua:75
---@param currentSavePath string Folder of the profile being saved.
function career_modules_delivery_general.onSaveCurrentProfile(currentSavePath) end

--- Hook: a manual waypoint placed on the big map disables the automatic route in delivery mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/general.lua:1020
function career_modules_delivery_general.onSetBigmapNavFocus() end

--- Hook: leaves delivery mode if the player is towed to the garage.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/general.lua:1104
---@param garageId string Garage id.
---@param veh any Teleported vehicle (unused).
function career_modules_delivery_general.onTeleportedToGarage(garageId, veh) end

--- Per-frame hook: advances the delivery time, applies the penalty coming from a previous save (toast + addAttributes), refreshes the nearby containers every second and updates the weights.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/general.lua:420
---@param dtReal number Real time delta (s).
---@param dtSim number Simulated time delta (s).
---@param dtRaw number Raw time delta (s).
function career_modules_delivery_general.onUpdate(dtReal, dtSim, dtRaw) end

--- Schedules a container weight update; executed in onUpdate when the simulation is not paused.
---Source: lua/ge/extensions/career/modules/delivery/general.lua:333
function career_modules_delivery_general.requestUpdateContainerWeights() end

--- Enables/disables the automatic route: when enabled, calls cargoScreen.setBestRoute; when disabled, clears the path of the ground markers and the big map. Notifies the UI (guihooks 'automaticRouteSet').
---Source: lua/ge/extensions/career/modules/delivery/general.lua:1003
---@param enabled boolean New state.
function career_modules_delivery_general.setAutomaticRoute(enabled) end

--- Pauses or resumes the delivery clock.
---Source: lua/ge/extensions/career/modules/delivery/general.lua:419
---@param paused boolean true to freeze time.
function career_modules_delivery_general.setDeliveryTimePaused(paused) end

--- Sets the detailedDropOff setting and notifies the UI (guihooks 'detailedDropOffSet').
---Source: lua/ge/extensions/career/modules/delivery/general.lua:1014
---@param enabled boolean New state.
function career_modules_delivery_general.setDetailedDropOff(enabled) end

--- Writes a delivery setting (saved in logisticsDatabase.json).
---Source: lua/ge/extensions/career/modules/delivery/general.lua:1026
---@param key string Setting name.
---@param value any Value.
function career_modules_delivery_general.setSetting(key, value) end

--- Enables delivery mode (no effect if already active), clears the POIs and fires the onDeliveryModeStarted hook.
---Source: lua/ge/extensions/career/modules/delivery/general.lua:949
function career_modules_delivery_general.startDeliveryMode() end

--- Current delivery time (cumulated simulation seconds, saved).
---Source: lua/ge/extensions/career/modules/delivery/general.lua:165
---@return number  Seconds.
function career_modules_delivery_general.time() end

--- If an update is scheduled, computes for each vehicle/container the volume (weight of parcels, volume of fluids and bulk) and the density, sends them to the vehicle (setCargoContainers), freezes the vehicle (setFreeze), reads the loading delay, then calls delayCallback with the delay per vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/general.lua:334
---@param delayCallback function|nil Receives {[vehId] = delay in seconds}; by default shows a loading popup and unfreezes the vehicles.
function career_modules_delivery_general.updateContainerWeights(delayCallback) end

