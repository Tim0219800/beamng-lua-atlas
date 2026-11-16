---@meta
-- tim19Atlas stub generated from lua/ge/extensions/vehicles/saveConfigUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilities for the vehicle configuration metadata editor (info_<config>.json) when saving. Defines the list of editable fields (Description, Value, Years, vehicleSelectorSubCluster, vehicleSelectorSubGroup, Country, Region, Type, Body Style, Config Type, Commercial Class, Derby Class, InsuranceClass, Population) with their type, limits and labels. `getFields` prepares these fields for the UI (values, options, fallback value) and `validateMetadata` normalizes and validates the metadata before writing.
--- Access: extension `vehicles_saveConfigUtils`: `extensions.load("vehicles_saveConfigUtils")`, then the global `vehicles_saveConfigUtils`
---@class vehicles_saveConfigUtils
vehicles_saveConfigUtils = {}

--- Empties the option caches (country and catalog); call when the vehicle list has changed.
---Source: lua/ge/extensions/vehicles/saveConfigUtils.lua:581
function vehicles_saveConfigUtils.clearCache() end

--- Builds the list of metadata fields for the editor. For each definition, computes the target config's value (falling back to the source config if useSourceFallback), the model's fallback value, the `included` state, and the options (with a "custom" entry for lists that allow a free value). Returns copies of the definitions, without the internal keys.
---Source: lua/ge/extensions/vehicles/saveConfigUtils.lua:452
---@param modelKey string vehicle model key
---@param vehicleDirectory string|nil vehicle folder (ending with /) where to read info_<config>.json; otherwise core_vehicles.getConfig is used
---@param sourceConfigName string|nil name of the source config (fallback values)
---@param targetConfigName string|nil name of the target config whose current values are read
---@return table[]  ordered list of fields: key, type, label, value, fallbackValue, included, optional, options, etc.
function vehicles_saveConfigUtils.getFields(modelKey, vehicleDirectory, sourceConfigName, targetConfigName) end

--- Validates and normalizes a metadata table. The lowercase alias `description` is accepted for `Description`. Rejects unknown keys and invalid values; trims texts, sorts multi-selections.
---Source: lua/ge/extensions/vehicles/saveConfigUtils.lua:506
---@param metadata table|nil metadata to validate; nil gives an empty table
---@param modelKey string|nil model key, used to resolve the options of model-dependent lists
---@return table|nil  normalized metadata, or nil on error
---@return table|nil  on error: {field = key or nil, code = string}
function vehicles_saveConfigUtils.validateMetadata(metadata, modelKey) end

