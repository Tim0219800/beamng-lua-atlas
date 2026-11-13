# `gameplay_drift_display`

*Fichier : `lua/ge/extensions/gameplay/drift/display.lua` · VM : Game Engine (GE) · 532 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_display` : `extensions.load("gameplay_drift_display")`, puis la globale `gameplay_drift_display`

**Dépendances (chargées avant) :** `gameplay_drift_general`, `gameplay_drift_drift`, `gameplay_drift_scoring`, `ui_apps_genericMissionData`, `ui_appContainers`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_display.getDriftDebugInfo()` |  | 494 |
| `gameplay_drift_display.getIsScorePresentationActive(vehId)` |  | 70 |
| `gameplay_drift_display.getScorePresentationDuration()` |  | 56 |
| `gameplay_drift_display.onDeserialized(data)` | *(hook)* | 453 |
| `gameplay_drift_display.onDonutDriftScored(score)` | *(hook)* | 171 |
| `gameplay_drift_display.onDriftCachedScoreReset(vehId)` | *(hook)* | 407 |
| `gameplay_drift_display.onDriftCompletedScored(data)` | *(hook)* | 143 |
| `gameplay_drift_display.onDriftContextChanged(context)` | *(hook)* | 463 |
| `gameplay_drift_display.onDriftCrash(vehId)` | *(hook)* | 163 |
| `gameplay_drift_display.onDriftDebugChanged(value)` | *(hook)* | 457 |
| `gameplay_drift_display.onDriftPlVehReset(vehId)` | *(hook)* | 401 |
| `gameplay_drift_display.onDriftQuickMessageDisplay(data)` | *(hook)* | 396 |
| `gameplay_drift_display.onDriftScoreWrappedUp(score, vehId)` | *(hook)* | 436 |
| `gameplay_drift_display.onDriftSpinout(vehId)` | *(hook)* | 167 |
| `gameplay_drift_display.onDriftSpotCompleted(data)` | *(hook)* | 392 |
| `gameplay_drift_display.onDriftSpotFailed(data)` | *(hook)* | 432 |
| `gameplay_drift_display.onExtensionLoaded()` | *(hook)* | 480 |
| `gameplay_drift_display.onExtensionUnloaded()` | *(hook)* | 411 |
| `gameplay_drift_display.onFreeroamDriftZoneNewHighscore()` | *(hook)* | 428 |
| `gameplay_drift_display.onHitPoleScored(score)` | *(hook)* | 186 |
| `gameplay_drift_display.onNearPoleScored(score)` | *(hook)* | 176 |
| `gameplay_drift_display.onNewDriftTierReached(tierData)` | *(hook)* | 442 |
| `gameplay_drift_display.onSerialize()` | *(hook)* | 447 |
| `gameplay_drift_display.onTightDriftScored(score)` | *(hook)* | 181 |
| `gameplay_drift_display.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 381 |
| `gameplay_drift_display.onVehicleDestroyed(vehId)` | *(hook)* | 423 |
| `gameplay_drift_display.reset()` |  | 487 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

**Évènements UI (guihooks.trigger) :** `ClearTasklist`, `ScenarioRealtimeDisplay`, `TopCenterAppsFlashMessage`, `displayDriftScoreModifier`, `setDriftPersistentDriftScored`, `setDriftRealtimeFail`, `stuntZoneScored`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/display.lua`.*
