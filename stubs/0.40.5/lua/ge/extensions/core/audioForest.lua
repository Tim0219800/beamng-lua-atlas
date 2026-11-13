---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/audioForest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE (core_audioForest) : coordinateur d'exécution des émetteurs audio de forêt. À partir des arbres/objets du Forest du niveau, elle construit un nuage de noeuds audio éclaircis (audioForestCommon), puis à chaque frame calcule la position moyenne pondérée des noeuds autour de l'auditeur (rayon 150 m) et déplace un émetteur SFX unique (le 'main emitter') à ce point en réglant ses paramètres FMOD (RTPC). Un émetteur 'roomtone' indépendant peut aussi jouer une ambiance. Les réglages par niveau sont lus dans levels/<niveau>/dynamicAudioEmitters/forestData.audioSFX.json (créé par l'éditeur). Les RTPC : volume = intensité, pitch = densité de noeuds, color = taille de la végétation, texture = inutilisé ; le paramètre global g_ForestHeight = hauteur de l'auditeur par rapport au barycentre de la forêt (ou au terrain).
--- Accès : extension `core_audioForest` : `extensions.load("core_audioForest")`, puis la globale `core_audioForest`
---@class core_audioForest
core_audioForest = {}

--- Réinitialise tout l'état d'exécution (émetteurs, noeuds, état d'outil, réglages).
---Source : lua/ge/extensions/core/audioForest.lua:582
function core_audioForest.clear() end

--- Supprime uniquement le chemin audio principal (émetteur et nom d'événement).
---Source : lua/ge/extensions/core/audioForest.lua:550
function core_audioForest.clearMainAudio() end

--- Pour l'éditeur : renvoie la table {[1] = id du noeud représentatif le plus proche} et la taille 1.
---Source : lua/ge/extensions/core/audioForest.lua:540
---@return table<integer, integer>  Tableau d'ids de noeuds (0 si aucun)
---@return integer  Nombre d'émetteurs (toujours 1)
function core_audioForest.getEmitterNodeIds() end

--- Pour la visualisation éditeur : état actuel de l'émetteur principal.
---Source : lua/ge/extensions/core/audioForest.lua:545
---@return boolean  true si l'émetteur est actif (des noeuds sont dans le rayon)
---@return number  x (m)
---@return number  y (m)
---@return number  z (m)
---@return integer  id du noeud représentatif
function core_audioForest.getMainEmitterDebugState() end

--- Renvoie l'état d'outil actuellement chargé.
---Source : lua/ge/extensions/core/audioForest.lua:180
---@return table|nil  État d'outil (voir setPersistedToolState)
function core_audioForest.getPersistedToolState() end

--- Hook appelé quand les objets du niveau sont créés : charge la configuration du niveau et lance la pré-passe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/audioForest.lua:517
function core_audioForest.onClientCustomObjectSpawning() end

--- Hook appelé à la fin d'un niveau : réinitialise tout l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/audioForest.lua:587
function core_audioForest.onClientEndMission() end

--- Hook après rechargement Lua : relit la configuration du niveau et reconstruit l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/audioForest.lua:526
---@param data table Données de onSerialize (ignorées)
function core_audioForest.onDeserialized(data) end

--- Hook appelé par l'éditeur avant la sauvegarde du niveau : écrit l'état d'outil mémorisé dans levels/<niveau>/dynamicAudioEmitters/forestData.audioSFX.json.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/audioForest.lua:531
function core_audioForest.onEditorBeforeSaveLevel() end

--- Hook de sérialisation avant rechargement Lua : renvoie une table vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/audioForest.lua:522
---@return table  {}
function core_audioForest.onSerialize() end

--- Hook appelé à chaque frame par le système d'extensions : fait avancer la pré-passe de chargement, puis déplace l'émetteur principal et règle ses RTPC selon les noeuds proches de l'auditeur (SFXSystem.getPositionXYZ).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/audioForest.lua:299
---@param dtReal number Pas de temps réel (s)
---@param dtSim number Pas de temps simulation (s)
---@param dtRaw number Pas de temps brut (s)
function core_audioForest.onUpdate(dtReal, dtSim, dtRaw) end

--- Active ou désactive le système. À l'activation, crée l'émetteur principal s'il y a un événement et des noeuds ; à la désactivation, le supprime.
---Source : lua/ge/extensions/core/audioForest.lua:395
---@param v boolean true pour activer
function core_audioForest.setEnabled(v) end

--- Définit l'événement FMOD de l'émetteur principal (sans toucher à la roomtone). Chaîne vide : supprime l'émetteur. Sinon met à jour l'émetteur existant ou le crée si le système est actif et a des noeuds.
---Source : lua/ge/extensions/core/audioForest.lua:284
---@param eventName string|nil Nom de l'événement FMOD
function core_audioForest.setMainEvent(eventName) end

--- Installe un nuage de noeuds produit par audioForestCommon.buildNodeCloudFromForest (utilisé par l'éditeur ou le runtime). Récupère le terrain (core_terrain.getTerrain) et les paramètres globaux audio ; renvoie false et vide l'état si le nuage est invalide ou s'il n'y a pas de terrain.
---Source : lua/ge/extensions/core/audioForest.lua:253
---@param cloud table Nuage : nodeCount, nodeX, nodeY, nodeZ, nodeDepth, nodeAvgNormVol, nodeSourceCount, pitchDensityInv, kdNodes
---@return boolean  true si installé
function core_audioForest.setNodeCloud(cloud) end

--- Mémorise l'état de l'outil d'édition pour la sauvegarde du niveau.
---Source : lua/ge/extensions/core/audioForest.lua:175
---@param st table|nil Etat : version, mainEvent, roomtoneEnabled, roomtoneEvent, roomtoneZ, includeByShape, classSelByShape, classOverrideByShape, nodeVisDrawRadius, nodeVisSphereRadius, showNodes, selectedRow
function core_audioForest.setPersistedToolState(st) end

--- Remplace la normalisation automatique du pitch (inverse du nombre de sources de référence). nil ou valeur <= 0 : revient à l'automatique.
---Source : lua/ge/extensions/core/audioForest.lua:407
---@param v number|nil Facteur 1 / nombre de sources
function core_audioForest.setPitchDensityInv(v) end

--- Active ou coupe l'émetteur 'roomtone' indépendant (le crée s'il y a un événement roomtone).
---Source : lua/ge/extensions/core/audioForest.lua:416
---@param v boolean true pour activer
function core_audioForest.setRoomtoneEnabled(v) end

--- Définit l'événement de la roomtone. Sans effet visible tant que la roomtone n'est pas activée ; chaîne vide : supprime l'émetteur.
---Source : lua/ge/extensions/core/audioForest.lua:426
---@param eventName string|nil Nom de l'événement FMOD
function core_audioForest.setRoomtoneEvent(eventName) end

--- Fixe l'altitude de l'émetteur roomtone (positionné en x=0, y=0).
---Source : lua/ge/extensions/core/audioForest.lua:446
---@param v number|nil Altitude en mètres, 0 par défaut
function core_audioForest.setRoomtoneZ(v) end

