---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/paints.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Applique les peintures du véhicule : vehicleConfig.paints (ou, à défaut, vehicleConfig.colors converti par convertVehicleColorsToPaints) donne jusqu'à trois peintures. Pour chacune, validateVehiclePaint la vérifie puis baseColor devient la couleur de l'objet (paints[1] -> color, paints[2] -> colorPalette0, paints[3] -> colorPalette1). Toute la liste est ensuite envoyée au moteur via setMetallicPaintData pour les paramètres métalliques/clearcoat.
--- Accès : `require("jbeam/sections/paints")`
---@class jbeam_sections_paints
local jbeam_sections_paints = {}

--- Applique les peintures du config à l'objet véhicule et transmet les données de peinture métallique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/sections/paints.lua:10
---@param vehicleObj userdata Objet véhicule moteur.
---@param vehicleConfig table Configuration (paints ou colors).
---@param vehicle table Données jbeam (non utilisé).
function jbeam_sections_paints.process(vehicleObj, vehicleConfig, vehicle) end

return jbeam_sections_paints
