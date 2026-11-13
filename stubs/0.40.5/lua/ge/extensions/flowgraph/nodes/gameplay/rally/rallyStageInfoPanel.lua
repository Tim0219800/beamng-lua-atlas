---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C
local flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C = {}

--- Liste des spéciales de la boucle (nom, distance, surfaces) d'après les champs stage1..4_rallyStage de la mission.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:96
---@return table|nil  Liste d'entrées ou nil.
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:buildLoopStages() end

--- Distances de spéciales, de liaison et totale de la boucle rally (formatées en km).
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:78
---@return table|nil  {specialStageDistance, liaisonDistance, totalDistance} ou nil si planning invalide.
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:buildLoopStats() end

--- Construit la liste des règles (clés de traduction ou {txt, context}) selon isLoop et la réparation.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:132
---@param repairEnabled boolean Si la recovery répare le véhicule.
---@return table  Liste de règles.
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:buildRules(repairEnabled) end

--- Stats formatées de la spéciale courante.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:74
---@return table|nil  Voir formatStats.
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:buildStats() end

--- Formate les stats : distance (« %.2f km ») et surfaces arrondies > 0 % triées par valeur décroissante.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:49
---@param stats table|nil Stats brutes.
---@return table|nil  {distance, surfaces} ou nil.
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:formatStats(stats) end

--- Limite de vitesse du parc d'assistance affichable (30 km/h par défaut).
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:123
---@return string  Texte du type « 30 km/h ».
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:getServiceParkSpeedLimit() end

--- Lit les stats du driveline du rally manager, ou du fichier spline de la mission.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:27
---@return table|nil  Stats (raceDistanceKms, surfacePercentages…) ou nil.
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:readStats() end

--- Lit les stats du fichier driveline d'un dossier de mission.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:41
---@param folder string|nil Dossier de mission.
---@return table|nil  Stats ou nil.
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:readStatsForFolder(folder) end

--- Chaque frame : recopie flow et ajoute l'élément UI rallyStageInfo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:168
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:work() end

