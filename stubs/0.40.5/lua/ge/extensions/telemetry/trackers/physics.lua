---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/physics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Physics telemetry tracker: reports physics instabilities with enough context to reproduce them ("physicsInstability" event: model, config, originating mod, level, simulation speed, vehicle count, position and sum of the vehicle's section damage) then requests the report to be written.
--- Access: extension `telemetry_trackers_physics`: `extensions.load("telemetry_trackers_physics")`, then the global `telemetry_trackers_physics`
---@class telemetry_trackers_physics
---@field dependencies string[] telemetry_core.
telemetry_trackers_physics = {}

--- Hook called on load: manual unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/physics.lua:46
function telemetry_trackers_physics.onExtensionLoaded() end

--- Hook called when a physics instability is detected on a vehicle: builds and sends the event, then calls telemetry_core.triggerReportWrite().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/physics.lua:18
---@param vid integer Id of the unstable vehicle.
---@param returnData table Return table of the instability handlers (not used here).
function telemetry_trackers_physics.onInstabilityDetected(vid, returnData) end

