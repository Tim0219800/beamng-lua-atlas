---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/util/vehicleSelectUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Selector instance. Option fields: allowedTypes, allowedSubtypes, modelBlacklist (table key->true), configBlacklist (model -> {configKey = true}), enableConfigs (true), enablePaints (false), enableCustomConfig (false), paintLayers (3), columnWidth (80 by default, multiplied by im.uiscale).
---@class editor_util_vehicleSelectUtil
local editor_util_vehicleSelectUtil = {}

--- Loads if needed the lists of models (filtered by type and blacklist, sorted by name), configs (filtered by blacklist and subtypes) and paints of the current model.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/vehicleSelectUtil.lua:155
function editor_util_vehicleSelectUtil:fetchData() end

--- Converts a paint (table {r,g,b,a}, or table with baseColor as an array or as x/y/z/w) into a 4-component imgui float array; white by default.
---Source: lua/ge/extensions/editor/util/vehicleSelectUtil.lua:135
---@param paintTbl table|nil Paint or baseColor.
---@return cdata  Temporary float[4] array of the editor (editor.getTempFloatArray4_TableTable).
function editor_util_vehicleSelectUtil:getPaintPtr(paintTbl) end

--- Constructor: creates a unique id, resets selections and options, then applies `data` if given.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/vehicleSelectUtil.lua:19
---@param name string|nil Displayed name of the instance ('Vehicle' by default).
---@param data table|nil Initial selection: model, config, customConfigPath, customConfigActive, configPath, paintName(2,3).
function editor_util_vehicleSelectUtil:init(name, data) end

--- Empty edit mode callback.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/vehicleSelectUtil.lua:479
function editor_util_vehicleSelectUtil:onActivate() end

--- Empty edit mode callback.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/vehicleSelectUtil.lua:482
function editor_util_vehicleSelectUtil:onDeactivate() end

--- Clears the configs, the chosen config and the custom config.
---Source: lua/ge/extensions/editor/util/vehicleSelectUtil.lua:89
function editor_util_vehicleSelectUtil:resetConfig() end

--- Clears the model list and the chosen model.
---Source: lua/ge/extensions/editor/util/vehicleSelectUtil.lua:83
function editor_util_vehicleSelectUtil:resetModel() end

--- Resets the options to default (allowed types, empty blacklists, enableConfigs true, enablePaints false, 3 paint layers).
---Source: lua/ge/extensions/editor/util/vehicleSelectUtil.lua:115
function editor_util_vehicleSelectUtil:resetOptions() end

--- Clears the available and chosen paints.
---Source: lua/ge/extensions/editor/util/vehicleSelectUtil.lua:99
function editor_util_vehicleSelectUtil:resetPaint() end

--- Clears type, model, config and paints.
---Source: lua/ge/extensions/editor/util/vehicleSelectUtil.lua:107
function editor_util_vehicleSelectUtil:resetSelections() end

--- Directly sets the config by its key (the model must already be set); computes configName and configPath. Sets config back to nil if the config does not exist.
---Source: lua/ge/extensions/editor/util/vehicleSelectUtil.lua:55
---@param config string Config key (name of the .pc without extension).
function editor_util_vehicleSelectUtil:setConfig(config) end

--- Stub (TODO): should filter the configs of a model by field/value; does nothing.
---Source: lua/ge/extensions/editor/util/vehicleSelectUtil.lua:131
---@param model string Model key.
---@param key string Field name.
---@param value any Value searched.
---@param disallow boolean true to blacklist instead of whitelist.
function editor_util_vehicleSelectUtil:setConfigListByField(model, key, value, disallow) end

--- Directly sets the model by its key; fills vehType and modelName from core_vehicles.getModel, or sets model back to nil if unknown.
---Source: lua/ge/extensions/editor/util/vehicleSelectUtil.lua:42
---@param model string Model key (folder name vehicles/<model>).
function editor_util_vehicleSelectUtil:setModel(model) end

--- Stub (TODO): should filter models by field/value; does nothing.
---Source: lua/ge/extensions/editor/util/vehicleSelectUtil.lua:127
---@param key string Field name.
---@param value any Value searched.
---@param disallow boolean true to blacklist instead of whitelist.
function editor_util_vehicleSelectUtil:setModelListByField(key, value, disallow) end

--- Copies the options enableConfigs, enablePaints, enableCustomConfig, paintLayers and columnWidth present (truthy) in data to the instance.
---Source: lua/ge/extensions/editor/util/vehicleSelectUtil.lua:73
---@param data table Options to apply.
function editor_util_vehicleSelectUtil:setOptions(data) end

--- Draws the interface (combos Type, Model, Config, Paint 1-3, custom config field) and applies the cascading resets.
---Source: lua/ge/extensions/editor/util/vehicleSelectUtil.lua:206
---@return string|nil  Reason for the change: 'type', 'model', 'config', 'paintName', 'paintName2', 'paintName3', 'customConfig', or nil.
function editor_util_vehicleSelectUtil:widget() end

