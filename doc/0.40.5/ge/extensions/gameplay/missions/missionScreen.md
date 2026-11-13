# `gameplay_missions_missionScreen`

*Fichier : `lua/ge/extensions/gameplay/missions/missionScreen.lua` · VM : Game Engine (GE) · 1412 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_missions_missionScreen` : `extensions.load("gameplay_missions_missionScreen")`, puis la globale `gameplay_missions_missionScreen`

**Dépendances (chargées avant) :** `gameplay_missions_missions`, `gameplay_markerInteraction`, `gameplay_playmodeMarkers`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_missions_missionScreen.abandonCurrentMission()` |  | 822 |
| `gameplay_missions_missionScreen.activateSound(soundLabel, active, pitch)` |  | 1012 |
| `gameplay_missions_missionScreen.activateSoundBlur(active)` |  | 894 |
| `gameplay_missions_missionScreen.changeUserSettings(id, settings)` |  | 824 |
| `gameplay_missions_missionScreen.debugOnUpdate(dt)` |  | 1291 |
| `gameplay_missions_missionScreen.discoverLayouts()` |  | 1269 |
| `gameplay_missions_missionScreen.enableDebug(enable)` |  | 1281 |
| `gameplay_missions_missionScreen.formatMission(m)` | formats a single mission. | 111 |
| `gameplay_missions_missionScreen.getActiveStarsForUserSettings(id, userSettings)` |  | 599 |
| `gameplay_missions_missionScreen.getMissionScreenData()` |  | 308 |
| `gameplay_missions_missionScreen.getMissionTiles(ids)` |  | 1096 |
| `gameplay_missions_missionScreen.getMissionsAtCurrentLocationFormatted()` | gets all the missions at the current location (mission marker), and returns them in a list already formatted. | 258 |
| `gameplay_missions_missionScreen.getPauseMissionObjectivesData()` | Data for pause menu (Vue MissionObjectives): merges unlocked stars with active star rules for current settings. | 713 |
| `gameplay_missions_missionScreen.getRepairCostForStartingRepairType(type)` |  | 13 |
| `gameplay_missions_missionScreen.isAnyMissionActive()` |  | 1405 |
| `gameplay_missions_missionScreen.isMissionStartOrEndScreenActive()` |  | 1406 |
| `gameplay_missions_missionScreen.navigateToMission(id, routeTarget, routeParams)` |  | 972 |
| `gameplay_missions_missionScreen.onBigMapActivated()` | *(hook)* | 991 |
| `gameplay_missions_missionScreen.onClientEndMission(levelPath)` | *(hook)* | 927 |
| `gameplay_missions_missionScreen.onExtensionUnloaded()` | *(hook)* | 923 |
| `gameplay_missions_missionScreen.onMissionScreenReady(mode, uiLayout)` | *(hook)* | 1380 |
| `gameplay_missions_missionScreen.onRequestMissionScreenData(mode)` | Testing: Todo: Remove *(hook)* | 1393 |
| `gameplay_missions_missionScreen.openAPMChallenges(branch, skill, routeTarget, routeParams)` |  | 937 |
| `gameplay_missions_missionScreen.openVehicleSelectorForMissionBySetting(mId, settingKey)` |  | 1038 |
| `gameplay_missions_missionScreen.requestStartingOptionsForUserSettings(id, userSettings)` |  | 421 |
| `gameplay_missions_missionScreen.resolveDefaultMissionVehicleClass(m)` | Resolves the vehicle that the mission would use by default (i.e. the option that<br> would be initially selected in the mission settings). The default-pick rules<br> are owned by gameplay_vehiclePerformance.getDefaultMissionVehicleSpec, so this<br> function only translates the spec into a class data payload. | 42 |
| `gameplay_missions_missionScreen.resolveMissionVehicleClassRequirement(m)` | Returns a PerformanceIndexSticker-shaped class requirement for a mission, or nil if<br> the mission does not have a class requirement to display. Mirrors the resolution<br> in gameplay/missionTypes/aiRace/constructor.lua:onPreStart. | 73 |
| `gameplay_missions_missionScreen.resolvePlayerVehicleClass()` | Returns the player's current vehicle class as a PerformanceIndexSticker-shaped table<br> ({ class = { name, description, minPI }, performanceIndex }), or nil if unavailable.<br> Prefers the career-active inventory vehicle (which has real certification data),<br> and falls back to the active player vehicle in free-roam. | 22 |
| `gameplay_missions_missionScreen.resolveRequirementState(currentClass, requiredClass)` | Resolves the panel state ("met" / "unmet" / "unknown") for the panel rendered<br> in the big map and on mission cards. Centralises the comparison rule so the<br> UI does not have to duplicate it. | 60 |
| `gameplay_missions_missionScreen.setPreselectedMissionId(mId)` |  | 882 |
| `gameplay_missions_missionScreen.setPreselectedPage(page)` |  | 877 |
| `gameplay_missions_missionScreen.startFromWithinMission(id, settings)` |  | 1250 |
| `gameplay_missions_missionScreen.startMissionById(id, userSettings, startingOptions)` |  | 790 |
| `gameplay_missions_missionScreen.stopMissionById(id, force, abandonButtonPressed)` |  | 813 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `savedLayouts` | nil |  |
| `testLayout` | nil |  |
| `uiLayoutHistory` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onAvailableMissionsSentToUi` — écouté par 1 module(s)
- `onGetIsMissionStartOrEndScreenActive` — écouté par 1 module(s)
- `onUpdate` — écouté par 186 module(s)

**Évènements UI (guihooks.trigger) :** `MenuOpenModule`, `missionProgressKeyChanged`, `missionStartingOptionsForUserSettingsReady`, `onRequestMissionScreenDataReady`

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`, `removeFile`
- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

**Charge les extensions :** `gameplay_vehiclePerformance`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/missionScreen.lua`.*
