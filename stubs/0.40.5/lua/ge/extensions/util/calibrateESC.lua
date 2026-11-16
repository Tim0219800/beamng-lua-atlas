---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/calibrateESC.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Internal tool for automated measurement of vehicles' stability control (ESC). It loads the level /levels/smallgrid/info.json, then for each vehicle config (excluding the blacklist and already processed configs) replaces the player vehicle, loads the vehicle extension escMeasurement, runs escMeasurement.performTests(model, config) and waits for the end (vehicleDone), a 20 s watchdog without heartbeat or a maximum duration. At the end, the game exits (shutdown(0)). Intended for automated runs by a worker script, not for normal use.
--- Access: extension `util_calibrateESC`: `extensions.load("util_calibrateESC")`, then the global `util_calibrateESC`
---@class util_calibrateESC
util_calibrateESC = {}

--- To call (from the vehicle) regularly to signal that the test is progressing and reset the watchdog.
---Source: lua/ge/extensions/util/calibrateESC.lua:203
function util_calibrateESC.heartbeat() end

--- Hook called when a level starts; if it is the test level (/levels/smallgrid/info.json), allows the work to continue.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/calibrateESC.lua:141
---@param levelPath string Path of the started level.
function util_calibrateESC.onClientStartMission(levelPath) end

--- Load hook: sets the physics speed to 2, loads the vehicle blacklist and prints the ignored vehicles.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/calibrateESC.lua:165
function util_calibrateESC.onExtensionLoaded() end

--- Unload hook: only logs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/calibrateESC.lua:207
function util_calibrateESC.onExtensionUnloaded() end

--- Hook called when the module loads (not all systems are necessarily ready); only logs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/calibrateESC.lua:24
function util_calibrateESC.onInit() end

--- To call (from the vehicle) when a vehicle's measurements are finished: moves on to the next one.
---Source: lua/ge/extensions/util/calibrateESC.lua:199
function util_calibrateESC.vehicleDone() end

--- Starts the calibration work in a job, loads the test level if it is not already loaded.
---Source: lua/ge/extensions/util/calibrateESC.lua:147
---@param pcFile string|nil Key of the config to test; nil or empty for all.
---@param vehicle string|nil Key of the model to test; nil for all.
function util_calibrateESC.work(pcFile, vehicle) end

