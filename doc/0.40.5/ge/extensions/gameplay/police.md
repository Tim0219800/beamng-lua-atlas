# `gameplay_police`

*Fichier : `lua/ge/extensions/gameplay/police.lua` · VM : Game Engine (GE) · 806 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_police` : `extensions.load("gameplay_police")`, puis la globale `gameplay_police`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_police.arrestVehicle(id, showMessages)` |  | 456 |
| `gameplay_police.checkRoadblock(vehIds, rbWidth, useLength)` |  | 56 |
| `gameplay_police.evadeVehicle(id, showMessages)` |  | 493 |
| `gameplay_police.getNearestPoliceVehicle(targetId, isVisible, isUsable)` |  | 277 |
| `gameplay_police.getPolice()` |  | 273 |
| `gameplay_police.getPoliceVars()` |  | 603 |
| `gameplay_police.getPoliceVehicles()` |  | 273 |
| `gameplay_police.getPursuitData(id)` |  | 594 |
| `gameplay_police.getPursuitVars()` |  | 603 |
| `gameplay_police.insertProp(propId)` | public interface | 235 |
| `gameplay_police.isVehicleInPursuit(id, targetId)` |  | 299 |
| `gameplay_police.onClientEndMission()` | *(hook)* | 707 |
| `gameplay_police.onDeserialized(data)` | *(hook)* | 762 |
| `gameplay_police.onSerialize()` | *(hook)* | 756 |
| `gameplay_police.onTrafficAction(id, action, data)` | *(hook)* | 607 |
| `gameplay_police.onTrafficSpecialVehiclesProviders()` | *(hook)* | 26 |
| `gameplay_police.onTrafficStarted()` | *(hook)* | 635 |
| `gameplay_police.onTrafficStopped()` | *(hook)* | 642 |
| `gameplay_police.onTrafficVehicleAdded(id)` | *(hook)* | 623 |
| `gameplay_police.onTrafficVehicleRemoved(id)` | *(hook)* | 629 |
| `gameplay_police.onUpdate(dt, dtSim)` | *(hook)* | 712 |
| `gameplay_police.onVehicleDestroyed(id)` | *(hook)* | 700 |
| `gameplay_police.onVehicleResetted(id)` | *(hook)* | 683 |
| `gameplay_police.onVehicleSwitched(oldId, newId)` | *(hook)* | 646 |
| `gameplay_police.placeRoadblock(vehIds, pos, rot, placeData)` |  | 91 |
| `gameplay_police.releaseVehicle(id, showMessages)` |  | 519 |
| `gameplay_police.removeProp(propId)` |  | 242 |
| `gameplay_police.setPoliceVars(data)` |  | 265 |
| `gameplay_police.setPropsActive(active, reset)` |  | 226 |
| `gameplay_police.setPursuitMode(mode, targetId, policeIds)` |  | 325 |
| `gameplay_police.setPursuitVars(data)` |  | 265 |
| `gameplay_police.setSuspect(id)` |  | 429 |
| `gameplay_police.setSuspectTimer(time)` |  | 439 |
| `gameplay_police.setupPursuitGameplay(suspectId, policeIds, options)` |  | 544 |
| `gameplay_police.setupRoadblock(targetId, roadblockVehIds, roadblockPropIds, originPos, originDirVec, activeDist, spawnDist)` |  | 136 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `enabled` | boolean |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onPursuitAction` — écouté par 3 module(s)
- `onPursuitModeUpdate`

## Appels vers le moteur (C++)

- `be:` `getEnabled`, `getObjectActive`, `getObjectPositionXYZ`, `getPlayerVehicleID`
- `obj:` `isPlayerControlled`, `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/police.lua`.*
