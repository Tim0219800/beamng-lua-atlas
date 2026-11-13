# `gameplay_missions_missionTypes_flowMission`

*Fichier : `lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua` · VM : Game Engine (GE) · 655 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/missions/missionTypes/flowMission")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_missions_missionTypes_flowMission")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addOrSetVariable(name, value)` |  | 569 |
| `C:attemptAbandonMission()` |  | 560 |
| `C:getCommonSettingsData()` | common settings that any mission type may use (vehicles, traffic, environment, etc.) | 111 |
| `C:getDynamicStarReward(key, userSettings)` |  | 420 |
| `C:getEntryFee(userSettings)` |  | 409 |
| `C:getGameContextUiButtons()` |  | 616 |
| `C:getProgressKeyTranslation(progressKey)` |  | 63 |
| `C:init()` | This is called when a mission of this type is being created. Load files, initialize variables etc | 37 |
| `C:onFlowgraphStateStarted(stateName, state, transData)` |  | 491 |
| `C:onFlowgraphStateStopped(stateName, state)` |  | 497 |
| `C:onMissionScreenReady(mode)` |  | 503 |
| `C:onStart()` | when the activity starts. | 423 |
| `C:onStop(data)` |  | 537 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` | update each frame | 520 |
| `C:processCommonSettings(flatSettings)` | apply common settings for the mission | 295 |
| `C:processUserSettings(settings)` |  | 324 |
| `C:retrieveProgressFromFlowgraph()` |  | 598 |
| `C:setBackwardsCompatibility(keyAliases)` | enables backwards compatibility for older missions | 329 |
| `C:setPreviewsForCustomVehicles(userSettings)` |  | 241 |
| `C:setupFlowgraphManager(fgFile, variables)` |  | 69 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onMissionProgressChanged`

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `core_environment.` `getSolarTimeOfDayOptions`, `getSolarTimeOfDayValue`, `getTimeOfDay`, `getTimeOfDayValueForNormalizedTime`, `setTimeOfDay`

**Charge les extensions :** `gameplay_vehiclePerformance`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua`.*
