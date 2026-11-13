---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Moteur d'exécution du mode crawl (franchissement lent d'un parcours à points de passage). Il garde l'état de chaque crawler (crawlStates, indexé par id de véhicule) : noeud courant, noeuds franchis ou sautés, chrono, points de pénalité, évènements, point de récupération, disqualification. À chaque image, updateCrawl avance le chrono, lit la position du véhicule, détecte les noeuds atteints (test 2D sur le centre de la boîte englobante, avec contrôle de direction si le noeud a une rotation), vérifie la zone limite (gameplay_crawl_boundary), les infractions (marche arrière, touche de portes dynamiques) et le seuil de DNF. Il gère aussi les marqueurs 3D des portes (partagés ou par joueur en écran partagé), le tracé en pointillés d'aperçu, le chargement des prefabs du parcours, l'intégration à core_lapTimes et les réinitialisations de véhicule. Le barème est dans infractionPoints.
--- Accès : extension `gameplay_crawl_utils` : `extensions.load("gameplay_crawl_utils")`, puis la globale `gameplay_crawl_utils`
---@class gameplay_crawl_utils
---@field drivingBackwardsSettings table<string, number> Réglages de détection de marche arrière : velocityDotThreshold = -0.5, distanceThreshold = 2.
---@field infractionCooldowns table<string, number> Délais de répétition en secondes : drivingBackwards = 5, boundaryViolation = 3.
---@field infractionPoints table<string, number> Points par type d'infraction (voir notes). Valeurs négatives = bonus.
gameplay_crawl_utils = {}

--- Active le premier marqueur ('current') du chemin actif et quitte le mode aperçu.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:540
function gameplay_crawl_utils.activateCrawlMarkers() end

--- Ajoute des points au crawler (négatifs = bonus ; total borné à 0), émet onCrawlPenaltyScoreChanged et consigne l'évènement. Sans effet si le crawler est inactif ou si les pénalités sont désactivées.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:231
---@param crawlerId integer Id du véhicule.
---@param penaltyType string Clé de infractionPoints (ex. 'boundaryViolation', 'dnf').
---@param points number|nil Points à ajouter ; sinon la valeur de infractionPoints[penaltyType].
function gameplay_crawl_utils.applyPenalty(crawlerId, penaltyType, points) end

--- Calcule distance totale et dénivelé d'un chemin (par pas de 5 m) et met le résultat en cache.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1741
---@param pathId string Id (fichier) du chemin.
---@param pathReversed boolean|nil Sans effet réel (voir notes).
---@return table|nil  {totalDistance (m), totalElevationChange (m), elevationGain, elevationLoss} ; nil si le chemin a moins de 2 positions.
function gameplay_crawl_utils.calculatePathStats(pathId, pathReversed) end

--- Efface les marqueurs, décharge les prefabs, supprime tous les états de crawlers, remet gameplay_crawl_general.activeTrail à nil, émet onCrawlCleared et efface les messages. Sans force, ne fait rien si un crawl de mission est actif.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:397
---@param force boolean|nil Vrai pour tout effacer même en mission.
function gameplay_crawl_utils.clear(force) end

--- Retire un crawler (ses marqueurs par joueur et son état).
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:372
---@param crawlerId integer|nil Id du véhicule.
function gameplay_crawl_utils.clearCrawler(crawlerId) end

--- Supprime tous les marqueurs de portes et quitte le mode aperçu.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:359
function gameplay_crawl_utils.clearMarkers() end

--- Met à jour et affiche les marqueurs de portes (masqués en mode photo). Appelée par onPreRender.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1623
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulation (s).
---@param dtRaw number Delta temps brut (s).
function gameplay_crawl_utils.drawMarkers(dtReal, dtSim, dtRaw) end

--- Retourne l'id du premier crawler actif trouvé.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1902
---@return integer|nil  Id du véhicule.
function gameplay_crawl_utils.getActiveCrawlerId() end

--- Retourne la table interne de tous les états (indexés par id de véhicule), sans copie.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1898
---@return table<integer, table>  États.
function gameplay_crawl_utils.getAllCrawlStates() end

--- Retourne l'état complet d'un crawler : active, trail, crawlerData, currentPathnodeIndex, completedPathnodes, skippedPathnodes, pathnodeTimings, eventLog, currentTime, isCompleted, completionStartTime, events, crawlStarted, lastRecoveryCheckpoint, lastRecoveryCheckpointIndex, lastReachedPathnodeIndex, isDisqualified, recoveryCount, isFromMission, raceData.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1862
---@param crawlerId integer Id du véhicule.
---@return table|nil  État, ou nil.
function gameplay_crawl_utils.getCrawlState(crawlerId) end

--- Retourne l'orientation du véhicule réduite à son lacet (rotation autour de Z).
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1874
---@param crawlerId integer Id du véhicule.
---@return quat  Quaternion de lacet ; identité si inconnu.
function gameplay_crawl_utils.getCrawlerDirection(crawlerId) end

--- Retourne la dernière position connue d'un crawler (référence vers un vec3 mis à jour en continu).
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1866
---@param crawlerId integer Id du véhicule.
---@return vec3|nil  Position.
function gameplay_crawl_utils.getCrawlerPosition(crawlerId) end

--- Retourne les points du tracé en pointillés d'aperçu.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1915
---@return table[]  Liste de {pos, distanceFromStart}.
function gameplay_crawl_utils.getDottedPath() end

--- Liste les ids des enfants d'un prefab dont un champ dynamique a pour valeur dynamicName.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:288
---@param prefabId integer Id du prefab.
---@param dynamicName string Valeur recherchée.
---@return integer[]  Ids des objets trouvés ; vide si absent.
function gameplay_crawl_utils.getDynamicObjectsFromPrefab(prefabId, dynamicName) end

--- Retourne le dernier point de récupération franchi par un crawler actif.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1919
---@param crawlerId integer Id du véhicule.
---@return table|nil  {position, rotation, index, time}.
function gameplay_crawl_utils.getLastRecoveryCheckpoint(crawlerId) end

--- Retourne l'indice du dernier point de récupération d'un crawler actif.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1932
---@param crawlerId integer Id du véhicule.
---@return integer  Indice ; 0 si aucun ou crawler inactif.
function gameplay_crawl_utils.getLastRecoveryCheckpointIndex(crawlerId) end

--- Indique si le parcours du crawler applique des pénalités (vrai sauf si trail.rules.penalties == false).
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:225
---@param crawlerId integer|nil Id du véhicule.
---@return boolean  true si les pénalités sont actives.
function gameplay_crawl_utils.hasPenalties(crawlerId) end

--- Indique si l'overlay de debug est actif.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1737
---@return boolean  État.
function gameplay_crawl_utils.isDebugDrawEnabled() end

--- Indique si les marqueurs sont en mode aperçu (avant le démarrage du crawl).
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1911
---@return boolean  État.
function gameplay_crawl_utils.isPreviewMode() end

--- Fait apparaître les prefabs du parcours (canSave = false, ajoutés à MissionGroup), empêche l'entrée automatique dans les véhicules, repère les objets portant le champ dynamique 'crawlDynamic' (portes qui coûtent gateTouch si touchées), recharge les collisions puis crée les drapeaux de la zone limite (espacement 5 m).
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:313
---@param prefabFileList string[]|nil Chemins de fichiers prefab.
function gameplay_crawl_utils.loadPrefabs(prefabFileList) end

--- Applique la pénalité boundaryViolation et affiche le message, sauf pendant le délai de 3 s. Appelée par gameplay_crawl_boundary.checkBoundary.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1550
---@param crawlerId integer Id du véhicule.
function gameplay_crawl_utils.onBoundaryViolation(crawlerId) end

--- Hook de dessin de la minimap : dessine les marqueurs de portes (ceux du joueur 0 en écran partagé).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1660
---@param td table Objet de dessin de la minimap.
function gameplay_crawl_utils.onDrawOnMinimap(td) end

--- Hook appelé au déchargement : restaure commands.dropPlayerAtCameraNoReset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:2063
function gameplay_crawl_utils.onExtensionUnloaded() end

--- Hook appelé avant le rendu : affiche les marqueurs, l'aperçu en pointillés (en mode aperçu), le guidage en pause et l'overlay de debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1713
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulation (s).
---@param dtRaw number Delta temps brut (s).
function gameplay_crawl_utils.onPreRender(dtReal, dtSim, dtRaw) end

--- Hook appelé quand un objet est créé : pendant le chargement des prefabs, désactive l'entrée automatique dans le véhicule créé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1830
---@param objId integer Id de l'objet créé.
function gameplay_crawl_utils.onSpawnCCallback(objId) end

--- Hook appelé au changement d'écran partagé : reconstruit les marqueurs (par joueur en mode 'split', sinon partagés).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1672
---@param enabled boolean Écran partagé activé.
---@param _playerCount integer Nombre de joueurs (non utilisé).
---@param _layoutId any Identifiant de disposition (non utilisé).
---@param layoutMode string|nil Mode de disposition ('split' pour des vues séparées).
function gameplay_crawl_utils.onSplitScreenChanged(enabled, _playerCount, _layoutId, layoutMode) end

--- Applique la pénalité vehicleFlippedUpright et affiche le message.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1431
---@param crawlerId integer Id du véhicule.
function gameplay_crawl_utils.onVehicleFlippedUpright(crawlerId) end

--- Compte une récupération du véhicule. Avec isGateRecovery : pénalité vehicleReset et délai de 5 s sans pénalité de marche arrière ; sinon, en mission : pénalité vehicleFlippedUpright ; hors mission : pénalité dnf (seuil du parcours), donc disqualification.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1440
---@param crawlerId integer Id du véhicule.
---@param isGateRecovery boolean|nil Vrai si la récupération vient de recoverToLastGate.
function gameplay_crawl_utils.onVehicleReset(crawlerId, isGateRecovery) end

--- Téléporte le véhicule au dernier noeud franchi (ou à la position de départ), avec la rotation du noeud ou une direction déduite du noeud voisin, répare le véhicule sauf si recovery.repairVehicle == false, et applique la pénalité de récupération. Exige trail.rules.recovery.mode == 'lastGate'.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1495
---@param crawlerId integer Id du véhicule.
---@return boolean  true si la téléportation a eu lieu.
function gameplay_crawl_utils.recoverToLastGate(crawlerId) end

--- Remet à zéro l'état du crawler (noeud 1, chrono, points, infractions, évènements ; crawlStarted devient false), efface les messages et le suivi des temps.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1151
---@param crawlerId integer Id du véhicule.
---@param force boolean|nil Nécessaire pour réinitialiser un crawl de mission.
---@return boolean  false si le crawler est inconnu, inactif, ou protégé (mission sans force).
function gameplay_crawl_utils.resetCrawlData(crawlerId, force) end

--- Fait démarrer le chrono d'un crawler préparé mais pas encore lancé (crawlStarted devient true) et affiche les messages de début et de points.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1806
---@param crawlerId integer Id du véhicule.
---@return boolean  true si le chrono tourne (déjà démarré ou démarré maintenant).
function gameplay_crawl_utils.resumeCrawlTimer(crawlerId) end

--- Remplace l'état d'un crawler.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1890
---@param crawlerId integer Id du véhicule.
---@param state table Nouvel état.
---@return boolean  false si un paramètre manque.
function gameplay_crawl_utils.setCrawlState(crawlerId, state) end

--- Active ou désactive l'overlay de debug (chemin, zone limite, position de départ).
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1727
---@param enabled boolean true pour activer.
---@return boolean  Nouvel état.
function gameplay_crawl_utils.setDebugDraw(enabled) end

--- Impose le point de récupération d'un crawler actif et active le délai de 5 s sans pénalité de marche arrière.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1945
---@param crawlerId integer Id du véhicule.
---@param checkpoint table {position, rotation, index, time}.
---@return boolean  false si paramètres manquants ou crawler inactif.
function gameplay_crawl_utils.setRecoveryCheckpoint(crawlerId, checkpoint) end

--- Crée les marqueurs de portes d'un chemin (tous cachés, le dernier en 'final'), construit le tracé en pointillés depuis la position du joueur et passe en mode aperçu. Sans effet si les marqueurs de ce chemin existent déjà.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:490
---@param path table Chemin avec nodes (pos, rotation, radius).
function gameplay_crawl_utils.setupCrawlMarkers(path) end

--- Crée les données dynamiques d'un crawler pour un véhicule : id, points, boîte englobante (getSpawnWorldOOBB), décalages des roues (coins de référence), valeurs d'infraction ; enregistre aussi la notification de accZSmooth.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1279
---@param veh userdata Objet véhicule.
---@return table|nil  Données du crawler, nil si veh est nil.
function gameplay_crawl_utils.setupCrawlerData(veh) end

--- Crée l'état du crawler (noeud 1, chrono 0, points conservés dans crawlerData), prépare les marqueurs de portes du chemin actif, affiche les messages de début et de points, et configure core_lapTimes (un seul tour, un segment par noeud). Nécessite gameplay_crawl_general.activeTrail avec un chemin non vide.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1074
---@param crawlerId integer Id du véhicule.
---@param trail table Parcours (rules, etc.).
---@param crawlerData table Données du crawler créées par setupCrawlerData.
---@param isFromMission boolean|nil Vrai si lancé par une mission : le crawler n'est alors pas retiré automatiquement à la fin.
---@return boolean  false si paramètres invalides ou chemin vide.
function gameplay_crawl_utils.startCrawl(crawlerId, trail, crawlerData, isFromMission) end

--- Arrête le suivi des temps (core_lapTimes.onRaceStop), efface les points de sortie de zone et appelle clear. Sans force, ne fait rien si un crawl actif vient d'une mission.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1029
---@param force boolean|nil Vrai pour arrêter même un crawl de mission.
function gameplay_crawl_utils.stopCrawl(force) end

--- Bascule l'overlay de debug.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1732
---@return boolean  Nouvel état.
function gameplay_crawl_utils.toggleDebugDraw() end

--- Appelée quand le joueur réinitialise son véhicule : avec la règle de récupération au dernier noeud, annule l'aperçu de récupération puis demande recoverToLastGate ; sinon, mémorise la position pour détecter à l'image suivante un téléport réel (> 1 m) et appliquer onVehicleReset.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:2010
---@param vehId integer|string|nil Id du véhicule ; si nil, le crawler du joueur ayant utilisé un périphérique en dernier, ou tous les crawlers actifs.
function gameplay_crawl_utils.trackVehReset(vehId) end

--- Supprime les prefabs créés, recharge les collisions, vide les objets dynamiques et les marqueurs de zone.
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:267
function gameplay_crawl_utils.unloadPrefabs() end

--- Mise à jour par image de tous les crawlers actifs : animations de la zone limite, chrono, position, noeuds atteints, zone, infractions, évènements, flux de temps vers core_lapTimes, messages de points, DNF et retrait des crawlers terminés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1567
---@param dtSim number Delta temps simulation (s).
function gameplay_crawl_utils.updateCrawl(dtSim) end

