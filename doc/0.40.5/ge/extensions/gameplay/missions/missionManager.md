# `gameplay_missions_missionManager`

*Fichier : `lua/ge/extensions/gameplay/missions/missionManager.lua` · VM : Game Engine (GE) · 1544 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_missions_missionManager` : `extensions.load("gameplay_missions_missionManager")`, puis la globale `gameplay_missions_missionManager`

**Dépendances (chargées avant) :** `gameplay_traffic`, `gameplay_police`, `gameplay_parking`, `ui_fadeScreen`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_missions_missionManager.allowMissionInteraction()` | WIP for allowing or disallowing missions | 1425 |
| `gameplay_missions_missionManager.attemptAbandonMissionWithFade(mission, force, abandonButtonPressed)` |  | 1301 |
| `gameplay_missions_missionManager.getCurrentTaskdataTypeOrNil()` |  | 1529 |
| `gameplay_missions_missionManager.getForegroundMissionId()` | exclusivity | 1541 |
| `gameplay_missions_missionManager.isCurrentlyProcessingStep()` |  | 1542 |
| `gameplay_missions_missionManager.onCareerActive()` | when we change level, immediately stop mission, but don't clean up. *(hook)* | 1513 |
| `gameplay_missions_missionManager.onClientEndMission()` | when we change level, immediately stop mission, but don't clean up. *(hook)* | 1513 |
| `gameplay_missions_missionManager.onParkingVehiclesActivated()` | *(hook)* | 1060 |
| `gameplay_missions_missionManager.onScreenFadeState(state)` | *(hook)* | 1071 |
| `gameplay_missions_missionManager.onTrafficStarted()` | *(hook)* | 1060 |
| `gameplay_missions_missionManager.onUpdate(dtReal, dtSim, dtRaw)` | external callbacks *(hook)* | 1434 |
| `gameplay_missions_missionManager.start(mission, userSettings, startingOptions)` |  | 1088 |
| `gameplay_missions_missionManager.startAsScenario(mission, userSettings)` |  | 1153 |
| `gameplay_missions_missionManager.startFromWithinMission(mission, userSettings, instant)` |  | 1193 |
| `gameplay_missions_missionManager.startInstant(mission, userSettings, startingOptions)` |  | 1222 |
| `gameplay_missions_missionManager.startWithFade(mission, userSettings, startingOptions)` |  | 1088 |
| `gameplay_missions_missionManager.startWithLoadingLevel(mission, userSettings, level, startedFrom)` |  | 1248 |
| `gameplay_missions_missionManager.stop(mission, data)` |  | 1371 |
| `gameplay_missions_missionManager.stopForegroundMissionInstantly()` | when we change level, immediately stop mission, but don't clean up. | 1513 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `fadeDuration` | number |  |

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
