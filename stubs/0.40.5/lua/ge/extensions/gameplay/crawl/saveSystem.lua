---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/saveSystem.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Système de fichiers du mode crawl. Il lit et écrit les quatre types de fichiers JSON d'un niveau, dans /levels/<niveau>/crawls/ : *.trail.json (parcours), *.boundary.json (zone limite, objet gameplay/sites/zone), *.path.json (noeuds du chemin) et *.startingPosition.json (position de départ). Chaque objet est chargé à la demande puis mis en cache, avec _filePath, _fileName, _dir et _ext ajoutés ; l'id d'un objet est son chemin de fichier. Il gère aussi les scores du joueur par parcours (meilleur temps, meilleurs points de pénalité, tentatives), stockés dans settings/cloud/crawlTrails/ en freeroam ou dans le profil de carrière (/career/crawlTrails/).
--- Accès : extension `gameplay_crawl_saveSystem` : `extensions.load("gameplay_crawl_saveSystem")`, puis la globale `gameplay_crawl_saveSystem`
---@class gameplay_crawl_saveSystem
gameplay_crawl_saveSystem = {}

--- Enregistre une tentative : met à jour le meilleur temps (si > 0 et meilleur), les meilleurs points de pénalité (si >= 0 et plus bas) et incrémente le nombre de tentatives, puis sauvegarde.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:774
---@param trailId string Id du parcours.
---@param time number|nil Temps en secondes.
---@param penaltyPoints number|nil Points de pénalité.
---@return table|nil  {isNewBestTime, isNewBestPenaltyPoints, bestTime, bestPenaltyPoints} ; nil si le parcours est inconnu (parcours de mission).
function gameplay_crawl_saveSystem.addNewPlayerScore(trailId, time, penaltyPoints) end

--- Vide tous les caches.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:840
function gameplay_crawl_saveSystem.cleanup() end

--- Vide le cache d'un type ('trails', 'boundaries', 'paths' ou 'startingPositions') ou de tous.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:67
---@param type string|nil Clé du cache ; tous les caches si nil.
function gameplay_crawl_saveSystem.clearCache(type) end

--- Crée le dossier de sauvegarde freeroam settings/cloud/crawlTrails/ s'il n'existe pas.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:687
function gameplay_crawl_saveSystem.ensurePlayerSaveDirectories() end

--- Charge toutes les zones limites du niveau courant.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:646
---@return table[]  Zones.
function gameplay_crawl_saveSystem.getAllBoundaries() end

--- Liste les fichiers *.boundary.json.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:621
---@param levelPath string|nil Dossier ; niveau courant si nil.
---@return string[]  Chemins de fichiers.
function gameplay_crawl_saveSystem.getAllBoundaryFiles(levelPath) end

--- Liste les fichiers *.path.json.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:625
---@param levelPath string|nil Dossier ; niveau courant si nil.
---@return string[]  Chemins de fichiers.
function gameplay_crawl_saveSystem.getAllPathFiles(levelPath) end

--- Charge tous les chemins du niveau courant.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:658
---@return table[]  Chemins.
function gameplay_crawl_saveSystem.getAllPaths() end

--- Liste les fichiers *.startingPosition.json.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:629
---@param levelPath string|nil Dossier ; niveau courant si nil.
---@return string[]  Chemins de fichiers.
function gameplay_crawl_saveSystem.getAllStartingPositionFiles(levelPath) end

--- Charge toutes les positions de départ du niveau courant.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:670
---@return table[]  Positions de départ.
function gameplay_crawl_saveSystem.getAllStartingPositions() end

--- Liste les chemins des fichiers *.trail.json d'un dossier (non récursif).
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:617
---@param levelPath string|nil Dossier ; dossier crawl du niveau courant si nil.
---@return string[]  Chemins de fichiers.
function gameplay_crawl_saveSystem.getAllTrailFiles(levelPath) end

--- Charge tous les parcours d'un dossier.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:634
---@param levelPath string|nil Dossier ; niveau courant si nil.
---@return table[]  Parcours.
function gameplay_crawl_saveSystem.getAllTrails(levelPath) end

--- Charge (avec cache) une zone limite, créée comme objet zone puis désérialisée.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:569
---@param boundaryId string Chemin du fichier .boundary.json.
---@return table|nil  Zone.
function gameplay_crawl_saveSystem.getBoundaryById(boundaryId) end

--- Retourne le dossier des fichiers crawl du niveau courant.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:20
---@return string|nil  '/levels/<niveau>/crawls/', ou nil si aucun niveau n'est chargé.
function gameplay_crawl_saveSystem.getCurrentLevelCrawlPath() end

--- Charge (avec cache) un chemin ; les noeuds ont pos (vec3), rotation (quat), radius, flags, name.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:578
---@param pathId string Chemin du fichier .path.json.
---@return table|nil  Chemin {name, description, nodes, id}.
function gameplay_crawl_saveSystem.getPathById(pathId) end

--- Retourne les données de score d'un parcours.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:723
---@param trailId string Id (chemin de fichier) du parcours.
---@return table|nil  {id, trail, saveData}.
function gameplay_crawl_saveSystem.getPlayerCrawlTrailById(trailId) end

--- Charge (une fois) les scores du joueur pour tous les parcours du niveau courant, depuis le dossier freeroam ou le profil de carrière.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:727
---@return table<string, table>  Dictionnaire id -> {id, trail, saveData{bestTime, bestPenaltyPoints, bestTimeDate, bestPenaltyPointsDate, attempts}}.
function gameplay_crawl_saveSystem.getPlayerCrawlTrailsById() end

--- Retourne les statistiques du joueur sur un parcours.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:827
---@param trailId string Id du parcours.
---@return table|nil  {bestTime, bestPenaltyPoints, attempts} ; nil si inconnu.
function gameplay_crawl_saveSystem.getPlayerTrailStats(trailId) end

--- Charge (avec cache) une position de départ. Retourne nil pour un parcours issu d'une mission ou un id vide.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:587
---@param startingPositionId string|nil Chemin du fichier .startingPosition.json.
---@param trail table|nil Parcours ; ignoré si isFromMission.
---@return table|nil  Position de départ {transform, iconPosition, …}.
function gameplay_crawl_saveSystem.getStartingPositionById(startingPositionId, trail) end

--- Charge (avec cache) un parcours à partir de son chemin de fichier.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:560
---@param trailId string Chemin du fichier .trail.json.
---@return table|nil  Parcours, avec _filePath, _fileName, _dir, _ext.
function gameplay_crawl_saveSystem.getTrailById(trailId) end

--- Indique si un parcours est issu d'une mission (isFromMission).
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:857
---@param trail table|nil Parcours.
---@return boolean  true si isFromMission est vrai.
function gameplay_crawl_saveSystem.isTrailFromMission(trail) end

--- Charge un fichier de données crawl (name, description, icon, metadata, liste d'ids de trails) et résout chaque trail via getTrailById.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:428
---@param filename string Fichier JSON à lire.
---@return table|nil  {name, description, icon ('rockCrawling01' par défaut), metadata, trails}.
function gameplay_crawl_saveSystem.loadCrawlData(filename) end

--- Hook appelé quand la carrière change d'état : oublie les scores chargés pour les relire depuis le bon dossier.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:695
function gameplay_crawl_saveSystem.onCareerActive() end

--- Hook appelé lors de la sauvegarde du profil de carrière : écrit les scores de parcours modifiés (_dirty).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:705
---@param currentSavePath string Dossier du profil courant.
function gameplay_crawl_saveSystem.onSaveCurrentProfile(currentSavePath) end

--- Remet à zéro (math.huge, dates 0, tentatives 0) les scores d'un parcours et les sauvegarde.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:815
---@param trailId string Id du parcours.
function gameplay_crawl_saveSystem.resetPlayerTrailScores(trailId) end

--- Écrit une zone limite en JSON (via boundary:onSerialize()) et la met en cache.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:322
---@param boundary table Zone (objet gameplay/sites/zone).
---@param filePath string Chemin du fichier .boundary.json.
---@return boolean  true si écrit.
function gameplay_crawl_saveSystem.saveBoundary(boundary, filePath) end

--- Écrit un fichier de données crawl : métadonnées et ids des trails (voir notes sur le champ id).
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:469
---@param saveData table {name, description, icon, metadata, trails}.
---@param filepath string Fichier de sortie.
---@return boolean  true si écrit.
function gameplay_crawl_saveSystem.saveCrawlData(saveData, filepath) end

--- Écrit un chemin (liste de noeuds : name, position, rotation, radius 4.0 par défaut, flags) en JSON et le met en cache.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:357
---@param path table Chemin {name, description, nodes}.
---@param filePath string Chemin du fichier .path.json.
---@return boolean  true si écrit.
function gameplay_crawl_saveSystem.savePath(path, filePath) end

--- Marque les scores du parcours comme modifiés ; hors carrière, les écrit tout de suite dans settings/cloud/crawlTrails/.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:713
---@param trailId string Id du parcours.
function gameplay_crawl_saveSystem.savePlayerCrawlTrailScoresForTrailById(trailId) end

--- Écrit une position de départ (transform position/rotation/radius 10.0 par défaut, iconPosition, metadata) en JSON et la met en cache.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:392
---@param startingPosition table Position de départ.
---@param filePath string Chemin du fichier .startingPosition.json.
---@return boolean  true si écrit.
function gameplay_crawl_saveSystem.saveStartingPosition(startingPosition, filePath) end

--- Sérialise un parcours et l'écrit en JSON (création du dossier si besoin), puis le met en cache.
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:287
---@param trail table Parcours (name, description, pathId, boundaryId, startingPositionId, rules, prefabs…).
---@param filePath string Chemin du fichier .trail.json.
---@return boolean  true si écrit.
function gameplay_crawl_saveSystem.saveTrail(trail, filePath) end

