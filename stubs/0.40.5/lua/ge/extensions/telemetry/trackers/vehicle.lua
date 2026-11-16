---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/vehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vehicle telemetry tracker. It records which vehicles are spawned (`vehicleSpawned` event), driven and for how long (`vehicleUsed` activity), and resets (`vehicleReset` event). Custom configurations are reported as ":custom" instead of the configuration contents. Relies on `telemetry_core`, `telemetry_vehicleInfo` and `telemetry_configManager`.
--- Access: extension `telemetry_trackers_vehicle`: `extensions.load("telemetry_trackers_vehicle")`, then the global `telemetry_trackers_vehicle`
---@class telemetry_trackers_vehicle
---@field dependencies table<integer, string> Extensions to load before this one: `{'telemetry_core'}`.
telemetry_trackers_vehicle = {}

--- Hook called at the end of the mission/level on the client side. Closes the `vehicleUsed` activity.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/vehicle.lua:78
function telemetry_trackers_vehicle.onClientEndMission() end

--- Hook called when the game exits. Closes the `vehicleUsed` activity.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/vehicle.lua:91
function telemetry_trackers_vehicle.onExit() end

--- Hook called when the extension loads. Sets the extension to manual unload and, if player 0 is already driving a vehicle, opens its `vehicleUsed` activity.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/vehicle.lua:82
function telemetry_trackers_vehicle.onExtensionLoaded() end

--- Hook called when the extension is unloaded (a Lua reload does not go through onExit). Closes the `vehicleUsed` activity.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/vehicle.lua:21
function telemetry_trackers_vehicle.onExtensionUnloaded() end

--- Hook called when a vehicle is spawned. Sends the `vehicleSpawned` event with the model, configuration and current level. Does nothing if the vehicle info cannot be found.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/vehicle.lua:37
---@param vid integer Id of the created vehicle.
function telemetry_trackers_vehicle.onVehicleSpawned(vid) end

--- Hook called when the controlled vehicle changes. For player 0, closes the current `vehicleUsed` activity then opens one for the new vehicle (or only closes it if newId is -1).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/vehicle.lua:49
---@param oldId integer Id of the old vehicle.
---@param newId integer ID of the new vehicle, -1 if the player is no longer in a vehicle.
---@param player integer Player index; only 0 is handled.
function telemetry_trackers_vehicle.onVehicleSwitched(oldId, newId, player) end

--- Sends the `vehicleReset` event (model and damage of player 0's vehicle, read from `map.objects[vid].damage`). Can be disabled via `trackResets = false` in the `vehicle` module config. Ignored if the player has no vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/vehicle.lua:61
function telemetry_trackers_vehicle.trackVehReset() end

