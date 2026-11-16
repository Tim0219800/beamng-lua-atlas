---@meta
-- tim19Atlas stub generated from lua/vehicle/input.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Reception and filtering of the vehicle's driving inputs (steering, throttle, brake, parking brake, clutch, and any vehicle-specific input). Control actions (keyboard, gamepad, wheel, AI, scripts) call input.event(type, value, filter, …); the value is stored in input.state[type]. Every frame, input.updateGFX applies the chosen filter (keyboard/gamepad smoothing, wheel angle mapping, steering assists), clamps the value and writes it into input[type] (e.g. input.throttle) and into electrics.values[type .. '_input']. The vehicle modules (controller, hydros, wheels, powertrain) then read electrics.values.* or input.*.
--- Access: global `input`
---@class input
---@field allowedInputSources table<string, table<string, boolean>> Allowed sources by input type; absent = all. Managed by setAllowedInputSource.
---@field keys table Legacy compatibility: any read of input.keys[x] is logged as obsolete (use vehicle-specific bindings instead).
---@field lastFilterType integer|string Last steering filter seen by updateGFX (-1 at start).
---@field lastInputs table<string, table<string, number>> Last raw value received by source then by input type (cleared on reset).
---@field lowspeedCoef nil Always nil (declared but never assigned, see notes).
---@field state table<string, table> One state per input type (steering, throttle, brake, parkingbrake, clutch, + vehicle inputs): raw val, filter, angle, lockType, osClockHP, source, minLimit/maxLimit, smoothers. Recreated by init().
input = {}

--- Records an input value for the next frame. Filtering and publication into electrics happen in updateGFX. Ignored (but stored in lastInputs) if sources are restricted for this type and `source` is not among them.
---Source: lua/vehicle/input.lua:717
---@param itype string Input type: "steering", "throttle", "brake", "parkingbrake", "clutch" or vehicle-specific input.
---@param ivalue number Raw value (steering -1..1, others 0..1; clamped by minLimit/maxLimit after filtering).
---@param filter integer|string FILTER_KBD (0), FILTER_PAD (1), FILTER_DIRECT (2), FILTER_KBD2 (3) or FILTER_AI.
---@param angle number|nil Physical wheel angle in degrees for the mapping (steering only).
---@param lockType integer|nil Angle lock type: 0 disabled, 1 normal, 2 faster if needed, 3 disabled if needed.
---@param osClockHP number|nil High-precision timestamp of the event, published in electrics.values.<type>_timestamp.
---@param source string|nil Origin of the event; "local" if nil.
function input.event(itype, ivalue, filter, angle, lockType, osClockHP, source) end

--- First initialization stage (main.lua: initSystems): recreates input.state with the five default inputs and their smoothers.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/input.lua:88
function input.init() end

--- Second stage (after sounds/electrics): determines the vehicle's wheel angle (steering_input hydro or v.data.input.steeringWheelLock), autocenter and lowspeedCoefFFB requested by the hydro, creates the parking brake sounds, identifies front/rear wheels for the assists, computes the keyboard smoothing rates, then calls reset().
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/input.lua:144
function input.initSecondStage() end

--- Multi-key keyboard compatibility: stores the value of the left or right key and sends event('steering', right - left, filter).
---Source: lua/vehicle/input.lua:753
---@param isRight boolean true for the right key, false for the left.
---@param val number Key value (0..1).
---@param filter integer Filter to use.
function input.kbdSteer(isRight, val, filter) end

--- Resets all inputs to 0 (keyboard filter) except the parking brake, and resets the kbdSteer left/right keys.
---Source: lua/vehicle/input.lua:773
function input.neutralizeControls() end

--- Single-axis gamepad compatibility: val > 0 goes to throttle (brake at 0), val <= 0 goes to brake with -val (throttle at 0).
---Source: lua/vehicle/input.lua:763
---@param val number Axis -1..1 (positive = acceleration).
---@param filter integer Filter to use.
function input.padAccelerateBrake(val, filter) end

--- Resets the smoothers, lastInputs and the assists state, rereads the settings. Called by main.lua on vehicle reset and by initSecondStage.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/input.lua:694
function input.reset() end

--- Restricts or releases the accepted sources for an input type. source == nil removes the restriction; otherwise marks the source as allowed (enabled true) or denied (false). As soon as a table exists for a type, only sources set to true are accepted.
---Source: lua/vehicle/input.lua:834
---@param itype string Input type.
---@param source string|nil Source name; nil to remove any restriction on this type.
---@param enabled boolean|nil true to allow the source, false to deny it.
function input.setAllowedInputSource(itype, source, enabled) end

--- Rereads the settings (settings.getValue) of the steering assists: oversteer stabilization, understeer reduction, slowdown and limiting at high speed, autocenter at low speed. Called by reset() and by onSettingsChanged in main.lua. Swaps the start/end speeds if they are inverted.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/input.lua:783
function input.settingsChanged() end

--- Toggles an input: sets val to 0 if it exceeds 0.5, otherwise to 1, with filter 0 (keyboard). Ignored if the type does not exist in state. Does not take allowed sources into account.
---Source: lua/vehicle/input.lua:738
---@param itype string Existing input type (e.g. "parkingbrake").
function input.toggleEvent(itype) end

--- Called every graphics frame by main.lua, very early (after sensors and ai, before electrics). For each input: applies the filter (direct/pad/keyboard/AI), the angle mapping and the steering assists, clamps the value, plays the parking brake sounds and publishes the result in input[name] and electrics.values[name_input].
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/input.lua:574
---@param dt number Simulation time step in seconds.
function input.updateGFX(dt) end

--- Metatable set on input.keys, for compatibility only: its __index logs an error (only once) saying that access to input.keys is obsolete, then returns rawget(M.keys, key).
---@class input_MT
local input_MT = {}

--- Logs the obsolete use of input.keys[key] then returns the raw value.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/input.lua:12
---@param tbl table Table input.keys.
---@param key any Key read.
function input_MT.__index(tbl, key) end

