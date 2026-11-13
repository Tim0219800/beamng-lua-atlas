---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markerInteraction.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère chaque frame (onPreRender) l'affichage et l'interaction des marqueurs de mission/activité en freeroam et en carrière : sélectionne les clusters de marqueurs proches (rayon 100 m) via le quadtree de gameplay_playmodeMarkers, les affiche, met à jour leurs décalques au sol, et ouvre la fenêtre d'acceptation d'activité quand le joueur est à l'arrêt (moins de 1 km/h, avec hystérésis jusqu'à 3 km/h) ou à pied dans une zone. Gère aussi l'effacement du guidage à l'arrivée (moins de 7 m), le mode multi-joueur sur un écran (multiseat) et le formatage des missions pour l'UI. Les anciennes fonctions de lancement de mission sont dépréciées.
--- Accès : extension `gameplay_markerInteraction` : `extensions.load("gameplay_markerInteraction")`, puis la globale `gameplay_markerInteraction`
---@class gameplay_markerInteraction
---@field abandonCurrent nil Toujours nil : référence à une variable locale non définie.
---@field dependencies string[] gameplay_missions_missions, gameplay_missions_missionManager, freeroam_bigMapMode, gameplay_playmodeMarkers, freeroam_bigMapPoiProvider, ui_missionInfo.
---@field getClusterMarker nil Toujours nil : référence à une variable locale non définie.
---@field restartCurrent nil Toujours nil : référence à une variable locale non définie.
gameplay_markerInteraction = {}

--- Déprécié : logge une erreur et une trace de pile.
---Source : lua/ge/extensions/gameplay/markerInteraction.lua:138
---@param id string ID de mission (ignoré).
---@param settings table Ignoré.
function gameplay_markerInteraction.changeUserSettings(id, settings) end

--- Force la réévaluation de la fenêtre d'acceptation au prochain passage.
---Source : lua/ge/extensions/gameplay/markerInteraction.lua:651
function gameplay_markerInteraction.clearCache() end

--- Si force est vrai, ferme la fenêtre d'acceptation, envoie onMissionAvailabilityChanged avec missionCount = 0 à l'UI et aux extensions.
---Source : lua/ge/extensions/gameplay/markerInteraction.lua:211
---@param force boolean|nil Sans true, ne fait rien.
function gameplay_markerInteraction.closeViewDetailPrompt(force) end

--- Formate les missions des éléments interactifs courants pour l'UI, triées par gameplay_missions_unlocks.depthIdSort.
---Source : lua/ge/extensions/gameplay/markerInteraction.lua:114
---@return table[]|nil  Liste de missions formatées, ou nil.
function gameplay_markerInteraction.formatDataForUi() end

--- Construit la table de données d'une mission pour l'UI (nom, description, aperçu, réglages, attributs, progression, déblocages, boutons de contexte).
---Source : lua/ge/extensions/gameplay/markerInteraction.lua:66
---@param m table Objet mission.
---@return table  Informations de mission formatées pour l'interface.
function gameplay_markerInteraction.formatMission(m) end

--- Renvoie la liste des éléments actuellement interactifs (ceux de la fenêtre d'acceptation ouverte).
---Source : lua/ge/extensions/gameplay/markerInteraction.lua:61
---@return table[]  Éléments d'interaction des marqueurs.
function gameplay_markerInteraction.getCurrentInteractableElements() end

--- Renvoie les données de l'écran de mission via gameplay_missions_missionScreen.getMissionScreenData().
---Source : lua/ge/extensions/gameplay/markerInteraction.lua:149
---@param fromMissionMenu boolean|nil Non utilisé.
---@return table  Données de l'écran de mission.
function gameplay_markerInteraction.getGameContext(fromMissionMenu) end

--- Hook : à tout changement d'état de mission, force le renvoi des POI ; au démarrage (state == "started"), désélectionne la grande carte, retire les focus et ferme la fenêtre d'acceptation si ouverte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markerInteraction.lua:666
---@param state string État de la mission (par exemple "started").
function gameplay_markerInteraction.onAnyMissionChanged(state) end

--- Hook de fin de niveau : oublie le POI de navigation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markerInteraction.lua:685
---@param levelPath string Chemin du niveau.
function gameplay_markerInteraction.onClientEndMission(levelPath) end

--- Hook : remet à zéro les focus de marqueurs puis mémorise le POI vers lequel on navigue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markerInteraction.lua:678
---@param poiId string ID du POI cible.
function gameplay_markerInteraction.onNavigateToMission(poiId) end

--- Hook avant rendu, chaque frame : si l'état de jeu a des marqueurs de mode jeu, gère l'arrivée à la cible, le guidage et appelle l'affichage des marqueurs de mission du niveau courant ; sinon vide gameplay_playmodeMarkers.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markerInteraction.lua:603
---@param dtReal number Delta temps réel en secondes.
---@param dtSim number Delta temps de simulation en secondes.
function gameplay_markerInteraction.onPreRender(dtReal, dtSim) end

--- Appelée par l'UI quand le joueur choisit une entrée de la fenêtre d'acceptation : ferme le dialogue, vide ActivityAcceptUpdate et exécute le buttonFun de l'entrée choisie.
---Source : lua/ge/extensions/gameplay/markerInteraction.lua:199
---@param idx integer Indice de l'entrée (1-based) dans promptData.
function gameplay_markerInteraction.onSelectDetailPromptClicked(idx) end

--- Hook de changement de réglages : relit la résolution (GFXDevice.getVideoMode) et le rapport d'aspect.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markerInteraction.lua:221
function gameplay_markerInteraction.onSettingsChanged() end

--- Hook : à l'entrée en mode jeu (enteredPlay vrai), force la réévaluation de la fenêtre d'acceptation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markerInteraction.lua:713
---@param enteredPlay boolean true si l'UI passe en mode jeu.
function gameplay_markerInteraction.onUIPlayStateChanged(enteredPlay) end

--- Force la réévaluation de la fenêtre d'acceptation à la prochaine frame.
---Source : lua/ge/extensions/gameplay/markerInteraction.lua:709
function gameplay_markerInteraction.setForceReevaluateOpenPrompt() end

--- Affiche ou cache temporairement tous les marqueurs (sauf cluster en focus).
---Source : lua/ge/extensions/gameplay/markerInteraction.lua:689
---@param visible boolean true pour afficher.
function gameplay_markerInteraction.setMarkersVisibleTemporary(visible) end

--- Mémorise un ID de mission présélectionné (la variable n'est lue nulle part dans ce fichier).
---Source : lua/ge/extensions/gameplay/markerInteraction.lua:144
---@param mId string|nil ID de mission.
function gameplay_markerInteraction.setPreselectedMissionId(mId) end

--- À appeler quand le réglage d'affichage des marqueurs change : vide les POI bruts (gameplay_rawPois.clear) et force le renvoi des POI de grande carte.
---Source : lua/ge/extensions/gameplay/markerInteraction.lua:660
---@param active boolean Nouvel état (non utilisé).
function gameplay_markerInteraction.showMissionMarkersToggled(active) end

--- Active un drapeau local skipIconFading remis à false à la fin de la frame suivante (aucune lecture dans ce fichier).
---Source : lua/ge/extensions/gameplay/markerInteraction.lua:656
function gameplay_markerInteraction.skipNextIconFading() end

--- Déprécié : logge une erreur et une trace de pile, ne démarre rien.
---Source : lua/ge/extensions/gameplay/markerInteraction.lua:128
---@param id string ID de mission (ignoré).
---@param userSettings table|nil Ignoré.
---@param startingOptions table|nil Ignoré.
function gameplay_markerInteraction.startMissionById(id, userSettings, startingOptions) end

--- Déprécié : logge une erreur et une trace de pile.
---Source : lua/ge/extensions/gameplay/markerInteraction.lua:133
---@param id string ID de mission (ignoré).
---@param force boolean|nil Ignoré.
function gameplay_markerInteraction.stopMissionById(id, force) end

