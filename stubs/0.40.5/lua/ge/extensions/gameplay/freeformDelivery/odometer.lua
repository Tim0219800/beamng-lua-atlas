---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/odometer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_freeformDelivery_odometer` : `extensions.load("gameplay_freeformDelivery_odometer")`, puis la globale `gameplay_freeformDelivery_odometer`
---@class gameplay_freeformDelivery_odometer
---@field dependencies table
gameplay_freeformDelivery_odometer = {}

---Source : lua/ge/extensions/gameplay/freeformDelivery/odometer.lua:242
function gameplay_freeformDelivery_odometer.cleanup() end

--- Get odometer data for a vehicle
---Source : lua/ge/extensions/gameplay/freeformDelivery/odometer.lua:181
---@param vehId any
function gameplay_freeformDelivery_odometer.getOdometerData(vehId) end

--- Get odometer data by delivery vehicle ID
---Source : lua/ge/extensions/gameplay/freeformDelivery/odometer.lua:186
---@param deliveryVehicleId any
function gameplay_freeformDelivery_odometer.getOdometerDataByDeliveryId(deliveryVehicleId) end

--- Check if odometer requests are complete
---Source : lua/ge/extensions/gameplay/freeformDelivery/odometer.lua:130
function gameplay_freeformDelivery_odometer.isSetupComplete() end

--- Setup odometer tracking for vehicles with the flag
---Source : lua/ge/extensions/gameplay/freeformDelivery/odometer.lua:92
---@param delivery any
function gameplay_freeformDelivery_odometer.setup(delivery) end

--- Update odometer values (called 8 times per second)
---Source : lua/ge/extensions/gameplay/freeformDelivery/odometer.lua:135
---@param dtReal any
function gameplay_freeformDelivery_odometer.update(dtReal) end

---Source : lua/ge/extensions/gameplay/freeformDelivery/odometer.lua:197
function gameplay_freeformDelivery_odometer.updateTasklistMessage() end

