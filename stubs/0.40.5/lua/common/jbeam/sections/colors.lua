---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/colors.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Applies the legacy body color from the vehicle configuration (vehicleConfig.colors, old format) to the vehicle object: colors[1] -> vehicleObj.color, colors[2] -> colorPalette0, colors[3] -> colorPalette1. Each entry is an array {r, g, b, a} converted to a linear color. Replaced by jbeam/sections/paints for the current format (paints).
--- Access: `require("jbeam/sections/colors")`
---@class jbeam_sections_colors
local jbeam_sections_colors = {}

--- Sets color, colorPalette0 and colorPalette1 of the vehicle object from vehicleConfig.colors if it exists.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/sections/colors.lua:10
---@param vehicleObj userdata Engine vehicle object.
---@param vehicleConfig table Vehicle configuration (colors field).
---@param vehicle table Jbeam data (unused).
function jbeam_sections_colors.process(vehicleObj, vehicleConfig, vehicle) end

return jbeam_sections_colors
