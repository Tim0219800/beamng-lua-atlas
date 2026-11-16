# `scenario_scenarios`

*Fichier : `lua/ge/extensions/scenario/scenarios.lua` · VM : Game Engine (GE) · 2482 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `scenario_scenarios` : `extensions.load("scenario_scenarios")`, puis la globale `scenario_scenarios`

Cœur du mode « scénario » : machine à états qui charge le niveau d'un scénario, fait apparaître ses prefabs et véhicules, gère la phase d'introduction, le compte à rebours, la course (chrono, tentatives, suivi de dégâts), la fin avec agrégation des résultats, les statistiques et l'écran de fin. Un scénario est une table (produite par scenario_scenariosLoader) stockée dans une variable locale unique ; on la lit avec getScenario(). Un moddeur s'en sert pour lancer/arrêter un scénario (executeScenario, stop, restartScenario), terminer (endScenario, finish) ou écouter les hooks émis (onScenarioChange, onRaceStart, onRaceResult…).

## Exemple

```lua
-- lancer un scénario déjà traité par scenario_scenariosLoader :
local sc = scenario_scenariosLoader.loadScenario('/levels/west_coast_usa/scenarios/xxx.json')
scenario_scenarios.executeScenario(sc)
-- dans une extension, réagir aux changements d'état :
local function onScenarioChange(sc) if sc and sc.state == 'running' then log('I','','course lancée') end end
-- terminer avec un échec :
scenario_scenarios.finish({failed = 'Trop lent'})
```

## Remarques

- Cycle de vie d'un scénario (scenario.state) : executeScenario -> core_levels.startLevel(scenario.mission) avec spawn.preventPlayerSpawning=true ; au chargement du niveau, onClientStartMission supprime l'ancien ScenarioObjectsGroup, crée un nouveau SimGroup 'ScenarioObjectsGroup' dans MissionGroup, spawne scenario.prefabs, démarre la physique, spawne éventuellement le véhicule choisi par l'utilisateur (userSelectedVehicle), émet onLoadCustomPrefabs(scenario) puis changeState('pre-start').
- Machine à états, pilotée depuis onPreRender selon scenario.state : 'pre-start' (tickPreStart : stage 0 attend le véhicule utilisateur, stage 1 appelle completeStartUp : traite véhicules, transformations de départ, waypoints, état du niveau, filtre d'actions, multiseat, émet onScenarioLoaded, puis affiche l'UI de départ, stage 2 fin) -> 'pre-running' (introduction ; l'UI envoie onScenarioUIReady('start') qui déclenche cet état ; caméra de chemin, vérification des extensions du scénario) -> 'running' (déclenché par onScenarioUIReady('play')) avec scenario.raceState 'countdown' puis 'racing' -> 'finished' (endRace) -> 'post' (résultats, stats, écran de fin) ; 'restart' pour un redémarrage ; 'physicsPaused' pendant une pause physique ; 'deferredRunning' repasse aussitôt en 'running'. Chaque changeState émet à la fin le hook onScenarioChange(scenario).
- Entrée en 'pre-running' : initialise raceMarker, scenario_raceUI, scenario_raceGoals.initialiseGoals(), scenario_waypoints.initialise(), gèle tous les véhicules (controller.setFreeze) et passe en caméra de jeu. Entrée en 'running' : finalise le multiseat, remet la caméra du joueur, cache l'intro, démarre le compte à rebours (3,5 s avec affichage 3-2-1, sinon 1,5 s), initialise l'IA des véhicules (initVehicleAIState) et émet onRaceInit.
- Compte à rebours (tickRunning, raceState 'countdown') : décrémente countDownTime avec dtSim ; à <= 3 s émet onCountdownStarted et les messages UI 3-2-1 ; à <= 0 affiche GO, passe raceState à 'racing', dégèle les véhicules, remet le chrono à 0, émet onCountdownEnded puis processRaceStart (sauf rollingStart : dans ce cas rollingStartTriggered() doit être appelée plus tard). processRaceStart émet onRaceStart et l'évènement UI RaceStart.
- En course : scenario.timer += dtSim (si timerActive et pas en pause), évènement UI raceTime, fin automatique (endRace) si timer > maxTime + extraTime, gestion des tentatives (attemptsInfo : onNewAttempt, onLastAttemptTaken, onAttemptFailed/Completed via onBeamNGTrigger), hook onRaceTick(0.25, timer) toutes les 0,25 s de temps simulé, hook onFailureTimerFired après failureTriggerTime (temps réel), suivi des véhicules (onObjectCollision, onVehicleTakenDamage, onVehicleStoppedMoving).
- Fin : endRace/endScenario passent en 'finished' avec un délai (endCountDownTime ou 3 s, temps réel) ; tickFinished émet onRaceResult({finalTime}), agrège scenario.pooledResults (le premier échec l'emporte si seul, sinon le premier succès ; sinon victoire par défaut), fixe scenario.result {msg|failed, finalTime, finalTimeStr}, passe en 'post', met à jour les buts, collecte les statistiques, les sauvegarde dans settings/playerStatistics.json, et prépare l'écran de fin (ui_router 'scenario.end' ou 'scenario.quickrace.end'). Pendant l'écran de fin le temps est ralenti à 1/8.
- Résultat : finish(result) ajoute result à scenario.pooledResults et termine la course ; result.failed (chaîne ou table de traduction) = échec, result.msg = succès.
- Filtrage d'entrées : en début de scénario, les actions listées dans scenario.blackListActions et whiteListActions sont appliquées au joueur 0 (groupe d'actions camera_blacklist toujours ajouté). stop() les retire. Pendant une lecture de replay qui n'autorise pas le gameplay, le filtre est levé.
- Redémarrage : restartScenario (aussi déclenché par onResetGameplay) copie le scénario, appelle stop(), restaure la copie et passe en 'restart' ; tickRestart remet les triggers, réinitialise les véhicules, retraite les véhicules, puis revient à 'pre-start' et émet onScenarioRestarted.
- Persistance au rechargement Lua : onSerialize sauvegarde état, chrono, buts, etc. ; onDeserialized recharge le scénario depuis son fichier source via scenario_scenariosLoader.loadScenario puis retraite véhicules et waypoints.
- Compatibilité : onExtensionLoaded crée la globale scenario_race (obsolète) qui redirige chaque appel vers scenario_scenarios en loguant une erreur ; scenario.vehiclesByName/vehiclesByID/vehicleInitialTransform sont des champs obsolètes (métatable de compatibilité). spawnPrefab est obsolète (utiliser ge_utils).
- Bug/incohérence : M.onRaceWaypointReached est assigné depuis une variable locale jamais définie (donc nil) : le champ n'existe pas réellement.
- Bug/incohérence : la fonction locale onUpdate (fenêtre imgui de debug « Scenario Runtime Debug ») n'est jamais exportée (ligne M.onUpdate commentée) : code mort.
- Bug/incohérence : dans tickRunning, « abs(vehicleData.damage - data.lastDamage) » est testé via « delataDamage > 0 » ; si vehicleData est nil, delataDamage vaut nil et la comparaison lève une erreur Lua.
- Bug/incohérence : dans tickFinished, « {msg = scenario.defaultWin} or {...} » : la partie « or » n'est jamais atteinte (une table est toujours vraie), donc le message par défaut de traduction n'est jamais utilisé ; si scenario.defaultWin est nil, msg est nil.
- Bug/incohérence : initializeVehicle convertit les degrés en radians avec 3.1459 (au lieu de 3.14159).
- Bug/incohérence : onClientStartMission ne vérifie pas que spawnPrefab renvoie un objet avant d'utiliser prefabObj.obj.
- Bug/incohérence : getscenarioName() plante si aucun scénario n'est chargé (scenario nil).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `scenario_scenarios.changeState(newState)` | Change scenario.state et exécute les actions d'entrée de l'état ('pre-start', 'pre-running', 'deferredRunning', 'running', 'finished', 'post'), puis émet onScenarioChange(scenario). Ne fait rien sans scénario. | 252 |
| `scenario_scenarios.continueScenario()` | Reprend le temps de simulation (simTimeAuthority.pause(false)). | 396 |
| `scenario_scenarios.displayEndUI()` | Efface displayEndUIRefs (autorise l'affichage de l'écran de fin). | 1523 |
| `scenario_scenarios.displayStartUI()` | Navigue vers l'écran 'scenario.start' (ui_router) et efface displayStartUIRefs. | 1518 |
| `scenario_scenarios.endRace(countDownTime)` | Passe en état 'finished' (sauf si déjà finished/post), fixe le délai avant les résultats (countDownTime, sinon scenario.endCountDownTime, sinon 3 s) et mémorise le temps final. | 401 |
| `scenario_scenarios.endScenario(countDownTime)` | Termine la course (endRace), émet onEndScenario(countDownTime) pour laisser buts et Lua custom décider du résultat, et ralentit le temps à 1/8 si besoin. | 1452 |
| `scenario_scenarios.executeScenario(sc)` | Lance un scénario : arrête le scénario courant s'il y en a un, mémorise sc, charge ses extensions (scenario.extensions), interdit le spawn automatique du joueur puis démarre le niveau scenario.mission via core_levels.startLevel. La suite se passe dans onClientStartMission. | 1110 |
| `scenario_scenarios.finish(result)` | Ajoute un résultat à scenario.pooledResults et termine la course si elle n'est pas déjà finie (endRace(0), sans délai). result.failed (chaîne) = échec ; result.msg = succès. | 677 |
| `scenario_scenarios.freezeAll(state)` | Gèle ou dégèle tous les véhicules du scénario via controller.setFreeze côté véhicule (utilisé avant la fin du compte à rebours). | 118 |
| `scenario_scenarios.getRaceDistance(scenario)` | Longueur d'un tour : somme des distances entre les points successifs de scenario.lapConfig (noeuds de la carte ou objets de scène). | 336 |
| `scenario_scenarios.getScenario()` | Renvoie la table du scénario actuellement chargé. | 1440 |
| `scenario_scenarios.getScenarioStateAtPauseEvent()` | État du scénario mémorisé au moment de la pause physique. | 2276 |
| `scenario_scenarios.getVehicleName(vehicleID)` | Nom de scénario d'un véhicule à partir de son id. | 1489 |
| `scenario_scenarios.getscenarioName()` | Renvoie scenario.name du scénario courant (erreur Lua s'il n'y en a pas). | 2345 |
| `scenario_scenarios.onBeamNGTrigger(data)` | Hook : gère les tentatives (scenario.attemptsInfo) quand le véhicule joueur entre dans un trigger : émet onAttemptFailed ou onAttemptCompleted selon failAttempts/completeAttempt et arme le minuteur d'attente. *(interne)* *(hook)* | 2395 |
| `scenario_scenarios.onCameraModeChanged(modeName)` | Hook : mémorise le dernier mode de caméra (sauf 'path' et 'observer') dans scenario.lastModeName, pour le restaurer au départ de la course. *(interne)* *(hook)* | 1444 |
| `scenario_scenarios.onClientEndMission()` | Hook de fin de niveau : nettoie raceMarker. *(interne)* *(hook)* | 2426 |
| `scenario_scenarios.onClientStartMission(levelPath)` | Hook appelé par main.lua quand le niveau est chargé (clientStartMission). Si un scénario est en attente : crée ScenarioObjectsGroup, spawne les prefabs et le véhicule choisi, émet onLoadCustomPrefabs et passe en 'pre-start'. Supprime toujours l'ancien groupe d'objets de scénario et lève preventPlayerSpawning. *(interne)* *(hook)* | 999 |
| `scenario_scenarios.onDeserialized(data)` | Hook de désérialisation après rechargement Lua : recharge le scénario depuis sourceFile/scenarioKey et restaure l'état. *(interne)* *(hook)* | 2314 |
| `scenario_scenarios.onDrawDebug(focusPos)` | Hook de dessin debug : si l'éditeur est activé et le réglage BeamNGRaceDrawDebug vrai, dessine sphères et noms des noeuds de waypoints du scénario dans un rayon de 200 m. *(interne)* *(hook)* | 1168 |
| `scenario_scenarios.onExtensionLoaded()` | Hook de chargement de l'extension : crée la globale obsolète scenario_race qui redirige vers scenario_scenarios. *(interne)* *(hook)* | 2355 |
| `scenario_scenarios.onExtensionUnloaded()` | Hook de déchargement : appelle stop() et efface scenario_race. *(interne)* *(hook)* | 2350 |
| `scenario_scenarios.onFilteredInputChanged(devName, action, value)` | Hook : en scénario multiseat, un mouvement de direction (steering, steer_left, steer_right) d'un périphérique change le véhicule assigné (limité à une fois par 500 ms, seuil 0,2). *(interne)* *(hook)* | 1354 |
| `scenario_scenarios.onInputBindingsChanged(assignedPlayers)` | Hook : rapproche les périphériques et les places multiseat quand les assignations d'entrée changent. *(interne)* *(hook)* | 1350 |
| `scenario_scenarios.onPhysicsPaused()` | Hook : mémorise l'état courant et passe en 'physicsPaused' (sauf éditeur actif). *(interne)* *(hook)* | 2267 |
| `scenario_scenarios.onPhysicsUnpaused()` | Hook : restaure l'état mémorisé au moment de la pause (sauf si le scénario est en 'restart'). *(interne)* *(hook)* | 2256 |
| `scenario_scenarios.onPreRender(dt, dtSim)` | Hook appelé chaque frame depuis luaPreRender : exécute la fonction de tick de l'état courant (tickPreStart, tickPreRunning, tickRunning, tickFinished, tickPost, tickRestart) puis dessine les marqueurs de course. Ne fait rien pendant une lecture de replay qui interdit le gameplay. *(interne)* *(hook)* | 2119 |
| `scenario_scenarios.onReplayCoreEvent(data)` | Hook du replay : lève ou rétablit le filtre d'actions du scénario selon que le replay autorise le gameplay. *(interne)* *(hook)* | 2223 |
| `scenario_scenarios.onResetGameplay(playerID)` | Hook : un reset du gameplay redémarre le scénario (restartScenario). *(interne)* *(hook)* | 2250 |
| `scenario_scenarios.onScenarioUIReady(state)` | Callback envoyé par l'UI : 'start' (en pre-start) lance la phase d'introduction (pre-running) ; 'play' (en pre-running) lance la course (running). Re-publie ScenarioChange à l'UI. *(interne)* *(hook)* | 1400 |
| `scenario_scenarios.onSerialize()` | Hook de sérialisation avant rechargement Lua : renvoie l'état minimal du scénario. *(interne)* *(hook)* | 2287 |
| `scenario_scenarios.onVehicleSelected(vehicleData)` | Hook appelé quand le joueur choisit un véhicule dans l'UI du scénario : remplace ou spawne le véhicule du joueur avec model/config/color/licenseText, puis gèle tous les véhicules. *(interne)* *(hook)* | 1985 |
| `scenario_scenarios.onVehicleStoppedMoving(vehicleID)` | Hook : si trackPlayerVehicle est actif et que le véhicule est le joueur 0, marque playerIsDamaged et playerHasStopped. *(interne)* *(hook)* | 2239 |
| `scenario_scenarios.pauseScenario()` | Met le temps de simulation en pause (simTimeAuthority.pause(true)). | 391 |
| `scenario_scenarios.prepareStartUI()` | Remet à 0 le compteur displayStartUIRefs du scénario ; l'UI de départ s'affiche tant que ce compteur vaut 0 au stage 1 de pre-start. | 413 |
| `scenario_scenarios.restartScenario()` | Redémarre le scénario courant depuis le début en conservant le niveau chargé : copie le scénario, appelle stop(), puis passe à l'état 'restart'. Doit rester un « reload » et non un « onload » (commentaire du code). | 1136 |
| `scenario_scenarios.rollingStartTriggered()` | À appeler pour un départ lancé (scenario.rollingStart) : remet le chrono à 0 et lance processRaceStart (onRaceStart). | 1581 |
| `scenario_scenarios.setScenarioStateAtPauseEvent(state)` | Force l'état à restaurer à la reprise de la physique. | 2280 |
| `scenario_scenarios.spawnPrefab(val, objName, objFileName, objPos, objRotation, objScale)` | OBSOLÈTE : utiliser spawnPrefab/addPrefab/removePrefab de ge_utils. val 2 = ajouter et charger, 1 = ajouter sans charger, 0 = décharger. | 687 |
| `scenario_scenarios.stop()` | Arrête et décharge complètement le scénario : coupe le multiseat, décharge les extensions du scénario, remet la vitesse du temps à 1, retire le filtre d'actions, réactive trailerRespawn, vide la variable scénario, nettoie raceMarker, envoie ScenarioChange(nil) à l'UI et émet onScenarioChange sans argument. Ne fait rien s'il n'y a pas de scénario. | 469 |
| `scenario_scenarios.stopRaceTimer()` | Arrête le chronomètre du scénario (timerActive = false). | 386 |
| `scenario_scenarios.trackVehicleMovementAfterDamage(vehicleName, trackingOptions)` | Enregistre un véhicule dans scenario.vehicleTrackingTable : le suivi émet ensuite onObjectCollision, onVehicleTakenDamage et onVehicleStoppedMoving pendant la course. | 1493 |
| `scenario_scenarios.uiEventFreeRoam()` | Appelée par l'UI (bouton Free roam) : supprime les véhicules IA du scénario, arrête le scénario et passe l'état de jeu en 'freeroam' sans restaurer l'état du niveau. *(interne)* | 1481 |
| `scenario_scenarios.uiEventRetry()` | Appelée par l'UI (bouton Réessayer) : restartScenario puis prepareStartUI. *(interne)* | 1475 |
| `scenario_scenarios.updateVehicleAiState(vehicleName, data)` | Met à jour scenario.aiControlledVehiclesById pour un véhicule (mode 'disable' le retire) et émet onVehicleAIStateChanged({vehicleId, vehicleName, aiControlled}). | 2374 |

### Détail des paramètres

#### `scenario_scenarios.changeState(newState)`

Change scenario.state et exécute les actions d'entrée de l'état ('pre-start', 'pre-running', 'deferredRunning', 'running', 'finished', 'post'), puis émet onScenarioChange(scenario). Ne fait rien sans scénario.

- `newState` (*string*) : 'pre-start', 'pre-running', 'deferredRunning', 'running', 'finished', 'post', 'restart', 'physicsPaused'

#### `scenario_scenarios.endRace(countDownTime)`

Passe en état 'finished' (sauf si déjà finished/post), fixe le délai avant les résultats (countDownTime, sinon scenario.endCountDownTime, sinon 3 s) et mémorise le temps final.

- `countDownTime` (*number|nil*) : délai en s

#### `scenario_scenarios.endScenario(countDownTime)`

Termine la course (endRace), émet onEndScenario(countDownTime) pour laisser buts et Lua custom décider du résultat, et ralentit le temps à 1/8 si besoin.

- `countDownTime` (*number|nil*) : délai avant le résultat (s, temps réel)

#### `scenario_scenarios.executeScenario(sc)`

Lance un scénario : arrête le scénario courant s'il y en a un, mémorise sc, charge ses extensions (scenario.extensions), interdit le spawn automatique du joueur puis démarre le niveau scenario.mission via core_levels.startLevel. La suite se passe dans onClientStartMission.

- `sc` (*table*) : table de scénario traitée par scenario_scenariosLoader

#### `scenario_scenarios.finish(result)`

Ajoute un résultat à scenario.pooledResults et termine la course si elle n'est pas déjà finie (endRace(0), sans délai). result.failed (chaîne) = échec ; result.msg = succès.

- `result` (*table*) : {failed = ..., msg = ...}

#### `scenario_scenarios.freezeAll(state)`

Gèle ou dégèle tous les véhicules du scénario via controller.setFreeze côté véhicule (utilisé avant la fin du compte à rebours).

- `state` (*integer*) : 1 pour geler, 0 pour dégeler

#### `scenario_scenarios.getRaceDistance(scenario)`

Longueur d'un tour : somme des distances entre les points successifs de scenario.lapConfig (noeuds de la carte ou objets de scène).

- `scenario` (*table*) : scénario (utilise lapConfig)
- **renvoie** : number distance en m (0 si pas de lapConfig)

#### `scenario_scenarios.getScenario()`

Renvoie la table du scénario actuellement chargé.

- **renvoie** : table|nil scénario ou nil

#### `scenario_scenarios.getScenarioStateAtPauseEvent()`

État du scénario mémorisé au moment de la pause physique.

- **renvoie** : string|nil état

#### `scenario_scenarios.getVehicleName(vehicleID)`

Nom de scénario d'un véhicule à partir de son id.

- `vehicleID` (*integer*) : id du véhicule
- **renvoie** : string|nil nom, nil si aucun scénario ou inconnu

#### `scenario_scenarios.getscenarioName()`

Renvoie scenario.name du scénario courant (erreur Lua s'il n'y en a pas).

- **renvoie** : string nom du scénario

#### `scenario_scenarios.onBeamNGTrigger(data)`

Hook : gère les tentatives (scenario.attemptsInfo) quand le véhicule joueur entre dans un trigger : émet onAttemptFailed ou onAttemptCompleted selon failAttempts/completeAttempt et arme le minuteur d'attente.

- `data` (*table*) : {event, subjectID, triggerName, ...}

#### `scenario_scenarios.onCameraModeChanged(modeName)`

Hook : mémorise le dernier mode de caméra (sauf 'path' et 'observer') dans scenario.lastModeName, pour le restaurer au départ de la course.

- `modeName` (*string*) : nom du mode de caméra

#### `scenario_scenarios.onClientStartMission(levelPath)`

Hook appelé par main.lua quand le niveau est chargé (clientStartMission). Si un scénario est en attente : crée ScenarioObjectsGroup, spawne les prefabs et le véhicule choisi, émet onLoadCustomPrefabs et passe en 'pre-start'. Supprime toujours l'ancien groupe d'objets de scénario et lève preventPlayerSpawning.

- `levelPath` (*string*) : chemin du niveau

#### `scenario_scenarios.onDeserialized(data)`

Hook de désérialisation après rechargement Lua : recharge le scénario depuis sourceFile/scenarioKey et restaure l'état.

- `data` (*table*) : données produites par onSerialize

#### `scenario_scenarios.onDrawDebug(focusPos)`

Hook de dessin debug : si l'éditeur est activé et le réglage BeamNGRaceDrawDebug vrai, dessine sphères et noms des noeuds de waypoints du scénario dans un rayon de 200 m.

- `focusPos` (*vec3*) : position de focalisation de debug

#### `scenario_scenarios.onFilteredInputChanged(devName, action, value)`

Hook : en scénario multiseat, un mouvement de direction (steering, steer_left, steer_right) d'un périphérique change le véhicule assigné (limité à une fois par 500 ms, seuil 0,2).

- `devName` (*string*) : périphérique
- `action` (*string*) : action
- `value` (*number*) : valeur de l'axe

#### `scenario_scenarios.onInputBindingsChanged(assignedPlayers)`

Hook : rapproche les périphériques et les places multiseat quand les assignations d'entrée changent.

- `assignedPlayers` (*table*) : joueurs assignés

#### `scenario_scenarios.onPreRender(dt, dtSim)`

Hook appelé chaque frame depuis luaPreRender : exécute la fonction de tick de l'état courant (tickPreStart, tickPreRunning, tickRunning, tickFinished, tickPost, tickRestart) puis dessine les marqueurs de course. Ne fait rien pendant une lecture de replay qui interdit le gameplay.

- `dt` (*number*) : dtReal (s)
- `dtSim` (*number*) : temps simulé (s)

#### `scenario_scenarios.onReplayCoreEvent(data)`

Hook du replay : lève ou rétablit le filtre d'actions du scénario selon que le replay autorise le gameplay.

- `data` (*table*) : données de l'évènement (non utilisées)

#### `scenario_scenarios.onResetGameplay(playerID)`

Hook : un reset du gameplay redémarre le scénario (restartScenario).

- `playerID` (*integer*) : joueur

#### `scenario_scenarios.onScenarioUIReady(state)`

Callback envoyé par l'UI : 'start' (en pre-start) lance la phase d'introduction (pre-running) ; 'play' (en pre-running) lance la course (running). Re-publie ScenarioChange à l'UI.

- `state` (*string*) : 'start' ou 'play'

#### `scenario_scenarios.onSerialize()`

Hook de sérialisation avant rechargement Lua : renvoie l'état minimal du scénario.

- **renvoie** : table données (vide si aucun scénario)

#### `scenario_scenarios.onVehicleSelected(vehicleData)`

Hook appelé quand le joueur choisit un véhicule dans l'UI du scénario : remplace ou spawne le véhicule du joueur avec model/config/color/licenseText, puis gèle tous les véhicules.

- `vehicleData` (*table*) : {model, config, color, licenseText}

#### `scenario_scenarios.onVehicleStoppedMoving(vehicleID)`

Hook : si trackPlayerVehicle est actif et que le véhicule est le joueur 0, marque playerIsDamaged et playerHasStopped.

- `vehicleID` (*integer*) : id du véhicule

#### `scenario_scenarios.setScenarioStateAtPauseEvent(state)`

Force l'état à restaurer à la reprise de la physique.

- `state` (*string|nil*) : état

#### `scenario_scenarios.spawnPrefab(val, objName, objFileName, objPos, objRotation, objScale)`

OBSOLÈTE : utiliser spawnPrefab/addPrefab/removePrefab de ge_utils. val 2 = ajouter et charger, 1 = ajouter sans charger, 0 = décharger.

- `val` (*integer*) : 0, 1 ou 2
- `objName` (*string*) : nom
- `objFileName` (*string*) : fichier
- `objPos` (*string*) : position
- `objRotation` (*string*) : rotation
- `objScale` (*string*) : échelle
- **renvoie** : table|nil prefab

#### `scenario_scenarios.trackVehicleMovementAfterDamage(vehicleName, trackingOptions)`

Enregistre un véhicule dans scenario.vehicleTrackingTable : le suivi émet ensuite onObjectCollision, onVehicleTakenDamage et onVehicleStoppedMoving pendant la course.

- `vehicleName` (*string*) : nom de l'objet véhicule
- `trackingOptions` (*table|nil*) : {waitTimerLimit (s, défaut 1.0), vehDisplacementLimit (m, défaut 0.25)}

#### `scenario_scenarios.updateVehicleAiState(vehicleName, data)`

Met à jour scenario.aiControlledVehiclesById pour un véhicule (mode 'disable' le retire) et émet onVehicleAIStateChanged({vehicleId, vehicleName, aiControlled}).

- `vehicleName` (*string*) : nom du véhicule
- `data` (*table*) : {mode = 'disable'|autre}

## Champs

| Champ | Type | Description |
|---|---|---|
| `onRaceWaypointReached` | nil | Exporté mais vaut nil (variable locale non définie dans le fichier). ⚠ référence `onRaceWaypointReached` non définie dans le fichier (vaut probablement nil) |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onAttemptCompleted` — écouté par 1 module(s)
- `onAttemptFailed` — écouté par 1 module(s)
- `onCountdownEnded` — écouté par 2 module(s)
- `onCountdownStarted`
- `onCustomWaypoints` — écouté par 1 module(s)
- `onEndScenario`
- `onFailureTimerFired`
- `onLastAttemptTaken`
- `onLoadCustomPrefabs` — écouté par 1 module(s)
- `onNewAttempt` — écouté par 1 module(s)
- `onObjectCollision`
- `onRaceInit` — écouté par 2 module(s)
- `onRaceResult` — écouté par 6 module(s)
- `onRaceStart` — écouté par 5 module(s)
- `onRaceTick` — écouté par 2 module(s)
- `onScenarioChange` — écouté par 9 module(s)
- `onScenarioFinished` — écouté par 2 module(s)
- `onScenarioLoaded` — écouté par 5 module(s)
- `onScenarioRestarted` — écouté par 7 module(s)
- `onScenarioUIReady` — écouté par 1 module(s)
- `onVehicleAIStateChanged` — écouté par 1 module(s)
- `onVehicleStoppedMoving` — écouté par 1 module(s)
- `onVehicleTakenDamage`

**Évènements UI (guihooks.trigger) :** `HotlappingResetApp`, `PlayersChanged`, `RaceStart`, `ScenarioChange`, `ScenarioFlashMessage`, `ScenarioFlashMessageReset`, `ScenarioNotRunning`, `ScenarioResetTimer`, `raceTime`, `scenarioStart:showStartButton`, `setQuickRaceMode`

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `Sim.` `upcast`
- `be:` `enterVehicle`, `exitVehicle`, `getEnabled`, `getPlayerVehicleID`, `physicsStartSimulation`, `resetVehicle`, `setDynamicCollisionEnabled`, `toggleEnabled`
- `core_environment.` `getTimeOfDay`, `reset_init`, `setTimeOfDay`
- `debugDrawer:` `drawSphere`, `drawText`
- `scenetree.` `findClassObjects`, `findObject`

**Charge les extensions :** `scenario_`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/scenarios.lua`.*
