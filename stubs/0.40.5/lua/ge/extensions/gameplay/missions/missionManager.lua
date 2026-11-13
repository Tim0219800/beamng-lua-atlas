---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/missionManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Chef d'orchestre du démarrage et de l'arrêt des missions. Chaque démarrage ou arrêt est une suite d'étapes (taskData.steps) exécutées image par image dans onUpdate : fondu d'écran, retrait/mise de côté (stash) des véhicules, création du véhicule de la mission, trafic, configuration de l'environnement (heure, nuages, vent, brouillard), puis mission:onStart(). L'arrêt restaure les véhicules, le trafic et l'environnement. Une seule mission « de premier plan » (foreground) peut tourner à la fois. Un moddeur l'appelle pour lancer ou arrêter une mission depuis le code.
--- Accès : extension `gameplay_missions_missionManager` : `extensions.load("gameplay_missions_missionManager")`, puis la globale `gameplay_missions_missionManager`
---@class gameplay_missions_missionManager
---@field dependencies string[] Extensions chargées avant : gameplay_traffic, gameplay_police, gameplay_parking, ui_fadeScreen.
---@field fadeDuration number Durée (s) du fondu d'écran, 0.75 par défaut ; utilisée pour le fondu de démarrage dans startFromWithinMission.
gameplay_missions_missionManager = {}

--- WIP : indique si l'interaction avec les missions est autorisée (true seulement si l'état de jeu est « freeroam »).
---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1425
---@return boolean  true si autorisée.
function gameplay_missions_missionManager.allowMissionInteraction() end

--- Demande l'abandon d'une mission. Émet onGameplayActivityAborted (si abandonButtonPressed) puis onMissionAbandoned(mission, abandonButtonPressed). Si la mission gère elle-même l'abandon (mission:attemptAbandonMission() vrai, p. ex. un flowgraph avec onRequestAbandon), s'arrête là ; sinon lance la séquence d'arrêt avec fondu.
---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1301
---@param mission table Mission en cours.
---@param force boolean|nil Non utilisé dans le code.
---@param abandonButtonPressed boolean|nil true si le joueur a appuyé sur le bouton d'abandon (data.abandoned = true).
---@return boolean|nil  true en cas d'erreur ou si la mission gère l'abandon elle-même.
function gameplay_missions_missionManager.attemptAbandonMissionWithFade(mission, force, abandonButtonPressed) end

--- Renvoie le type de tâche en cours ("start" ou "stop"), "start" aussi si un démarrage depuis l'intérieur d'une mission est différé, nil si aucune tâche.
---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1529
---@return string|nil  "start", "stop" ou nil.
function gameplay_missions_missionManager.getCurrentTaskdataTypeOrNil() end

--- Id de la mission de premier plan en cours (exclusivité : une seule à la fois), ou nil.
---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1541
---@return string|nil  Id de mission.
function gameplay_missions_missionManager.getForegroundMissionId() end

--- Indique si une suite d'étapes de démarrage/arrêt est en cours de traitement.
---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1542
---@return boolean  true si taskData.active.
function gameplay_missions_missionManager.isCurrentlyProcessingStep() end

--- Hook appelé à l'activation de la carrière : arrête immédiatement la mission de premier plan (alias de stopForegroundMissionInstantly).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1513
function gameplay_missions_missionManager.onCareerActive() end

--- Hook appelé à la fin du niveau courant (changement de niveau) : arrête immédiatement la mission de premier plan sans nettoyage (alias de stopForegroundMissionInstantly). Sans rapport avec une fin de mission de gameplay.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1513
function gameplay_missions_missionManager.onClientEndMission() end

--- Hook appelé quand des véhicules garés apparaissent sans trafic : même effet que onTrafficStarted.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1060
function gameplay_missions_missionManager.onParkingVehiclesActivated() end

--- Hook de ui_fadeScreen appelé à chaque phase du fondu. Débloque l'étape qui attend le fondu (fadeState<state> = true) et déclenche l'arrêt de la mission courante pour un démarrage différé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1071
---@param state integer Numéro de phase du fondu (1, 2, 3).
function gameplay_missions_missionManager.onScreenFadeState(state) end

--- Hook appelé quand le trafic démarre : valide l'étape qui attend le trafic (waitForTraffic).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1060
function gameplay_missions_missionManager.onTrafficStarted() end

--- Appelé chaque frame. Avance les étapes de la tâche active (timeouts compris), lance le démarrage différé de startFromWithinMission quand l'arrêt est fini, et appelle mission:onUpdate des missions en cours. Contient une fenêtre de debug imgui (désactivée par défaut).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1434
---@param dtReal number Temps réel (s).
---@param dtSim number Temps de simulation (s).
---@param dtRaw number Temps brut (s).
function gameplay_missions_missionManager.onUpdate(dtReal, dtSim, dtRaw) end

--- Alias de startWithFade : démarre une mission avec fondu d'écran.
---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1088
---@param mission table Mission construite (gameplay_missions_missions.getMissionById).
---@param userSettings table|nil Réglages utilisateur choisis ({} par défaut).
---@param startingOptions table|nil Options : startedFrom, skipPartConditionSnapshot, etc.
---@return boolean|nil  true en cas d'erreur.
function gameplay_missions_missionManager.start(mission, userSettings, startingOptions) end

--- Démarre une mission sans fondu ni retrait de véhicules : pré-mission, mise de côté des véhicules, véhicule, trafic, onStart (utilisé quand la mission est lancée comme scénario).
---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1153
---@param mission table Mission construite.
---@param userSettings table|nil Réglages utilisateur.
---@return boolean|nil  true en cas d'erreur, nil si une tâche est active.
function gameplay_missions_missionManager.startAsScenario(mission, userSettings) end

--- Arrête la mission de premier plan puis en démarre une autre (ou la même, reconfigurée) : avec fondu (par défaut) ou instantanément. Le démarrage réel est différé jusqu'à la fin de l'arrêt (traité dans onUpdate). Émet onMissionReconfigured si c'est la même mission.
---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1193
---@param mission table Mission à démarrer.
---@param userSettings table|nil Réglages utilisateur.
---@param instant boolean|nil true pour éviter le fondu.
function gameplay_missions_missionManager.startFromWithinMission(mission, userSettings, instant) end

--- Démarre une mission immédiatement avec seulement les étapes pré-mission et onStart (sans toucher aux véhicules). Émet le hook startFromWithinMissionInstant(mission, userSettings, startingOptions).
---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1222
---@param mission table Mission construite.
---@param userSettings table|nil Réglages utilisateur.
---@param startingOptions table|nil Options de démarrage.
function gameplay_missions_missionManager.startInstant(mission, userSettings, startingOptions) end

--- Démarre une mission avec la suite d'étapes complète : fondu, retrait des véhicules, préparation (pré-mission), réparation de départ, instantané de l'état des pièces (sauf skipPartConditionSnapshot), mise de côté des véhicules, véhicule de mission, trafic, puis onStart. Émet le hook onMissionStartWithFade(mission, userSettings).
---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1088
---@param mission table Mission construite.
---@param userSettings table|nil Réglages utilisateur.
---@param startingOptions table|nil Options de démarrage.
---@return boolean|nil  true en cas d'erreur (mission nil ou déjà en cours), nil si une tâche est déjà active.
function gameplay_missions_missionManager.startWithFade(mission, userSettings, startingOptions) end

--- Charge d'abord le niveau (celui de la mission par défaut), arrête toute mission de premier plan, puis exécute pré-mission, mise de côté des véhicules, véhicule, trafic et onStart.
---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1248
---@param mission table Mission construite.
---@param userSettings table|nil Réglages utilisateur.
---@param level string|nil Niveau à charger ; par défaut mission.startTrigger.level.
---@param startedFrom string|nil Origine du démarrage (transmise aux hooks).
---@return boolean|nil  true en cas d'erreur.
function gameplay_missions_missionManager.startWithLoadingLevel(mission, userSettings, level, startedFrom) end

--- Arrête une mission en cours : onStop de la mission, restauration des véhicules mis de côté, post-traitement, retrait de véhicules, réapparition du véhicule du joueur et du trafic, puis fondu (sauf data.ignoreFade). Émet le hook onMissionStopped(mission).
---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1371
---@param mission table Mission en cours.
---@param data table|nil Données d'arrêt : ignoreFade, abandoned, attempt, stopInstant...
---@return boolean|nil  true en cas d'erreur (mission nil ou non en cours), nil si une tâche est active.
function gameplay_missions_missionManager.stop(mission, data) end

--- Arrête immédiatement la mission de premier plan (taskStopMissionStep avec stopInstant) sans restaurer véhicules ni environnement. Appelé aussi à la fin du chargement d'un niveau et à l'activation de la carrière.
---Source : lua/ge/extensions/gameplay/missions/missionManager.lua:1513
function gameplay_missions_missionManager.stopForegroundMissionInstantly() end

