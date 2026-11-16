---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleSelector/vehicleMetadataEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sketch of a vehicle metadata editor for the selector. The module is almost empty: its only function returns fixed values. Its reference in the dependencies of ui_vehicleSelector_general is commented out.
--- Access: extension `ui_vehicleSelector_vehicleMetadataEditor`: `extensions.load("ui_vehicleSelector_vehicleMetadataEditor")`, then the global `ui_vehicleSelector_vehicleMetadataEditor`
---@class ui_vehicleSelector_vehicleMetadataEditor
ui_vehicleSelector_vehicleMetadataEditor = {}

--- Returns dummy vehicle metadata (name, description, type), whatever the argument.
---Source: lua/ge/extensions/ui/vehicleSelector/vehicleMetadataEditor.lua:4
---@param data any Ignored.
---@return table  {name, description, type} with fixed default values.
function ui_vehicleSelector_vehicleMetadataEditor.getVehicleMetadataDetails(data) end

