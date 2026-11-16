---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/hardware.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Hardware telemetry tracker: collects system, graphics, display, audio, storage and input device information for minimum-spec and optimization decisions. The "hardwareSurvey" survey is large and changes little: it is only sent every 30 days (24*30 h by default, modifiable via the server config). Changes of controllers, audio output and display mode are separate one-off events.
--- Access: extension `telemetry_trackers_hardware`: `extensions.load("telemetry_trackers_hardware")`, then the global `telemetry_trackers_hardware`
---@class telemetry_trackers_hardware
---@field dependencies string[] telemetry_core.
telemetry_trackers_hardware = {}

--- Hook called when the audio output changes: emits "audioOutputChanged" (sample rate, speaker mode, channels).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/hardware.lua:197
function telemetry_trackers_hardware.onAudioOutputDeviceChanged() end

--- Hook called when an input device changes: compares with the known controllers and emits an "inputDeviceConnection" event per difference.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/hardware.lua:185
function telemetry_trackers_hardware.onDeviceChanged() end

--- Hook called on display mode change: emits "displayModeChanged" only for the tracked transitions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/hardware.lua:208
---@param from string Old mode.
---@param to string New mode.
function telemetry_trackers_hardware.onDisplayModeChanged(from, to) end

--- Hook called on load: remembers the connected controllers, emits the GPU memory snapshots, sends the hardware survey if it is due, then switches to manual unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/hardware.lua:278
function telemetry_trackers_hardware.onExtensionLoaded() end

