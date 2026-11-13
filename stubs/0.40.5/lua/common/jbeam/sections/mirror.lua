---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/mirror.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Traite la section jbeam « mirrors » (rétroviseurs). Pour chaque entrée ayant un champ mesh, enregistre le rétroviseur dans le moteur (addMirror avec mesh, idRef, id1, id2) et récupère l'id obtenu dans v.id, puis configure l'objet miroir : offset (refBaseTranslation ou offset), normal (déduite de baseRotationGlobal en degrés ou de normal) et offsetNormal (champs dépréciés). Les entrées sans mesh sont considérées comme de vieilles données.
--- Accès : `require("jbeam/sections/mirror")`
---@class jbeam_sections_mirror
local jbeam_sections_mirror = {}

--- Crée et configure les rétroviseurs déclarés dans vehicle.mirrors.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/sections/mirror.lua:11
---@param objID integer Identifiant du véhicule (non utilisé).
---@param vehicleObj userdata Objet véhicule moteur (addMirror, getMirror).
---@param vehicle table Données jbeam (section mirrors).
function jbeam_sections_mirror.process(objID, vehicleObj, vehicle) end

return jbeam_sections_mirror
