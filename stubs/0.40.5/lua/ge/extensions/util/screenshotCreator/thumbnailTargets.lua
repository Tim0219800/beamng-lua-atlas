---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/thumbnailTargets.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Helper to build the list of thumbnail targets (model/config pairs) for the thumbnail composer. It validates the targets received from the UI (at most 2000, names of 128 characters maximum, duplicates removed), turns them into work items from core_vehicles data, produces the catalog of models and configs for the UI (with the "shipped" flag from shippedConfigs) and handles the default case where only the player vehicle's config is photographed.
--- Access: extension `util_screenshotCreator_thumbnailTargets`: `extensions.load("util_screenshotCreator_thumbnailTargets")`, then the global `util_screenshotCreator_thumbnailTargets`
---@class util_screenshotCreator_thumbnailTargets
---@field dependencies string[] Extensions loaded before: core_vehicles and util_screenshotCreator_shippedConfigs.
util_screenshotCreator_thumbnailTargets = {}

--- Turns sanitized targets into work items. Fails if a config is unknown.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailTargets.lua:54
---@param targets table[] List of {model, config}.
---@return table[]|nil  Work items.
---@return string|nil  "Unknown vehicle config: model/config".
function util_screenshotCreator_thumbnailTargets.buildExplicitWorkItems(targets) end

--- Builds the sorted catalog of models for the UI: {key, label "Brand Name", category = Type, configs = [{key, label, isDefault, shipped}]}. Models without configs are omitted.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailTargets.lua:71
---@return table[]  Model catalog.
function util_screenshotCreator_thumbnailTargets.buildModelCatalog() end

--- Lists all the shipped {model, config} targets (according to shippedConfigs) for the given models.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailTargets.lua:100
---@param modelKeys string[] Model keys.
---@return table[]  {model, config} targets.
function util_screenshotCreator_thumbnailTargets.buildShippedTargets(modelKeys) end

--- Looks in core_vehicles.getModel(modelKey).configs for the configuration whose key is configName.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailTargets.lua:16
---@param modelKey string Model key.
---@param configName string Configuration key.
---@return table|nil  Config data, or nil.
function util_screenshotCreator_thumbnailTargets.getConfigData(modelKey, configName) end

--- Indicates whether the config is the model's default one (is_default_config or the model's default_pc).
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailTargets.lua:24
---@param modelKey string Model key.
---@param configName string Configuration key.
---@param configData table|nil Config data, if already known.
---@return boolean  true if default config.
function util_screenshotCreator_thumbnailTargets.isDefaultConfig(modelKey, configName, configData) end

--- Extracts the config name from a .pc path (last segment, without extension). Returns nil if it is not a string ending in .pc.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailTargets.lua:9
---@param partConfig string|nil Value of vehicle.partConfig, e.g. vehicles/pickup/d15_4wd.pc.
---@return string|nil  Configuration name, e.g. d15_4wd.
function util_screenshotCreator_thumbnailTargets.normalizeConfigName(partConfig) end

--- Converts a start message from the UI into work items: message.targets if present, otherwise the player vehicle's current config.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailTargets.lua:113
---@param message table|nil UI message ({targets = ...}).
---@return table[]|nil  Work items.
---@return string|nil  Error message.
function util_screenshotCreator_thumbnailTargets.resolveStartMessage(message) end

--- Validates and deduplicates a list of targets.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailTargets.lua:30
---@param targets table|nil List of {model, config}.
---@return table|nil  Sanitized list; nil if targets is nil.
---@return string|nil  Error message (invalid list, invalid target at index N).
function util_screenshotCreator_thumbnailTargets.sanitizeTargets(targets) end

