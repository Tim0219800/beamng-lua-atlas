---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C
local flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C = {}

--- Vide la sélection et met playerId à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:214
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:_executionStarted() end

--- Construit {model, config, paint aléatoire, dial} à partir d'une config (dial = time_1_4 des données de performance, sinon 12).
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:69
---@param config table Config de véhicule
---@return table  Entrée véhicule
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:createVehicleEntry(config) end

--- Éditeur : aucune propriété.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:31
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:drawCustomProperties() end

--- Dessin du nœud dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:36
---@param builder any
---@param style any
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:drawMiddle(builder, style) end

--- Liste les configurations de core_vehicles.getConfigList valides comme adversaires.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:50
---@return table  Liste de configs
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:filterValidVehicleConfigs() end

--- Choisit des configs aléatoires avec dial - 0.5.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:138
---@param vehConfigs table Configs candidates
---@param count integer Nombre d'adversaires
---@return table  Liste d'entrées
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:generateBracketRaceOpponents(vehConfigs, count) end

--- Choisit des configs dont le temps 1/4 est proche du dial donné.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:157
---@param vehConfigs table Configs candidates
---@param dial number Dial du joueur
---@param count integer Nombre d'adversaires
---@param currentVeh table|nil Véhicule courant
---@return table  Liste d'entrées
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:generateSimilarOpponents(vehConfigs, dial, count, currentVeh) end

--- Détermine le dial du joueur : pin playerDial si >= 0, sinon dial enregistré (dragBridge.getDialTimes), sinon données de performance, sinon 12.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:113
---@param currentVeh table|nil Détails du véhicule courant
---@return number  Dial (temps 1/4 de mile, s)
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:getPlayerDial(currentVeh) end

--- Renvoie count copies du véhicule du joueur comme adversaires de secours.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:85
---@param count integer Nombre d'entrées
---@return table  Liste d'entrées
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:getPlayerVehicleAsFallback(count) end

--- Initialise selectedOpponents et playerId.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:26
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:init() end

--- Choisit la stratégie (bracketRace ou similaire) et renvoie la liste d'adversaires.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:189
---@return table  Liste d'entrées
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:selectVehicle() end

--- Initialise le hasard et écrit vehicleGroup.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:219
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:workOnce() end

