---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/escMeasurement.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Internal tool for automatic ESC measurement/calibration (drivingDynamics/CMU controller), driven from the GE by util_calibrateESC. A worker coroutine runs a skew stiffness test by sweeping speeds (30 to 150 km/h, 2 m/s steps) and steering angles (0.5° to 20°), then writes the result to vehicles/<model>/drivingDynamics/<config>.stat.json. A second test (STM, yaw measurements at 200 km/h) exists but is disabled in performTests.
--- Access: extension `escMeasurement`: `extensions.load (vehicle VM)("escMeasurement")`, then the global `escMeasurement`
---@class escMeasurement
escMeasurement = {}

--- Initialization hook: resets state, counters, measurements and physics speed to zero (Idling state).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/escMeasurement.lua:442
function escMeasurement.onInit() end

--- Same function as onInit.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/escMeasurement.lua:442
function escMeasurement.onReset() end

--- Launches the complete calibration sequence in a coroutine and stores model/config for the output file name.
---Source: lua/vehicle/extensions/escMeasurement.lua:507
---@param vehicleName string Model name (vehicles/ folder).
---@param configName string Configuration name.
function escMeasurement.performTests(vehicleName, configName) end

--- Starts the skew stiffness test: gets the CMU, registers the fixed-step callback, disables the ESC systems for calibration and switches to Initialization.
---Source: lua/vehicle/extensions/escMeasurement.lua:457
function escMeasurement.startSkewStiffnessTest() end

--- Stops the test: cuts the internal regulator, restores normal physics speed, Finished state.
---Source: lua/vehicle/extensions/escMeasurement.lua:499
function escMeasurement.stopSkewStiffnessTest() end

--- Callback called by the CMU at a fixed physics step: runs the skew stiffness test logic.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/escMeasurement.lua:390
---@param dt number Time step in seconds.
function escMeasurement.updateFixedStepCallback(dt) end

--- Called every frame: resumes the worker coroutine, sends the heartbeat to the GE and triggers the killswitch when it is finished.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/escMeasurement.lua:115
---@param dt number Time step in seconds (unused).
function escMeasurement.updateGFX(dt) end

--- GFX callback of the CMU; empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/escMeasurement.lua:394
---@param dt number Time step in seconds.
function escMeasurement.updateGFXCallback(dt) end

