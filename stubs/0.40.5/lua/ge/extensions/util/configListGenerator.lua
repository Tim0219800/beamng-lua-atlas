---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/configListGenerator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_configListGenerator` : `extensions.load("util_configListGenerator")`, puis la globale `util_configListGenerator`
---@class util_configListGenerator
util_configListGenerator = {}

---Source : lua/ge/extensions/util/configListGenerator.lua:70
---@param vehicleInfo any
---@param filter any
function util_configListGenerator.doesVehiclePassFilter(vehicleInfo, filter) end

---Source : lua/ge/extensions/util/configListGenerator.lua:175
---@param allowAuxiliaryVehicles any
---@param allowLoadedTrailers any
function util_configListGenerator.getEligibleVehicles(allowAuxiliaryVehicles, allowLoadedTrailers) end

---Source : lua/ge/extensions/util/configListGenerator.lua:195
---@param filterSet any
---@param numberOfVehicles any
---@param eligibleVehicles any
---@param popAttribute any
function util_configListGenerator.getRandomVehicleInfos(filterSet, numberOfVehicles, eligibleVehicles, popAttribute) end

