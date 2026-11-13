# `gameplay_traffic_vehicle`

*Fichier : `lua/ge/extensions/gameplay/traffic/vehicle.lua` · VM : Game Engine (GE) · 1029 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/traffic/vehicle")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_traffic_vehicle")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:applyModelConfigData()` |  | 98 |
| `C:checkCollisions()` |  | 319 |
| `C:checkOffenses()` |  | 492 |
| `C:checkPoliceVisibility(dtSim)` |  | 550 |
| `C:checkRayCast(startPos, endPos)` |  | 412 |
| `C:checkTimeOfDay()` |  | 599 |
| `C:fade(rate, isFadeOut)` |  | 401 |
| `C:getBrakingDistance(speed, accel)` |  | 311 |
| `C:getInteractiveDistance(pos, squared)` |  | 297 |
| `C:honkHorn(duration)` |  | 213 |
| `C:init(id, role)` |  | 23 |
| `C:modifyRespawnValues(addActiveRadius, addInnerRadius)` |  | 305 |
| `C:onActiveDone()` |  | 618 |
| `C:onDeserialized(data)` |  | 994 |
| `C:onPursuitUpdate(dt, dtSim)` |  | 755 |
| `C:onRefresh()` |  | 632 |
| `C:onRespawn()` |  | 622 |
| `C:onSerialize()` |  | 966 |
| `C:onTrafficTick(tickTime)` |  | 668 |
| `C:onUpdate(dt, dtSim)` |  | 875 |
| `C:onVehicleResetted()` |  | 610 |
| `C:postInit()` |  | 93 |
| `C:resetAll()` |  | 207 |
| `C:resetElectrics()` |  | 200 |
| `C:resetPursuit()` |  | 168 |
| `C:resetTracking()` |  | 177 |
| `C:resetValues()` |  | 184 |
| `C:setAiMode(mode, ignoreParams)` |  | 225 |
| `C:setAiParameters(params)` |  | 253 |
| `C:setRole(roleName)` |  | 278 |
| `C:trackCollision(otherId, dt)` |  | 377 |
| `C:triggerOffense(data)` |  | 473 |
| `C:tryRespawn()` |  | 439 |
| `C:updateActiveRadius(tickTime)` |  | 421 |
| `C:useSiren(duration, disableAfterUse)` |  | 218 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onPursuitAction` — écouté par 3 module(s)
- `onPursuitOffense` — écouté par 1 module(s)
- `onTrafficAction` — écouté par 2 module(s)
- `onTrafficVehicleCrashed` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `be:` `getObjectActive`, `getObjectOOBBCenterXYZ`, `getPlayerVehicleID`
- `core_environment.` `getGravity`, `getTimeOfDay`
- `obj:` `isPlayerControlled`, `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/traffic/vehicle.lua`.*
