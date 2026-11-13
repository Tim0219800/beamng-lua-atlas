---@meta
-- tim19Atlas stub generated from lua/vehicle/material.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère le changement dynamique de matériaux du véhicule (feux, phares, cadrans lumineux, carrosserie cassée). Le jbeam compile à l'init une table v.data._materials (mv, triggerList, triggers, deformMeshes). À chaque frame, material.updateGFX relit les valeurs electrics.values listées dans triggerList ; si l'une a changé il réévalue la fonction (evalFunctionString) de chaque déclencheur et bascule le matériau du mesh (obj:switchMaterial) ou le réinitialise (obj:resetMaterials), avec éventuellement une échelle d'émissivité. Gère aussi les matériaux « cassés » liés aux groupes de déformation.
--- Accès : globale `material`
---@class material
material = {}

--- Réinitialise immédiatement et sans condition tous les matériaux modifiés (état à faux + obj:resetMaterials), efface les valeurs mémorisées et les matériaux cassés.
---Source : lua/vehicle/material.lua:123
function material.forceReset() end

--- Charge v.data._materials : compile la chaîne d'évaluation de chaque déclencheur dans l'environnement mv, convertit materialEmissiveScaling en scaleEmissiveMaterial*, réinitialise l'état des matériaux cassés. Appelée par main.lua (initSystems) au début.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/material.lua:141
function material.init() end

--- Au reset du véhicule : réinitialise (obj:resetMaterials) tous les matériaux modifiés, efface les matériaux cassés et les dernières valeurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/material.lua:133
function material.reset() end

--- Applique les matériaux de dégâts (dmgMat) des meshs liés à une poutre qui casse (beam.deformSwitches) : désactive les props du groupe de déformation, joue le son de déformation du mesh (une seule fois par mesh) et ajoute 500 de dégâts à beamstate. Appelée par beamstate.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/material.lua:33
---@param beam table Poutre cassée, avec deformSwitches {msc -> {deformGroup, dmgMat}} et id1.
function material.switchBrokenMaterial(beam) end

--- Appelée à chaque frame par main.lua (après props.updateGFX) : détecte les changements des valeurs electrics suivies et met à jour matériaux et émissivité.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/material.lua:51
function material.updateGFX() end

