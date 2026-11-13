---@meta
-- tim19Atlas stub generated from lua/common/jbeam/materials.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Étape de chargement côté GE qui prépare les changements de matériaux dynamiques d'un véhicule : (1) la section jbeam glowMap (matériaux qui s'allument, avec simpleFunction ou advancedFunction pilotées par des valeurs d'électriques), (2) les groupes de déformation des flexbodies (deformGroup, deformMaterialBase, deformMaterialDamaged) reliés aux poutres de même deformGroup. Elle crée les « material switches » via le moteur, précompile les matériaux en les faisant passer par leurs états, et stocke le résultat dans vehicle._materials pour la VM véhicule.
--- Accès : `require("jbeam/materials")`
---@class jbeam_materials
local jbeam_materials = {}

--- Prépare tous les switches de matériaux (glowMap et groupes de déformation) pour le véhicule et remplit vehicle._materials. Fait passer chaque switch par ses états on/on_intense/off pour précompiler les shaders.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/materials.lua:32
---@param vehicleObj userdata Objet véhicule moteur (getMeshsMaterialsTbl, getSwitchableMaterial, switchMaterial, resetMaterials, getMeshesContainingMaterial).
---@param vehicle table Données jbeam du véhicule (flexbodies, beams, glowMap ; _materials est écrit).
function jbeam_materials.process(vehicleObj, vehicle) end

return jbeam_materials
