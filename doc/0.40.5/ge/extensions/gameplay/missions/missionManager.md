# `gameplay_missions_missionManager`

*Fichier : `lua/ge/extensions/gameplay/missions/missionManager.lua` · VM : Game Engine (GE) · 1544 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_missions_missionManager` : `extensions.load("gameplay_missions_missionManager")`, puis la globale `gameplay_missions_missionManager`

Chef d'orchestre du démarrage et de l'arrêt des missions. Chaque démarrage ou arrêt est une suite d'étapes (taskData.steps) exécutées image par image dans onUpdate : fondu d'écran, retrait/mise de côté (stash) des véhicules, création du véhicule de la mission, trafic, configuration de l'environnement (heure, nuages, vent, brouillard), puis mission:onStart(). L'arrêt restaure les véhicules, le trafic et l'environnement. Une seule mission « de premier plan » (foreground) peut tourner à la fois. Un moddeur l'appelle pour lancer ou arrêter une mission depuis le code.

## Exemple

```lua
local m = gameplay_missions_missions.getMissionById('gridmap_v2/timeTrial/monCircuit')
gameplay_missions_missionManager.startWithFade(m, {}, {})
-- plus tard
gameplay_missions_missionManager.stop(m, {})
```

## Remarques

- Les fonctions de démarrage et d'arrêt renvoient true en cas d'erreur (mission nil, déjà en cours, pas en cours) et nil si une tâche est déjà active (simple avertissement dans le log) ; un nouveau démarrage ou arrêt est refusé tant que taskData.active est vrai (voir isCurrentlyProcessingStep).
- Chaque étape a un timeout (120 s par défaut, 10 s pour le fondu de départ, 5 s pour le fondu de fin) ; passé ce délai elle est marquée terminée avec une erreur dans le log.
- Dans taskStartMissionStep, si mission:onStart() renvoie une valeur vraie, _isOngoing est remis à false et une erreur est loguée, mais l'exécution continue : foregroundMissionId est tout de même fixé (sauf mission.background) et le hook onAnyMissionChanged("started") est émis.
- Hook onAnyMissionChanged : ("started", mission, userSettings, startedFrom) au démarrage ; ("stopped", mission) à l'arrêt. onAnyMissionWillChange : ("stopped", mission, abandoned) juste avant l'arrêt effectif.
- L'environnement n'est modifié que si mission.setupModules.environment.enabled ; les valeurs d'origine (heure, nuages, vent des nuages, brouillard) sont sauvegardées dans setupModules.environment._original* pour être restaurées. Le vent appliqué aux véhicules est _windVec = (sin(windDirAngle), cos(windDirAngle), 0) * windSpeed.
- Les véhicules mis de côté peuvent être supprimés puis recréés depuis leurs données de spawn (despawnStashedVehiclesForMission=true) ; en carrière, un véhicule trop endommagé est rangé dans l'inventaire et n'est pas réapparu (toast « vehStoredMission »).
- startInstant n'a ni vérification mission nil, ni garde « déjà en cours », ni garde « tâche active » contrairement à startWithFade / startAsScenario.
- allowMissionInteraction est un WIP : renvoie false si core_gamestate.state.state n'est pas « freeroam », true sinon (l'appel dans onUpdate est commenté).
- Le hook onUpdate de ce module appelle mission:onUpdate pour toutes les missions _isOngoing, seulement quand une mission de premier plan existe, en parcourant gameplay_missions_missions.getAllMissions().

**Dépendances (chargées avant) :** `gameplay_traffic`, `gameplay_police`, `gameplay_parking`, `ui_fadeScreen`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_missions_missionManager.allowMissionInteraction()` | WIP : indique si l'interaction avec les missions est autorisée (true seulement si l'état de jeu est « freeroam »). | 1425 |
| `gameplay_missions_missionManager.attemptAbandonMissionWithFade(mission, force, abandonButtonPressed)` | Demande l'abandon d'une mission. Émet onGameplayActivityAborted (si abandonButtonPressed) puis onMissionAbandoned(mission, abandonButtonPressed). Si la mission gère elle-même l'abandon (mission:attemptAbandonMission() vrai, p. ex. un flowgraph avec onRequestAbandon), s'arrête là ; sinon lance la séquence d'arrêt avec fondu. | 1301 |
| `gameplay_missions_missionManager.getCurrentTaskdataTypeOrNil()` | Renvoie le type de tâche en cours ("start" ou "stop"), "start" aussi si un démarrage depuis l'intérieur d'une mission est différé, nil si aucune tâche. | 1529 |
| `gameplay_missions_missionManager.getForegroundMissionId()` | Id de la mission de premier plan en cours (exclusivité : une seule à la fois), ou nil. | 1541 |
| `gameplay_missions_missionManager.isCurrentlyProcessingStep()` | Indique si une suite d'étapes de démarrage/arrêt est en cours de traitement. | 1542 |
| `gameplay_missions_missionManager.onCareerActive()` | Hook appelé à l'activation de la carrière : arrête immédiatement la mission de premier plan (alias de stopForegroundMissionInstantly). *(interne)* *(hook)* | 1513 |
| `gameplay_missions_missionManager.onClientEndMission()` | Hook appelé à la fin du niveau courant (changement de niveau) : arrête immédiatement la mission de premier plan sans nettoyage (alias de stopForegroundMissionInstantly). Sans rapport avec une fin de mission de gameplay. *(interne)* *(hook)* | 1513 |
| `gameplay_missions_missionManager.onParkingVehiclesActivated()` | Hook appelé quand des véhicules garés apparaissent sans trafic : même effet que onTrafficStarted. *(interne)* *(hook)* | 1060 |
| `gameplay_missions_missionManager.onScreenFadeState(state)` | Hook de ui_fadeScreen appelé à chaque phase du fondu. Débloque l'étape qui attend le fondu (fadeState<state> = true) et déclenche l'arrêt de la mission courante pour un démarrage différé. *(interne)* *(hook)* | 1071 |
| `gameplay_missions_missionManager.onTrafficStarted()` | Hook appelé quand le trafic démarre : valide l'étape qui attend le trafic (waitForTraffic). *(interne)* *(hook)* | 1060 |
| `gameplay_missions_missionManager.onUpdate(dtReal, dtSim, dtRaw)` | Appelé chaque frame. Avance les étapes de la tâche active (timeouts compris), lance le démarrage différé de startFromWithinMission quand l'arrêt est fini, et appelle mission:onUpdate des missions en cours. Contient une fenêtre de debug imgui (désactivée par défaut). *(interne)* *(hook)* | 1434 |
| `gameplay_missions_missionManager.start(mission, userSettings, startingOptions)` | Alias de startWithFade : démarre une mission avec fondu d'écran. | 1088 |
| `gameplay_missions_missionManager.startAsScenario(mission, userSettings)` | Démarre une mission sans fondu ni retrait de véhicules : pré-mission, mise de côté des véhicules, véhicule, trafic, onStart (utilisé quand la mission est lancée comme scénario). | 1153 |
| `gameplay_missions_missionManager.startFromWithinMission(mission, userSettings, instant)` | Arrête la mission de premier plan puis en démarre une autre (ou la même, reconfigurée) : avec fondu (par défaut) ou instantanément. Le démarrage réel est différé jusqu'à la fin de l'arrêt (traité dans onUpdate). Émet onMissionReconfigured si c'est la même mission. | 1193 |
| `gameplay_missions_missionManager.startInstant(mission, userSettings, startingOptions)` | Démarre une mission immédiatement avec seulement les étapes pré-mission et onStart (sans toucher aux véhicules). Émet le hook startFromWithinMissionInstant(mission, userSettings, startingOptions). | 1222 |
| `gameplay_missions_missionManager.startWithFade(mission, userSettings, startingOptions)` | Démarre une mission avec la suite d'étapes complète : fondu, retrait des véhicules, préparation (pré-mission), réparation de départ, instantané de l'état des pièces (sauf skipPartConditionSnapshot), mise de côté des véhicules, véhicule de mission, trafic, puis onStart. Émet le hook onMissionStartWithFade(mission, userSettings). | 1088 |
| `gameplay_missions_missionManager.startWithLoadingLevel(mission, userSettings, level, startedFrom)` | Charge d'abord le niveau (celui de la mission par défaut), arrête toute mission de premier plan, puis exécute pré-mission, mise de côté des véhicules, véhicule, trafic et onStart. | 1248 |
| `gameplay_missions_missionManager.stop(mission, data)` | Arrête une mission en cours : onStop de la mission, restauration des véhicules mis de côté, post-traitement, retrait de véhicules, réapparition du véhicule du joueur et du trafic, puis fondu (sauf data.ignoreFade). Émet le hook onMissionStopped(mission). | 1371 |
| `gameplay_missions_missionManager.stopForegroundMissionInstantly()` | Arrête immédiatement la mission de premier plan (taskStopMissionStep avec stopInstant) sans restaurer véhicules ni environnement. Appelé aussi à la fin du chargement d'un niveau et à l'activation de la carrière. | 1513 |

### Détail des paramètres

#### `gameplay_missions_missionManager.allowMissionInteraction()`

WIP : indique si l'interaction avec les missions est autorisée (true seulement si l'état de jeu est « freeroam »).

- **renvoie** : boolean true si autorisée.

#### `gameplay_missions_missionManager.attemptAbandonMissionWithFade(mission, force, abandonButtonPressed)`

Demande l'abandon d'une mission. Émet onGameplayActivityAborted (si abandonButtonPressed) puis onMissionAbandoned(mission, abandonButtonPressed). Si la mission gère elle-même l'abandon (mission:attemptAbandonMission() vrai, p. ex. un flowgraph avec onRequestAbandon), s'arrête là ; sinon lance la séquence d'arrêt avec fondu.

- `mission` (*table*) : Mission en cours.
- `force` (*boolean|nil*) : Non utilisé dans le code.
- `abandonButtonPressed` (*boolean|nil*) : true si le joueur a appuyé sur le bouton d'abandon (data.abandoned = true).
- **renvoie** : boolean|nil true en cas d'erreur ou si la mission gère l'abandon elle-même.

#### `gameplay_missions_missionManager.getCurrentTaskdataTypeOrNil()`

Renvoie le type de tâche en cours ("start" ou "stop"), "start" aussi si un démarrage depuis l'intérieur d'une mission est différé, nil si aucune tâche.

- **renvoie** : string|nil "start", "stop" ou nil.

#### `gameplay_missions_missionManager.getForegroundMissionId()`

Id de la mission de premier plan en cours (exclusivité : une seule à la fois), ou nil.

- **renvoie** : string|nil Id de mission.

#### `gameplay_missions_missionManager.isCurrentlyProcessingStep()`

Indique si une suite d'étapes de démarrage/arrêt est en cours de traitement.

- **renvoie** : boolean true si taskData.active.

#### `gameplay_missions_missionManager.onScreenFadeState(state)`

Hook de ui_fadeScreen appelé à chaque phase du fondu. Débloque l'étape qui attend le fondu (fadeState<state> = true) et déclenche l'arrêt de la mission courante pour un démarrage différé.

- `state` (*integer*) : Numéro de phase du fondu (1, 2, 3).

#### `gameplay_missions_missionManager.onUpdate(dtReal, dtSim, dtRaw)`

Appelé chaque frame. Avance les étapes de la tâche active (timeouts compris), lance le démarrage différé de startFromWithinMission quand l'arrêt est fini, et appelle mission:onUpdate des missions en cours. Contient une fenêtre de debug imgui (désactivée par défaut).

- `dtReal` (*number*) : Temps réel (s).
- `dtSim` (*number*) : Temps de simulation (s).
- `dtRaw` (*number*) : Temps brut (s).

#### `gameplay_missions_missionManager.start(mission, userSettings, startingOptions)`

Alias de startWithFade : démarre une mission avec fondu d'écran.

- `mission` (*table*) : Mission construite (gameplay_missions_missions.getMissionById).
- `userSettings` (*table|nil*) : Réglages utilisateur choisis ({} par défaut).
- `startingOptions` (*table|nil*) : Options : startedFrom, skipPartConditionSnapshot, etc.
- **renvoie** : boolean|nil true en cas d'erreur.

#### `gameplay_missions_missionManager.startAsScenario(mission, userSettings)`

Démarre une mission sans fondu ni retrait de véhicules : pré-mission, mise de côté des véhicules, véhicule, trafic, onStart (utilisé quand la mission est lancée comme scénario).

- `mission` (*table*) : Mission construite.
- `userSettings` (*table|nil*) : Réglages utilisateur.
- **renvoie** : boolean|nil true en cas d'erreur, nil si une tâche est active.

#### `gameplay_missions_missionManager.startFromWithinMission(mission, userSettings, instant)`

Arrête la mission de premier plan puis en démarre une autre (ou la même, reconfigurée) : avec fondu (par défaut) ou instantanément. Le démarrage réel est différé jusqu'à la fin de l'arrêt (traité dans onUpdate). Émet onMissionReconfigured si c'est la même mission.

- `mission` (*table*) : Mission à démarrer.
- `userSettings` (*table|nil*) : Réglages utilisateur.
- `instant` (*boolean|nil*) : true pour éviter le fondu.

#### `gameplay_missions_missionManager.startInstant(mission, userSettings, startingOptions)`

Démarre une mission immédiatement avec seulement les étapes pré-mission et onStart (sans toucher aux véhicules). Émet le hook startFromWithinMissionInstant(mission, userSettings, startingOptions).

- `mission` (*table*) : Mission construite.
- `userSettings` (*table|nil*) : Réglages utilisateur.
- `startingOptions` (*table|nil*) : Options de démarrage.

#### `gameplay_missions_missionManager.startWithFade(mission, userSettings, startingOptions)`

Démarre une mission avec la suite d'étapes complète : fondu, retrait des véhicules, préparation (pré-mission), réparation de départ, instantané de l'état des pièces (sauf skipPartConditionSnapshot), mise de côté des véhicules, véhicule de mission, trafic, puis onStart. Émet le hook onMissionStartWithFade(mission, userSettings).

- `mission` (*table*) : Mission construite.
- `userSettings` (*table|nil*) : Réglages utilisateur.
- `startingOptions` (*table|nil*) : Options de démarrage.
- **renvoie** : boolean|nil true en cas d'erreur (mission nil ou déjà en cours), nil si une tâche est déjà active.

#### `gameplay_missions_missionManager.startWithLoadingLevel(mission, userSettings, level, startedFrom)`

Charge d'abord le niveau (celui de la mission par défaut), arrête toute mission de premier plan, puis exécute pré-mission, mise de côté des véhicules, véhicule, trafic et onStart.

- `mission` (*table*) : Mission construite.
- `userSettings` (*table|nil*) : Réglages utilisateur.
- `level` (*string|nil*) : Niveau à charger ; par défaut mission.startTrigger.level.
- `startedFrom` (*string|nil*) : Origine du démarrage (transmise aux hooks).
- **renvoie** : boolean|nil true en cas d'erreur.

#### `gameplay_missions_missionManager.stop(mission, data)`

Arrête une mission en cours : onStop de la mission, restauration des véhicules mis de côté, post-traitement, retrait de véhicules, réapparition du véhicule du joueur et du trafic, puis fondu (sauf data.ignoreFade). Émet le hook onMissionStopped(mission).

- `mission` (*table*) : Mission en cours.
- `data` (*table|nil*) : Données d'arrêt : ignoreFade, abandoned, attempt, stopInstant...
- **renvoie** : boolean|nil true en cas d'erreur (mission nil ou non en cours), nil si une tâche est active.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant : gameplay_traffic, gameplay_police, gameplay_parking, ui_fadeScreen. |
| `fadeDuration` | number | Durée (s) du fondu d'écran, 0.75 par défaut ; utilisée pour le fondu de démarrage dans startFromWithinMission. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onAnyMissionChanged` — écouté par 19 module(s)
- `onAnyMissionWillChange` — écouté par 2 module(s)
- `onClientStartMission` — écouté par 40 module(s)
- `onGameplayActivityAborted`
- `onMissionAbandoned` — écouté par 1 module(s)
- `onMissionReconfigured` — écouté par 1 module(s)
- `onMissionStartWithFade`
- `onMissionStopped`
- `startFromWithinMissionInstant`

**Évènements UI (guihooks.trigger) :** `toastrMsg`

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `be:` `enterVehicle`, `resetTireMarks`
- `core_environment.` `getCloudCover`, `getFogDensity`, `getSolarTimeOfDayValue`, `getTimeOfDay`, `getTimeOfDayValueForNormalizedTime`, `getWindSpeed`, `setCloudCover`, `setFogDensity`, `setTimeOfDay`, `setWindSpeed`
- `obj:` `delete`, `getActive`, `getDirectionVector`, `getDirectionVectorUp`, `getDynDataFieldbyName`, `getField`, `getId`, `getMetallicPaintData`, `getPosition`, `setActive`
- `scenetree.` `findClassObjects`, `findObject`

**Charge les extensions :** `gameplay_vehiclePerformance`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/missionManager.lua`.*
