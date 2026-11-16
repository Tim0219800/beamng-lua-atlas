---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/vehicleClassGrouping.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generates vehicle groups by performance class (S, A, B, C, D) for the core_multiSpawn system (opponents, races). Walks through all Car/Truck models and their configs, filters by model, config and config type, keeps those whose class (gameplay_vehiclePerformance.getClassFromConfig) matches, then shuffles the result. Also provides an AI aggression coefficient per class.
--- Access: extension `career_modules_vehicleClassGrouping`: `extensions.load("career_modules_vehicleClassGrouping")`, then the global `career_modules_vehicleClassGrouping`
---@class career_modules_vehicleClassGrouping
---@field dependencies string[] {"gameplay_vehiclePerformance"}.
career_modules_vehicleClassGrouping = {}

--- Builds a vehicle group of a given class, usable by core_multiSpawn.
---Source: lua/ge/extensions/career/modules/vehicleClassGrouping.lua:50
---@param class string|nil Performance class, default "B".
---@param mode string|nil "default" or "drag" (no effect).
---@param modelFilter table<string, any>|nil Models to exclude (key = model).
---@param configFilter table<string, any>|nil Configs to exclude (key "model/config").
---@param configTypeFilter table<string, any>|nil Config types to exclude.
---@param invertedFilters table<string, boolean>|nil E.g. {modelFilter = true} inverts the filter (whitelist).
---@param randomizePaint boolean|nil "(Random)" paint, true by default.
---@param smartShuffle boolean|nil Interleave models, true by default.
---@param performanceIndexTarget number|nil Target performance index.
---@param performanceIndexWindow number|nil Tolerance around the target, default 5.
---@return table  {name = "Class X", type = "custom", data = {{model, config, paintName}, ...}}.
function career_modules_vehicleClassGrouping.generateGroup(class, mode, modelFilter, configFilter, configTypeFilter, invertedFilters, randomizePaint, smartShuffle, performanceIndexTarget, performanceIndexWindow) end

--- Returns the AI aggression coefficient for a class.
---Source: lua/ge/extensions/career/modules/vehicleClassGrouping.lua:37
---@param class string|nil Class S/A/B/C/D, default "B".
---@return number  Coefficient (1 if the class is unknown).
function career_modules_vehicleClassGrouping.getAggressionMultiplier(class) end

