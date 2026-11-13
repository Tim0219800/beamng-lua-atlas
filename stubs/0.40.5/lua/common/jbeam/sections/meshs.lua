---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/meshs.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Traite les sections jbeam qui concernent les meshes 3D du véhicule : triangles (triangles de collision physique), props (meshes rigides attachés à trois nœuds de référence, y compris les lumières SPOTLIGHT/POINTLIGHT) et flexbodies (meshes déformables liés à des groupes de nœuds). Applique d'abord les rotations/déplacements du composant aux positions/rotations des flexbodies, demande au moteur le chargement groupé des meshes, crée les triangles physiques, les props et les flexmeshes avec leurs transformations, puis valide (meshCommit).
--- Accès : `require("jbeam/sections/meshs")`
---@class jbeam_sections_meshs
local jbeam_sections_meshs = {}

--- Charge et configure triangles, props et flexbodies du véhicule dans le moteur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/sections/meshs.lua:322
---@param objID integer Identifiant du véhicule (non utilisé).
---@param vehicleObj userdata|nil Objet véhicule moteur.
---@param vehicle table Données jbeam du véhicule (modifiées en place : pid, fid, mesh, rotation...).
function jbeam_sections_meshs.process(objID, vehicleObj, vehicle) end

return jbeam_sections_meshs
