# `gameplay_tutorial_damageTracker`

*Fichier : `lua/ge/extensions/gameplay/tutorial/damageTracker.lua` · VM : Game Engine (GE) · 393 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_tutorial_damageTracker` : `extensions.load("gameplay_tutorial_damageTracker")`, puis la globale `gameplay_tutorial_damageTracker`

**Dépendances (chargées avant) :** `gameplay_util_crashDetection`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_tutorial_damageTracker.claimNextDamagePopup()` |  | 162 |
| `gameplay_tutorial_damageTracker.cleanup()` |  | 202 |
| `gameplay_tutorial_damageTracker.debugTriggerCrash()` |  | 195 |
| `gameplay_tutorial_damageTracker.getHadCrash()` |  | 388 |
| `gameplay_tutorial_damageTracker.onCareerTutorialOutOfBoundsEnded()` | *(hook)* | 315 |
| `gameplay_tutorial_damageTracker.onCareerTutorialOutOfBoundsStarted()` | *(hook)* | 307 |
| `gameplay_tutorial_damageTracker.onClientStartMission(levelPath)` | *(hook)* | 347 |
| `gameplay_tutorial_damageTracker.onRecoveryPromptButtonPressed(buttonId)` | *(hook)* | 368 |
| `gameplay_tutorial_damageTracker.onRecoveryPromptRepairHereUsed(invVehId)` | *(hook)* | 353 |
| `gameplay_tutorial_damageTracker.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 278 |
| `gameplay_tutorial_damageTracker.onVehicleCrashEnded(crashData)` | *(hook)* | 294 |
| `gameplay_tutorial_damageTracker.onVehicleRepaired(invVehId)` | *(hook)* | 360 |
| `gameplay_tutorial_damageTracker.onVehicleResetted(vehicleId)` | *(hook)* | 379 |
| `gameplay_tutorial_damageTracker.setDamagePopupHandler(handler)` |  | 86 |
| `gameplay_tutorial_damageTracker.setDefaultRepairGoal()` |  | 85 |
| `gameplay_tutorial_damageTracker.setEnabled(value)` |  | 181 |
| `gameplay_tutorial_damageTracker.setRepairGoal(goal)` |  | 84 |
| `gameplay_tutorial_damageTracker.setTrackedVehicleId(vehicleId)` |  | 158 |
| `gameplay_tutorial_damageTracker.showRepairTask()` |  | 169 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

**Évènements UI (guihooks.trigger) :** `DiscardTasklistItem`, `SetTasklistTask`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/tutorial/damageTracker.lua`.*
