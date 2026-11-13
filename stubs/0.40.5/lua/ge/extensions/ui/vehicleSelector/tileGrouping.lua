---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/tileGrouping.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_vehicleSelector_tileGrouping` : `extensions.load("ui_vehicleSelector_tileGrouping")`, puis la globale `ui_vehicleSelector_tileGrouping`
---@class ui_vehicleSelector_tileGrouping
---@field groupModeFunctions table
---@field isRange table
ui_vehicleSelector_tileGrouping = {}

--- Get property value from config or model
---Source : lua/ge/extensions/ui/vehicleSelector/tileGrouping.lua:102
---@param config any
---@param prop any
function ui_vehicleSelector_tileGrouping.getConfigOrModelPropValue(config, prop) end

--- Get group mode function
---Source : lua/ge/extensions/ui/vehicleSelector/tileGrouping.lua:151
---@param groupMode any
function ui_vehicleSelector_tileGrouping.getGroupModeFunction(groupMode) end

--- Get groups for a specific config based on group mode
---Source : lua/ge/extensions/ui/vehicleSelector/tileGrouping.lua:115
---@param config any
---@param groupMode any
---@param displayData any
function ui_vehicleSelector_tileGrouping.getGroupsForConfig(config, groupMode, displayData) end

--- Get range grouping function
---Source : lua/ge/extensions/ui/vehicleSelector/tileGrouping.lua:156
---@param groupMode any
function ui_vehicleSelector_tileGrouping.getRangeGroupingFunction(groupMode) end

--- Check if a group mode uses range-based grouping
---Source : lua/ge/extensions/ui/vehicleSelector/tileGrouping.lua:146
---@param groupMode any
function ui_vehicleSelector_tileGrouping.isRangeGroupMode(groupMode) end

