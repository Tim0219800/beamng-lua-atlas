---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/licenseplatesSkins.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Traite deux familles de pièces actives : plaques d'immatriculation et skins. Une pièce dont un slotType contient '_licenseplate' (ou ayant licenseplateFormat) active la plaque ; les formats utilisés sont collectés (défaut '30-15'). Une pièce de design de plaque (slotType contenant 'licenseplate_design') fournit licenseplate_path. Une pièce de skin (slotType contenant 'skin_' ou égal à 'paint_design') appelle vehicleObj:setSkin("<slot>.<nom du skin>") et peut imposer des couleurs par défaut. À la fin, si une plaque est utilisée, core_vehicles.setPlateText est appelé.
--- Accès : `require("jbeam/sections/licenseplatesSkins")`
---@class jbeam_sections_licenseplatesSkins
local jbeam_sections_licenseplatesSkins = {}

--- Parcourt les pièces actives pour configurer plaque d'immatriculation et skins du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/sections/licenseplatesSkins.lua:11
---@param objID integer Identifiant du véhicule.
---@param vehicleObj userdata Objet véhicule moteur.
---@param config table|nil Configuration du véhicule (licenseName).
---@param activePartsData table<string, table>|nil Pièces actives (nom -> données de pièce).
function jbeam_sections_licenseplatesSkins.process(objID, vehicleObj, config, activePartsData) end

return jbeam_sections_licenseplatesSkins
