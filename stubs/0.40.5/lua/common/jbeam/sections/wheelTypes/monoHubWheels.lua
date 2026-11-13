---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/wheelTypes/monoHubWheels.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire du type de roue 'monoHubWheels' : roue à moyeu simple. Anneau de pneu (2 x numRays nœuds) relié aux deux nœuds d'axe par des côtés et des poutres de soutien, plus UN seul anneau de numRays nœuds de moyeu placé au milieu de l'axe et relié à node1, node2 et au pneu par des poutres anisotropes de renfort. Appelé par jbeam/sections/wheels.lua pendant le chargement du véhicule.
--- Accès : `require("jbeam/sections/wheelTypes/monoHubWheels")`
---@class jbeam_sections_wheelTypes_monoHubWheels
local jbeam_sections_wheelTypes_monoHubWheels = {}

--- Crée nœuds et poutres d'une roue monoHubWheels (alias de addMonoHubWheel). Avertissement 'invalid monohub wheel' et sortie si node1 ou node2 manque.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/sections/wheelTypes/monoHubWheels.lua:19
---@param vehicle table véhicule en construction
---@param wheelKey integer indice de la roue dans sa section
---@param wheel table définition jbeam de la roue (modifiée : collision, radius, hubRadius, numRays, nodes)
function jbeam_sections_wheelTypes_monoHubWheels.process(vehicle, wheelKey, wheel) end

return jbeam_sections_wheelTypes_monoHubWheels
