# `gameplay_race_race`

*Fichier : `lua/ge/extensions/gameplay/race/race.lua` · VM : Game Engine (GE) · 1351 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/race/race")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_race_race")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:abortRace(id)` |  | 615 |
| `C:calcAIPath()` |  | 47 |
| `C:changeRaceVehicle(lastId, newId)` |  | 361 |
| `C:clearEvents(id)` |  | 1166 |
| `C:completeLap(id, endTime)` |  | 667 |
| `C:createRecoveryPoint(id, recovery)` |  | 628 |
| `C:debugDraw(data)` |  | 109 |
| `C:detectOffTrack(data, dt)` |  | 118 |
| `C:detectRollingStart(id, dt)` |  | 822 |
| `C:digestEvents(id, dt)` |  | 1028 |
| `C:doSuspend(sus)` |  | 330 |
| `C:drawDebug(id)` |  | 1175 |
| `C:findNextPathnodes(id)` |  | 734 |
| `C:formatTimeDifference(timeDiff)` |  | 1315 |
| `C:getDistOnNav(pointA, pointB, inNextAiPathIdx, inPrevAiPathIdx, outNextAiPathIdx, outPrevAiPathIdx)` |  | 67 |
| `C:getTimeDifferencesToFirst()` |  | 1327 |
| `C:getTrackedData(dt)` |  | 182 |
| `C:getVehiclePosition(id)` | this should probably be improved at some point | 602 |
| `C:handlePacenotes(id)` |  | 1005 |
| `C:handleRecover(id)` |  | 650 |
| `C:hasRecoveryPosition(id)` |  | 636 |
| `C:inDrawEventlog(id, im)` |  | 1194 |
| `C:inDrawLapTimes(lTimes, im)` |  | 1300 |
| `C:inDrawSegmentTimes(sTimes, im, mode, prefix)` |  | 1280 |
| `C:inDrawTimes(id, im, detail)` |  | 1220 |
| `C:init()` |  | 7 |
| `C:onUpdate(dt)` |  | 278 |
| `C:raceTime(time)` |  | 1308 |
| `C:requestRecover(id)` | returns only true if a recovery state exists | 644 |
| `C:setPath(path)` |  | 51 |
| `C:setPathFile(file)` |  | 35 |
| `C:setVehicleIds(ids)` |  | 57 |
| `C:skipLap(id, keepLapProgress)` |  | 349 |
| `C:startAiVehicle(id, aggression)` |  | 395 |
| `C:startRace()` |  | 469 |
| `C:stopAiVehicle(id)` |  | 461 |
| `C:stopRace()` |  | 584 |
| `C:updateVehicle(id, dt)` |  | 852 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRaceAborted`
- `onRaceComplete`
- `onRacePathnodeReached` — écouté par 2 module(s)
- `onRaceStarted` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `HotlappingResetApp`, `HotlappingTimerPause`, `HotlappingTimerUnpause`, `setQuickRaceMode`

## Appels vers le moteur (C++)

- `be:` `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfExtentsXYZ`, `getPlayerVehicleID`
- `debugDrawer:` `drawSphere`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/race/race.lua`.*
