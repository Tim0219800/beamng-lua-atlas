# `gameplay_drag_phaseHandlers`

*Fichier : `lua/ge/extensions/gameplay/drag/phaseHandlers.lua` · VM : Game Engine (GE) · 1232 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drag_phaseHandlers` : `extensions.load("gameplay_drag_phaseHandlers")`, puis la globale `gameplay_drag_phaseHandlers`

Logique de phases d'une course de drag : stage (placement sur la ligne de stage), countdown (arbre de départ), race (course jusqu'au dernier timer de distance), stop (arrêt du véhicule) et emergencyStop. Il met à jour la position/vitesse/roues des racers (updateRacer), détecte pré-stage et stage par distance des roues avant, applique les règles de disqualification (faux départ, hors couloir, immobile trop longtemps, crash), pilote les véhicules IA par queueLuaCommand (ai.setSpeed, transbrake, nitro, throttleOverride), gère les transitions de phase et le re-staging après DQ en freeroam. Les fonctions de phase sont appelées par les extensions dragTypes_* (headsUpRace/bracketRace) à chaque frame pour chaque racer.

## Remarques

- Constantes : arrêt quand la vitesse <= 15 m/s ou après 300 m de phase stop ; pré-stage à -0.178 m, stage à 0 m (fenêtre de ±0.178 m) ; sortie des feux au-delà de 0.4 m ; stage validé après 1 s continue avec roues avant parallèles à la ligne (|dot| >= 0.70).
- Disqualifications : faux départ (roue avant < -0.178 - 0.02 ou >= 0.178 m pendant le décompte, raison redLightReason), hors couloir (distance < -0.33 m ou inLane faux), immobile > 5 s (vitesse < 1 m/s), crash (z du vecteur haut < 0.2) ou immobilité (moins de 3 m en 3 s) pendant la course. Jamais de DQ en phase 1 (stage).
- Les chaînes de raison de DQ sont des clés de traduction missions.dragRace.gameplay.disqualified.*.
- Les IA freinent puis rampent (0.5 m/s) sur les 0.5 derniers mètres avant la ligne de stage ; leur accélérateur est réduit (min 0.5) si le nez se cabre au-delà de ~17 à 33 degrés.
- La phase de course se termine quand le timer à la plus grande distance (raceEndTimerId) est défini, pas le timer important.
- Hooks émis : onPhaseTransition (abortable via setPhaseTransitionAbort), onRacerPhaseTransition, preStageLightOn/Off, stageLightOn/Off, stageStarted, startDragCountdown, dragRaceStarted, dragRaceEndLineReached, stoppingVehicleDrag, dragRaceVehicleStopped, setDisqualifiedLights, onWinnerLightOn.
- En MP, les racers distants (isLocalRacer == false ou vehId < 0) n'ont pas de données de position et sont exemptés du test de couloir ; leur staging est tenu 1 s via setRemoteStagingState.
- Les commandes IA sont envoyées en texte à la VM du véhicule, avec le nom des waypoints (endLine, drag_stop ou autoStopName) du niveau.

**Dépendances (chargées avant) :** `gameplay_drag_core`, `gameplay_drag_times`, `gameplay_drag_saveSystem`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drag_phaseHandlers.areAllRacersStaged(dragData)` | Indique si tous les racers sont en staging (phase 1 terminée, dans leur couloir, ou déjà finis) et si leur nombre atteint le minimum attendu (core.getExpectedStagingRacerCount). | 433 |
| `gameplay_drag_phaseHandlers.calculateDistanceOfAllWheelsFromStagePos(racer)` | Calcule, pour chaque groupe de roues du racer, le vecteur centre de roues moins la position du point de stage de son couloir (racer._wheelDistances). | 58 |
| `gameplay_drag_phaseHandlers.changeAllPhases()` | Fait passer à la phase suivante tous les racers dont la phase courante est complétée. | 381 |
| `gameplay_drag_phaseHandlers.changeRacerPhase(racer, expectedCurrentPhase)` | Fait avancer un racer d'une phase (ou le marque fini après la dernière). Refuse si une transition est déjà en cours, si la phase attendue diffère, si le racer est hors couloir pour entrer en phase 2 ou 3, ou si un hook onPhaseTransition appelle setPhaseTransitionAbort. Émet onPhaseTransition (avant) et onRacerPhaseTransition (après, newPhase nil et nom 'finished' si fini). | 313 |
| `gameplay_drag_phaseHandlers.checkFreeroamDqReStage(dtSim)` | En freeroam solo/multiseat (hors gamemode drag MP), gère le re-staging après DQ : 6 s après la DQ, si le joueur est à plus de 6 m derrière la ligne, relance la course (reset puis startDragRaceActivity) ; entre -6 et +6 m, affiche une fois le message ui.drag.flash.reverseToRestage. Renvoie 'leftArea' si le seul racer recule à plus de 15 m. | 637 |
| `gameplay_drag_phaseHandlers.clearDqRestageState()` | Vide l'état de re-staging après DQ. | 629 |
| `gameplay_drag_phaseHandlers.clearRacerTransitionLock(vehId)` | Supprime le verrou de transition (et le drapeau d'abandon) d'un racer, ou de tous si vehId est nil. | 299 |
| `gameplay_drag_phaseHandlers.clearRemoteStagingHoldTimers()` | Vide les minuteries de maintien du staging distant (MP). | 625 |
| `gameplay_drag_phaseHandlers.countdown(phase, racer, dtSim)` | Phase 2 (arbre) pour un racer. Démarre le décompte (émet startDragCountdown avec le dial), prépare l'IA (agressivité 2, two-step, transbrake ou freeze, throttleOverride = 1), et disqualifie pour faux départ ou sortie de couloir (met reactionTimeInvalid et appelle startRaceFromTree avant disqualifyRacer). *(interne)* | 715 |
| `gameplay_drag_phaseHandlers.disqualifyRacer(racer, reason)` | Disqualifie un racer (jamais en phase 1, ni hors freeroam tant que la course n'est pas démarrée). Pour une IA, remet throttleOverride à nil. Émet setDisqualifiedLights. | 236 |
| `gameplay_drag_phaseHandlers.emergencyStop(phase, racer, dtSim)` | Phase d'arrêt d'urgence : pour une IA, coupe nitro/jato et throttleOverride, impose ai.setSpeed(0) ; la phase est complétée quand la vitesse <= 0.01 m/s. *(interne)* | 1052 |
| `gameplay_drag_phaseHandlers.generateWinData()` | Demande à l'extension de type de course (ext.generateWinData) la liste triée des résultats et émet onWinnerLightOn pour le couloir du premier. | 280 |
| `gameplay_drag_phaseHandlers.getFrontWheelDistanceFromStagePos(racer)` | Distance signée (m) des roues avant à la ligne de stage, projetée sur l'axe stage-arrivée du couloir (négatif avant la ligne). | 50 |
| `gameplay_drag_phaseHandlers.getImportantTimerValueForWin(racer, data)` | Valeur du timer important pour le classement (délègue à gameplay_drag_times). | 174 |
| `gameplay_drag_phaseHandlers.isRacerInsideBoundary(racer)` | Vrai si toutes les roues du racer (centres par groupe, sinon la position du véhicule) sont dans la zone de son couloir et, s'il y a plusieurs racers, pas dans la zone d'un autre couloir occupé. | 93 |
| `gameplay_drag_phaseHandlers.onDragClear()` | Hook de clear : vide les minuteries de staging distant et l'état de re-staging. *(interne)* *(hook)* | 1227 |
| `gameplay_drag_phaseHandlers.onExtensionLoaded()` | Hook de chargement : logue une erreur si gameplay_drag_core est absent. *(interne)* *(hook)* | 43 |
| `gameplay_drag_phaseHandlers.race(phase, racer, dtSim)` | Phase 3 (course). Lance l'IA (jato, transbrake relâché, throttleOverride = 1, vitesse et cible de l'endLine), détecte crash/immobilité/sortie de couloir, régule le cabrage des IA, et termine quand le timer de fin de course est défini : émet dragRaceEndLineReached, en MP envoie le temps brut à l'hôte, sinon génère les résultats et le ticket quand tous ont fini. *(interne)* | 838 |
| `gameplay_drag_phaseHandlers.setDialsData(data)` | Calcule les délais de départ (dialsData) par véhicule : 1 racer = 0 ; 2 racers = l'écart de dial est ajouté au racer au dial le plus bas ; plus de 2 = le dial de chacun. | 1178 |
| `gameplay_drag_phaseHandlers.setPhaseTransitionAbort(vehId)` | À appeler depuis un hook onPhaseTransition pour annuler la transition en cours d'un racer. | 309 |
| `gameplay_drag_phaseHandlers.setRemoteStagingState(data, lane, staged)` | MP : applique l'état de staging d'un couloir reçu du réseau. À staged = true, démarre une minuterie (1 s de maintien avant de valider la phase 1) ; à false, annule et rouvre la phase 1 des racers du couloir. | 592 |
| `gameplay_drag_phaseHandlers.stage(phase, racer, dtSim)` | Phase 1 (staging). Met à jour la géométrie des roues, envoie la distance à l'UI (updateStageApp) pour le joueur local, valide la phase après 1 s sur la ligne (joueur) ou conduit l'IA à la ligne (approche, freinage, rampement) puis l'arrête. *(interne)* | 471 |
| `gameplay_drag_phaseHandlers.startRaceFromTree(vehId)` | Termine la phase de décompte d'un racer (phase 'countdown'), démarre ses timers si local et, pour une IA, tire un délai aléatoire de 0 à 0,5 s avant son départ. | 393 |
| `gameplay_drag_phaseHandlers.stop(phase, racer, dtSim)` | Phase d'arrêt après l'arrivée : pour une IA, coupe nitro/jato et lui ordonne de s'arrêter vers la cible d'arrêt. Terminée quand la vitesse <= 15 m/s ou 300 m parcourus ; émet stoppingVehicleDrag et dragRaceVehicleStopped. *(interne)* | 992 |
| `gameplay_drag_phaseHandlers.updateRacer(racer)` | Met à jour les données d'un racer depuis le véhicule : position, direction, vitesse, centres de roues, distances au stage, inLane, états pré-stage/stage (émet les hooks de feux) et currentDistanceFromOrigin. | 1099 |
| `gameplay_drag_phaseHandlers.updateRemoteStagingHoldTimers()` | Valide la phase 1 des racers d'un couloir dont le staging distant est maintenu depuis au moins 1 s. Appelée par core.onUpdate. *(interne)* | 608 |

### Détail des paramètres

#### `gameplay_drag_phaseHandlers.areAllRacersStaged(dragData)`

Indique si tous les racers sont en staging (phase 1 terminée, dans leur couloir, ou déjà finis) et si leur nombre atteint le minimum attendu (core.getExpectedStagingRacerCount).

- `dragData` (*table|nil*) : Données de course ; défaut core.getData().
- **renvoie** : boolean true si tous en staging.
- **renvoie** : integer Nombre de racers en staging.
- **renvoie** : integer Nombre total de racers.

#### `gameplay_drag_phaseHandlers.calculateDistanceOfAllWheelsFromStagePos(racer)`

Calcule, pour chaque groupe de roues du racer, le vecteur centre de roues moins la position du point de stage de son couloir (racer._wheelDistances).

- `racer` (*table*) : Racer.

#### `gameplay_drag_phaseHandlers.changeRacerPhase(racer, expectedCurrentPhase)`

Fait avancer un racer d'une phase (ou le marque fini après la dernière). Refuse si une transition est déjà en cours, si la phase attendue diffère, si le racer est hors couloir pour entrer en phase 2 ou 3, ou si un hook onPhaseTransition appelle setPhaseTransitionAbort. Émet onPhaseTransition (avant) et onRacerPhaseTransition (après, newPhase nil et nom 'finished' si fini).

- `racer` (*table*) : Racer.
- `expectedCurrentPhase` (*integer|nil*) : Phase attendue (validation).
- **renvoie** : boolean true si fait ou sans objet (racer retiré, fini), false si refusé.

#### `gameplay_drag_phaseHandlers.checkFreeroamDqReStage(dtSim)`

En freeroam solo/multiseat (hors gamemode drag MP), gère le re-staging après DQ : 6 s après la DQ, si le joueur est à plus de 6 m derrière la ligne, relance la course (reset puis startDragRaceActivity) ; entre -6 et +6 m, affiche une fois le message ui.drag.flash.reverseToRestage. Renvoie 'leftArea' si le seul racer recule à plus de 15 m.

- `dtSim` (*number*) : Delta temps simulé (s).
- **renvoie** : string|nil 'leftArea' ou nil.

#### `gameplay_drag_phaseHandlers.clearRacerTransitionLock(vehId)`

Supprime le verrou de transition (et le drapeau d'abandon) d'un racer, ou de tous si vehId est nil.

- `vehId` (*integer|nil*) : ID du véhicule ; nil = tous.

#### `gameplay_drag_phaseHandlers.countdown(phase, racer, dtSim)`

Phase 2 (arbre) pour un racer. Démarre le décompte (émet startDragCountdown avec le dial), prépare l'IA (agressivité 2, two-step, transbrake ou freeze, throttleOverride = 1), et disqualifie pour faux départ ou sortie de couloir (met reactionTimeInvalid et appelle startRaceFromTree avant disqualifyRacer).

- `phase` (*table*) : Phase courante du racer.
- `racer` (*table*) : Racer.
- `dtSim` (*number*) : Delta temps simulé (s).

#### `gameplay_drag_phaseHandlers.disqualifyRacer(racer, reason)`

Disqualifie un racer (jamais en phase 1, ni hors freeroam tant que la course n'est pas démarrée). Pour une IA, remet throttleOverride à nil. Émet setDisqualifiedLights.

- `racer` (*table*) : Racer.
- `reason` (*string*) : Clé de traduction de la raison.

#### `gameplay_drag_phaseHandlers.emergencyStop(phase, racer, dtSim)`

Phase d'arrêt d'urgence : pour une IA, coupe nitro/jato et throttleOverride, impose ai.setSpeed(0) ; la phase est complétée quand la vitesse <= 0.01 m/s.

- `phase` (*table*) : Phase.
- `racer` (*table*) : Racer.
- `dtSim` (*number*) : Delta temps simulé (s).

#### `gameplay_drag_phaseHandlers.generateWinData()`

Demande à l'extension de type de course (ext.generateWinData) la liste triée des résultats et émet onWinnerLightOn pour le couloir du premier.

- **renvoie** : table[] Liste des résultats (vide si pas de données).

#### `gameplay_drag_phaseHandlers.getFrontWheelDistanceFromStagePos(racer)`

Distance signée (m) des roues avant à la ligne de stage, projetée sur l'axe stage-arrivée du couloir (négatif avant la ligne).

- `racer` (*table*) : Racer.
- **renvoie** : number|nil Distance ou nil si les données de roues manquent.

#### `gameplay_drag_phaseHandlers.getImportantTimerValueForWin(racer, data)`

Valeur du timer important pour le classement (délègue à gameplay_drag_times).

- `racer` (*table*) : Racer.
- `data` (*table*) : Données de course.
- **renvoie** : number Valeur, 0 si indisponible.

#### `gameplay_drag_phaseHandlers.isRacerInsideBoundary(racer)`

Vrai si toutes les roues du racer (centres par groupe, sinon la position du véhicule) sont dans la zone de son couloir et, s'il y a plusieurs racers, pas dans la zone d'un autre couloir occupé.

- `racer` (*table*) : Racer.
- **renvoie** : boolean true si dans le couloir.

#### `gameplay_drag_phaseHandlers.race(phase, racer, dtSim)`

Phase 3 (course). Lance l'IA (jato, transbrake relâché, throttleOverride = 1, vitesse et cible de l'endLine), détecte crash/immobilité/sortie de couloir, régule le cabrage des IA, et termine quand le timer de fin de course est défini : émet dragRaceEndLineReached, en MP envoie le temps brut à l'hôte, sinon génère les résultats et le ticket quand tous ont fini.

- `phase` (*table*) : Phase.
- `racer` (*table*) : Racer.
- `dtSim` (*number*) : Delta temps simulé (s).

#### `gameplay_drag_phaseHandlers.setDialsData(data)`

Calcule les délais de départ (dialsData) par véhicule : 1 racer = 0 ; 2 racers = l'écart de dial est ajouté au racer au dial le plus bas ; plus de 2 = le dial de chacun.

- `data` (*table[]*) : Liste d'entrées {vehId, dial}.

#### `gameplay_drag_phaseHandlers.setPhaseTransitionAbort(vehId)`

À appeler depuis un hook onPhaseTransition pour annuler la transition en cours d'un racer.

- `vehId` (*integer*) : ID du véhicule.

#### `gameplay_drag_phaseHandlers.setRemoteStagingState(data, lane, staged)`

MP : applique l'état de staging d'un couloir reçu du réseau. À staged = true, démarre une minuterie (1 s de maintien avant de valider la phase 1) ; à false, annule et rouvre la phase 1 des racers du couloir.

- `data` (*table*) : dragData.
- `lane` (*integer*) : Couloir.
- `staged` (*boolean*) : Staging actif ou non.

#### `gameplay_drag_phaseHandlers.stage(phase, racer, dtSim)`

Phase 1 (staging). Met à jour la géométrie des roues, envoie la distance à l'UI (updateStageApp) pour le joueur local, valide la phase après 1 s sur la ligne (joueur) ou conduit l'IA à la ligne (approche, freinage, rampement) puis l'arrête.

- `phase` (*table*) : Phase.
- `racer` (*table*) : Racer.
- `dtSim` (*number*) : Delta temps simulé (s).

#### `gameplay_drag_phaseHandlers.startRaceFromTree(vehId)`

Termine la phase de décompte d'un racer (phase 'countdown'), démarre ses timers si local et, pour une IA, tire un délai aléatoire de 0 à 0,5 s avant son départ.

- `vehId` (*integer*) : ID du véhicule.

#### `gameplay_drag_phaseHandlers.stop(phase, racer, dtSim)`

Phase d'arrêt après l'arrivée : pour une IA, coupe nitro/jato et lui ordonne de s'arrêter vers la cible d'arrêt. Terminée quand la vitesse <= 15 m/s ou 300 m parcourus ; émet stoppingVehicleDrag et dragRaceVehicleStopped.

- `phase` (*table*) : Phase.
- `racer` (*table*) : Racer.
- `dtSim` (*number*) : Delta temps simulé (s).

#### `gameplay_drag_phaseHandlers.updateRacer(racer)`

Met à jour les données d'un racer depuis le véhicule : position, direction, vitesse, centres de roues, distances au stage, inLane, états pré-stage/stage (émet les hooks de feux) et currentDistanceFromOrigin.

- `racer` (*table*) : Racer.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drag_core, gameplay_drag_times, gameplay_drag_saveSystem. |
| `redLightReason` | string | Clé de raison de DQ pour le faux départ : 'missions.dragRace.gameplay.disqualified.jumping'. display.setDisqualifiedLights l'utilise pour allumer le feu rouge. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `dragRaceEndLineReached`
- `dragRaceStarted`
- `dragRaceVehicleStopped`
- `onPhaseTransition`
- `onRacerPhaseTransition` — écouté par 2 module(s)
- `onWinnerLightOn` — écouté par 1 module(s)
- `setDisqualifiedLights`
- `stageStarted`
- `startDragCountdown`
- `stoppingVehicleDrag`

**Évènements UI (guihooks.trigger) :** `DragRaceTreeFlashMessage`, `ScenarioFlashMessage`, `updateStageApp`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drag/phaseHandlers.lua`.*
