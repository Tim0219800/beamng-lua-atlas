---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/vehicleSleep.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Freeform delivery submodule that puts to sleep (setActive(0)) the delivery vehicles far from the camera and the player's vehicle, and wakes them when approached, to save simulation time. Only vehicles with a valid sleepDistance in their definition are managed.
--- Access: extension `gameplay_freeformDelivery_vehicleSleep`: `extensions.load("gameplay_freeformDelivery_vehicleSleep")`, then the global `gameplay_freeformDelivery_vehicleSleep`
---@class gameplay_freeformDelivery_vehicleSleep
gameplay_freeformDelivery_vehicleSleep = {}

--- Reactivates all tracked vehicles and clears the tracking.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/vehicleSleep.lua:128
function gameplay_freeformDelivery_vehicleSleep.cleanup() end

--- Returns an array sorted by id with, for each tracked vehicle, the sleep state and the distances (useful for debug display).
---Source: lua/ge/extensions/gameplay/freeformDelivery/vehicleSleep.lua:112
---@return table[]  Entries {id, sleeping, sleepDistance, wakeDistance, cameraDistance, playerVehicleDistance}.
function gameplay_freeformDelivery_vehicleSleep.getDebugData() end

--- Normalizes sleepDistance/wakeDistance in delivery.vehicles and registers the relevant vehicles (active at the start, setActive(1)).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/vehicleSleep.lua:47
---@param delivery table Delivery data with the vehicles array.
function gameplay_freeformDelivery_vehicleSleep.setup(delivery) end

--- Called every frame: measures the camera/player distances of each tracked vehicle and toggles its active/asleep state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/vehicleSleep.lua:74
function gameplay_freeformDelivery_vehicleSleep.update() end

