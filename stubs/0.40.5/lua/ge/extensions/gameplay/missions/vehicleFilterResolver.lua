---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/vehicleFilterResolver.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Transforms a mission vehicle filter configuration (filterData: whitelist/blacklist, probability settings, manual additions and removals, maxVehicles) into a flat list of model/configuration pairs. Relies on util/configListGenerator to get the eligible vehicles.
--- Access: extension `gameplay_missions_vehicleFilterResolver`: `extensions.load("gameplay_missions_vehicleFilterResolver")`, then the global `gameplay_missions_vehicleFilterResolver`
---@class gameplay_missions_vehicleFilterResolver
gameplay_missions_vehicleFilterResolver = {}

--- Indicates whether filterData contains a real constraint: non-empty whitelist or blacklist, probabilitySettings, manualAdditions, manualRemovals or maxVehicles > 0.
---Source: lua/ge/extensions/gameplay/missions/vehicleFilterResolver.lua:172
---@param filterData table|any Filter data; any non-table gives false.
---@return boolean  true if the filter constrains the vehicle set.
function gameplay_missions_vehicleFilterResolver.hasAnyConfiguration(filterData) end

--- Resolves filterData into a list {model, config, name}. Applies the base filter, the probabilitySettings (which replace the result if they find vehicles), the maxVehicles limit, the manual removals ('model/config' keys), then adds the manual additions not already present, without duplicates. allowAuxiliaryVehicles and allowLoadedTrailers control eligibility.
---Source: lua/ge/extensions/gameplay/missions/vehicleFilterResolver.lua:189
---@param filterData table|any Fields read: allowAuxiliaryVehicles, allowLoadedTrailers, baseFilter, probabilitySettings, maxVehicles, manualRemovals, manualAdditions.
---@return table[]  List of {model = string, config = string, name = string} (empty if filterData is not a table).
function gameplay_missions_vehicleFilterResolver.resolveFilteredConfigs(filterData) end

