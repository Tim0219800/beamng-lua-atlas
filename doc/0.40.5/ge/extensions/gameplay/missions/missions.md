# `gameplay_missions_missions`

*Fichier : `lua/ge/extensions/gameplay/missions/missions.lua` · VM : Game Engine (GE) · 1315 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_missions_missions` : `extensions.load("gameplay_missions_missions")`, puis la globale `gameplay_missions_missions`

**Dépendances (chargées avant) :** `gameplay_missions_startTrigger`, `gameplay_missions_progress`, `gameplay_rawPois`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_missions_missions.areAllMissionsLoaded()` |  | 1024 |
| `gameplay_missions_missions.baseMission(C, ...)` |  | 1311 |
| `gameplay_missions_missions.clearCache()` |  | 1298 |
| `gameplay_missions_missions.createMission(id, data)` |  | 855 |
| `gameplay_missions_missions.editorHelper(C, ...)` |  | 1313 |
| `gameplay_missions_missions.existsMission(id)` |  | 1289 |
| `gameplay_missions_missions.flowMission(C, ...)` |  | 1312 |
| `gameplay_missions_missions.formatMissionToRawPoi(m, elements, levelIdentifier)` |  | 1113 |
| `gameplay_missions_missions.getAdditionalAttributes()` |  | 75 |
| `gameplay_missions_missions.getAllIds()` |  | 1028 |
| `gameplay_missions_missions.getAllMissions()` |  | 999 |
| `gameplay_missions_missions.getFilesData(skipThumbnail)` |  | 834 |
| `gameplay_missions_missions.getLocations(mission)` |  | 1071 |
| `gameplay_missions_missions.getMissionById(id, infoData)` |  | 967 |
| `gameplay_missions_missions.getMissionEditorForType(missionTypeName)` |  | 157 |
| `gameplay_missions_missions.getMissionPreviewFilepath(missionData)` |  | 189 |
| `gameplay_missions_missions.getMissionProgressSetupData(missionTypeName)` |  | 118 |
| `gameplay_missions_missions.getMissionStaticData(missionTypeName)` |  | 138 |
| `gameplay_missions_missions.getMissionTypeConstructor(missionTypeName)` |  | 98 |
| `gameplay_missions_missions.getMissionTypeFromMissionId(missionId)` |  | 701 |
| `gameplay_missions_missions.getMissionTypes()` |  | 83 |
| `gameplay_missions_missions.getMissionsByFilter(filters)` |  | 1046 |
| `gameplay_missions_missions.getMissionsByMissionType(type)` |  | 1036 |
| `gameplay_missions_missions.getMissionsOfLevel(levelIdentifier)` |  | 980 |
| `gameplay_missions_missions.getNoPreviewFilepath()` |  | 185 |
| `gameplay_missions_missions.getNoThumbFilepath()` |  | 186 |
| `gameplay_missions_missions.getNoVehicleThumbFilepath()` |  | 187 |
| `gameplay_missions_missions.getRecommendedAttributesList()` |  | 11 |
| `gameplay_missions_missions.loadMission(missionDir, skipThumbnail)` |  | 581 |
| `gameplay_missions_missions.logMissionIssues(mission)` |  | 1213 |
| `gameplay_missions_missions.onActivityAcceptGatherData(elemData, activityData)` | *(hook)* | 1145 |
| `gameplay_missions_missions.onExtensionLoaded()` | *(hook)* | 1093 |
| `gameplay_missions_missions.onGetRawPoiListForLevel(levelIdentifier, elements)` | *(hook)* | 1134 |
| `gameplay_missions_missions.recursiveRemoveNestedFromCondition(mId, cond)` |  | 347 |
| `gameplay_missions_missions.reloadCompleteMissionSystem()` |  | 1272 |
| `gameplay_missions_missions.sanitizeMissionAfterCreation(mission)` |  | 272 |
| `gameplay_missions_missions.saveMission(missionData, newFolder)` |  | 617 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `onModManagerReady` | any |  |

**Évènements UI (guihooks.trigger) :** `MenuOpenModule`

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/missions.lua`.*
