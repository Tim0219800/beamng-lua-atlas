---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/race/raceAiParameters.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_race_raceAiParameters_C
local flowgraph_nodes_gameplay_race_raceAiParameters_C = {}

--- Renvoie un nombre aléatoire uniforme dans [-scale, scale].
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceAiParameters.lua:27
---@param scale number|nil Amplitude (1 par défaut).
---@return number  Valeur aléatoire.
function flowgraph_nodes_gameplay_race_raceAiParameters_C:getRandomNumber(scale) end

--- Applique les paramètres IA à chaque véhicule IA de la course (une seule fois, au premier flux).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceAiParameters.lua:32
function flowgraph_nodes_gameplay_race_raceAiParameters_C:workOnce() end

