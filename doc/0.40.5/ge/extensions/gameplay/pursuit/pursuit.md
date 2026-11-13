# `gameplay_pursuit_pursuit`

*Fichier : `lua/ge/extensions/gameplay/pursuit/pursuit.lua` · VM : Game Engine (GE) · 784 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_pursuit_pursuit` : `extensions.load("gameplay_pursuit_pursuit")`, puis la globale `gameplay_pursuit_pursuit`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_pursuit_pursuit.filterParkingSpots(parkingSpots, chaseAmount, fleeAmount)` |  | 280 |
| `gameplay_pursuit_pursuit.getManager()` |  | 507 |
| `gameplay_pursuit_pursuit.insertVeh(vehId, isChase, isAiControlled, options)` |  | 106 |
| `gameplay_pursuit_pursuit.onDeserialized(data)` | *(hook)* | 746 |
| `gameplay_pursuit_pursuit.onPursuitAction(vehId, action, pursuit)` | *(hook)* | 511 |
| `gameplay_pursuit_pursuit.onSerialize()` | *(hook)* | 719 |
| `gameplay_pursuit_pursuit.onTrafficAmountChanged()` | *(hook)* | 716 |
| `gameplay_pursuit_pursuit.onTrafficStarted()` | *(hook)* | 704 |
| `gameplay_pursuit_pursuit.onTrafficStopped()` | *(hook)* | 713 |
| `gameplay_pursuit_pursuit.onUpdate(dt, dtSim)` | *(hook)* | 560 |
| `gameplay_pursuit_pursuit.onVehicleGroupSpawned(vehList, groupId, groupName)` | *(hook)* | 682 |
| `gameplay_pursuit_pursuit.removeVeh(vehId)` |  | 159 |
| `gameplay_pursuit_pursuit.reset()` |  | 221 |
| `gameplay_pursuit_pursuit.restart()` |  | 241 |
| `gameplay_pursuit_pursuit.setupGoals(options)` |  | 70 |
| `gameplay_pursuit_pursuit.setupPursuit(chaseVehId, fleeVehId, options, pursuitVars)` |  | 310 |
| `gameplay_pursuit_pursuit.setupPursuitMulti(chaseVehIds, fleeVehIds, options, pursuitVars)` |  | 342 |
| `gameplay_pursuit_pursuit.setupVehicles(chaseAmount, fleeAmount, chaseVehGroup, fleeVehGroup, parkingSpots, options, pursuitVars)` |  | 420 |
| `gameplay_pursuit_pursuit.setupVehiclesFromFiles(chaseAmount, fleeAmount, chaseVehGroupFile, fleeVehGroupFile, sitesFile, options, pursuitVars)` |  | 448 |
| `gameplay_pursuit_pursuit.start()` |  | 250 |
| `gameplay_pursuit_pursuit.stop(winner)` |  | 258 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onPursuitAction` — écouté par 3 module(s)
- `onPursuitGameplayEvent`
- `onPursuitGameplayFinished`
- `onPursuitGameplayStarted`

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/pursuit/pursuit.lua`.*
