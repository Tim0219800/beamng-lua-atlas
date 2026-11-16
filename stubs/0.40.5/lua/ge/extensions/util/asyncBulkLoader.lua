---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/asyncBulkLoader.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Asynchronous loader for large datasets (vehicles, missions, gameplay selector, levels, career save profiles). Each loadXxx starts a job (core_jobsystem, 1/30 s interval) that runs the heavy loading while yielding between steps, publishes progress in the 'asyncBulkLoaderProgress' stream and signals completion via guihooks and extensions.hook. The xxxDirect variants load synchronously with time measurement.
--- Access: extension `util_asyncBulkLoader`: `extensions.load("util_asyncBulkLoader")`, then the global `util_asyncBulkLoader`
---@class util_asyncBulkLoader
---@field yield function|nil Yield function _anon(job.yield) set by setupYield; nop at start. Called by the loading code to let the game breathe.
util_asyncBulkLoader = {}

--- Adds to the number of items already processed and publishes the progress.
---Source: lua/ge/extensions/util/asyncBulkLoader.lua:30
---@param count number Processed items to add.
function util_asyncBulkLoader.addCount(count) end

--- Adds to the total number of items to load and publishes the progress.
---Source: lua/ge/extensions/util/asyncBulkLoader.lua:23
---@param total number Items to add to the total.
function util_asyncBulkLoader.addTotal(total) end

--- Returns whether the gameplay selector data is loaded.
---Source: lua/ge/extensions/util/asyncBulkLoader.lua:102
---@return boolean  true if loaded.
function util_asyncBulkLoader.isGameplaySelectorLoaded() end

--- Returns whether the level list is loaded (core_levels.isListLoaded).
---Source: lua/ge/extensions/util/asyncBulkLoader.lua:106
---@return boolean  true if loaded.
function util_asyncBulkLoader.isLevelsLoaded() end

--- Returns whether an asynchronous load is in progress.
---Source: lua/ge/extensions/util/asyncBulkLoader.lua:135
---@return boolean  true if in progress.
function util_asyncBulkLoader.isLoading() end

--- Returns whether all missions are loaded.
---Source: lua/ge/extensions/util/asyncBulkLoader.lua:98
---@return boolean  true if loaded.
function util_asyncBulkLoader.isMissionsLoaded() end

--- Returns whether the vehicle model data is loaded (core_vehicles.isModelsDataLoaded).
---Source: lua/ge/extensions/util/asyncBulkLoader.lua:94
---@return boolean  true if loaded.
function util_asyncBulkLoader.isVehiclesLoaded() end

--- Builds the gameplay selector data asynchronously, then emits 'asyncGameplaySelectorLoadComplete'.
---Source: lua/ge/extensions/util/asyncBulkLoader.lua:228
---@return string  'alreadyLoaded', 'alreadyLoading' or 'startLoading'.
function util_asyncBulkLoader.loadGameplaySelector() end

--- Builds the gameplay selector tiles synchronously and prints the time.
---Source: lua/ge/extensions/util/asyncBulkLoader.lua:122
function util_asyncBulkLoader.loadGameplaySelectorDirect() end

--- Loads the level list asynchronously, then emits 'asyncLevelLoadComplete'.
---Source: lua/ge/extensions/util/asyncBulkLoader.lua:268
---@return string  'alreadyLoaded', 'alreadyLoading' or 'startLoading'.
function util_asyncBulkLoader.loadLevels() end

--- Loads the level list synchronously and prints the time.
---Source: lua/ge/extensions/util/asyncBulkLoader.lua:128
function util_asyncBulkLoader.loadLevelsDirect() end

--- Loads all missions asynchronously, then emits the guihook 'asyncMissionLoadComplete'.
---Source: lua/ge/extensions/util/asyncBulkLoader.lua:193
---@return string  'alreadyLoaded', 'alreadyLoading' or 'startLoading'.
function util_asyncBulkLoader.loadMissions() end

--- Loads all missions synchronously and prints the time.
---Source: lua/ge/extensions/util/asyncBulkLoader.lua:116
function util_asyncBulkLoader.loadMissionsDirect() end

--- Loads the vehicle model data asynchronously, then emits 'asyncVehicleLoadComplete' (UI and extensions). Used by the vehicle selector.
---Source: lua/ge/extensions/util/asyncBulkLoader.lua:155
---@return string  'alreadyLoaded', 'alreadyLoading' or 'startLoading'.
function util_asyncBulkLoader.loadVehicles() end

--- Loads the vehicle model list synchronously (core_vehicles.loadModelListNoGarbage) and prints the time.
---Source: lua/ge/extensions/util/asyncBulkLoader.lua:110
function util_asyncBulkLoader.loadVehiclesDirect() end

--- Updates the percentage of file parsing (decoding of vehicles) and publishes the progress.
---Source: lua/ge/extensions/util/asyncBulkLoader.lua:18
---@param percent number 0 to 100 determinate, -1 indeterminate.
function util_asyncBulkLoader.reportScanPercent(percent) end

--- Sends the current progress state in the 'asyncBulkLoaderProgress' stream.
---Source: lua/ge/extensions/util/asyncBulkLoader.lua:13
function util_asyncBulkLoader.reportStream() end

--- In a job, sends the UI the data of all career save slots (career_career.sendAllCareerProfilesData).
---Source: lua/ge/extensions/util/asyncBulkLoader.lua:304
---@return string  'startLoading'.
function util_asyncBulkLoader.sendAllCareerSaveSlotsDataAsync() end

--- Prepares M.yield from a job: job.yield, or a profiled version if the threshold is lowered.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/asyncBulkLoader.lua:139
---@param job table core_jobsystem job.
function util_asyncBulkLoader.setupYield(job) end

