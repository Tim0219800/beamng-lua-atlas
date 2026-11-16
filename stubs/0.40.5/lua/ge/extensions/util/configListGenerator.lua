---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/configListGenerator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generates random lists of vehicles (configs) from filters, used by gameplay systems that need vehicles for sale or traffic (career dealers, for example). It starts from the core_vehicles config list, excludes props, utility vehicles and configs without a value, then draws configs at random weighted by a popularity attribute.
--- Access: extension `util_configListGenerator`: `extensions.load("util_configListGenerator")`, then the global `util_configListGenerator`
---@class util_configListGenerator
util_configListGenerator = {}

--- Returns whether a vehicle (config) satisfies a {whiteList, blackList} filter.
---Source: lua/ge/extensions/util/configListGenerator.lua:70
---@param vehicleInfo table Vehicle config (with aggregates).
---@param filter table Filter {whiteList = table|nil, blackList = table|nil}.
---@return boolean  true if the vehicle passes.
function util_configListGenerator.doesVehiclePassFilter(vehicleInfo, filter) end

--- Returns the sorted list (model then config) of eligible configs: having a Type and a Value, excluding Prop, Utility, PropParked and PropTraffic; the translated brand is written to Brand.
---Source: lua/ge/extensions/util/configListGenerator.lua:175
---@param allowAuxiliaryVehicles boolean|nil true to include auxiliary configs.
---@param allowLoadedTrailers boolean|nil true to include loaded trailers (hasLoad).
---@return table[]  Copies of the config infos.
function util_configListGenerator.getEligibleVehicles(allowAuxiliaryVehicles, allowLoadedTrailers) end

--- Draws up to numberOfVehicles different configs according to a seller's filters (filterSet.filter, with any subFilters): choice of a filter, a model then a weighted config. Each result gets a filter field (the filter used).
---Source: lua/ge/extensions/util/configListGenerator.lua:195
---@param filterSet table Seller {filter = {...}, subFilters = {...}|nil}.
---@param numberOfVehicles integer|nil Number of vehicles wanted, 10 by default.
---@param eligibleVehicles table[]|nil List from getEligibleVehicles; computed if nil.
---@param popAttribute string|nil Popularity attribute, 'Population' by default.
---@return table[]  Infos of the drawn vehicles (may be shorter than requested).
function util_configListGenerator.getRandomVehicleInfos(filterSet, numberOfVehicles, eligibleVehicles, popAttribute) end

