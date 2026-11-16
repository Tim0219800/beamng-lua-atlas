# `gameplay_drag_dragBridge`

*Fichier : `lua/ge/extensions/gameplay/drag/dragBridge.lua` · VM : Game Engine (GE) · 888 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drag_dragBridge` : `extensions.load("gameplay_drag_dragBridge")`, puis la globale `gameplay_drag_dragBridge`

Façade du système de drag pour les nœuds flowgraph (missions) et l'interface Vue. Elle ne contient presque pas de logique : elle renvoie vers gameplay_drag_core, saveSystem, rulesMenu, timeslip et phaseHandlers, fournit des données prêtes pour l'UI (infos de course, dial, état de l'arbre, temps en direct, règles de piste) et pousse des guihooks (dragRaceInfoChanged, dragDialDataChanged, onDragRaceLiveTimesData, onDragReset) quand l'état drag change. Un moddeur l'utilise pour démarrer/arrêter une course, définir des pilotes et des dials, ou générer des adversaires.

## Exemple

```lua
gameplay_drag_dragBridge.loadDragDataForMission('/levels/west_coast_usa/dragstrips/strip.dragSettings.json')
gameplay_drag_dragBridge.setVehicles({{id = playerId, lane = 1, isPlayable = true, dial = 11.5}})
gameplay_drag_dragBridge.startDragRaceActivity(1)
```

## Remarques

- startDragRace renvoie toujours une valeur vraie : l'expression est « startDragRaceActivity(...) or true », donc même un échec de démarrage renvoie true (seul l'absence de véhicule renvoie false).
- startDragRace ignore le paramètre vehicleId pour le démarrage (il ne sert qu'à vérifier que le véhicule existe) : core.startDragRaceActivity(lane or 1) est appelé sans véhicule.
- Les temps de vitesse (type 'velocity') sont en m/s ; l'UI reçoit value_kmh et value_mph (chaînes à 3 décimales).
- Les messages de phase de l'info HUD (Staging, On Tree, Racing, Stopping, Ready) sont en anglais en dur.
- onUpdate envoie à l'UI uniquement les timers dont la valeur a changé de plus de 0,0005 s (cache par couloir, vidé à chaque setup/reset/clear).
- getTimers/getRacerData renvoient {} quand rien n'est trouvé (alors que core.getRacerData renvoie nil).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drag_dragBridge.applyRulesRestore(levelId, stripId)` | Renvoie les règles sauvegardées d'une piste (délègue à rulesMenu.applyRulesRestore). | 548 |
| `gameplay_drag_dragBridge.applyRulesSave(levelId, stripId, rules)` | Sauvegarde les règles d'une piste (rulesMenu). En MP, les diffuse aux clients (broadcastRulesUpdate) ; applique aussi importantTimerId, dragType et treeType aux données de course en cours. | 527 |
| `gameplay_drag_dragBridge.cleanup()` | Arrête la course si elle est démarrée (stopDragRace). | 563 |
| `gameplay_drag_dragBridge.clearRacers()` | Supprime tous les racers des données courantes (core.reset avec clearRacers = true). | 400 |
| `gameplay_drag_dragBridge.clearTimeslip()` | Efface le ticket côté UI (core.reset avec timeslip = true). | 483 |
| `gameplay_drag_dragBridge.closeMenu()` | Ferme tous les menus de carrière (career_career.closeAllMenus). Sert aussi de callback de la laisse (tether). | 558 |
| `gameplay_drag_dragBridge.configureDragStrip(dragStrip)` | Compatibilité : renvoie true si dragStrip n'est pas nil. La config réelle est appliquée par core.setDragRaceData. | 118 |
| `gameplay_drag_dragBridge.createTimeslipData()` | Délègue à core.createTimeslipData. | 471 |
| `gameplay_drag_dragBridge.generateHashFromFile(vehicleId)` | Hash d'identification d'un véhicule/config pour le carnet de dial (saveSystem.generateHashFromFile). Sans argument, utilise le véhicule du joueur 0. | 421 |
| `gameplay_drag_dragBridge.generateOpponentsGroup(vehId, dial, vehiclePermissionRules, amount, offset)` | Construit une liste d'adversaires (model, config, paint) dont le temps time_1_4 (Performance Data ou Drag Times) est dans [dial - offset ; dial + 0,4[ et qui respectent les règles de permission de véhicule. Si aucun n'est éligible, reprend le véhicule du joueur. Exclut les configs simple_traffic. | 280 |
| `gameplay_drag_dragBridge.getActiveRacerId()` | ID du véhicule du premier racer jouable. | 232 |
| `gameplay_drag_dragBridge.getData()` | Délègue à core.getData. | 374 |
| `gameplay_drag_dragBridge.getDialTimes()` | Carnet des temps de dial sauvegardés (saveSystem.getDialTimes), indexé par hash de véhicule. | 417 |
| `gameplay_drag_dragBridge.getDragDialData()` | Données de dial du racer jouable local : vehicleId, dialValue (10 par défaut), isSet, importantTimerId, importantTimerLabel, isBracketRace. | 764 |
| `gameplay_drag_dragBridge.getDragInfoData()` | Toutes les données du widget HUD d'info drag : dragType, stripName, treeType et libellé, timer important, dial, isStarted/isCompleted, phase courante, liste des racers (nom, couloir, phase, dial, fini, DQ), et en MP manche courante, nombre de manches et liste d'attente. | 572 |
| `gameplay_drag_dragBridge.getDragIsStarted()` | Vrai si la course est démarrée. | 429 |
| `gameplay_drag_dragBridge.getDragRaceData()` | Données du racer jouable : vehicleId, lane, timers, isFinished, isDisqualified, disqualificationReason, currentPhase, damage, phases. | 151 |
| `gameplay_drag_dragBridge.getDragRaceRuntimeData()` | Données d'exécution du racer jouable : phase, isStarted, isCompleted, timers, phases, DQ, dégâts, vehiclePosition (vehPos), vehicleSpeed (vehSpeed). | 175 |
| `gameplay_drag_dragBridge.getDragStripInfo(dragStripId)` | Infos d'une piste : stripName, dragType, context, lanes, phases, prefabs, canBeTeleported, canBeReseted. Charge la piste par id (saveSystem.loadCompleteDragRaceData) ou utilise les données courantes. | 202 |
| `gameplay_drag_dragBridge.getHistory(id)` | Historique des courses d'une installation (saveSystem.getHistory). | 487 |
| `gameplay_drag_dragBridge.getPlayerRaceResult()` | Résultat du joueur d'après generateWinData : playerWin, playerPos, winners, dialDiff (temps du joueur moins son dial) et threshold (temps du meilleur adversaire non disqualifié moins celui du joueur). | 439 |
| `gameplay_drag_dragBridge.getRacerData(vehicleId)` | Table complète du racer d'un véhicule. | 379 |
| `gameplay_drag_dragBridge.getRulesScreenData(facilityIdOrStripId)` | Données de l'écran de règles Vue (délègue à rulesMenu.getRulesScreenData). | 521 |
| `gameplay_drag_dragBridge.getStripLaneInfo()` | Infos des couloirs de la première piste du niveau courant : liste lanes (index, longName, shortName, color), timers (ou DEFAULT_TIMERS) et importantTimerId. | 807 |
| `gameplay_drag_dragBridge.getTimers(vehicleId)` | Timers d'un racer. | 367 |
| `gameplay_drag_dragBridge.getTreeLightUIState()` | État de l'arbre pour l'UI, côté couloir du racer jouable : isStaging, stageLights (prestageLight, stageLight), countDownLights (amberLight1..3, greenLight, redLight), globalLights.blueLight. | 720 |
| `gameplay_drag_dragBridge.getWinnersData()` | Données de classement (phaseHandlers.generateWinData). | 435 |
| `gameplay_drag_dragBridge.isDragRaceActive()` | Vrai si une course est démarrée (compte à rebours ou en cours). | 227 |
| `gameplay_drag_dragBridge.loadDragDataForMission(filepath)` | Charge les données de piste depuis un fichier via core.loadDragDataForMission ; logue une erreur en cas d'échec. | 386 |
| `gameplay_drag_dragBridge.loadDragStrip(dragStripId)` | Charge une piste par id : essaie saveSystem.loadCompleteDragRaceData puis loadDragStripData. | 101 |
| `gameplay_drag_dragBridge.onDragClear()` | Hook : à l'effacement du drag, envoie nil aux guihooks dragRaceInfoChanged/dragDialDataChanged et cache les apps topLeft dragInfo et dragDialControl. *(interne)* *(hook)* | 854 |
| `gameplay_drag_dragBridge.onDragDataSet(data)` | Hook : piste armée ; pousse infos et dial à l'UI et affiche l'app topLeft dragInfo. *(interne)* *(hook)* | 840 |
| `gameplay_drag_dragBridge.onDragRaceListChanged()` | Hook MP : la liste des courses change ; pousse dragRaceInfoChanged. *(interne)* *(hook)* | 874 |
| `gameplay_drag_dragBridge.onDragRacePlayersUpdated()` | Hook MP : joueurs mis à jour ; pousse dragRaceInfoChanged. *(interne)* *(hook)* | 866 |
| `gameplay_drag_dragBridge.onDragRaceStarted()` | Hook MP : manche démarrée ; vide le cache de temps en direct et pousse dragRaceInfoChanged. *(interne)* *(hook)* | 878 |
| `gameplay_drag_dragBridge.onDragRaceStateChanged()` | Hook MP : l'état de course change ; pousse dragRaceInfoChanged. *(interne)* *(hook)* | 870 |
| `gameplay_drag_dragBridge.onDragRacersSetup(data)` | Hook émis par core.startDragRaceActivity : vide le cache de temps et pousse infos et dial à l'UI. *(interne)* *(hook)* | 834 |
| `gameplay_drag_dragBridge.onDragReset(opts)` | Hook de reset : vide le cache de temps, pousse infos et dial à l'UI et déclenche le guihook onDragReset. *(interne)* *(hook)* | 847 |
| `gameplay_drag_dragBridge.onMenuClosed()` | Hook : un menu est fermé ; supprime la laisse (tether) de proximité de l'installation. *(interne)* *(hook)* | 554 |
| `gameplay_drag_dragBridge.onRacerPhaseTransition(vehId, oldPhase, newPhase, newPhaseName)` | Hook émis par phaseHandlers lors d'un changement de phase d'un racer ; rafraîchit l'info HUD. *(interne)* *(hook)* | 862 |
| `gameplay_drag_dragBridge.onUpdate()` | Hook par frame : envoie à l'UI (onDragRaceLiveTimesData) les valeurs de timers nouvelles ou modifiées de chaque couloir, locales ou reçues du réseau. *(interne)* *(hook)* | 883 |
| `gameplay_drag_dragBridge.openHistoryScreen(facility)` | Ouvre l'écran d'historique drag (route mission.dragHistory) ; en carrière, pose une laisse sphérique de 4 m près de la porte de l'installation. | 495 |
| `gameplay_drag_dragBridge.openRulesScreen(facility)` | Ouvre l'écran Vue des règles et réglages drag (route mission.dragRules) pour une installation ; laisse de 4 m en carrière. | 505 |
| `gameplay_drag_dragBridge.openRulesScreenForStrip(levelId, stripId)` | Ouvre l'écran de règles pour une piste donnée (par ex. depuis l'UI du gamemode MP). | 515 |
| `gameplay_drag_dragBridge.reset(opts)` | Remet la course à zéro. Sans argument : reset complet (raceState, racers, timeslip, transitionLock, treeLightStaging, hooks) ; sinon transmet opts à core.reset. | 139 |
| `gameplay_drag_dragBridge.screenshotTimeslip()` | Prend une capture du ticket (gameplay_drag_timeslip.screenshotTimeslip). | 479 |
| `gameplay_drag_dragBridge.sendTimeslipDataToUi()` | Délègue à core.sendTimeslipDataToUi. | 475 |
| `gameplay_drag_dragBridge.setLocalPlayerDial(value)` | Fixe le dial du racer jouable local puis rafraîchit l'info HUD. | 793 |
| `gameplay_drag_dragBridge.setRacerDial(vehicleId, dialValue)` | Délègue à core.setRacerDial. | 404 |
| `gameplay_drag_dragBridge.setRacersDial(dials)` | Délègue à core.setRacersDial. | 408 |
| `gameplay_drag_dragBridge.setVehicles(vehicleIds)` | Crée plusieurs racers d'un coup et règle isPlayable et le dial (si > 0). | 346 |
| `gameplay_drag_dragBridge.setupRacer(vehicleId, lane)` | Délègue à core.setupRacer. | 341 |
| `gameplay_drag_dragBridge.showDialControl()` | Affiche l'app de réglage du dial (dragDialControl) dans le conteneur topLeft. | 802 |
| `gameplay_drag_dragBridge.startDragRace(vehicleId, lane)` | Démarre une course (core.startDragRaceActivity(lane or 1)) après avoir vérifié qu'un véhicule valide existe. | 123 |
| `gameplay_drag_dragBridge.startDragRaceActivity(lane)` | Délègue à core.startDragRaceActivity(lane). | 395 |
| `gameplay_drag_dragBridge.stopDragRace()` | Arrête la course : clear complet (hooks, transitionLock, localRace, extensions, data, context, ui, treeLightStaging). | 133 |
| `gameplay_drag_dragBridge.unloadRace()` | Même clear complet que stopDragRace, sans valeur de retour. | 413 |

### Détail des paramètres

#### `gameplay_drag_dragBridge.applyRulesRestore(levelId, stripId)`

Renvoie les règles sauvegardées d'une piste (délègue à rulesMenu.applyRulesRestore).

- `levelId` (*string*) : Identifiant du niveau.
- `stripId` (*string*) : Identifiant de la piste.
- **renvoie** : table|nil Règles, nil si rulesMenu absent.

#### `gameplay_drag_dragBridge.applyRulesSave(levelId, stripId, rules)`

Sauvegarde les règles d'une piste (rulesMenu). En MP, les diffuse aux clients (broadcastRulesUpdate) ; applique aussi importantTimerId, dragType et treeType aux données de course en cours.

- `levelId` (*string*) : Identifiant du niveau.
- `stripId` (*string*) : Identifiant de la piste.
- `rules` (*table*) : Règles (importantTimerId, dragType, treeType...).

#### `gameplay_drag_dragBridge.configureDragStrip(dragStrip)`

Compatibilité : renvoie true si dragStrip n'est pas nil. La config réelle est appliquée par core.setDragRaceData.

- `dragStrip` (*table|nil*) : Données de piste.
- **renvoie** : boolean dragStrip ~= nil.

#### `gameplay_drag_dragBridge.createTimeslipData()`

Délègue à core.createTimeslipData.

- **renvoie** : table Données du ticket.

#### `gameplay_drag_dragBridge.generateHashFromFile(vehicleId)`

Hash d'identification d'un véhicule/config pour le carnet de dial (saveSystem.generateHashFromFile). Sans argument, utilise le véhicule du joueur 0.

- `vehicleId` (*integer|nil*) : ID du véhicule.
- **renvoie** : string Hash.

#### `gameplay_drag_dragBridge.generateOpponentsGroup(vehId, dial, vehiclePermissionRules, amount, offset)`

Construit une liste d'adversaires (model, config, paint) dont le temps time_1_4 (Performance Data ou Drag Times) est dans [dial - offset ; dial + 0,4[ et qui respectent les règles de permission de véhicule. Si aucun n'est éligible, reprend le véhicule du joueur. Exclut les configs simple_traffic.

- `vehId` (*any*) : Identifiant utilisé pour core_vehicles.getVehicleDetails (nom de modèle/config du véhicule joueur, déduit du code).
- `dial` (*number|nil*) : Temps cible (s) ; défaut time_1_4 du véhicule, sinon 10.
- `vehiclePermissionRules` (*table[]*) : Règles {path = {clés...}, allowedValues = {...}} ou {path, value} testées sur le modèle.
- `amount` (*integer|nil*) : Nombre d'adversaires (défaut 1).
- `offset` (*number|nil*) : Marge basse du temps (défaut 0,1 s).
- **renvoie** : table[]|nil Liste {model, config, paint}, nil si entrée invalide ou pas de données de temps.

#### `gameplay_drag_dragBridge.getActiveRacerId()`

ID du véhicule du premier racer jouable.

- **renvoie** : integer|nil ID ou nil.

#### `gameplay_drag_dragBridge.getData()`

Délègue à core.getData.

- **renvoie** : table|nil dragData.

#### `gameplay_drag_dragBridge.getDialTimes()`

Carnet des temps de dial sauvegardés (saveSystem.getDialTimes), indexé par hash de véhicule.

- **renvoie** : table Temps par véhicule.

#### `gameplay_drag_dragBridge.getDragDialData()`

Données de dial du racer jouable local : vehicleId, dialValue (10 par défaut), isSet, importantTimerId, importantTimerLabel, isBracketRace.

- **renvoie** : table|nil Données, nil si indisponible.

#### `gameplay_drag_dragBridge.getDragInfoData()`

Toutes les données du widget HUD d'info drag : dragType, stripName, treeType et libellé, timer important, dial, isStarted/isCompleted, phase courante, liste des racers (nom, couloir, phase, dial, fini, DQ), et en MP manche courante, nombre de manches et liste d'attente.

- **renvoie** : table|nil Données, nil si aucune piste chargée.

#### `gameplay_drag_dragBridge.getDragIsStarted()`

Vrai si la course est démarrée.

- **renvoie** : boolean isStarted.

#### `gameplay_drag_dragBridge.getDragRaceData()`

Données du racer jouable : vehicleId, lane, timers, isFinished, isDisqualified, disqualificationReason, currentPhase, damage, phases.

- **renvoie** : table|nil Données ou nil.

#### `gameplay_drag_dragBridge.getDragRaceRuntimeData()`

Données d'exécution du racer jouable : phase, isStarted, isCompleted, timers, phases, DQ, dégâts, vehiclePosition (vehPos), vehicleSpeed (vehSpeed).

- **renvoie** : table|nil Données ou nil.

#### `gameplay_drag_dragBridge.getDragStripInfo(dragStripId)`

Infos d'une piste : stripName, dragType, context, lanes, phases, prefabs, canBeTeleported, canBeReseted. Charge la piste par id (saveSystem.loadCompleteDragRaceData) ou utilise les données courantes.

- `dragStripId` (*string|nil*) : Identifiant de piste ; nil = piste courante.
- **renvoie** : table|nil Infos ou nil.

#### `gameplay_drag_dragBridge.getHistory(id)`

Historique des courses d'une installation (saveSystem.getHistory).

- `id` (*string*) : Identifiant de l'installation/piste.
- **renvoie** : table Historique.

#### `gameplay_drag_dragBridge.getPlayerRaceResult()`

Résultat du joueur d'après generateWinData : playerWin, playerPos, winners, dialDiff (temps du joueur moins son dial) et threshold (temps du meilleur adversaire non disqualifié moins celui du joueur).

- **renvoie** : table {playerWin, playerPos, winners, dialDiff, threshold}.

#### `gameplay_drag_dragBridge.getRacerData(vehicleId)`

Table complète du racer d'un véhicule.

- `vehicleId` (*integer*) : ID du véhicule.
- **renvoie** : table Racer, {} si inconnu.

#### `gameplay_drag_dragBridge.getRulesScreenData(facilityIdOrStripId)`

Données de l'écran de règles Vue (délègue à rulesMenu.getRulesScreenData).

- `facilityIdOrStripId` (*string*) : Identifiant d'installation ou de piste.
- **renvoie** : table|nil Données, nil si rulesMenu absent.

#### `gameplay_drag_dragBridge.getStripLaneInfo()`

Infos des couloirs de la première piste du niveau courant : liste lanes (index, longName, shortName, color), timers (ou DEFAULT_TIMERS) et importantTimerId.

- **renvoie** : table|nil Infos ou nil.

#### `gameplay_drag_dragBridge.getTimers(vehicleId)`

Timers d'un racer.

- `vehicleId` (*integer*) : ID du véhicule.
- **renvoie** : table Timers, {} si inconnu.

#### `gameplay_drag_dragBridge.getTreeLightUIState()`

État de l'arbre pour l'UI, côté couloir du racer jouable : isStaging, stageLights (prestageLight, stageLight), countDownLights (amberLight1..3, greenLight, redLight), globalLights.blueLight.

- **renvoie** : table|nil État ou nil.

#### `gameplay_drag_dragBridge.getWinnersData()`

Données de classement (phaseHandlers.generateWinData).

- **renvoie** : table|nil Liste des résultats triés.

#### `gameplay_drag_dragBridge.isDragRaceActive()`

Vrai si une course est démarrée (compte à rebours ou en cours).

- **renvoie** : boolean isStarted.

#### `gameplay_drag_dragBridge.loadDragDataForMission(filepath)`

Charge les données de piste depuis un fichier via core.loadDragDataForMission ; logue une erreur en cas d'échec.

- `filepath` (*string*) : Chemin du fichier.
- **renvoie** : table|nil Données chargées.

#### `gameplay_drag_dragBridge.loadDragStrip(dragStripId)`

Charge une piste par id : essaie saveSystem.loadCompleteDragRaceData puis loadDragStripData.

- `dragStripId` (*string*) : Identifiant/chemin de piste.
- **renvoie** : table|nil Données de piste ou nil.

#### `gameplay_drag_dragBridge.onDragDataSet(data)`

Hook : piste armée ; pousse infos et dial à l'UI et affiche l'app topLeft dragInfo.

- `data` (*table*) : Données de piste.

#### `gameplay_drag_dragBridge.onDragRacersSetup(data)`

Hook émis par core.startDragRaceActivity : vide le cache de temps et pousse infos et dial à l'UI.

- `data` (*table*) : dragData.

#### `gameplay_drag_dragBridge.onDragReset(opts)`

Hook de reset : vide le cache de temps, pousse infos et dial à l'UI et déclenche le guihook onDragReset.

- `opts` (*table*) : Options du reset.

#### `gameplay_drag_dragBridge.onRacerPhaseTransition(vehId, oldPhase, newPhase, newPhaseName)`

Hook émis par phaseHandlers lors d'un changement de phase d'un racer ; rafraîchit l'info HUD.

- `vehId` (*integer*) : Véhicule.
- `oldPhase` (*integer*) : Ancienne phase.
- `newPhase` (*integer*) : Nouvelle phase.
- `newPhaseName` (*string*) : Nom de la nouvelle phase.

#### `gameplay_drag_dragBridge.openHistoryScreen(facility)`

Ouvre l'écran d'historique drag (route mission.dragHistory) ; en carrière, pose une laisse sphérique de 4 m près de la porte de l'installation.

- `facility` (*table*) : Installation (id, name, level).

#### `gameplay_drag_dragBridge.openRulesScreen(facility)`

Ouvre l'écran Vue des règles et réglages drag (route mission.dragRules) pour une installation ; laisse de 4 m en carrière.

- `facility` (*table*) : Installation (id, level).

#### `gameplay_drag_dragBridge.openRulesScreenForStrip(levelId, stripId)`

Ouvre l'écran de règles pour une piste donnée (par ex. depuis l'UI du gamemode MP).

- `levelId` (*string*) : Niveau.
- `stripId` (*string*) : Piste.

#### `gameplay_drag_dragBridge.reset(opts)`

Remet la course à zéro. Sans argument : reset complet (raceState, racers, timeslip, transitionLock, treeLightStaging, hooks) ; sinon transmet opts à core.reset.

- `opts` (*table|nil*) : Options de core.reset.
- **renvoie** : boolean false si aucune donnée drag, sinon true.

#### `gameplay_drag_dragBridge.screenshotTimeslip()`

Prend une capture du ticket (gameplay_drag_timeslip.screenshotTimeslip).

- **renvoie** : any Valeur renvoyée par timeslip.

#### `gameplay_drag_dragBridge.setLocalPlayerDial(value)`

Fixe le dial du racer jouable local puis rafraîchit l'info HUD.

- `value` (*number*) : Dial en secondes (>= 0).
- **renvoie** : boolean true si appliqué.

#### `gameplay_drag_dragBridge.setRacerDial(vehicleId, dialValue)`

Délègue à core.setRacerDial.

- `vehicleId` (*integer*) : ID du véhicule.
- `dialValue` (*number*) : Dial (s).
- **renvoie** : boolean true si appliqué.

#### `gameplay_drag_dragBridge.setRacersDial(dials)`

Délègue à core.setRacersDial.

- `dials` (*table[]*) : Liste {racerId, value}.
- **renvoie** : boolean true si au moins un appliqué.

#### `gameplay_drag_dragBridge.setVehicles(vehicleIds)`

Crée plusieurs racers d'un coup et règle isPlayable et le dial (si > 0).

- `vehicleIds` (*table[]*) : Liste de {id, lane, isPlayable, dial}.

#### `gameplay_drag_dragBridge.setupRacer(vehicleId, lane)`

Délègue à core.setupRacer.

- `vehicleId` (*integer*) : ID du véhicule.
- `lane` (*integer*) : Couloir.

#### `gameplay_drag_dragBridge.startDragRace(vehicleId, lane)`

Démarre une course (core.startDragRaceActivity(lane or 1)) après avoir vérifié qu'un véhicule valide existe.

- `vehicleId` (*integer|nil*) : Véhicule à vérifier (défaut : véhicule joueur 0).
- `lane` (*integer|nil*) : Couloir (défaut 1).
- **renvoie** : boolean false si aucun véhicule, sinon toujours true (voir notes).

#### `gameplay_drag_dragBridge.startDragRaceActivity(lane)`

Délègue à core.startDragRaceActivity(lane).

- `lane` (*integer|nil*) : Couloir.
- **renvoie** : boolean true si démarré.

#### `gameplay_drag_dragBridge.stopDragRace()`

Arrête la course : clear complet (hooks, transitionLock, localRace, extensions, data, context, ui, treeLightStaging).

- **renvoie** : boolean Toujours true.

**Évènements UI (guihooks.trigger) :** `dragDialDataChanged`, `dragRaceInfoChanged`, `onDragRaceLiveTimesData`, `onDragReset`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`, `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drag/dragBridge.lua`.*
