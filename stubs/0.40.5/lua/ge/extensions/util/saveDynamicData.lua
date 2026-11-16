---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/saveDynamicData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Internal automated tool: loads the "autotest" test level, then spawns each vehicle configuration (filterable by model or by .pc file) and runs the dynamicVehicleData extension in the vehicle to measure its dynamic data (dynamicVehicleData.performTests). Results are written to vehicles/<model>/info_<config>.touched; configs already processed are skipped. A watchdog (20 s without heartbeat) and a maximum duration (600 s) move on to the next vehicle. At the end, the game is quit (shutdown(0)).
--- Access: extension `util_saveDynamicData`: `extensions.load("util_saveDynamicData")`, then the global `util_saveDynamicData`
---@class util_saveDynamicData
util_saveDynamicData = {}

--- Called by the vehicle side during the tests to signal that it is still active (rearms the 20 s watchdog).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/saveDynamicData.lua:197
function util_saveDynamicData.heartbeat() end

--- Hook called when a level starts; marks the level as ready if it is the autotest test level.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/saveDynamicData.lua:135
---@param levelPath string Path of the started level
function util_saveDynamicData.onClientStartMission(levelPath) end

--- Called on load: unloads/reloads the base extensions if core_camera is absent, then loads the vehicle blacklist (blacklist.json, otherwise blacklistDefault.json).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/saveDynamicData.lua:160
function util_saveDynamicData.onExtensionLoaded() end

--- Called on unload; only logs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/saveDynamicData.lua:201
function util_saveDynamicData.onExtensionUnloaded() end

--- Called at module initialization; only logs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/saveDynamicData.lua:26
function util_saveDynamicData.onInit() end

--- Called by the vehicle side (dynamicVehicleData) when the tests of the current configuration are finished; moves on to the next one.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/saveDynamicData.lua:193
function util_saveDynamicData.vehicleDone() end

--- Entry point: stores the filters, starts the test job and launches the autotest level if it is not already loaded.
---Source: lua/ge/extensions/util/saveDynamicData.lua:142
---@param pcFile string|nil Configuration key to test (empty or nil = all)
---@param vehicle string|nil Model key to test (nil = all)
function util_saveDynamicData.work(pcFile, vehicle) end

