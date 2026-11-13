---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/wheelTypes/hubWheels.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire du type de roue 'hubWheels' : roue à moyeu séparé du pneu, avec pression d'air simulée par des poutres pressurisées entre le moyeu et le pneu. Il crée un anneau de nœuds de pneu, un anneau de nœuds de moyeu, éventuellement un enjoliveur (hubcap), puis les poutres de bande de roulement, de périphérie, de moyeu, d'axe, de pression, de renfort et de soutien. Appelé par jbeam/sections/wheels.lua pendant le chargement.
--- Accès : `require("jbeam/sections/wheelTypes/hubWheels")`
---@class jbeam_sections_wheelTypes_hubWheels
local jbeam_sections_wheelTypes_hubWheels = {}

--- Crée tous les nœuds et poutres d'une roue hubWheels (alias de addHubWheel). Sort avec un avertissement 'invalid hubWheel' si node1 ou node2 n'existe pas.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/sections/wheelTypes/hubWheels.lua:20
---@param vehicle table véhicule en construction
---@param wheelKey integer indice de la roue dans sa section
---@param wheel table définition jbeam de la roue (modifiée : collision, treadCoef, radius, hubRadius, numRays, nodes, pressuredBeams)
function jbeam_sections_wheelTypes_hubWheels.process(vehicle, wheelKey, wheel) end

return jbeam_sections_wheelTypes_hubWheels
