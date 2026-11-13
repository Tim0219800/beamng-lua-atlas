---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/scenarios.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Cœur du mode « scénario » : machine à états qui charge le niveau d'un scénario, fait apparaître ses prefabs et véhicules, gère la phase d'introduction, le compte à rebours, la course (chrono, tentatives, suivi de dégâts), la fin avec agrégation des résultats, les statistiques et l'écran de fin. Un scénario est une table (produite par scenario_scenariosLoader) stockée dans une variable locale unique ; on la lit avec getScenario(). Un moddeur s'en sert pour lancer/arrêter un scénario (executeScenario, stop, restartScenario), terminer (endScenario, finish) ou écouter les hooks émis (onScenarioChange, onRaceStart, onRaceResult…).
--- Accès : extension `scenario_scenarios` : `extensions.load("scenario_scenarios")`, puis la globale `scenario_scenarios`
---@class scenario_scenarios
---@field onRaceWaypointReached nil Exporté mais vaut nil (variable locale non définie dans le fichier).
scenario_scenarios = {}

--- Change scenario.state et exécute les actions d'entrée de l'état ('pre-start', 'pre-running', 'deferredRunning', 'running', 'finished', 'post'), puis émet onScenarioChange(scenario). Ne fait rien sans scénario.
---Source : lua/ge/extensions/scenario/scenarios.lua:252
---@param newState string 'pre-start', 'pre-running', 'deferredRunning', 'running', 'finished', 'post', 'restart', 'physicsPaused'
function scenario_scenarios.changeState(newState) end

--- Reprend le temps de simulation (simTimeAuthority.pause(false)).
---Source : lua/ge/extensions/scenario/scenarios.lua:396
function scenario_scenarios.continueScenario() end

--- Efface displayEndUIRefs (autorise l'affichage de l'écran de fin).
---Source : lua/ge/extensions/scenario/scenarios.lua:1523
function scenario_scenarios.displayEndUI() end

--- Navigue vers l'écran 'scenario.start' (ui_router) et efface displayStartUIRefs.
---Source : lua/ge/extensions/scenario/scenarios.lua:1518
function scenario_scenarios.displayStartUI() end

--- Passe en état 'finished' (sauf si déjà finished/post), fixe le délai avant les résultats (countDownTime, sinon scenario.endCountDownTime, sinon 3 s) et mémorise le temps final.
---Source : lua/ge/extensions/scenario/scenarios.lua:401
---@param countDownTime number|nil délai en s
function scenario_scenarios.endRace(countDownTime) end

--- Termine la course (endRace), émet onEndScenario(countDownTime) pour laisser buts et Lua custom décider du résultat, et ralentit le temps à 1/8 si besoin.
---Source : lua/ge/extensions/scenario/scenarios.lua:1452
---@param countDownTime number|nil délai avant le résultat (s, temps réel)
function scenario_scenarios.endScenario(countDownTime) end

--- Lance un scénario : arrête le scénario courant s'il y en a un, mémorise sc, charge ses extensions (scenario.extensions), interdit le spawn automatique du joueur puis démarre le niveau scenario.mission via core_levels.startLevel. La suite se passe dans onClientStartMission.
---Source : lua/ge/extensions/scenario/scenarios.lua:1110
---@param sc table table de scénario traitée par scenario_scenariosLoader
function scenario_scenarios.executeScenario(sc) end

--- Ajoute un résultat à scenario.pooledResults et termine la course si elle n'est pas déjà finie (endRace(0), sans délai). result.failed (chaîne) = échec ; result.msg = succès.
---Source : lua/ge/extensions/scenario/scenarios.lua:677
---@param result table {failed = ..., msg = ...}
function scenario_scenarios.finish(result) end

--- Gèle ou dégèle tous les véhicules du scénario via controller.setFreeze côté véhicule (utilisé avant la fin du compte à rebours).
---Source : lua/ge/extensions/scenario/scenarios.lua:118
---@param state integer 1 pour geler, 0 pour dégeler
function scenario_scenarios.freezeAll(state) end

--- Longueur d'un tour : somme des distances entre les points successifs de scenario.lapConfig (noeuds de la carte ou objets de scène).
---Source : lua/ge/extensions/scenario/scenarios.lua:336
---@param scenario table scénario (utilise lapConfig)
---@return number  distance en m (0 si pas de lapConfig)
function scenario_scenarios.getRaceDistance(scenario) end

--- Renvoie la table du scénario actuellement chargé.
---Source : lua/ge/extensions/scenario/scenarios.lua:1440
---@return table|nil  scénario ou nil
function scenario_scenarios.getScenario() end

--- État du scénario mémorisé au moment de la pause physique.
---Source : lua/ge/extensions/scenario/scenarios.lua:2276
---@return string|nil  état
function scenario_scenarios.getScenarioStateAtPauseEvent() end

--- Nom de scénario d'un véhicule à partir de son id.
---Source : lua/ge/extensions/scenario/scenarios.lua:1489
---@param vehicleID integer id du véhicule
---@return string|nil  nom, nil si aucun scénario ou inconnu
function scenario_scenarios.getVehicleName(vehicleID) end

--- Renvoie scenario.name du scénario courant (erreur Lua s'il n'y en a pas).
---Source : lua/ge/extensions/scenario/scenarios.lua:2345
---@return string  nom du scénario
function scenario_scenarios.getscenarioName() end

--- Hook : gère les tentatives (scenario.attemptsInfo) quand le véhicule joueur entre dans un trigger : émet onAttemptFailed ou onAttemptCompleted selon failAttempts/completeAttempt et arme le minuteur d'attente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/scenarios.lua:2395
---@param data table {event, subjectID, triggerName, ...}
function scenario_scenarios.onBeamNGTrigger(data) end

--- Hook : mémorise le dernier mode de caméra (sauf 'path' et 'observer') dans scenario.lastModeName, pour le restaurer au départ de la course.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/scenarios.lua:1444
---@param modeName string nom du mode de caméra
function scenario_scenarios.onCameraModeChanged(modeName) end

--- Hook de fin de niveau : nettoie raceMarker.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/scenarios.lua:2426
function scenario_scenarios.onClientEndMission() end

--- Hook appelé par main.lua quand le niveau est chargé (clientStartMission). Si un scénario est en attente : crée ScenarioObjectsGroup, spawne les prefabs et le véhicule choisi, émet onLoadCustomPrefabs et passe en 'pre-start'. Supprime toujours l'ancien groupe d'objets de scénario et lève preventPlayerSpawning.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/scenarios.lua:999
---@param levelPath string chemin du niveau
function scenario_scenarios.onClientStartMission(levelPath) end

--- Hook de désérialisation après rechargement Lua : recharge le scénario depuis sourceFile/scenarioKey et restaure l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/scenarios.lua:2314
---@param data table données produites par onSerialize
function scenario_scenarios.onDeserialized(data) end

--- Hook de dessin debug : si l'éditeur est activé et le réglage BeamNGRaceDrawDebug vrai, dessine sphères et noms des noeuds de waypoints du scénario dans un rayon de 200 m.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/scenarios.lua:1168
---@param focusPos vec3 position de focalisation de debug
function scenario_scenarios.onDrawDebug(focusPos) end

--- Hook de chargement de l'extension : crée la globale obsolète scenario_race qui redirige vers scenario_scenarios.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/scenarios.lua:2355
function scenario_scenarios.onExtensionLoaded() end

--- Hook de déchargement : appelle stop() et efface scenario_race.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/scenarios.lua:2350
function scenario_scenarios.onExtensionUnloaded() end

--- Hook : en scénario multiseat, un mouvement de direction (steering, steer_left, steer_right) d'un périphérique change le véhicule assigné (limité à une fois par 500 ms, seuil 0,2).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/scenarios.lua:1354
---@param devName string périphérique
---@param action string action
---@param value number valeur de l'axe
function scenario_scenarios.onFilteredInputChanged(devName, action, value) end

--- Hook : rapproche les périphériques et les places multiseat quand les assignations d'entrée changent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/scenarios.lua:1350
---@param assignedPlayers table joueurs assignés
function scenario_scenarios.onInputBindingsChanged(assignedPlayers) end

--- Hook : mémorise l'état courant et passe en 'physicsPaused' (sauf éditeur actif).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/scenarios.lua:2267
function scenario_scenarios.onPhysicsPaused() end

--- Hook : restaure l'état mémorisé au moment de la pause (sauf si le scénario est en 'restart').
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/scenarios.lua:2256
function scenario_scenarios.onPhysicsUnpaused() end

--- Hook appelé chaque frame depuis luaPreRender : exécute la fonction de tick de l'état courant (tickPreStart, tickPreRunning, tickRunning, tickFinished, tickPost, tickRestart) puis dessine les marqueurs de course. Ne fait rien pendant une lecture de replay qui interdit le gameplay.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/scenarios.lua:2119
---@param dt number dtReal (s)
---@param dtSim number temps simulé (s)
function scenario_scenarios.onPreRender(dt, dtSim) end

--- Hook du replay : lève ou rétablit le filtre d'actions du scénario selon que le replay autorise le gameplay.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/scenarios.lua:2223
---@param data table données de l'évènement (non utilisées)
function scenario_scenarios.onReplayCoreEvent(data) end

--- Hook : un reset du gameplay redémarre le scénario (restartScenario).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/scenarios.lua:2250
---@param playerID integer joueur
function scenario_scenarios.onResetGameplay(playerID) end

--- Callback envoyé par l'UI : 'start' (en pre-start) lance la phase d'introduction (pre-running) ; 'play' (en pre-running) lance la course (running). Re-publie ScenarioChange à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/scenarios.lua:1400
---@param state string 'start' ou 'play'
function scenario_scenarios.onScenarioUIReady(state) end

--- Hook de sérialisation avant rechargement Lua : renvoie l'état minimal du scénario.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/scenarios.lua:2287
---@return table  données (vide si aucun scénario)
function scenario_scenarios.onSerialize() end

--- Hook appelé quand le joueur choisit un véhicule dans l'UI du scénario : remplace ou spawne le véhicule du joueur avec model/config/color/licenseText, puis gèle tous les véhicules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/scenarios.lua:1985
---@param vehicleData table {model, config, color, licenseText}
function scenario_scenarios.onVehicleSelected(vehicleData) end

--- Hook : si trackPlayerVehicle est actif et que le véhicule est le joueur 0, marque playerIsDamaged et playerHasStopped.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/scenarios.lua:2239
---@param vehicleID integer id du véhicule
function scenario_scenarios.onVehicleStoppedMoving(vehicleID) end

--- Met le temps de simulation en pause (simTimeAuthority.pause(true)).
---Source : lua/ge/extensions/scenario/scenarios.lua:391
function scenario_scenarios.pauseScenario() end

--- Remet à 0 le compteur displayStartUIRefs du scénario ; l'UI de départ s'affiche tant que ce compteur vaut 0 au stage 1 de pre-start.
---Source : lua/ge/extensions/scenario/scenarios.lua:413
function scenario_scenarios.prepareStartUI() end

--- Redémarre le scénario courant depuis le début en conservant le niveau chargé : copie le scénario, appelle stop(), puis passe à l'état 'restart'. Doit rester un « reload » et non un « onload » (commentaire du code).
---Source : lua/ge/extensions/scenario/scenarios.lua:1136
function scenario_scenarios.restartScenario() end

--- À appeler pour un départ lancé (scenario.rollingStart) : remet le chrono à 0 et lance processRaceStart (onRaceStart).
---Source : lua/ge/extensions/scenario/scenarios.lua:1581
function scenario_scenarios.rollingStartTriggered() end

--- Force l'état à restaurer à la reprise de la physique.
---Source : lua/ge/extensions/scenario/scenarios.lua:2280
---@param state string|nil état
function scenario_scenarios.setScenarioStateAtPauseEvent(state) end

--- OBSOLÈTE : utiliser spawnPrefab/addPrefab/removePrefab de ge_utils. val 2 = ajouter et charger, 1 = ajouter sans charger, 0 = décharger.
---Source : lua/ge/extensions/scenario/scenarios.lua:687
---@param val integer 0, 1 ou 2
---@param objName string nom
---@param objFileName string fichier
---@param objPos string position
---@param objRotation string rotation
---@param objScale string échelle
---@return table|nil  prefab
function scenario_scenarios.spawnPrefab(val, objName, objFileName, objPos, objRotation, objScale) end

--- Arrête et décharge complètement le scénario : coupe le multiseat, décharge les extensions du scénario, remet la vitesse du temps à 1, retire le filtre d'actions, réactive trailerRespawn, vide la variable scénario, nettoie raceMarker, envoie ScenarioChange(nil) à l'UI et émet onScenarioChange sans argument. Ne fait rien s'il n'y a pas de scénario.
---Source : lua/ge/extensions/scenario/scenarios.lua:469
function scenario_scenarios.stop() end

--- Arrête le chronomètre du scénario (timerActive = false).
---Source : lua/ge/extensions/scenario/scenarios.lua:386
function scenario_scenarios.stopRaceTimer() end

--- Enregistre un véhicule dans scenario.vehicleTrackingTable : le suivi émet ensuite onObjectCollision, onVehicleTakenDamage et onVehicleStoppedMoving pendant la course.
---Source : lua/ge/extensions/scenario/scenarios.lua:1493
---@param vehicleName string nom de l'objet véhicule
---@param trackingOptions table|nil {waitTimerLimit (s, défaut 1.0), vehDisplacementLimit (m, défaut 0.25)}
function scenario_scenarios.trackVehicleMovementAfterDamage(vehicleName, trackingOptions) end

--- Appelée par l'UI (bouton Free roam) : supprime les véhicules IA du scénario, arrête le scénario et passe l'état de jeu en 'freeroam' sans restaurer l'état du niveau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/scenarios.lua:1481
function scenario_scenarios.uiEventFreeRoam() end

--- Appelée par l'UI (bouton Réessayer) : restartScenario puis prepareStartUI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/scenarios.lua:1475
function scenario_scenarios.uiEventRetry() end

--- Met à jour scenario.aiControlledVehiclesById pour un véhicule (mode 'disable' le retire) et émet onVehicleAIStateChanged({vehicleId, vehicleName, aiControlled}).
---Source : lua/ge/extensions/scenario/scenarios.lua:2374
---@param vehicleName string nom du véhicule
---@param data table {mode = 'disable'|autre}
function scenario_scenarios.updateVehicleAiState(vehicleName, data) end

