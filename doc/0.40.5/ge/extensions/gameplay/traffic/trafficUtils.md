# `gameplay_traffic_trafficUtils`

*Fichier : `lua/ge/extensions/gameplay/traffic/trafficUtils.lua` · VM : Game Engine (GE) · 741 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_traffic_trafficUtils` : `extensions.load("gameplay_traffic_trafficUtils")`, puis la globale `gameplay_traffic_trafficUtils`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_traffic_trafficUtils.checkSpawnPoint(pos, origPos, minDist, maxDist, minVehDist, n1, n2)` |  | 293 |
| `gameplay_traffic_trafficUtils.createPoliceGroup(amount, allMods)` |  | 85 |
| `gameplay_traffic_trafficUtils.createTrafficGroup(amount, allMods, allConfigs, simpleVehs)` |  | 58 |
| `gameplay_traffic_trafficUtils.finalizeSpawnPoint(pos, dir, mapNode1, mapNode2, options)` |  | 297 |
| `gameplay_traffic_trafficUtils.findSafeSpawnPoint(startPos, startDir, minDist, maxDist, targetDist, options)` |  | 648 |
| `gameplay_traffic_trafficUtils.findSpawnPoint(startPos, startDir, minDist, maxDist, targetDist, options)` |  | 519 |
| `gameplay_traffic_trafficUtils.findSpawnPointOnLine(startPos, startDir, minDist, maxDist, targetDist, options)` |  | 452 |
| `gameplay_traffic_trafficUtils.findSpawnPointOnRoute(startPos, startDir, minDist, maxDist, targetDist, options)` |  | 519 |
| `gameplay_traffic_trafficUtils.findSpawnPointRadial(startPos, startDir, minDist, maxDist, targetDist, options)` |  | 384 |
| `gameplay_traffic_trafficUtils.getAheadPos(pos, dir, scale, useZ0)` |  | 161 |
| `gameplay_traffic_trafficUtils.getBaseGroupParams()` |  | 49 |
| `gameplay_traffic_trafficUtils.getBaseValues()` |  | 45 |
| `gameplay_traffic_trafficUtils.getLevelInfo()` |  | 26 |
| `gameplay_traffic_trafficUtils.getNearestTrafficVehicle(pos, filters)` |  | 678 |
| `gameplay_traffic_trafficUtils.getRoleConstructor(roleName)` |  | 150 |
| `gameplay_traffic_trafficUtils.getTrafficGroupFromFile(options)` |  | 107 |
| `gameplay_traffic_trafficUtils.placeTrafficVehicles(pos, dir, options)` |  | 669 |
| `gameplay_traffic_trafficUtils.setTrafficSpeedFromApp(speed, mode)` |  | 707 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugMode` | boolean |  |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`
- `core_environment.` `getGravity`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/traffic/trafficUtils.lua`.*
