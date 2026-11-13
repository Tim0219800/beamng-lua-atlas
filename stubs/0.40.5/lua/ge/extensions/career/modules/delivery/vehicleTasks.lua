---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/vehicleTasks.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_delivery_vehicleTasks` : `extensions.load("career_modules_delivery_vehicleTasks")`, puis la globale `career_modules_delivery_vehicleTasks`
---@class career_modules_delivery_vehicleTasks
---@field debugName string
---@field debugOrder number
---@field dependencies table
career_modules_delivery_vehicleTasks = {}

---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:674
function career_modules_delivery_vehicleTasks.abandonAllVehicleTasks() end

---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:73
---@param vehId any
---@param offer any
function career_modules_delivery_vehicleTasks.addVehicleTask(vehId, offer) end

---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:420
---@param psPath any
function career_modules_delivery_vehicleTasks.canDropOffCargoAtPsPath(psPath) end

---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:700
function career_modules_delivery_vehicleTasks.drawDebugMenu() end

---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:434
---@param offerIds any
function career_modules_delivery_vehicleTasks.finishTasks(offerIds) end

---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:527
---@param taskData any
function career_modules_delivery_vehicleTasks.getFineForAbandon(taskData) end

---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:663
function career_modules_delivery_vehicleTasks.getFineForAbandonAllVehicleTasks() end

---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:624
function career_modules_delivery_vehicleTasks.getTargetDestinationsForActiveTasks() end

---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:362
function career_modules_delivery_vehicleTasks.getVehicleDataWithRewardsSummary() end

---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:686
---@param offer any
function career_modules_delivery_vehicleTasks.getVehicleTaskForOffer(offer) end

---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:658
function career_modules_delivery_vehicleTasks.getVehicleTasks() end

---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:648
---@param vehId any
function career_modules_delivery_vehicleTasks.giveBackDeliveryVehicle(vehId) end

---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:638
---@param vehId any
function career_modules_delivery_vehicleTasks.isVehicleDeliveryVehicle(vehId) end

---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:571
function career_modules_delivery_vehicleTasks.navigateToNextTask() end

---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:8
function career_modules_delivery_vehicleTasks.onCareerActivated() end

---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:201
---@param objId1 any
---@param objId2 any
function career_modules_delivery_vehicleTasks.onTrailerAttached(objId1, objId2) end

---Source : lua/ge/extensions/career/modules/delivery/vehicleTasks.lua:578
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function career_modules_delivery_vehicleTasks.onUpdate(dtReal, dtSim, dtRaw) end

