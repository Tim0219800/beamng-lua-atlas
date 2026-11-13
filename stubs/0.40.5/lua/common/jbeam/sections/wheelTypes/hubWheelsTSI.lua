---@meta
-- tim19Atlas stub generated from lua/common/jbeam/sections/wheelTypes/hubWheelsTSI.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire du type de roue 'hubWheelsTSI' : variante de hubWheels sans enjoliveur. Anneau de nœuds de pneu + anneau de nœuds de moyeu, poutres de bande de roulement, de périphérie, de moyeu et d'axe, et six poutres pressurisées par rayon entre moyeu et pneu (la pression d'air est simulée). Appelé par jbeam/sections/wheels.lua pendant le chargement du véhicule.
--- Accès : `require("jbeam/sections/wheelTypes/hubWheelsTSI")`
---@class jbeam_sections_wheelTypes_hubWheelsTSI
local jbeam_sections_wheelTypes_hubWheelsTSI = {}

--- Crée nœuds et poutres d'une roue hubWheelsTSI (alias de addHubWheelTSI). Avertissement 'invalid hubWheel' et sortie sans rien créer si node1 ou node2 est introuvable.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/sections/wheelTypes/hubWheelsTSI.lua:20
---@param vehicle table véhicule en construction
---@param wheelKey integer indice de la roue dans sa section
---@param wheel table définition jbeam de la roue (modifiée : collision, radius, hubRadius, numRays, tireWidth, hubWidth, nodes, pressuredBeams)
function jbeam_sections_wheelTypes_hubWheelsTSI.process(vehicle, wheelKey, wheel) end

return jbeam_sections_wheelTypes_hubWheelsTSI
