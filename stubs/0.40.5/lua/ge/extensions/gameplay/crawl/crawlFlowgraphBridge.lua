---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pont entre le mode « crawl » (franchissement lent de parcours à points de passage) et les nœuds flowgraph / missions. Il charge un parcours (trail) depuis gameplay_crawl_saveSystem, le configure (zone, chemin, position de départ, prefabs), démarre et arrête le crawl sur un véhicule via gameplay_crawl_general / gameplay_crawl_utils, et expose l'état courant (temps, points, noeud atteint, disqualification) et la liste des parcours. Un seul crawl actif à la fois, mémorisé dans bridgeState.
--- Accès : extension `gameplay_crawl_crawlFlowgraphBridge` : `extensions.load("gameplay_crawl_crawlFlowgraphBridge")`, puis la globale `gameplay_crawl_crawlFlowgraphBridge`
---@class gameplay_crawl_crawlFlowgraphBridge
---@field dependencies table<integer, string> Extensions chargées avant : gameplay_crawl_saveSystem, general, utils, boundary, display.
gameplay_crawl_crawlFlowgraphBridge = {}

--- Applique une pénalité au crawler actif, avec le nombre de points défini dans gameplay_crawl_utils.infractionPoints. Sans effet si le crawl est inactif ou le type inconnu.
---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:243
---@param penaltyType string Un des types de getPenaltyTypes().
function gameplay_crawl_crawlFlowgraphBridge.applyPenalty(penaltyType) end

--- Arrête le crawl éventuel et vide l'état du pont.
---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:303
function gameplay_crawl_crawlFlowgraphBridge.cleanup() end

--- Prépare le crawl actif à partir d'un parcours : résout sa zone (boundaryId), son chemin (pathId) et sa position de départ (startingPositionId) ; la zone et le chemin sont obligatoires.
---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:32
---@param trail table Parcours (name, boundaryId, pathId, startingPositionId, prefabs).
---@return boolean  true si la configuration est valide.
function gameplay_crawl_crawlFlowgraphBridge.configureCrawl(trail) end

--- Retourne l'id du véhicule en crawl.
---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:223
---@return integer|nil  Id du véhicule, nil si aucun.
function gameplay_crawl_crawlFlowgraphBridge.getActiveCrawlerId() end

--- Liste toutes les positions de départ connues de saveSystem.
---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:231
---@return table  Positions de départ.
function gameplay_crawl_crawlFlowgraphBridge.getAllStartingPositions() end

--- Liste tous les parcours connus de saveSystem.
---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:227
---@return table  Parcours.
function gameplay_crawl_crawlFlowgraphBridge.getAllTrails() end

--- Retourne un résumé de fin de crawl pour le crawler actif.
---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:151
---@return table|nil  {time, points, completed, pathnodesCompleted, pathnodeTimings, disqualified} ; nil si aucun crawl actif.
function gameplay_crawl_crawlFlowgraphBridge.getCrawlEndData() end

--- Retourne l'état en cours du crawl.
---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:171
---@return table|nil  {currentTime, currentPathnodeIndex, points, isCompleted, disqualified, crawlerPosition, crawlerDirection, vehicleId} ; nil si aucun crawl actif.
function gameplay_crawl_crawlFlowgraphBridge.getCrawlRuntimeData() end

--- Délègue à gameplay_crawl_utils.getDynamicObjectsFromPrefab : objets d'un prefab portant un nom dynamique donné.
---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:239
---@param prefabId any Id du prefab.
---@param dynamicName string Nom dynamique recherché.
---@return table  Objets trouvés (déduit du code).
function gameplay_crawl_crawlFlowgraphBridge.getDynamicObjectsFromPrefab(prefabId, dynamicName) end

--- Retourne l'indice du dernier point de récupération du crawler actif.
---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:271
---@return integer  Indice, 0 si aucun crawl actif.
function gameplay_crawl_crawlFlowgraphBridge.getLastRecoveryCheckpointIndex() end

--- Retourne la liste des types de pénalité.
---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:267
---@return string[]  Noms des pénalités.
function gameplay_crawl_crawlFlowgraphBridge.getPenaltyTypes() end

--- Retourne les statistiques du joueur sur un parcours (saveSystem).
---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:235
---@param trailId string|integer Id du parcours.
---@return table|nil  Statistiques.
function gameplay_crawl_crawlFlowgraphBridge.getPlayerTrailStats(trailId) end

--- Retourne les métadonnées d'un parcours (celui indiqué, sinon le parcours actif).
---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:193
---@param trailId string|integer|nil Id du parcours.
---@return table|nil  {name, description, pathId, boundaryId, startingPositionId, pathReversed, rules, prefabs, metadata}.
function gameplay_crawl_crawlFlowgraphBridge.getTrailInfo(trailId) end

--- Indique si un crawl est actif via ce pont.
---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:219
---@return boolean  État actif.
function gameplay_crawl_crawlFlowgraphBridge.isCrawlActive() end

--- Récupère un parcours par id depuis saveSystem.
---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:16
---@param trailId string|integer Id du parcours (type exact déduit du code).
---@return table|nil  Le parcours, ou nil si l'id est manquant ou inconnu.
function gameplay_crawl_crawlFlowgraphBridge.loadCrawlTrail(trailId) end

--- Hook appelé quand un noeud du chemin est atteint ; journalise indice et temps.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:295
---@param eventData table {pathnodeIndex, time}.
function gameplay_crawl_crawlFlowgraphBridge.onCrawlPathnodeReached(eventData) end

--- Hook appelé quand les résultats sont affichés ; journalise temps et points.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:291
---@param eventData table {time, points}.
function gameplay_crawl_crawlFlowgraphBridge.onCrawlResultsShown(eventData) end

--- Hook appelé quand un crawl démarre ; journalise seulement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:287
function gameplay_crawl_crawlFlowgraphBridge.onCrawlStarted() end

--- Réinitialise les données du crawler, téléporte le véhicule à la position de départ du parcours (orientation du premier noeud du chemin si disponible, spawn.safeTeleport) puis arrête le crawl.
---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:102
---@return boolean  true si la téléportation a eu lieu.
function gameplay_crawl_crawlFlowgraphBridge.resetCrawl() end

--- Définit le point de récupération du crawler actif.
---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:279
---@param checkpoint any Point de passage (déduit du code).
---@return boolean  false si aucun crawl actif ; sinon résultat de gameplay_crawl_utils.setRecoveryCheckpoint.
function gameplay_crawl_crawlFlowgraphBridge.setRecoveryCheckpoint(checkpoint) end

--- Démarre le crawl configuré sur un véhicule (gameplay_crawl_general.startCrawl) et marque le pont actif.
---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:59
---@param vehicleId integer|nil Id du véhicule ; le véhicule du joueur 0 si nil.
---@return boolean  true si lancé.
function gameplay_crawl_crawlFlowgraphBridge.startCrawl(vehicleId) end

--- Arrête le crawl actif (gameplay_crawl_utils.stopCrawl) et réinitialise l'état du pont.
---Source : lua/ge/extensions/gameplay/crawl/crawlFlowgraphBridge.lua:86
---@return boolean  false s'il n'y avait pas de crawl actif.
function gameplay_crawl_crawlFlowgraphBridge.stopCrawl() end

