---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/input/vibrationDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_input_vibrationDebug`: "Vibration Debug" ImGui debug window to tune in real time the controller vibration (haptics) parameters of the player's vehicle. Each modified field sends a command to the haptics extension on the vehicle side. Useful to test force feedback, not a lasting API.
--- Access: extension `core_input_vibrationDebug`: `extensions.load("core_input_vibrationDebug")`, then the global `core_input_vibrationDebug`
---@class core_input_vibrationDebug
core_input_vibrationDebug = {}

--- Per-frame hook: draws the ImGui window and sends to player vehicle 0 the new force multiplier values (wheel slip, jerks) and minimum thresholds.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/vibrationDebug.lua:14
function core_input_vibrationDebug.onUpdate() end

--- Hook on vehicle change: resets the window fields to their default values (multipliers 1, wheelSlipMin 4, jerkMin 30) without sending them back to the vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/input/vibrationDebug.lua:34
function core_input_vibrationDebug.onVehicleSwitched() end

