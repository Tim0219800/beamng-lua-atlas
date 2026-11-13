---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/dragBridge.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Façade du système de drag pour les nœuds flowgraph (missions) et l'interface Vue. Elle ne contient presque pas de logique : elle renvoie vers gameplay_drag_core, saveSystem, rulesMenu, timeslip et phaseHandlers, fournit des données prêtes pour l'UI (infos de course, dial, état de l'arbre, temps en direct, règles de piste) et pousse des guihooks (dragRaceInfoChanged, dragDialDataChanged, onDragRaceLiveTimesData, onDragReset) quand l'état drag change. Un moddeur l'utilise pour démarrer/arrêter une course, définir des pilotes et des dials, ou générer des adversaires.
--- Accès : extension `gameplay_drag_dragBridge` : `extensions.load("gameplay_drag_dragBridge")`, puis la globale `gameplay_drag_dragBridge`
---@class gameplay_drag_dragBridge
gameplay_drag_dragBridge = {}

--- Renvoie les règles sauvegardées d'une piste (délègue à rulesMenu.applyRulesRestore).
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:548
---@param levelId string Identifiant du niveau.
---@param stripId string Identifiant de la piste.
---@return table|nil  Règles, nil si rulesMenu absent.
function gameplay_drag_dragBridge.applyRulesRestore(levelId, stripId) end

--- Sauvegarde les règles d'une piste (rulesMenu). En MP, les diffuse aux clients (broadcastRulesUpdate) ; applique aussi importantTimerId, dragType et treeType aux données de course en cours.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:527
---@param levelId string Identifiant du niveau.
---@param stripId string Identifiant de la piste.
---@param rules table Règles (importantTimerId, dragType, treeType...).
function gameplay_drag_dragBridge.applyRulesSave(levelId, stripId, rules) end

--- Arrête la course si elle est démarrée (stopDragRace).
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:563
function gameplay_drag_dragBridge.cleanup() end

--- Supprime tous les racers des données courantes (core.reset avec clearRacers = true).
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:400
function gameplay_drag_dragBridge.clearRacers() end

--- Efface le ticket côté UI (core.reset avec timeslip = true).
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:483
function gameplay_drag_dragBridge.clearTimeslip() end

--- Ferme tous les menus de carrière (career_career.closeAllMenus). Sert aussi de callback de la laisse (tether).
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:558
function gameplay_drag_dragBridge.closeMenu() end

--- Compatibilité : renvoie true si dragStrip n'est pas nil. La config réelle est appliquée par core.setDragRaceData.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:118
---@param dragStrip table|nil Données de piste.
---@return boolean  dragStrip ~= nil.
function gameplay_drag_dragBridge.configureDragStrip(dragStrip) end

--- Délègue à core.createTimeslipData.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:471
---@return table  Données du ticket.
function gameplay_drag_dragBridge.createTimeslipData() end

--- Hash d'identification d'un véhicule/config pour le carnet de dial (saveSystem.generateHashFromFile). Sans argument, utilise le véhicule du joueur 0.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:421
---@param vehicleId integer|nil ID du véhicule.
---@return string  Hash.
function gameplay_drag_dragBridge.generateHashFromFile(vehicleId) end

--- Construit une liste d'adversaires (model, config, paint) dont le temps time_1_4 (Performance Data ou Drag Times) est dans [dial - offset ; dial + 0,4[ et qui respectent les règles de permission de véhicule. Si aucun n'est éligible, reprend le véhicule du joueur. Exclut les configs simple_traffic.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:280
---@param vehId any Identifiant utilisé pour core_vehicles.getVehicleDetails (nom de modèle/config du véhicule joueur, déduit du code).
---@param dial number|nil Temps cible (s) ; défaut time_1_4 du véhicule, sinon 10.
---@param vehiclePermissionRules table[] Règles {path = {clés...}, allowedValues = {...}} ou {path, value} testées sur le modèle.
---@param amount integer|nil Nombre d'adversaires (défaut 1).
---@param offset number|nil Marge basse du temps (défaut 0,1 s).
---@return table[]|nil  Liste {model, config, paint}, nil si entrée invalide ou pas de données de temps.
function gameplay_drag_dragBridge.generateOpponentsGroup(vehId, dial, vehiclePermissionRules, amount, offset) end

--- ID du véhicule du premier racer jouable.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:232
---@return integer|nil  ID ou nil.
function gameplay_drag_dragBridge.getActiveRacerId() end

--- Délègue à core.getData.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:374
---@return table|nil  dragData.
function gameplay_drag_dragBridge.getData() end

--- Carnet des temps de dial sauvegardés (saveSystem.getDialTimes), indexé par hash de véhicule.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:417
---@return table  Temps par véhicule.
function gameplay_drag_dragBridge.getDialTimes() end

--- Données de dial du racer jouable local : vehicleId, dialValue (10 par défaut), isSet, importantTimerId, importantTimerLabel, isBracketRace.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:764
---@return table|nil  Données, nil si indisponible.
function gameplay_drag_dragBridge.getDragDialData() end

--- Toutes les données du widget HUD d'info drag : dragType, stripName, treeType et libellé, timer important, dial, isStarted/isCompleted, phase courante, liste des racers (nom, couloir, phase, dial, fini, DQ), et en MP manche courante, nombre de manches et liste d'attente.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:572
---@return table|nil  Données, nil si aucune piste chargée.
function gameplay_drag_dragBridge.getDragInfoData() end

--- Vrai si la course est démarrée.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:429
---@return boolean  isStarted.
function gameplay_drag_dragBridge.getDragIsStarted() end

--- Données du racer jouable : vehicleId, lane, timers, isFinished, isDisqualified, disqualificationReason, currentPhase, damage, phases.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:151
---@return table|nil  Données ou nil.
function gameplay_drag_dragBridge.getDragRaceData() end

--- Données d'exécution du racer jouable : phase, isStarted, isCompleted, timers, phases, DQ, dégâts, vehiclePosition (vehPos), vehicleSpeed (vehSpeed).
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:175
---@return table|nil  Données ou nil.
function gameplay_drag_dragBridge.getDragRaceRuntimeData() end

--- Infos d'une piste : stripName, dragType, context, lanes, phases, prefabs, canBeTeleported, canBeReseted. Charge la piste par id (saveSystem.loadCompleteDragRaceData) ou utilise les données courantes.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:202
---@param dragStripId string|nil Identifiant de piste ; nil = piste courante.
---@return table|nil  Infos ou nil.
function gameplay_drag_dragBridge.getDragStripInfo(dragStripId) end

--- Historique des courses d'une installation (saveSystem.getHistory).
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:487
---@param id string Identifiant de l'installation/piste.
---@return table  Historique.
function gameplay_drag_dragBridge.getHistory(id) end

--- Résultat du joueur d'après generateWinData : playerWin, playerPos, winners, dialDiff (temps du joueur moins son dial) et threshold (temps du meilleur adversaire non disqualifié moins celui du joueur).
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:439
---@return table  {playerWin, playerPos, winners, dialDiff, threshold}.
function gameplay_drag_dragBridge.getPlayerRaceResult() end

--- Table complète du racer d'un véhicule.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:379
---@param vehicleId integer ID du véhicule.
---@return table  Racer, {} si inconnu.
function gameplay_drag_dragBridge.getRacerData(vehicleId) end

--- Données de l'écran de règles Vue (délègue à rulesMenu.getRulesScreenData).
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:521
---@param facilityIdOrStripId string Identifiant d'installation ou de piste.
---@return table|nil  Données, nil si rulesMenu absent.
function gameplay_drag_dragBridge.getRulesScreenData(facilityIdOrStripId) end

--- Infos des couloirs de la première piste du niveau courant : liste lanes (index, longName, shortName, color), timers (ou DEFAULT_TIMERS) et importantTimerId.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:807
---@return table|nil  Infos ou nil.
function gameplay_drag_dragBridge.getStripLaneInfo() end

--- Timers d'un racer.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:367
---@param vehicleId integer ID du véhicule.
---@return table  Timers, {} si inconnu.
function gameplay_drag_dragBridge.getTimers(vehicleId) end

--- État de l'arbre pour l'UI, côté couloir du racer jouable : isStaging, stageLights (prestageLight, stageLight), countDownLights (amberLight1..3, greenLight, redLight), globalLights.blueLight.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:720
---@return table|nil  État ou nil.
function gameplay_drag_dragBridge.getTreeLightUIState() end

--- Données de classement (phaseHandlers.generateWinData).
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:435
---@return table|nil  Liste des résultats triés.
function gameplay_drag_dragBridge.getWinnersData() end

--- Vrai si une course est démarrée (compte à rebours ou en cours).
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:227
---@return boolean  isStarted.
function gameplay_drag_dragBridge.isDragRaceActive() end

--- Charge les données de piste depuis un fichier via core.loadDragDataForMission ; logue une erreur en cas d'échec.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:386
---@param filepath string Chemin du fichier.
---@return table|nil  Données chargées.
function gameplay_drag_dragBridge.loadDragDataForMission(filepath) end

--- Charge une piste par id : essaie saveSystem.loadCompleteDragRaceData puis loadDragStripData.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:101
---@param dragStripId string Identifiant/chemin de piste.
---@return table|nil  Données de piste ou nil.
function gameplay_drag_dragBridge.loadDragStrip(dragStripId) end

--- Hook : à l'effacement du drag, envoie nil aux guihooks dragRaceInfoChanged/dragDialDataChanged et cache les apps topLeft dragInfo et dragDialControl.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:854
function gameplay_drag_dragBridge.onDragClear() end

--- Hook : piste armée ; pousse infos et dial à l'UI et affiche l'app topLeft dragInfo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:840
---@param data table Données de piste.
function gameplay_drag_dragBridge.onDragDataSet(data) end

--- Hook MP : la liste des courses change ; pousse dragRaceInfoChanged.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:874
function gameplay_drag_dragBridge.onDragRaceListChanged() end

--- Hook MP : joueurs mis à jour ; pousse dragRaceInfoChanged.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:866
function gameplay_drag_dragBridge.onDragRacePlayersUpdated() end

--- Hook MP : manche démarrée ; vide le cache de temps en direct et pousse dragRaceInfoChanged.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:878
function gameplay_drag_dragBridge.onDragRaceStarted() end

--- Hook MP : l'état de course change ; pousse dragRaceInfoChanged.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:870
function gameplay_drag_dragBridge.onDragRaceStateChanged() end

--- Hook émis par core.startDragRaceActivity : vide le cache de temps et pousse infos et dial à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:834
---@param data table dragData.
function gameplay_drag_dragBridge.onDragRacersSetup(data) end

--- Hook de reset : vide le cache de temps, pousse infos et dial à l'UI et déclenche le guihook onDragReset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:847
---@param opts table Options du reset.
function gameplay_drag_dragBridge.onDragReset(opts) end

--- Hook : un menu est fermé ; supprime la laisse (tether) de proximité de l'installation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:554
function gameplay_drag_dragBridge.onMenuClosed() end

--- Hook émis par phaseHandlers lors d'un changement de phase d'un racer ; rafraîchit l'info HUD.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:862
---@param vehId integer Véhicule.
---@param oldPhase integer Ancienne phase.
---@param newPhase integer Nouvelle phase.
---@param newPhaseName string Nom de la nouvelle phase.
function gameplay_drag_dragBridge.onRacerPhaseTransition(vehId, oldPhase, newPhase, newPhaseName) end

--- Hook par frame : envoie à l'UI (onDragRaceLiveTimesData) les valeurs de timers nouvelles ou modifiées de chaque couloir, locales ou reçues du réseau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:883
function gameplay_drag_dragBridge.onUpdate() end

--- Ouvre l'écran d'historique drag (route mission.dragHistory) ; en carrière, pose une laisse sphérique de 4 m près de la porte de l'installation.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:495
---@param facility table Installation (id, name, level).
function gameplay_drag_dragBridge.openHistoryScreen(facility) end

--- Ouvre l'écran Vue des règles et réglages drag (route mission.dragRules) pour une installation ; laisse de 4 m en carrière.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:505
---@param facility table Installation (id, level).
function gameplay_drag_dragBridge.openRulesScreen(facility) end

--- Ouvre l'écran de règles pour une piste donnée (par ex. depuis l'UI du gamemode MP).
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:515
---@param levelId string Niveau.
---@param stripId string Piste.
function gameplay_drag_dragBridge.openRulesScreenForStrip(levelId, stripId) end

--- Remet la course à zéro. Sans argument : reset complet (raceState, racers, timeslip, transitionLock, treeLightStaging, hooks) ; sinon transmet opts à core.reset.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:139
---@param opts table|nil Options de core.reset.
---@return boolean  false si aucune donnée drag, sinon true.
function gameplay_drag_dragBridge.reset(opts) end

--- Prend une capture du ticket (gameplay_drag_timeslip.screenshotTimeslip).
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:479
---@return any  Valeur renvoyée par timeslip.
function gameplay_drag_dragBridge.screenshotTimeslip() end

--- Délègue à core.sendTimeslipDataToUi.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:475
function gameplay_drag_dragBridge.sendTimeslipDataToUi() end

--- Fixe le dial du racer jouable local puis rafraîchit l'info HUD.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:793
---@param value number Dial en secondes (>= 0).
---@return boolean  true si appliqué.
function gameplay_drag_dragBridge.setLocalPlayerDial(value) end

--- Délègue à core.setRacerDial.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:404
---@param vehicleId integer ID du véhicule.
---@param dialValue number Dial (s).
---@return boolean  true si appliqué.
function gameplay_drag_dragBridge.setRacerDial(vehicleId, dialValue) end

--- Délègue à core.setRacersDial.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:408
---@param dials table[] Liste {racerId, value}.
---@return boolean  true si au moins un appliqué.
function gameplay_drag_dragBridge.setRacersDial(dials) end

--- Crée plusieurs racers d'un coup et règle isPlayable et le dial (si > 0).
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:346
---@param vehicleIds table[] Liste de {id, lane, isPlayable, dial}.
function gameplay_drag_dragBridge.setVehicles(vehicleIds) end

--- Délègue à core.setupRacer.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:341
---@param vehicleId integer ID du véhicule.
---@param lane integer Couloir.
function gameplay_drag_dragBridge.setupRacer(vehicleId, lane) end

--- Affiche l'app de réglage du dial (dragDialControl) dans le conteneur topLeft.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:802
function gameplay_drag_dragBridge.showDialControl() end

--- Démarre une course (core.startDragRaceActivity(lane or 1)) après avoir vérifié qu'un véhicule valide existe.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:123
---@param vehicleId integer|nil Véhicule à vérifier (défaut : véhicule joueur 0).
---@param lane integer|nil Couloir (défaut 1).
---@return boolean  false si aucun véhicule, sinon toujours true (voir notes).
function gameplay_drag_dragBridge.startDragRace(vehicleId, lane) end

--- Délègue à core.startDragRaceActivity(lane).
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:395
---@param lane integer|nil Couloir.
---@return boolean  true si démarré.
function gameplay_drag_dragBridge.startDragRaceActivity(lane) end

--- Arrête la course : clear complet (hooks, transitionLock, localRace, extensions, data, context, ui, treeLightStaging).
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:133
---@return boolean  Toujours true.
function gameplay_drag_dragBridge.stopDragRace() end

--- Même clear complet que stopDragRace, sans valeur de retour.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:413
function gameplay_drag_dragBridge.unloadRace() end

