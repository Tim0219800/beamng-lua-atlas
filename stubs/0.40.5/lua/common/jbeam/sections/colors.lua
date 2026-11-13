---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/colors.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Applique la couleur de carrosserie héritée de la configuration du véhicule (vehicleConfig.colors, ancien format) à l'objet véhicule : colors[1] -> vehicleObj.color, colors[2] -> colorPalette0, colors[3] -> colorPalette1. Chaque entrée est un tableau {r, v, b, a} converti en couleur linéaire. Remplacé par jbeam/sections/paints pour le format actuel (paints).
--- Accès : `require("jbeam/sections/colors")`
---@class jbeam_sections_colors
local jbeam_sections_colors = {}

--- Définit color, colorPalette0 et colorPalette1 de l'objet véhicule à partir de vehicleConfig.colors s'il existe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/sections/colors.lua:10
---@param vehicleObj userdata Objet véhicule moteur.
---@param vehicleConfig table Configuration du véhicule (champ colors).
---@param vehicle table Données jbeam (non utilisé).
function jbeam_sections_colors.process(vehicleObj, vehicleConfig, vehicle) end

return jbeam_sections_colors
