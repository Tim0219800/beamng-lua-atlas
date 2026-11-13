---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/audioRibbon.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE (core_audioRibbon) : audio dynamique pour des 'rubans' (rivières, cascades, etc.) définis dans l'éditeur. Un ruban est une bande de quadrilatères (nodes par paires gauche/droite, avec profondeur). À chaque frame, pour l'auditeur (SFXSystem), le module suit le point le plus proche sur chaque ruban proche et pilote jusqu'à 5 émetteurs SFX par évènement (1 'A' central/ambiant, puis 4 autour de l'auditeur : F devant, B derrière, R droite, L gauche) en réglant volume, pitch, color et texture (RTPC) d'après largeur, profondeur et vitesse du ruban. Les rubans sont chargés de levels/<niveau>/dynamicAudioEmitters/ribbonData.audioSFX.json (format JSON lignes, un ruban par ligne), écrits par l'éditeur à la sauvegarde. Beaucoup de fonctions exportées servent surtout à l'éditeur.
--- Accès : extension `core_audioRibbon` : `extensions.load("core_audioRibbon")`, puis la globale `core_audioRibbon`
---@class core_audioRibbon
core_audioRibbon = {}

--- Supprime tous les objets SFXEmitter dynamiques (5 axes) et vide leur table.
---Source : lua/ge/extensions/core/audioRibbon.lua:494
function core_audioRibbon.clearAllSFXEmitters() end

--- Vide les listes near, mid et far (elles seront reconstruites à la frame suivante).
---Source : lua/ge/extensions/core/audioRibbon.lua:802
function core_audioRibbon.clearNearFarLists() end

--- Vide la table des noms de rubans.
---Source : lua/ge/extensions/core/audioRibbon.lua:809
function core_audioRibbon.clearRibbonNames() end

--- Crée l'enregistrement d'un hôte d'émetteur dynamique (position initiale à l'infini, bestSeg 0, direction 1).
---Source : lua/ge/extensions/core/audioRibbon.lua:535
---@param eventName string Nom de l'évènement FMOD
---@return table  {bestSeg, dir, vol, pos, bN, eventNameStr}
function core_audioRibbon.createEmitterHost(eventName) end

--- Renvoie la liste far (rubans lointains, un seul visité par frame).
---Source : lua/ge/extensions/core/audioRibbon.lua:817
---@return table<string, integer>  Liste far
function core_audioRibbon.getFarList() end

--- Renvoie la liste mid (rubans à moins de 400 m, seulement le point interne mis à jour).
---Source : lua/ge/extensions/core/audioRibbon.lua:816
---@return table<string, integer>  Liste mid
function core_audioRibbon.getMidList() end

--- Renvoie la liste near (persistantId -> indice de ruban), au plus 2 rubans.
---Source : lua/ge/extensions/core/audioRibbon.lua:815
---@return table<string, integer>  Liste near
function core_audioRibbon.getNearList() end

--- Renvoie la table des identifiants de rubans connus (persistantId -> true).
---Source : lua/ge/extensions/core/audioRibbon.lua:814
---@return table<string, boolean>  Table des identifiants
function core_audioRibbon.getRibbonNames() end

--- Renvoie la liste des rubans (nil avant le premier chargement).
---Source : lua/ge/extensions/core/audioRibbon.lua:812
---@return table|nil  Liste de rubans
function core_audioRibbon.getRibbons() end

--- Renvoie les 5 tables d'émetteurs SFX par axe, indexées par nom d'évènement ({emitter, vol, pitch, color, texture, pos}).
---Source : lua/ge/extensions/core/audioRibbon.lua:818
---@return table  Tableau de 5 tables
function core_audioRibbon.getSfxEmitters() end

--- Hook appelé quand les objets du niveau sont créés : réinitialise les rubans puis relit le fichier ribbonData.audioSFX.json du niveau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/audioRibbon.lua:792
function core_audioRibbon.onClientCustomObjectSpawning() end

--- Hook appelé à la fin du niveau : supprime les émetteurs et vide les rubans (resetRibbons).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/audioRibbon.lua:778
function core_audioRibbon.onClientEndMission() end

--- Hook de restauration après rechargement Lua : reconstruit les rubans (nodes en vec3, hôtes d'émetteurs, widths, numSegs) et la table des noms.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/audioRibbon.lua:721
---@param data table|nil Données de onSerialize
function core_audioRibbon.onDeserialized(data) end

--- Hook appelé avant la sauvegarde du niveau dans l'éditeur : écrit les rubans dans levels/<niveau>/dynamicAudioEmitters/ribbonData.audioSFX.json (triés par nom).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/audioRibbon.lua:769
function core_audioRibbon.onEditorBeforeSaveLevel() end

--- Hook appelé à la fermeture du jeu : supprime tous les émetteurs SFX dynamiques.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/audioRibbon.lua:494
function core_audioRibbon.onExit() end

--- Hook de sérialisation avant rechargement Lua : renvoie une copie complète des rubans puis SUPPRIME tous les rubans et émetteurs. Renvoie nil s'il n'y a pas de ruban.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/audioRibbon.lua:708
---@return table|nil  Liste de rubans sérialisés
function core_audioRibbon.onSerialize() end

--- Hook appelé à chaque frame : lit la pose de l'auditeur, met à jour les listes near/mid/far, calcule pour chaque ruban proche les points les plus proches et les RTPC, puis crée/pilote les émetteurs SFXEmitter (positions et setVolumePitchCT). Ne fait rien s'il n'y a pas de ruban.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/audioRibbon.lua:311
---@param dtReal number Pas de temps réel (s)
---@param dtSim number Pas de temps simulation (s)
---@param dtRaw number Pas de temps brut (s)
function core_audioRibbon.onUpdate(dtReal, dtSim, dtRaw) end

--- Reconstruit la table des noms (persistantId -> true) à partir des rubans.
---Source : lua/ge/extensions/core/audioRibbon.lua:486
function core_audioRibbon.recomputeMap() end

--- Supprime tous les émetteurs SFX, retire le ruban d'indice idx de la liste et de la table des noms, et vide les listes near/mid/far.
---Source : lua/ge/extensions/core/audioRibbon.lua:506
---@param idx integer Indice du ruban dans getRibbons()
function core_audioRibbon.removeRibbon(idx) end

--- Remplace la liste des rubans (utilisé par l'éditeur).
---Source : lua/ge/extensions/core/audioRibbon.lua:813
---@param val table Nouvelle liste
function core_audioRibbon.setRibbons(val) end

--- À appeler après toute modification des noeuds d'un ruban : remet bestSeg=1 et dir=1 pour les 5 hôtes, recalcule ribbon.numSegs = max(0, (#nodes - 4)/2 + 1) et ribbon.widths (distance entre les deux noeuds de chaque paire).
---Source : lua/ge/extensions/core/audioRibbon.lua:517
---@param ribbon table Ruban (nodes, emitters) modifié en place
function core_audioRibbon.updateRibbonData(ribbon) end

