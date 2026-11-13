---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/wheelTypes/pressureWheels.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire du type de roue 'pressureWheels' : le modèle de roue le plus récent et le plus complet, avec pression d'air simulée par des TRIANGLES pressurisés (groupe de pression par roue) au lieu de poutres pressurisées. Il crée l'anneau de bande de roulement (si un pneu existe), l'anneau de moyeu, un éventuel nœud stabilisateur, des enjoliveurs, de nombreuses familles de poutres (jante, côtés, périphérie, renforts, bande, en L, soutien) et les triangles du pneu et du moyeu. Appelé par jbeam/sections/wheels.lua pendant le chargement.
--- Accès : `require("jbeam/sections/wheelTypes/pressureWheels")`
---@class jbeam_sections_wheelTypes_pressureWheels
local jbeam_sections_wheelTypes_pressureWheels = {}

--- Crée nœuds, poutres et triangles d'une roue de type pressureWheels (alias de addPressureWheel). Avertissement 'invalid pressureWheel' et sortie si node1 ou node2 manque.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/sections/wheelTypes/pressureWheels.lua:166
---@param vehicle table véhicule en construction (nodes, triangles, maxIDs…)
---@param wheelKey integer indice de la roue dans sa section
---@param wheel table définition jbeam de la roue (nombreux champs, voir notes) ; modifiée avec nodes, treadNodes, rimBeams, sideBeams, peripheryBeams, reinfBeams, treadBeams, pressureGroup
function jbeam_sections_wheelTypes_pressureWheels.process(vehicle, wheelKey, wheel) end

return jbeam_sections_wheelTypes_pressureWheels
