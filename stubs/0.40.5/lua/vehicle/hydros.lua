---@meta
-- tim19Atlas stub generated from lua/vehicle/hydros.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages jbeam hydros (beams/torsion bars driven by an input: steering, dump beds, cranes, etc.) and steering wheel force feedback (FFB). At init it reads v.data.hydros (beams) and v.data.torsionHydros, normalizes their limits and center, and separates steering hydros (inputSource 'steering_input') from the others. At each physics step (update) it moves each hydro toward its command (cmd, read from electrics.values via inputFlex) with inRate/outRate rates; for the physical steering wheel, the wheel position drives the steering and the force measured on the steering beams is sent back to the hardware (FFBcalc: smoothing, compression, damping, software stop "softlock"). Also provides a virtual wheel for tests (enableVirtualWheel).
--- Access: global `hydros`
---@class hydros
---@field GforceCoef number Effect coefficient of lateral G forces (sensors.gx) on the steering wheel force (default 0).
---@field curForceLimit number Current force limit (spike preventer): restarts from 0 after spawn/reload/pause and climbs up to wheelFFBForceLimit.
---@field curForceLimitNorm number curForceLimit / FFmax.
---@field deviceLightingMode string Device lighting configuration ('off' by default; 'default' enables sending the RPM LEDs).
---@field enableBrakeForceFeedback boolean Enables brake force feedback in gamepad vibration mode (default true).
---@field enableFFB boolean true by default; when set to false the real requests to the FFB hardware are ignored (the computations continue).
---@field enableFFBflood boolean false by default; true = ignores the time checks and sends at ~2 kHz (debug only: saturates the drivers).
---@field enableThrottleForceFeedback boolean Enables throttle force feedback in gamepad vibration mode (default true).
---@field enableVibration boolean false by default; true in vibration mode (gamepad), the steering wheel FFB is then disabled (FFBHydrosExist = false).
---@field ffbSpeedFast number Speed (m/s) above which the FFB force reaches its normal coefficient (5 / 3.6).
---@field forceAtDriver number Force sent to the hardware driver in [-FFmax, FFmax].
---@field forceAtDriverNorm number Force sent to the hardware driver, normalized.
---@field forceAtWheelNorm number Force measured at the wheel, normalized (force / FFmax).
---@field hydros table[] List of all hydros (beams then torsion bars) with their computed fields.
---@field wheelFFBForceCoef number FFB force coefficient at normal speed (default 100).
---@field wheelFFBForceCoefCurrent number Current coefficient, interpolated between low and normal speed according to the speed (ffbSpeedFast), 0 when the AI is driving.
---@field wheelFFBForceCoefLowSpeed number Force coefficient at parking speeds (initially = wheelFFBForceCoef; = forceCoef/10 if lowspeedCoef).
---@field wheelFFBForceCompressionCoef number Fraction of the limit from which the force is compressed (0..1, default 0.9).
---@field wheelFFBForceLimit number Stable FFB force limit (scale 0..FFmax = 10).
---@field wheelPowerSteeringCoef number Power steering coefficient (default 1) applied to the wheel displacement in the FFB force.
hydros = {}

--- Called by main.lua:onDebugDraw. Resets the FFB smoother when the real frame time is aberrant (less than 10 fps or at standstill) to avoid spikes.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/hydros.lua:288
function hydros.debugDraw() end

--- Called when the vehicle is removed (main.lua:onDespawnObject): cuts all FFB interfaces (force 0).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/hydros.lua:731
function hydros.destroy() end

--- Enables or disables a virtual wheel (software simulation of an FFB wheel): enables FFB with FFBID 0, replaces the force send function and the angle read function.
---Source: lua/vehicle/hydros.lua:116
---@param isEnabled boolean|nil true (default if nil) to enable.
---@param wheelAngleFun function|nil Function returning the wheel angle -1..1 (virtual wheel by default).
---@param sendForceFun function|nil Force send function _anon(o, FFBID, torque, dampCoef, inertia, friction); virtualSendForceFeedback by default.
function hydros.enableVirtualWheel(isEnabled, wheelAngleFun, sendForceFun) end

--- Returns the function that gives the current wheel angle: the virtual wheel's if enabled, otherwise a function reading electrics.values.steering_input.
---Source: lua/vehicle/hydros.lua:761
---@return function  Argument-less function returning the angle.
function hydros.getAngleFunction() end

--- Returns the current FFB configuration.
---Source: lua/vehicle/hydros.lua:488
---@return table  {forceCoef, softlockForce, smoothing, gforceCoef, wheelFFBDampLimit}.
function hydros.getFFBConfig() end

--- Returns the identifier of the steering FFB device (-1 if none).
---Source: lua/vehicle/hydros.lua:753
---@return integer  FFBID (>= 0 valid).
function hydros.getFFBID() end

--- Returns the current force send function _anon(obj.sendForceFeedback, or the virtual wheel's).
---Source: lua/vehicle/hydros.lua:749
---@return function  Function sendForceFeedback(obj, FFBID, force, ...).
function hydros.getForceFeedbackFunction() end

--- Prepares the hydros from v.data.hydros and v.data.torsionHydros: computation of multipliers/centers, steering / others split, inputFlex, vehicle FFB coefficient (v.data.input.FFBcoef x 1.2), haptics initialization, then reset(). Called by main.lua (initSystems).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/hydros.lua:603
function hydros.init() end

--- Indicates whether hydros needs the physics step (update active).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/hydros.lua:745
---@return boolean  true if M.update ~= nop.
function hydros.isPhysicsStepUsed() end

--- Hook called when the FFB device configuration changes: cuts the interfaces, rereads steering/accelerate/brake, chooses FFBID, force, smoothing, softlock, response curve, send frequency and configures input_haptics.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/hydros.lua:513
---@param newFFBConfig table|nil Config {steering = {FFBID, ffbParams, ffbSendms}, accelerate = {FFBID}, brake = {FFBID}}; nil to disable.
function hydros.onFFBConfigChanged(newFFBConfig) end

--- Resets the hydro states to center, reinitializes FFB smoothers and the virtual wheel, cuts the FFB interfaces; re-enables update/updateGFX if there are hydros (otherwise nop).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/hydros.lua:701
function hydros.reset() end

--- Resets the FFB force smoother and the force limit to 0 (anti-spike).
---Source: lua/vehicle/hydros.lua:203
function hydros.resetFFBSmoother() end

--- Sends guihooks.trigger('HydrosUpdate', M.state); M.state is never defined in this file (see notes).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/hydros.lua:735
function hydros.sendHydroStateToGUI() end

--- Sends the RPM LEDs to the FFB device (obj:sendRPMLeds) if FFBID is valid and deviceLightingMode is 'default'.
---Source: lua/vehicle/hydros.lua:739
---@param currentRPM number Current engine RPM.
---@param rpmFirstLedTurnsOn number RPM at which the first LED lights up.
---@param rpmRedLine number RPM of the red zone.
function hydros.sendRPMLeds(currentRPM, rpmFirstLedTurnsOn, rpmRedLine) end

--- Adds an external force to the steering wheel FFB computation (before the force coefficient).
---Source: lua/vehicle/hydros.lua:134
---@param force number External force (same scale as the wheel displacement).
function hydros.setExternalForce(force) end

--- Updates FFB parameters on the fly (only the fields provided are modified) then cuts the FFB interfaces.
---Source: lua/vehicle/hydros.lua:498
---@param ffbParams table Possible fields: forceCoef, softlockForce (0..1), smoothing, gforceCoef, enableThrottleForceFeedback, enableBrakeForceFeedback, deviceLightingMode, wheelFFBDampLimit.
function hydros.setFFBConfig(ffbParams) end

--- Physics step (main.lua:onPhysicsStep, after controller.update). Moves each hydro toward its command; for steering hydros with FFB active, follows the real wheel position and runs the FFB computation (FFBcalc).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/hydros.lua:418
---@param dtSim number Physics step in seconds.
function hydros.update(dtSim) end

--- Graphics frame (after extensions and electrics, before powertrain). Updates the virtual wheel, inputFlex, commands (cmd) and smoothing rates, the wheel motion model for FFB, the force limit, the force coefficient according to speed, and electrics.values.steering (angle in degrees).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/hydros.lua:293
---@param dt number Time step in seconds.
function hydros.updateGFX(dt) end

