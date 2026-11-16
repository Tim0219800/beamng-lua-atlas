---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/simpleTripApp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Feeds the "trip" UI app: accumulates distance and simulation time, estimates fuel consumption and range, and sends the result to the UI about every real second via guihooks.trigger('tripData', data). Reads electrics.values.fuelVolume, wheelspeed and airspeed.
--- Access: extension `simpleTripApp`: `extensions.load (vehicle VM)("simpleTripApp")`, then the global `simpleTripApp`
---@class simpleTripApp
simpleTripApp = {}

--- Load hook: returns false (unload) if the vehicle has neither wheels nor a powertrain device, otherwise calls reset().
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/simpleTripApp.lua:66
---@return boolean|nil  false to request unloading, nil otherwise.
function simpleTripApp.onExtensionLoaded() end

--- Hook called by main.lua when the seated players change; unloads the extension (extensions.unload) if there is no player left or if the vehicle is unsuitable.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/simpleTripApp.lua:73
---@param anyPlayerSeated boolean true if at least one player is seated in this vehicle.
function simpleTripApp.onPlayersChanged(anyPlayerSeated) end

--- Resets distance, time, send timer (1 s), previous fuel and starting fuel. Called on load; can be used to restart a trip.
---Source: lua/vehicle/extensions/simpleTripApp.lua:14
function simpleTripApp.reset() end

--- Called every graphics frame via extensions.hook('updateGFX'). Integrates distance and time, then about every real second computes the statistics and calls guihooks.trigger('tripData', data).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/simpleTripApp.lua:22
---@param dtSim number Simulation time step in seconds.
function simpleTripApp.updateGFX(dtSim) end

