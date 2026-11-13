---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/saveLoad.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Charge et sauvegarde les spots de drift du roaming libre. Scanne /levels/<niveau>/driftSpots/ à la recherche de spot.driftSpot.json, construit une table de spots indexée par id (niveau/dossier) avec leurs infos UI, leur aperçu, leurs scores et objectifs sauvegardés, cache les objets marqueurs de la scène, et écrit les scores modifiés. Charge aussi les zones de cascade (stuntZones) depuis un fichier JSON.
--- Accès : extension `gameplay_drift_saveLoad` : `extensions.load("gameplay_drift_saveLoad")`, puis la globale `gameplay_drift_saveLoad`
---@class gameplay_drift_saveLoad
gameplay_drift_saveLoad = {}

--- Vide le cache des spots ; le prochain appel à getDriftSpotsById relira tout depuis le disque.
---Source : lua/ge/extensions/gameplay/drift/saveLoad.lua:17
function gameplay_drift_saveLoad.clearCache() end

--- Renvoie les données d'un spot, ou nil s'il n'existe pas dans le niveau courant.
---Source : lua/ge/extensions/gameplay/drift/saveLoad.lua:45
---@param spotId string Id du spot.
---@return table|nil  Données du spot (id, spatialInfo, racePath, bounds, level, info, saveData, unlocked).
function gameplay_drift_saveLoad.getDriftSpotById(spotId) end

--- Renvoie (en la construisant au besoin) la table de tous les spots de drift du niveau courant, indexée par id. Utilise le dossier de sauvegarde carrière si la carrière est active, sinon settings/cloud/driftSpots/.
---Source : lua/ge/extensions/gameplay/drift/saveLoad.lua:50
---@return table<string, table>  Spots indexés par id.
function gameplay_drift_saveLoad.getDriftSpotsById() end

--- Cherche preview.jpg, preview.png ou preview.jpeg dans le dossier donné ; sinon renvoie /ui/images/noPreview.jpg.
---Source : lua/ge/extensions/gameplay/drift/saveLoad.lua:119
---@param dir string Dossier du spot.
---@return string  Chemin de l'image d'aperçu.
function gameplay_drift_saveLoad.getPreviewWithFallback(dir) end

--- Renvoie la liste (tableau) des spots dont le niveau est le niveau courant.
---Source : lua/ge/extensions/gameplay/drift/saveLoad.lua:132
---@return table[]  Tableau de spots.
function gameplay_drift_saveLoad.loadAndSanitizeDriftFreeroamSpotsCurrMap() end

--- Lit un fichier JSON de données de drift, convertit pos/rot/scl de chaque stuntZone en vec3/quat, puis appelle gameplay_drift_stuntZones.setStuntZones(json.stuntZones). Logge une erreur et retourne si le fichier est absent.
---Source : lua/ge/extensions/gameplay/drift/saveLoad.lua:142
---@param fileName string|nil Chemin du fichier JSON ; ne fait rien si nil.
function gameplay_drift_saveLoad.loadDriftData(fileName) end

--- Hook : appelé à l'activation de la carrière, vide le cache des spots.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/saveLoad.lua:13
function gameplay_drift_saveLoad.onCareerActive() end

--- Hook : appelé lors de la sauvegarde du profil carrière ; écrit dans <currentSavePath>/career/driftSpots/ tous les spots marqués _dirty.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/saveLoad.lua:27
---@param currentSavePath string Dossier de sauvegarde du profil courant.
function gameplay_drift_saveLoad.onSaveCurrentProfile(currentSavePath) end

--- Marque le spot comme modifié (_dirty). Hors carrière, écrit immédiatement son fichier de scores dans settings/cloud/driftSpots/ ; en carrière, l'écriture est différée à onSaveCurrentProfile.
---Source : lua/ge/extensions/gameplay/drift/saveLoad.lua:36
---@param spotId string Id du spot, de la forme "niveau/dossier".
function gameplay_drift_saveLoad.saveDriftSpotsScoresForSpotById(spotId) end

