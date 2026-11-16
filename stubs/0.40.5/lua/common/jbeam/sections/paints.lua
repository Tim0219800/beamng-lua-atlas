---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/paints.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Applies the vehicle paints: vehicleConfig.paints (or, failing that, vehicleConfig.colors converted by convertVehicleColorsToPaints) provides up to three paints. For each one, validateVehiclePaint checks it, then baseColor becomes the object's color (paints[1] -> color, paints[2] -> colorPalette0, paints[3] -> colorPalette1). The whole list is then sent to the engine via setMetallicPaintData for the metallic/clearcoat parameters.
--- Access: `require("jbeam/sections/paints")`
---@class jbeam_sections_paints
local jbeam_sections_paints = {}

--- Applies the config's paints to the vehicle object and passes on the metallic paint data.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/sections/paints.lua:10
---@param vehicleObj userdata Engine vehicle object.
---@param vehicleConfig table Configuration (paints or colors).
---@param vehicle table Jbeam data (unused).
function jbeam_sections_paints.process(vehicleObj, vehicleConfig, vehicle) end

return jbeam_sections_paints
