---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/wheelTypes/hubWheelsTSV.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire du type de roue 'hubWheelsTSV' : roue à moyeu séparé SANS pression d'air simulée : le pneu est relié au moyeu par des poutres anisotropes de côté et de renfort (au lieu de poutres pressurisées). Appelé par jbeam/sections/wheels.lua pendant le chargement du véhicule.
--- Accès : `require("jbeam/sections/wheelTypes/hubWheelsTSV")`
---@class jbeam_sections_wheelTypes_hubWheelsTSV
local jbeam_sections_wheelTypes_hubWheelsTSV = {}

--- Crée nœuds et poutres d'une roue hubWheelsTSV (alias de addHubWheelTSV). Avertissement 'invalid hubWheel' et sortie si node1 ou node2 manque.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/sections/wheelTypes/hubWheelsTSV.lua:19
---@param vehicle table véhicule en construction
---@param wheelKey integer indice de la roue dans sa section
---@param wheel table définition jbeam de la roue (modifiée : collision, radius, hubRadius, numRays, nodes, reinforcementBeams, sideBeams, treadBeams)
function jbeam_sections_wheelTypes_hubWheelsTSV.process(vehicle, wheelKey, wheel) end

return jbeam_sections_wheelTypes_hubWheelsTSV
