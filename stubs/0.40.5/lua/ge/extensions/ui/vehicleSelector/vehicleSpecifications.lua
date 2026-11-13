---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/vehicleSpecifications.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_vehicleSelector_vehicleSpecifications` : `extensions.load("ui_vehicleSelector_vehicleSpecifications")`, puis la globale `ui_vehicleSelector_vehicleSpecifications`
---@class ui_vehicleSelector_vehicleSpecifications
---@field CONVERSIONS table
---@field dependencies table
---@field specificationSetup table
---@field valueToUnit table
ui_vehicleSelector_vehicleSpecifications = {}

---Source : lua/ge/extensions/ui/vehicleSelector/vehicleSpecifications.lua:307
---@param modelDetails any
---@param configDetails any
function ui_vehicleSelector_vehicleSpecifications.addIconTags(modelDetails, configDetails) end

---Source : lua/ge/extensions/ui/vehicleSelector/vehicleSpecifications.lua:359
---@param itemDetails any
function ui_vehicleSelector_vehicleSpecifications.getDetails(itemDetails) end

---Source : lua/ge/extensions/ui/vehicleSelector/vehicleSpecifications.lua:285
---@param modelDetails any
---@param configDetails any
---@param key any
---@param list any
function ui_vehicleSelector_vehicleSpecifications.makeSpec(modelDetails, configDetails, key, list) end

--- Public API
---Source : lua/ge/extensions/ui/vehicleSelector/vehicleSpecifications.lua:4
---@param key any
function ui_vehicleSelector_vehicleSpecifications.propTitle(key) end

---Source : lua/ge/extensions/ui/vehicleSelector/vehicleSpecifications.lua:5
---@param propName any
---@param key any
function ui_vehicleSelector_vehicleSpecifications.propValue(propName, key) end

