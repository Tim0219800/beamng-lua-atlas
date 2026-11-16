---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/test/ffbCalibration.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Automatic steering wheel force feedback (FFB) calibration procedure. The vehicle is launched by the cruise control (cruiseControl) then the wheel is turned progressively; at each physics step the module records speed, steering wheel angle and normalized force at the wheel (hydros.forceAtWheelNorm, raw and smoothed). At the end it computes a recommended correction of the FFB coefficient and sends everything back to the game Lua via test_ffbCalibration.onFFBCalibrationFinished(data encoded with lpack). Modes: "steerPeak" (stops when the force has passed its peak), "steerFull" (goes to the end stop), "straight" (records driving straight).
--- Access: extension `test_ffbCalibration`: `extensions.load (vehicle VM)("test_ffbCalibration")`, then the global `test_ffbCalibration`
---@class test_ffbCalibration
test_ffbCalibration = {}

--- Ends the calibration: sets physics back to normal speed (GE side), gives control back (input, cruise, gearbox, brake, clutch), computes the FFB correction advice, sends the data to the GE via test_ffbCalibration.onFFBCalibrationFinished and frees `data`.
---Source: lua/vehicle/extensions/test/ffbCalibration.lua:184
function test_ffbCalibration.finish() end

--- Load hook: calls enablePhysicsStepHook() to receive onPhysicsStep.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/test/ffbCalibration.lua:263
function test_ffbCalibration.onExtensionLoaded() end

--- Physics step hook (enabled by enablePhysicsStepHook in onExtensionLoaded, called by main.lua at the physics frequency). Updates airspeed (obj:getGroundSpeed) then runs the logic of the current mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/test/ffbCalibration.lua:173
---@param dtSim number Physics step in seconds.
function test_ffbCalibration.onPhysicsStep(dtSim) end

--- Starts an FFB calibration in the given mode: initializes all counters and the results table, takes control of the steering wheel and gearbox, loads cruiseControl, sets the target speed and disables normal FFB.
---Source: lua/vehicle/extensions/test/ffbCalibration.lua:207
---@param mode string "steerPeak", "steerFull" or "straight"; any other value: error log and finish().
---@param fastmotion boolean|nil true to speed up physics (x100) during calibration.
function test_ffbCalibration.start(mode, fastmotion) end

