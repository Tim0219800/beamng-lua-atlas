---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/vropes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Traite la section jbeam « vropes » (cordes visuelles simulées, sans poutres physiques). Pour chaque entrée ayant anchorAProp et anchorBProp (noms de props du véhicule), crée une corde visuelle côté moteur (createRopeVisual/getRopeVisual), l'attache aux deux props (vehiclePropIdA/B) et applique ses propriétés avec des valeurs par défaut, puis appelle rope:rebuild(). La liste des identifiants créés est mise dans vehicleObj.ropeIds pour le rendu automatique.
--- Accès : `require("jbeam/sections/vropes")`
---@class jbeam_sections_vropes
local jbeam_sections_vropes = {}

--- Crée les cordes visuelles décrites par vehicle.vropes et enregistre leurs identifiants dans vehicleObj.ropeIds.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/sections/vropes.lua:117
---@param objID integer Identifiant du véhicule (non utilisé).
---@param vehicleObj userdata Objet véhicule moteur.
---@param vehicle table Données jbeam (vropes, props).
function jbeam_sections_vropes.process(objID, vehicleObj, vehicle) end

return jbeam_sections_vropes
