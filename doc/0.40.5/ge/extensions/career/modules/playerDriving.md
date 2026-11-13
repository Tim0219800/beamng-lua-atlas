# `career_modules_playerDriving`

*Fichier : `lua/ge/extensions/career/modules/playerDriving.lua` · VM : Game Engine (GE) · 379 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_playerDriving` : `extensions.load("career_modules_playerDriving")`, puis la globale `career_modules_playerDriving`

**Dépendances (chargées avant) :** `career_career`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_playerDriving.getPlayerData()` |  | 15 |
| `career_modules_playerDriving.onCareerActive(active)` | *(hook)* | 315 |
| `career_modules_playerDriving.onPursuitAction(vehId, action, data)` | *(hook)* | 262 |
| `career_modules_playerDriving.onTrafficOrParkingReady()` | *(hook)* | 283 |
| `career_modules_playerDriving.onTrafficStarted()` | *(hook)* | 245 |
| `career_modules_playerDriving.onTrafficStopped()` | *(hook)* | 258 |
| `career_modules_playerDriving.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 309 |
| `career_modules_playerDriving.onVehicleParkingStatus(vehId, data)` | *(hook)* | 233 |
| `career_modules_playerDriving.onVehicleSwitched(oldId, newId)` | *(hook)* | 303 |
| `career_modules_playerDriving.playerPursuitActive()` |  | 107 |
| `career_modules_playerDriving.resetPlayerState()` |  | 111 |
| `career_modules_playerDriving.restoreTrafficAfterTutorialPhase()` |  | 141 |
| `career_modules_playerDriving.retrieveFavoriteVehicle()` |  | 157 |
| `career_modules_playerDriving.setTrafficAfterTutorial()` |  | 125 |
| `career_modules_playerDriving.setTrafficForTutorial()` |  | 117 |
| `career_modules_playerDriving.showPosition(pos)` |  | 340 |
| `career_modules_playerDriving.teleportToGarage(garageId, veh, resetVeh)` |  | 205 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugMode` | any |  ⚠ référence `not` non définie dans le fichier (vaut probablement nil) |
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/playerDriving.lua`.*
