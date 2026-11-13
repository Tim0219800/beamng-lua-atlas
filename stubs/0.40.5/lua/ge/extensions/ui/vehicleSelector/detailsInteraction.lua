---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_vehicleSelector_detailsInteraction` : `extensions.load("ui_vehicleSelector_detailsInteraction")`, puis la globale `ui_vehicleSelector_detailsInteraction`
---@class ui_vehicleSelector_detailsInteraction
---@field customDetailsButtons table
---@field dependencies table
---@field exitCallback any
---@field managementButtonsEnabled boolean
ui_vehicleSelector_detailsInteraction = {}

--- Expose sub-module functions through main interface
---Source : lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:79
---@param ... any
function ui_vehicleSelector_detailsInteraction.executeButton(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:80
---@param ... any
function ui_vehicleSelector_detailsInteraction.executeDoubleClick(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:65
---@param path any
function ui_vehicleSelector_detailsInteraction.exploreFolder(path) end

--- Coordinate between modules
---Source : lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:13
---@param itemDetails any
function ui_vehicleSelector_detailsInteraction.getDetails(itemDetails) end

---Source : lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:55
function ui_vehicleSelector_detailsInteraction.getManagementDetails() end

---Source : lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:70
---@param modId any
function ui_vehicleSelector_detailsInteraction.goToMod(modId) end

---Source : lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:83
---@param buttons any
function ui_vehicleSelector_detailsInteraction.setCustomDetailsButtons(buttons) end

---Source : lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:82
---@param ... any
function ui_vehicleSelector_detailsInteraction.setDetailsButtonForFreeroam(...) end

---Source : lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:59
---@param callback any
function ui_vehicleSelector_detailsInteraction.setExitCallback(callback) end

---Source : lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua:81
---@param ... any
function ui_vehicleSelector_detailsInteraction.setManagementButtonsEnabled(...) end

