---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/controls.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Controls telemetry tracker: reports the steering method used (one-off event "controlsUsed") and, when the game closes, the number of uses of each bound action ("inputActionUse", via ActionMap.getActionUseCounts). Connected devices belong to the hardware survey (hardware tracker), not this one.
--- Access: extension `telemetry_trackers_controls`: `extensions.load("telemetry_trackers_controls")`, then the global `telemetry_trackers_controls`
---@class telemetry_trackers_controls
---@field dependencies string[] telemetry_core.
telemetry_trackers_controls = {}

--- Hook called on load: manual unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/controls.lua:45
function telemetry_trackers_controls.onExtensionLoaded() end

--- Hook called on unload: sends the count of action uses (except on Lua reload or if already done).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/controls.lua:50
function telemetry_trackers_controls.onExtensionUnloaded() end

--- Hook called before unload/reload: remembers whether the reason is a Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/controls.lua:56
---@param reason string Reason for the serialization ("reload" on reload).
function telemetry_trackers_controls.onSerialize(reason) end

--- Hook called when the vehicle's steering filter changes: records the controlsUsed event with the method.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/controls.lua:22
---@param method string Steering method (inferred from code: name of the steering filter/mode).
function telemetry_trackers_controls.onSteeringFilterChanged(method) end

