---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/saveSystem.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Chargement et sauvegarde des données de drag. Lit les pistes (fichiers *.strip.json et *.dragSettings.json, ou ancien format converti), reconstruit couloirs, waypoints, zones et timers, synchronise les waypoints avec les objets BeamNGWaypoint de la scène, précalcule le point d'arrêt IA, et fait apparaître/supprime les prefabs (arbre, panneaux, décorations, chemins). Gère aussi les fichiers du joueur : meilleurs temps par véhicule (carnet de dial) et historique des tickets, dans le dossier settings/ de l'utilisateur.
--- Accès : extension `gameplay_drag_saveSystem` : `extensions.load("gameplay_drag_saveSystem")`, puis la globale `gameplay_drag_saveSystem`
---@class gameplay_drag_saveSystem
---@field DEFAULT_TIMERS table[] Timers par défaut d'une piste : {id, label, labelKey, shortLabel, type = 'distanceTimer'|'velocity', distance (m), important}.
gameplay_drag_saveSystem = {}

--- Convertit l'ancien format de piste (stripInfo, strip.lanes) en structure actuelle (strip, lanes, waypoints), ajoute les timers par défaut et synchronise les waypoints avec la scène.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:415
---@param legacyData table Données dans l'ancien format.
---@return table|nil  Données converties, nil si legacyData est nil.
function gameplay_drag_saveSystem.convertLegacyData(legacyData) end

--- Charge une seule fois par session le carnet de dial (settings/dragDialTimes.json, historique .jsonl, overlay des meilleurs temps) et migre l'ancien historique hors du JSON principal.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:614
---@return table  Cache indexé par hash de config véhicule ({time_1_4, ..., history}).
function gameplay_drag_saveSystem.ensureDialCache() end

--- Hash stable de la config du véhicule (hash du fichier .pc) servant de clé pour dial et historique ; mis en cache. Retourne 'vehicle_<id>' si les détails ou le fichier sont indisponibles.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:723
---@param vehicleId integer|nil ID du véhicule (défaut : véhicule du joueur 0).
---@return string  Hash ou clé de repli.
function gameplay_drag_saveSystem.generateHashFromFile(vehicleId) end

--- Tous les couloirs de toutes les pistes (*.strip.json) du niveau courant, avec _stripId et _stripName ajoutés.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:887
---@return table[]  Couloirs.
function gameplay_drag_saveSystem.getAllLanes() end

--- Données brutes de toutes les pistes *.strip.json du dossier dragstrips du niveau courant (avec _filePath).
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:870
---@return table[]  Pistes.
function gameplay_drag_saveSystem.getAllStrips() end

--- Chemin /levels/<niveau>/dragstrips/ du niveau courant.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:261
---@return string|nil  Chemin, nil (log E) si le niveau est inconnu.
function gameplay_drag_saveSystem.getCurrentLevelDragPath() end

--- Chemin de sauvegarde carrière courant.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:752
---@return string  Chemin, chaîne vide hors carrière.
function gameplay_drag_saveSystem.getCurrentSavePath() end

--- Meilleurs temps par hash de config, sans l'historique ; time_1_4 vaut au moins 10 par défaut.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:706
---@return table<string, table>  Table hash vers {time_1_4, autres timers}.
function gameplay_drag_saveSystem.getDialTimes() end

--- Historique des tickets enregistrés. Avec id, filtre sur la piste correspondante du niveau courant (par id de dragSettings, nom de fichier ou id de strip).
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:770
---@param id string|nil Identifiant de piste/installation ; nil = tout l'historique.
---@return table  {history = tickets[]}.
function gameplay_drag_saveSystem.getHistory(id) end

--- Les count derniers tickets toutes pistes confondues, du plus récent au plus ancien (stripInfo.timestamp).
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:851
---@param count integer Nombre maximum de tickets.
---@return table[]  Tickets.
function gameplay_drag_saveSystem.getRecentHistory(count) end

--- Nom canonique dans la scène d'un waypoint de couloir : <stripId>_wp_<type>_<couloir> (le « _wp_ » évite la collision avec les feux d'arbre).
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:118
---@param stripId string Identifiant de piste.
---@param wpType string Type de waypoint (stage, endLine...).
---@param laneIndex integer Indice du couloir.
---@return string  Nom d'objet.
function gameplay_drag_saveSystem.laneWaypointSceneName(stripId, wpType, laneIndex) end

--- Charge une piste complète depuis un fichier .strip.json : couloirs (waypoints, boundary, zone, stageToEndNormalized), waypoints de piste, zone de piste, phases/prefabs/timers par défaut ; puis synchronise avec la scène.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:267
---@param stripId string Chemin du fichier strip JSON.
---@return table|nil  Données complètes, nil (log E) en cas d'échec de lecture.
function gameplay_drag_saveSystem.loadCompleteDragRaceData(stripId) end

--- Charge un fichier de réglages de piste : format modulaire (champ stripId pointant vers un .strip.json, plus dragType, context, phases, prefabs, timers) ou ancien format converti par convertLegacyData.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:375
---@param filepath string Chemin du fichier JSON (.dragSettings.json).
---@return table|nil  Données de piste ou nil.
function gameplay_drag_saveSystem.loadDragStripData(filepath) end

--- Fait apparaître dans la scène les prefabs utilisés de data.prefabs (christmasTree, displaySign, decorations, paths) à l'origine et stocke leur prefabId.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:919
---@param data table Données de piste avec prefabs[clé] = {isUsed, path, treeType}.
function gameplay_drag_saveSystem.loadPrefabs(data) end

--- Hook de carrière activée ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:867
function gameplay_drag_saveSystem.onCareerActive() end

--- Hook : à la sauvegarde du profil, copie le carnet de dial dans le dossier de sauvegarde (saveDialFile).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:863
---@param currentSavePath string|nil Dossier de sauvegarde courant.
function gameplay_drag_saveSystem.onSaveCurrentProfile(currentSavePath) end

--- Précalcule pour chaque couloir le nom du nœud de navigation où l'IA doit s'arrêter (lane.autoStopName), à plus de 350 m de la ligne d'arrivée. Ne fait rien si la piste a un waypoint drag_stop ou si le graphe n'existe pas.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:239
---@param dragData table Données de piste.
function gameplay_drag_saveSystem.resolveAutoStopWaypoints(dragData) end

--- Écrit le carnet de dial dans <dir>/dragDialTimes.json.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:758
---@param dir string Dossier cible.
---@return boolean  Succès de l'écriture.
function gameplay_drag_saveSystem.saveDialFile(dir) end

--- Pour chaque racer jouable, met à jour son meilleur temps (timer important) si battu, et ajoute le ticket à l'historique (mémoire et fichier .jsonl, avec configHash par pilote). Écrit settings/dragDialBest.json si un record change.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:650
---@param dragData table Données de course courantes.
---@param timeslip table|nil Ticket à enregistrer dans l'historique.
function gameplay_drag_saveSystem.saveDialTimes(dragData, timeslip) end

--- Écrit un couloir en JSON (mise en forme lisible).
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:915
---@param lane table Couloir.
---@param filePath string Fichier cible.
---@return boolean  Succès.
function gameplay_drag_saveSystem.saveLane(lane, filePath) end

--- Écrit une piste en JSON après avoir renommé les waypoints de chaque couloir selon laneWaypointSceneName.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:901
---@param strip table Piste (id, lanes avec waypoints[] ayant un type).
---@param filePath string Fichier cible.
---@return boolean  Succès.
function gameplay_drag_saveSystem.saveStrip(strip, filePath) end

--- Pour chaque waypoint de couloir et de piste, retrouve le BeamNGWaypoint de la scène à son nom canonique, le renomme si besoin, relit sa position/rotation/échelle, et calcule lane.stageToEndNormalized. Rebuild le graphe de navigation (map.reset) si un renommage a eu lieu.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:158
---@param dragData table Données de piste (strip.id requis).
function gameplay_drag_saveSystem.syncDragStripWaypointsWithSceneTree(dragData) end

--- Supprime de la scène les prefabs utilisés (par prefabId) et efface prefabId.
---Source : lua/ge/extensions/gameplay/drag/saveSystem.lua:938
---@param data table Données de piste avec prefabs.
function gameplay_drag_saveSystem.unloadPrefabs(data) end

