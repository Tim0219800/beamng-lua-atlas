---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Cœur du mode crawl (franchissement lent de parcours) côté freeroam/carrière : garde le parcours actif (activeTrail : trail, zone, chemin copié, départ, prefabs) et la liste des données de crawlers, prépare un parcours (setupCrawl, avec inversion éventuelle du chemin), démarre le crawl en freeroam ou depuis un flowgraph, et appelle gameplay_crawl_utils.updateCrawl à chaque image. Il fournit aussi les points d'intérêt (marqueurs de départ, carte), les fenêtres d'activité, le dessin de la zone sur la minimap et enregistre les scores à la fin. Il gère le cas multi-joueur local (multiseat).
--- Accès : extension `gameplay_crawl_general` : `extensions.load("gameplay_crawl_general")`, puis la globale `gameplay_crawl_general`
---@class gameplay_crawl_general
---@field activeTrail table|nil Parcours actif : {trail, boundary, path, startingPosition, prefabs, isFromMission} ; nil si aucun.
---@field crawlersData table<integer, table> Liste des données de crawler (créées par gameplay_crawl_utils.setupCrawlerData) du parcours actif.
---@field dependencies table<integer, string> Extensions chargées avant : gameplay_crawl_saveSystem, utils, boundary, display.
gameplay_crawl_general = {}

--- Décharge les prefabs du parcours actif, oublie le parcours, nettoie gameplay_crawl_utils et vide crawlersData.
---Source : lua/ge/extensions/gameplay/crawl/general.lua:38
---@param force boolean|nil Transmis à gameplay_crawl_utils.clear.
function gameplay_crawl_general.clear(force) end

--- Hook de la fenêtre d'activité : pour un POI 'crawl', ajoute une fiche (distance, dénivelé positif/négatif, meilleurs points, meilleur temps, tentatives) et un bouton « Jouer » qui lance startCrawlFreeroam sur le véhicule du joueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/general.lua:302
---@param elemData table Données des éléments sélectionnés.
---@param activityData table Liste de fiches à compléter.
function gameplay_crawl_general.onActivityAcceptGatherData(elemData, activityData) end

--- Hook appelé quand une activité est visible/masquée dans l'index : prépare le parcours et ses marqueurs de chemin pour un POI crawl, ou nettoie si data est nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/general.lua:385
---@param data table|nil Données du POI (type, trailId) ; nil quand l'index se ferme.
function gameplay_crawl_general.onActivityIndexVisible(data) end

--- Hook appelé au changement d'état d'une mission : nettoie tout si elle passe à 'stopped'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/general.lua:464
---@param status string État de la mission.
---@param id any Mission concernée.
function gameplay_crawl_general.onAnyMissionChanged(status, id) end

--- Hook émis par utils.clear() à chaque fin de crawl : vide crawlersData et efface les POI bruts pour réafficher le marqueur de départ.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/general.lua:470
function gameplay_crawl_general.onCrawlCleared() end

--- Hook appelé à l'affichage des résultats : enregistre le temps et les points du joueur pour le parcours actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/general.lua:480
---@param eventData table {time, points}.
function gameplay_crawl_general.onCrawlResultsShown(eventData) end

--- Hook appelé pour dessiner sur la minimap : dessine la zone du parcours actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/general.lua:424
---@param td table Objet de dessin de la minimap.
function gameplay_crawl_general.onDrawOnMinimap(td) end

--- Hook appelé au chargement : nettoie l'état et crée les dossiers de sauvegarde du joueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/general.lua:433
function gameplay_crawl_general.onExtensionLoaded() end

--- Hook de collecte des points d'intérêt d'un niveau : ajoute pour chaque parcours (dossier /levels/<niveau>/crawls/) un POI de type 'crawl' avec déclencheur invisible, marqueur de départ et marqueur de carte (nom, miniature, meilleurs points) tant qu'aucun parcours n'est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/general.lua:229
---@param levelIdentifier string Nom du niveau.
---@param elements table Liste de POI à compléter.
function gameplay_crawl_general.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Hook appelé au changement de session multijoueur : charge gameplay_crawl_freeroamMultiplayer au début de session et le décharge à la fin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/general.lua:492
---@param old any Ancienne session (nil/false si aucune).
---@param new any Nouvelle session.
function gameplay_crawl_general.onMPSessionChanged(old, new) end

--- Hook appelé avant rechargement des extensions : nettoie l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/general.lua:438
function gameplay_crawl_general.onSerialize() end

--- Hook appelé à chaque image : fait avancer le crawl actif (gameplay_crawl_utils.updateCrawl).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/general.lua:209
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulation (s).
---@param dtRaw number Delta temps brut (s).
function gameplay_crawl_general.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook appelé quand un véhicule est détruit : retire son crawler (parcours hors mission).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/general.lua:453
---@param vehId integer Id du véhicule.
function gameplay_crawl_general.onVehicleDestroyed(vehId) end

--- Hook appelé au changement de véhicule contrôlé : retire le crawler de l'ancien véhicule (parcours hors mission) et nettoie s'il n'en reste aucun.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/general.lua:442
---@param oldId integer Id de l'ancien véhicule.
---@param newId integer Id du nouveau véhicule.
---@param player integer Index du joueur.
function gameplay_crawl_general.onVehicleSwitched(oldId, newId, player) end

--- Prépare un parcours : arrête le crawl précédent, résout zone, chemin et départ depuis saveSystem, gère l'inversion, crée les données du crawler, charge les prefabs et, si isFromMission, téléporte le véhicule à la position de départ.
---Source : lua/ge/extensions/gameplay/crawl/general.lua:49
---@param trail table Parcours (boundaryId, pathId, startingPositionId, pathReversed, prefabs, name).
---@param veh userdata Objet véhicule.
---@param isFromMission boolean|nil Vrai si lancé par une mission/flowgraph.
---@return boolean  false si zone ou chemin manquent ou si trail/veh est nil.
function gameplay_crawl_general.setupCrawl(trail, veh, isFromMission) end

--- Démarre un crawl depuis un flowgraph. Si le même parcours (même nom) est déjà préparé, le réutilise ; sinon appelle setupCrawl(trail, veh, true). Émet onCrawlStarted.
---Source : lua/ge/extensions/gameplay/crawl/general.lua:169
---@param trail table Parcours à lancer.
---@param veh userdata Objet véhicule.
---@return boolean  true si le crawl a démarré.
function gameplay_crawl_general.startCrawlFlowgraph(trail, veh) end

--- Démarre un crawl en freeroam. En multiseat avec le même parcours déjà actif, ajoute simplement le véhicule au crawl ; sinon prépare le parcours puis lance gameplay_crawl_utils.startCrawl, émet onCrawlStarted et efface les POI bruts.
---Source : lua/ge/extensions/gameplay/crawl/general.lua:131
---@param trail table Parcours à lancer.
---@param veh userdata Objet véhicule.
function gameplay_crawl_general.startCrawlFreeroam(trail, veh) end

