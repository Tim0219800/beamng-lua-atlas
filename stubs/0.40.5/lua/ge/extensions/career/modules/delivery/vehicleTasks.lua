---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/vehicleTasks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Runs the vehicle and trailer delivery tasks accepted in career. Each offer becomes a taskData with a series of steps (coupleTrailer or enterVehicle, bringToDestination, confirmDropOff), an active step index and a GPS path (core_groundMarkers). onUpdate advances the steps according to position and couplings, handles the end of a delivery (vehicle removal, task removal), abandonment (fine) and computes the detailed rewards (damage, detours, delays, loaner organization, branch level, parking precision).
--- Access: extension `career_modules_delivery_vehicleTasks`: `extensions.load("career_modules_delivery_vehicleTasks")`, then the global `career_modules_delivery_vehicleTasks`
---@class career_modules_delivery_vehicleTasks
---@field debugName string Debug menu name: 'Delivery > Trailer Tasks'.
---@field debugOrder number Order in the debug menu (12).
---@field dependencies table<integer, string> Extensions loaded before: util_stepHandler.
career_modules_delivery_vehicleTasks = {}

--- Removes the vehicles of all tasks (the player goes back on foot if in one of them) and clears the list, without applying a fine.
---Source: lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:674
function career_modules_delivery_vehicleTasks.abandonAllVehicleTasks() end

--- Creates an offer's taskData (steps according to the offer type, active index 1, start timestamp), adds it to the list, updates the tasklist and starts navigation to the first step.
---Source: lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:73
---@param vehId integer Vehicle or trailer identifier.
---@param offer table Accepted offer (task.type 'trailerDropOff' or 'vehicleDropOff').
function career_modules_delivery_vehicleTasks.addVehicleTask(vehId, offer) end

--- Counts the vehicles and trailers whose active step is confirmDropOff at this parking spot.
---Source: lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:420
---@param psPath string Parking spot path.
---@return integer  Number of vehicles.
---@return integer  Number of trailers.
function career_modules_delivery_vehicleTasks.canDropOffCargoAtPsPath(psPath) end

--- "Trailer Tasks Debug" ImGui debug window that displays vehicleTasks with dumps.
---Source: lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:700
function career_modules_delivery_vehicleTasks.drawDebugMenu() end

--- Finishes the tasks of the given offers: stores the drop-off spot, reads broken parts and odometer, computes the rewards, then marks finished. The vehicle is removed and the task deleted at a later update (processFinished).
---Source: lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:434
---@param offerIds table List of offer identifiers.
---@return table  List of the taskData concerned (finished updated asynchronously).
function career_modules_delivery_vehicleTasks.finishTasks(offerIds) end

--- Computes the abandonment fine: -(offer's money) x the delivery's penalty factor, and the organization's reputation penalty (event discardDeliveryVehicle).
---Source: lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:527
---@param taskData table Vehicle task.
---@return table<string, number>  Amounts to add (negative): money and possibly <org>Reputation.
function career_modules_delivery_vehicleTasks.getFineForAbandon(taskData) end

--- Sum of the abandonment fines of all vehicle tasks.
---Source: lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:663
---@return table<string, number>  Amounts accumulated per attribute.
function career_modules_delivery_vehicleTasks.getFineForAbandonAllVehicleTasks() end

--- Lists the destinations of all steps of all tasks.
---Source: lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:624
---@return table  List of destinations (psPath, facId…).
function career_modules_delivery_vehicleTasks.getTargetDestinationsForActiveTasks() end

--- Prepares the reward data of the vehicles ready to be dropped off (confirmDropOff step) for the drop-off screen: reads the broken parts and odometer, computes originalRewards/breakdown/adjustedRewards, then calls progress.openDropOffScreenGatheringComplete. Returns the formatted list (finished becomes true later).
---Source: lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:362
---@return table  List of offers formatted for the UI.
function career_modules_delivery_vehicleTasks.getVehicleDataWithRewardsSummary() end

--- Looks up the task corresponding to an offer.
---Source: lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:686
---@param offer table Offer (field id).
---@return table|nil  taskData or nil.
function career_modules_delivery_vehicleTasks.getVehicleTaskForOffer(offer) end

--- Returns the list (reference) of the vehicle tasks in progress.
---Source: lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:658
---@return table  List of taskData.
function career_modules_delivery_vehicleTasks.getVehicleTasks() end

--- Marks the vehicle's task as given back (giveBack); processGiveBack will remove the vehicle, apply the fine and show a message.
---Source: lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:648
---@param vehId integer Vehicle identifier.
function career_modules_delivery_vehicleTasks.giveBackDeliveryVehicle(vehId) end

--- Indicates whether this vehicle is the vehicle of a delivery task in progress.
---Source: lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:638
---@param vehId integer Vehicle identifier.
---@return boolean  true if so.
function career_modules_delivery_vehicleTasks.isVehicleDeliveryVehicle(vehId) end

--- Restarts the GPS path to the active step of the last task in the list.
---Source: lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:571
function career_modules_delivery_vehicleTasks.navigateToNextTask() end

--- Hook called on career activation: stores the delivery extensions and util_stepHandler.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:8
function career_modules_delivery_vehicleTasks.onCareerActivated() end

--- Hook called when a trailer is coupled: updates the loaner organizations of each vehicle task.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:201
---@param objId1 integer First vehicle.
---@param objId2 integer Second vehicle.
function career_modules_delivery_vehicleTasks.onTrailerAttached(objId1, objId2) end

--- Per-frame hook: advances or goes back through the steps according to position, coupling and the controlled vehicle, processes the finished and given-back tasks, removes finished tasks, leaves delivery mode if needed and updates navigation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:578
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation time delta (s).
---@param dtRaw number Raw time delta (s).
function career_modules_delivery_vehicleTasks.onUpdate(dtReal, dtSim, dtRaw) end

