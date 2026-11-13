# `flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua` · VM : Game Engine (GE) · 609 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` |  | 114 |
| `C:_executionStopped()` |  | 124 |
| `C:calculateScheduledEventTime()` |  | 279 |
| `C:configureCountdownSettings()` |  | 270 |
| `C:drawDebugVisualization()` |  | 260 |
| `C:drawMiddle(builder, style)` |  | 572 |
| `C:enableRallyManagerPacenoteProcessing()` |  | 389 |
| `C:enqueueSystemPacenote(pacenoteName)` |  | 379 |
| `C:finishCountdown()` |  | 415 |
| `C:getCountdownPhase(showingGo)` |  | 292 |
| `C:getRallyClockData()` |  | 331 |
| `C:getTimeUntilLaunch()` |  | 288 |
| `C:getWallClockTime()` |  | 327 |
| `C:hasCrossedStartLine()` |  | 249 |
| `C:init(mgr, ...)` |  | 67 |
| `C:reset()` |  | 128 |
| `C:sendRallyDataUpdate()` |  | 530 |
| `C:shouldDrawDebug()` |  | 256 |
| `C:shouldPlaySoundEffects()` |  | 375 |
| `C:shouldPlayVoiceCountdown()` |  | 371 |
| `C:shouldShowVisualCountdown()` |  | 367 |
| `C:show(msg, big, duration, luaCall)` |  | 399 |
| `C:startTimer()` |  | 352 |
| `C:stopTimer()` |  | 137 |
| `C:triggerFalseStart()` |  | 442 |
| `C:unfreezeVehicle()` |  | 335 |
| `C:updateClock()` |  | 319 |
| `C:updateCountdown()` |  | 459 |
| `C:updateGoDisplay()` |  | 519 |
| `C:updateProximityState()` |  | 204 |
| `C:updateStartPosition()` |  | 156 |
| `C:updateVehicleData()` |  | 184 |
| `C:work(args)` |  | 579 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRallyDataUpdated` — écouté par 2 module(s)

**Évènements UI (guihooks.trigger) :** `Message`, `ScenarioFlashMessage`, `ScenarioFlashMessageClear`

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua`.*
