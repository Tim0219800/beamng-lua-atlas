---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/escCalibration.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Internal ESC calibration tool: automates a 'skew stiffness' test by sweeping 13 speeds (40 to 100 km/h) and 14 steering angles (0.5° to 7°), with the cruise control and the 'esc' controller. The result is written to skewStiffnessPivot.csv and progress is sent to the UI via the 'ESCSkewStiffnessChange' hook.
--- Access: extension `escCalibration`: `extensions.load (vehicle VM)("escCalibration")`, then the global `escCalibration`
---@class escCalibration
escCalibration = {}

--- Initialization hook: resets all counters and results to zero, physics speed to normal and the state to Idling.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/escCalibration.lua:165
function escCalibration.onInit() end

--- Same function as onInit.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/escCalibration.lua:165
function escCalibration.onReset() end

--- Starts the test: gets the 'esc' controller (aborts with a log error if it does not exist), loads cruiseControl, starts the ESC calibration and switches to the Initialization state.
---Source: lua/vehicle/extensions/escCalibration.lua:191
function escCalibration.startSkewStiffnessTest() end

--- Stops the test: cuts the cruise control, stops the ESC calibration, restores normal physics speed and switches to the Finished state (the CSV will then be written on the next frame).
---Source: lua/vehicle/extensions/escCalibration.lua:209
function escCalibration.stopSkewStiffnessTest() end

--- Called every frame: advances the test state machine and drives the steering.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/escCalibration.lua:57
---@param dt number Time step in seconds.
function escCalibration.updateGFX(dt) end

