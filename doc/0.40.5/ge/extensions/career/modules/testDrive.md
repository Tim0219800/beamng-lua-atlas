# `career_modules_testDrive`

*Fichier : `lua/ge/extensions/career/modules/testDrive.lua` · VM : Game Engine (GE) · 364 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_testDrive` : `extensions.load("career_modules_testDrive")`, puis la globale `career_modules_testDrive`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_testDrive.abandonTestDrive()` |  | 217 |
| `career_modules_testDrive.formatTestDriveToRawPoi(elements)` |  | 279 |
| `career_modules_testDrive.getTimeLeft()` |  | 266 |
| `career_modules_testDrive.isActive()` |  | 270 |
| `career_modules_testDrive.isDamageDetected()` |  | 274 |
| `career_modules_testDrive.onBeforeRadialOpened()` | *(hook)* | 322 |
| `career_modules_testDrive.onCareerActive(active)` | *(hook)* | 316 |
| `career_modules_testDrive.onGetRawPoiListForLevel(levelIdentifier, elements)` | poi list stuff *(hook)* | 294 |
| `career_modules_testDrive.onPoiDetailPromptOpening(elemData, promptData)` | *(hook)* | 298 |
| `career_modules_testDrive.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 252 |
| `career_modules_testDrive.onVehicleRepairedByInsurance(amount)` | *(hook)* | 203 |
| `career_modules_testDrive.resetData()` |  | 55 |
| `career_modules_testDrive.start(_vehicleId, testDriveInfo)` |  | 111 |
| `career_modules_testDrive.stop(userAborted)` |  | 207 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onGameplayActivityAborted`
- `onTestDriveEndedAfterFade` — écouté par 1 module(s)
- `onTestDriveStarted` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `Message`, `ScenarioRealtimeDisplay`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/testDrive.lua`.*
