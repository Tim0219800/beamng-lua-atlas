# `gameplay_crashTest_scenarioManager`

*Fichier : `lua/ge/extensions/gameplay/crashTest/scenarioManager.lua` · VM : Game Engine (GE) · 799 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_crashTest_scenarioManager` : `extensions.load("gameplay_crashTest_scenarioManager")`, puis la globale `gameplay_crashTest_scenarioManager`

**Dépendances (chargées avant) :** `ui_apps_genericMissionData`, `ui_apps_pointsBar`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_crashTest_scenarioManager.activatesAllVehForReset()` |  | 753 |
| `gameplay_crashTest_scenarioManager.clearMarkers()` | INTERNAL | 572 |
| `gameplay_crashTest_scenarioManager.getCrashTestData()` |  | 769 |
| `gameplay_crashTest_scenarioManager.goToNextStepFromUI()` |  | 757 |
| `gameplay_crashTest_scenarioManager.onAnyMissionChanged(status, mission)` | *(hook)* | 737 |
| `gameplay_crashTest_scenarioManager.onCrashCamEnded()` | *(hook)* | 765 |
| `gameplay_crashTest_scenarioManager.onExtensionUnloaded(extension)` | *(hook)* | 743 |
| `gameplay_crashTest_scenarioManager.onPlayerOutOfBounds()` | *(hook)* | 749 |
| `gameplay_crashTest_scenarioManager.onPreRender(dt, dtSim)` | *(hook)* | 566 |
| `gameplay_crashTest_scenarioManager.onUpdate(dtReal, dtSim)` | *(hook)* | 621 |
| `gameplay_crashTest_scenarioManager.onVehicleCrashEnded(crashEndData)` | *(hook)* | 728 |
| `gameplay_crashTest_scenarioManager.onVehicleCrashStarted(crashStartData)` | basically check if player crashed into the actual target, if not then mission failed *(hook)* | 701 |
| `gameplay_crashTest_scenarioManager.processData(crashTestData, deactivateVehiclesFromOtherSteps_)` |  | 203 |
| `gameplay_crashTest_scenarioManager.reset()` |  | 318 |
| `gameplay_crashTest_scenarioManager.setDebug(_debug)` |  | 792 |
| `gameplay_crashTest_scenarioManager.startScenario()` |  | 466 |
| `gameplay_crashTest_scenarioManager.startStepFromUI()` |  | 761 |
| `gameplay_crashTest_scenarioManager.trackVehiclesForCrash()` |  | 342 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onCrashScenarioFailed`
- `onCrashTestShowEndStepDetails`
- `onCrashTestShowStepDetails`

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawTextAdvanced`
- `scenetree.` `findObjectById`

**Charge les extensions :** `freeroam_crashCamMode`, `gameplay_crashTest_crashTestBoundaries`, `gameplay_crashTest_crashTestCountdown`, `gameplay_crashTest_crashTestDamageChecker`, `gameplay_crashTest_crashTestScoring`, `gameplay_crashTest_crashTestTaskList`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/crashTest/scenarioManager.lua`.*
