# `gameplay_rally_loop_stagedCountdownUtils`

*Fichier : `lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua` · VM : Game Engine (GE) · 240 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_loop_stagedCountdownUtils` : `extensions.load("gameplay_rally_loop_stagedCountdownUtils")`, puis la globale `gameplay_rally_loop_stagedCountdownUtils`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_loop_stagedCountdownUtils.buildRallyClockData(wallClockSecs)` |  | 54 |
| `gameplay_rally_loop_stagedCountdownUtils.calculateImmediateMinuteCountdown(duration)` |  | 30 |
| `gameplay_rally_loop_stagedCountdownUtils.drawDebugPlane(pos, rot, normals)` |  | 64 |
| `gameplay_rally_loop_stagedCountdownUtils.drawDebugVehiclePoint(vehPos, inside)` |  | 145 |
| `gameplay_rally_loop_stagedCountdownUtils.drawMiddleInfo(im, nodeData, formatTimeFromSeconds)` |  | 174 |
| `gameplay_rally_loop_stagedCountdownUtils.drawMiddleProgress(im, state, duration, timer, STATE_COUNTDOWN_RUNNING, STATE_FINISHED)` |  | 227 |
| `gameplay_rally_loop_stagedCountdownUtils.drawVehicleToPlaneDebug(vehPos, planePos, rot, tmpPlaneNormal, tmpToVehicle, tmpClosestPoint, tmpMidPoint)` |  | 95 |
| `gameplay_rally_loop_stagedCountdownUtils.freezeVehicle(vehId, logTag)` |  | 150 |
| `gameplay_rally_loop_stagedCountdownUtils.getEnvironmentWallClockSecs()` |  | 9 |
| `gameplay_rally_loop_stagedCountdownUtils.getStageCountdownSettings(defaultDuration, defaultMaxAnnounced)` |  | 17 |
| `gameplay_rally_loop_stagedCountdownUtils.getWallClockTime(environmentStartTimeSecs, epochTime)` |  | 50 |
| `gameplay_rally_loop_stagedCountdownUtils.unfreezeVehicle(vehId, logTag)` |  | 162 |

## Appels vers le moteur (C++)

- `core_environment.` `getTimeOfDay`
- `debugDrawer:` `drawLineInstance`, `drawSphere`, `drawTextAdvanced`, `drawTriSolid`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua`.*
