---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/odometer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Freeform delivery submodule that tracks the odometer of vehicles marked trackOdometer in the delivery definition. It reads the value via core_vehicleBridge (getRootPartOdometer), computes the distance traveled since the start, displays a message in the task list and fails the delivery if the distance exceeds maxOdometer.
--- Access: extension `gameplay_freeformDelivery_odometer`: `extensions.load("gameplay_freeformDelivery_odometer")`, then the global `gameplay_freeformDelivery_odometer`
---@class gameplay_freeformDelivery_odometer
---@field dependencies string[] core_vehicleBridge, gameplay_freeformDelivery_utils, gameplay_freeformDelivery_setup.
gameplay_freeformDelivery_odometer = {}

--- Clears the tracking and removes the odometer message from the task list (DiscardTasklistItem).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/odometer.lua:242
function gameplay_freeformDelivery_odometer.cleanup() end

--- Returns the tracking data of a vehicle.
---Source: lua/ge/extensions/gameplay/freeformDelivery/odometer.lua:181
---@param vehId integer Object ID of the vehicle in the game.
---@return table|nil  {deliveryVehicleId, startingOdometer, currentOdometer, maxOdometer, requestPending} or nil.
function gameplay_freeformDelivery_odometer.getOdometerData(vehId) end

--- Like getOdometerData but searching by the vehicle's ID in the delivery definition.
---Source: lua/ge/extensions/gameplay/freeformDelivery/odometer.lua:186
---@param deliveryVehicleId string Vehicle ID in the delivery (inferred from code).
---@return table|nil  Tracking data or nil.
function gameplay_freeformDelivery_odometer.getOdometerDataByDeliveryId(deliveryVehicleId) end

--- Returns whether all initial odometer requests have received a response.
---Source: lua/ge/extensions/gameplay/freeformDelivery/odometer.lua:130
---@return boolean  true when no request is pending.
function gameplay_freeformDelivery_odometer.isSetupComplete() end

--- Resets the tracking then, for each vehicle of delivery.vehicles with trackOdometer, requests the starting odometer from the vehicle. maxOdometer (optional) comes from the vehicle definition.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/odometer.lua:92
---@param delivery table Delivery data with the vehicles array.
function gameplay_freeformDelivery_odometer.setup(delivery) end

--- Called every frame; every 1/8 s, requests the odometer of each tracked vehicle again and fails the delivery if the distance traveled exceeds maxOdometer.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/odometer.lua:135
---@param dtReal number Real-time delta in seconds.
function gameplay_freeformDelivery_odometer.update(dtReal) end

--- Updates (or removes) the odometer message in the task list for the player's vehicle. Only sends SetTasklistTask if the text has changed.
---Source: lua/ge/extensions/gameplay/freeformDelivery/odometer.lua:197
function gameplay_freeformDelivery_odometer.updateTasklistMessage() end

