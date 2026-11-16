---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/tasklist.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Feeds the on-screen task list (tasklist) during career delivery. It groups the loaded cargos by destination, the cargos to pick up by pickup location, the trailer/vehicle tasks, and an "active deliveries" header. Each element is marked to update or to discard, then sent to the UI every frame via guihooks (SetTasklistTask, SetTasklistHeader, DiscardTasklistItem).
--- Access: extension `career_modules_delivery_tasklist`: `extensions.load("career_modules_delivery_tasklist")`, then the global `career_modules_delivery_tasklist`
---@class career_modules_delivery_tasklist
---@field dependencies table<integer, string> Extensions loaded before: core_vehicleBridge.
career_modules_delivery_tasklist = {}

--- Marks all elements to discard; they are removed at the next update.
---Source: lua/ge/extensions/career/modules/delivery/tasklist.lua:150
function career_modules_delivery_tasklist.clearAll() end

--- Marks to discard the element linked to a vehicle/trailer offer.
---Source: lua/ge/extensions/career/modules/delivery/tasklist.lua:143
---@param offerId integer Offer identifier.
function career_modules_delivery_tasklist.clearTasklistForOfferId(offerId) end

--- Hook called on career activation: stores the delivery extensions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/tasklist.lua:8
function career_modules_delivery_tasklist.onCareerActivated() end

--- Per-frame hook: calls updateCargoTasklistElements.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/tasklist.lua:301
---@param dtReal number Real time delta (s), unused.
---@param dtSim number Simulation time delta (s), unused.
---@param dtRaw number Raw time delta (s), unused.
function career_modules_delivery_tasklist.onUpdate(dtReal, dtSim, dtRaw) end

--- Rebuilds the tasklist elements from the cargo containers of nearby vehicles (asynchronous): marks all the old elements to discard, recreates the parcels and pickup groups, the vehicle tasks (dVehicleTasks.getVehicleTasks) and the header with the number of tasks or loaded items.
---Source: lua/ge/extensions/career/modules/delivery/tasklist.lua:22
function career_modules_delivery_tasklist.sendCargoToTasklist() end

--- Walks through the elements: sends the removals (DiscardTasklistItem / SetTasklistHeader nil) and updates (SetTasklistTask with label, subtext, active, type='message') to the UI, then deletes the discarded elements. The labels depend on the current step of the vehicle tasks (coupleTrailer, enterVehicle, bringToDestination/confirmDropOff, putIntoParkingSpot).
---Source: lua/ge/extensions/career/modules/delivery/tasklist.lua:159
function career_modules_delivery_tasklist.updateCargoTasklistElements() end

--- Marks to refresh the tasklist element that contains this cargo (useful for the countdown of timed parcels).
---Source: lua/ge/extensions/career/modules/delivery/tasklist.lua:129
---@param cargoId integer Cargo identifier.
function career_modules_delivery_tasklist.updateTasklistForCargoId(cargoId) end

--- Marks to refresh the element linked to a vehicle/trailer offer.
---Source: lua/ge/extensions/career/modules/delivery/tasklist.lua:136
---@param offerId integer Offer identifier.
function career_modules_delivery_tasklist.updateTasklistForOfferId(offerId) end

