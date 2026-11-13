# `gameplay_drag_dragBridge`

*Fichier : `lua/ge/extensions/gameplay/drag/dragBridge.lua` · VM : Game Engine (GE) · 888 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drag_dragBridge` : `extensions.load("gameplay_drag_dragBridge")`, puis la globale `gameplay_drag_dragBridge`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drag_dragBridge.applyRulesRestore(levelId, stripId)` | Returns saved rules for strip. Forward to rulesMenu. | 548 |
| `gameplay_drag_dragBridge.applyRulesSave(levelId, stripId, rules)` | Persists rules for strip. Forward to rulesMenu. In MP, also broadcast to all clients and update live dragData. | 527 |
| `gameplay_drag_dragBridge.cleanup()` | Stops drag race if one is active. | 563 |
| `gameplay_drag_dragBridge.clearRacers()` | Removes all racers from current drag data. Uses general.reset(..., clearRacers=true). | 400 |
| `gameplay_drag_dragBridge.clearTimeslip()` |  | 483 |
| `gameplay_drag_dragBridge.closeMenu()` |  | 558 |
| `gameplay_drag_dragBridge.configureDragStrip(dragStrip)` | Compatibility: returns true if dragStrip is non-nil. Config is applied via setDragRaceData in general. | 118 |
| `gameplay_drag_dragBridge.createTimeslipData()` |  | 471 |
| `gameplay_drag_dragBridge.generateHashFromFile(vehicleId)` |  | 421 |
| `gameplay_drag_dragBridge.generateOpponentsGroup(vehId, dial, vehiclePermissionRules, amount, offset)` | Builds a list of opponent configs (model, config, paint) matching dial time and vehicle permission rules. | 280 |
| `gameplay_drag_dragBridge.getActiveRacerId()` | Returns vehicle ID of the playable racer, or nil. | 232 |
| `gameplay_drag_dragBridge.getData()` |  | 374 |
| `gameplay_drag_dragBridge.getDialTimes()` |  | 417 |
| `gameplay_drag_dragBridge.getDragDialData()` | Returns dial data for the local playable racer, or nil when unavailable. | 764 |
| `gameplay_drag_dragBridge.getDragInfoData()` | Returns all display data for the drag info HUD widget, or nil when no race is loaded. | 572 |
| `gameplay_drag_dragBridge.getDragIsStarted()` |  | 429 |
| `gameplay_drag_dragBridge.getDragRaceData()` | Returns playable racer data (vehicleId, lane, timers, phases, isFinished, etc.) or nil. | 151 |
| `gameplay_drag_dragBridge.getDragRaceRuntimeData()` | Returns runtime data for playable racer (phase, position, speed, timers, etc.) or nil. | 175 |
| `gameplay_drag_dragBridge.getDragStripInfo(dragStripId)` | Returns strip info (stripName, dragType, context, lanes, phases, prefabs) for dragStripId or current data. | 202 |
| `gameplay_drag_dragBridge.getHistory(id)` |  | 487 |
| `gameplay_drag_dragBridge.getPlayerRaceResult()` |  | 439 |
| `gameplay_drag_dragBridge.getRacerData(vehicleId)` | Returns full racer table for vehicleId, or {}. | 379 |
| `gameplay_drag_dragBridge.getRulesScreenData(facilityIdOrStripId)` | Returns data for Vue rules screen. Uses same method as IMGUI (loadDragDataForFacility). Forward to rulesMenu. | 521 |
| `gameplay_drag_dragBridge.getStripLaneInfo()` | Returns lane info for the first strip on the current level. | 807 |
| `gameplay_drag_dragBridge.getTimers(vehicleId)` | Returns timers table for vehicleId, or {}. | 367 |
| `gameplay_drag_dragBridge.getTreeLightUIState()` |  | 720 |
| `gameplay_drag_dragBridge.getWinnersData()` |  | 435 |
| `gameplay_drag_dragBridge.isDragRaceActive()` | Returns true if a drag race is started (countdown or running). | 227 |
| `gameplay_drag_dragBridge.loadDragDataForMission(filepath)` | Loads drag data from file, loads prefabs, sets context and drag type extension. | 386 |
| `gameplay_drag_dragBridge.loadDragStrip(dragStripId)` | Loads drag strip by ID: tries loadCompleteDragRaceData then loadDragStripData. Returns strip data or nil. | 101 |
| `gameplay_drag_dragBridge.onDragClear()` | *(hook)* | 854 |
| `gameplay_drag_dragBridge.onDragDataSet(data)` | *(hook)* | 840 |
| `gameplay_drag_dragBridge.onDragRaceListChanged()` | *(hook)* | 874 |
| `gameplay_drag_dragBridge.onDragRacePlayersUpdated()` | *(hook)* | 866 |
| `gameplay_drag_dragBridge.onDragRaceStarted()` | *(hook)* | 878 |
| `gameplay_drag_dragBridge.onDragRaceStateChanged()` | *(hook)* | 870 |
| `gameplay_drag_dragBridge.onDragRacersSetup(data)` | *(hook)* | 834 |
| `gameplay_drag_dragBridge.onDragReset(opts)` | *(hook)* | 847 |
| `gameplay_drag_dragBridge.onMenuClosed()` | Clears tether when menu is closed. *(hook)* | 554 |
| `gameplay_drag_dragBridge.onRacerPhaseTransition(vehId, oldPhase, newPhase, newPhaseName)` | *(hook)* | 862 |
| `gameplay_drag_dragBridge.onUpdate()` | *(hook)* | 883 |
| `gameplay_drag_dragBridge.openHistoryScreen(facility)` | Opens drag history UI for facility; starts tether if career active. | 495 |
| `gameplay_drag_dragBridge.openRulesScreen(facility)` | Opens Vue drag rules & setup screen for facility; starts tether if career active.<br>For testing: also opens IMGUI rules menu with only the Multiplayer tab. | 505 |
| `gameplay_drag_dragBridge.openRulesScreenForStrip(levelId, stripId)` | Opens Vue drag rules screen by strip id (e.g. from MP gamemode UI). Same backend as POI rules; host can change rules at any time. | 515 |
| `gameplay_drag_dragBridge.reset(opts)` | Resets race state. No args = full reset. Otherwise forwards the options table to core.reset(opts). | 139 |
| `gameplay_drag_dragBridge.screenshotTimeslip()` |  | 479 |
| `gameplay_drag_dragBridge.sendTimeslipDataToUi()` |  | 475 |
| `gameplay_drag_dragBridge.setLocalPlayerDial(value)` | Sets the dial for the local playable racer. Convenience wrapper so Vue doesn't need to resolve vehicleId. | 793 |
| `gameplay_drag_dragBridge.setRacerDial(vehicleId, dialValue)` |  | 404 |
| `gameplay_drag_dragBridge.setRacersDial(dials)` |  | 408 |
| `gameplay_drag_dragBridge.setVehicles(vehicleIds)` | Sets multiple racers from vehicleIds (array of { id, lane, isPlayable, dial }). | 346 |
| `gameplay_drag_dragBridge.setupRacer(vehicleId, lane)` |  | 341 |
| `gameplay_drag_dragBridge.showDialControl()` | Shows the dial control panel in the topLeft utility apps container. | 802 |
| `gameplay_drag_dragBridge.startDragRace(vehicleId, lane)` | Starts a drag race; delegates to general.startDragRaceActivity(lane or 1). | 123 |
| `gameplay_drag_dragBridge.startDragRaceActivity(lane)` |  | 395 |
| `gameplay_drag_dragBridge.stopDragRace()` | Clears current drag data (stops race). Uses general.clear(). | 133 |
| `gameplay_drag_dragBridge.unloadRace()` | Clears drag data and unloads extensions. Uses general.clear(). | 413 |

**Évènements UI (guihooks.trigger) :** `dragDialDataChanged`, `dragRaceInfoChanged`, `onDragRaceLiveTimesData`, `onDragReset`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`, `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drag/dragBridge.lua`.*
