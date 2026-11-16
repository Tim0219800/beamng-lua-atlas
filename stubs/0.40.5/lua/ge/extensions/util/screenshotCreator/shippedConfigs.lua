---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/shippedConfigs.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Determines whether a vehicle model or configuration (.pc) is "shipped" with the game, i.e. not excluded by the deployment filter file /DevTools/deployfilters/shared_prepack.txt. The file is read once (lowercase rules, empty lines and # comments ignored), glob-style rules (*, **, ?) are converted to Lua patterns and results are cached. Used by the thumbnail creator (modelSelection, job) to photograph only shipped vehicles.
--- Access: extension `util_screenshotCreator_shippedConfigs`: `extensions.load("util_screenshotCreator_shippedConfigs")`, then the global `util_screenshotCreator_shippedConfigs`
---@class util_screenshotCreator_shippedConfigs
util_screenshotCreator_shippedConfigs = {}

--- Forgets the loaded rules and the result cache; the filter file will be reread on the next call.
---Source: lua/ge/extensions/util/screenshotCreator/shippedConfigs.lua:87
function util_screenshotCreator_shippedConfigs.clearCache() end

--- Indicates whether the model AND the file /vehicles/<model>/<config>.pc are shipped.
---Source: lua/ge/extensions/util/screenshotCreator/shippedConfigs.lua:82
---@param modelName string Model name.
---@param configName string Configuration name, without the .pc extension.
---@return boolean  true if the config is shipped.
function util_screenshotCreator_shippedConfigs.isConfigShipped(modelName, configName) end

--- Indicates whether the /vehicles/<model>/ folder is not excluded by the deployment filters.
---Source: lua/ge/extensions/util/screenshotCreator/shippedConfigs.lua:78
---@param modelName string Model name (vehicle folder).
---@return boolean  true if the model is shipped.
function util_screenshotCreator_shippedConfigs.isModelShipped(modelName) end

