# `flowgraph_nodes_gameplay_rally_rallySuperCountdown`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua` · VM : Game Engine (GE) · 1227 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` |  | 145 |
| `C:_executionStopped()` |  | 169 |
| `C:canSkipCountdown()` |  | 1030 |
| `C:checkStagingAt10s()` |  | 649 |
| `C:configureCountdownSettings()` |  | 572 |
| `C:drawDebugVisualization()` |  | 980 |
| `C:drawMiddle(builder, style)` |  | 995 |
| `C:enableRallyManagerPacenoteProcessing()` |  | 513 |
| `C:enqueuePauseSecs(secs)` |  | 532 |
| `C:enqueueSystemPacenote(pacenote_name, audioLenOffset)` |  | 522 |
| `C:finishCountdownImmediately()` |  | 755 |
| `C:freezeVehicle()` |  | 217 |
| `C:getCurrentEpochTime()` |  | 396 |
| `C:getRallyLoopManager()` |  | 385 |
| `C:getScheduledEventTime()` |  | 408 |
| `C:getWallClockTime()` |  | 942 |
| `C:hasCrossedStartLine()` |  | 380 |
| `C:init(mgr, ...)` |  | 81 |
| `C:isFlowActive()` |  | 767 |
| `C:isInLaunchZone()` |  | 375 |
| `C:isNearPlane()` |  | 365 |
| `C:isOngoing()` |  | 771 |
| `C:isOriginalSchedule()` |  | 763 |
| `C:isStaged()` |  | 370 |
| `C:isStopped()` |  | 360 |
| `C:isWaiting()` |  | 775 |
| `C:monitorCountdown()` |  | 689 |
| `C:onGameplayInteract()` |  | 1100 |
| `C:processWarnings()` |  | 781 |
| `C:randomPauseSecs(min, max)` |  | 542 |
| `C:requestReschedule()` |  | 441 |
| `C:reset()` |  | 174 |
| `C:shouldDrawDebug()` |  | 975 |
| `C:shouldPlayVoiceCountdown()` |  | 505 |
| `C:shouldShowVisualCountdown()` |  | 509 |
| `C:shouldStartTimer()` |  | 565 |
| `C:show(msg, big, duration)` |  | 547 |
| `C:skipToCountdown()` |  | 1070 |
| `C:startTimer()` |  | 606 |
| `C:stopTimer()` |  | 191 |
| `C:unfreezeVehicle()` |  | 225 |
| `C:updateCountdownStateMachine()` |  | 827 |
| `C:updateProximityState()` |  | 307 |
| `C:updateStartPosition()` |  | 256 |
| `C:updateTimesAfterReschedule()` |  | 643 |
| `C:updateVehicleData()` |  | 233 |
| `C:work(args)` |  | 1106 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRallyDataUpdated` — écouté par 2 module(s)

**Évènements UI (guihooks.trigger) :** `Message`, `RallyUIContextEnter_START_LINE`

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua`.*
