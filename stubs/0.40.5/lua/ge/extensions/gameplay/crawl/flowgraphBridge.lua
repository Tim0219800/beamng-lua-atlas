---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pont entre le mode crawl (franchissement lent de parcours) et les nœuds flowgraph des missions. Il charge un parcours depuis gameplay_crawl_saveSystem, le prépare (setupCrawl, avec téléportation au départ), démarre/arrête/réinitialise le crawl via gameplay_crawl_general et gameplay_crawl_utils, et expose l'état du crawl (temps, points, noeud courant, disqualification, récupérations), les informations du parcours et la gestion des pénalités et points de récupération. Contrairement à crawlFlowgraphBridge.lua, il ne garde pas d'état propre : il lit gameplay_crawl_general.activeTrail et cherche le crawler actif dans gameplay_crawl_utils.getAllCrawlStates().
--- Accès : extension `gameplay_crawl_flowgraphBridge` : `extensions.load("gameplay_crawl_flowgraphBridge")`, puis la globale `gameplay_crawl_flowgraphBridge`
---@class gameplay_crawl_flowgraphBridge
---@field dependencies table<integer, string> Extensions chargées avant : gameplay_crawl_saveSystem, general, utils, boundary, display.
gameplay_crawl_flowgraphBridge = {}

--- Applique une pénalité au crawler actif avec les points de gameplay_crawl_utils.infractionPoints[penaltyType]. Sans effet si aucun crawler actif ou si le type est inconnu.
---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:250
---@param penaltyType string Un des types de getPenaltyTypes().
function gameplay_crawl_flowgraphBridge.applyPenalty(penaltyType) end

--- Arrête le crawl actif s'il y en a un.
---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:319
function gameplay_crawl_flowgraphBridge.cleanup() end

--- Retourne l'id du premier crawler dont l'état est actif.
---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:230
---@return integer|nil  Id du véhicule.
function gameplay_crawl_flowgraphBridge.getActiveCrawlerId() end

--- Liste toutes les positions de départ (saveSystem).
---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:238
---@return table  Positions de départ.
function gameplay_crawl_flowgraphBridge.getAllStartingPositions() end

--- Liste tous les parcours (saveSystem).
---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:234
---@return table  Parcours.
function gameplay_crawl_flowgraphBridge.getAllTrails() end

--- Résumé du crawl du crawler actif.
---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:155
---@return table|nil  {time, points, completed, pathnodesCompleted, pathnodeTimings, disqualified, recoveries} ; nil si aucun crawl actif.
function gameplay_crawl_flowgraphBridge.getCrawlEndData() end

--- État en cours du crawl actif.
---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:177
---@return table|nil  {currentTime, currentPathnodeIndex, points, isCompleted, disqualified, crawlerPosition, crawlerDirection, vehicleId} ; nil si aucun crawl actif.
function gameplay_crawl_flowgraphBridge.getCrawlRuntimeData() end

--- Délègue à gameplay_crawl_utils.getDynamicObjectsFromPrefab.
---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:246
---@param prefabId any Id du prefab.
---@param dynamicName string Nom dynamique recherché.
---@return table  Objets trouvés (déduit du code).
function gameplay_crawl_flowgraphBridge.getDynamicObjectsFromPrefab(prefabId, dynamicName) end

--- Dernier point de récupération du crawler actif.
---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:279
---@return table|nil  Point de récupération (déduit du code) ; nil si aucun crawler actif.
function gameplay_crawl_flowgraphBridge.getLastRecoveryCheckpoint() end

--- Indice du dernier point de récupération du crawler actif.
---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:288
---@return integer  Indice, 0 si aucun crawler actif.
function gameplay_crawl_flowgraphBridge.getLastRecoveryCheckpointIndex() end

--- Liste des types de pénalité.
---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:275
---@return string[]  Noms des pénalités.
function gameplay_crawl_flowgraphBridge.getPenaltyTypes() end

--- Statistiques du joueur sur un parcours (saveSystem).
---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:242
---@param trailId string Id du parcours.
---@return table|nil  Statistiques.
function gameplay_crawl_flowgraphBridge.getPlayerTrailStats(trailId) end

--- Métadonnées d'un parcours (celui indiqué, sinon le parcours actif).
---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:200
---@param trailId string|nil Id du parcours.
---@return table|nil  {name, description, pathId, boundaryId, startingPositionId, pathReversed, rules, prefabs, metadata}.
function gameplay_crawl_flowgraphBridge.getTrailInfo(trailId) end

--- Indique si un parcours est actif dans gameplay_crawl_general.
---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:226
---@return boolean  true si activeTrail existe.
function gameplay_crawl_flowgraphBridge.isCrawlActive() end

--- Récupère un parcours par id depuis saveSystem.
---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:21
---@param trailId string Id (chemin de fichier) du parcours.
---@return table|nil  Le parcours, ou nil si absent.
function gameplay_crawl_flowgraphBridge.loadCrawlTrail(trailId) end

--- Hook appelé quand un noeud du chemin est atteint : corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:312
---@param eventData table Données de l'évènement.
function gameplay_crawl_flowgraphBridge.onCrawlPathnodeReached(eventData) end

--- Hook appelé quand les résultats sont affichés : corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:309
---@param eventData table Données de l'évènement.
function gameplay_crawl_flowgraphBridge.onCrawlResultsShown(eventData) end

--- Hook appelé au démarrage d'un crawl : corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:306
function gameplay_crawl_flowgraphBridge.onCrawlStarted() end

--- Réinitialise les données du crawler actif et téléporte son véhicule à la position de départ du parcours (spawn.safeTeleport).
---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:121
---@return boolean  true si réinitialisé et téléporté.
function gameplay_crawl_flowgraphBridge.resetCrawl() end

--- Définit le point de récupération du crawler actif.
---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:297
---@param checkpoint any Point de passage (déduit du code).
---@return boolean  false si aucun crawler actif, sinon le résultat de utils.setRecoveryCheckpoint.
function gameplay_crawl_flowgraphBridge.setRecoveryCheckpoint(checkpoint) end

--- Prépare un crawl : arrête l'éventuel crawl en cours, puis appelle gameplay_crawl_general.setupCrawl(trail, veh, true) (zone, chemin, départ, prefabs, téléportation au départ).
---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:36
---@param vehicleId integer|nil Id du véhicule ; véhicule du joueur 0 si nil.
---@param trail table Parcours à préparer.
---@return boolean  true si la préparation a réussi.
function gameplay_crawl_flowgraphBridge.setupCrawl(vehicleId, trail) end

--- Démarre le crawl préparé (gameplay_crawl_general.startCrawlFlowgraph) ou reprend le chronomètre d'un crawl déjà prêt.
---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:66
---@param vehicleId integer|nil Id du véhicule.
---@param trail table|nil Parcours ; sinon le parcours actif de general.
---@return boolean  true si le crawl est démarré.
function gameplay_crawl_flowgraphBridge.startCrawl(vehicleId, trail) end

--- Arrête le crawl actif (gameplay_crawl_utils.stopCrawl(true)).
---Source : lua/ge/extensions/gameplay/crawl/flowgraphBridge.lua:112
---@return boolean  false s'il n'y avait pas de parcours actif.
function gameplay_crawl_flowgraphBridge.stopCrawl() end

