---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/dragBridge.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_drag_dragBridge` : `extensions.load("gameplay_drag_dragBridge")`, puis la globale `gameplay_drag_dragBridge`
---@class gameplay_drag_dragBridge
gameplay_drag_dragBridge = {}

--- Returns saved rules for strip. Forward to rulesMenu.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:548
---@param levelId any
---@param stripId any
function gameplay_drag_dragBridge.applyRulesRestore(levelId, stripId) end

--- Persists rules for strip. Forward to rulesMenu. In MP, also broadcast to all clients and update live dragData.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:527
---@param levelId any
---@param stripId any
---@param rules any
function gameplay_drag_dragBridge.applyRulesSave(levelId, stripId, rules) end

--- Stops drag race if one is active.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:563
function gameplay_drag_dragBridge.cleanup() end

--- Removes all racers from current drag data. Uses general.reset(..., clearRacers=true).
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:400
function gameplay_drag_dragBridge.clearRacers() end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:483
function gameplay_drag_dragBridge.clearTimeslip() end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:558
function gameplay_drag_dragBridge.closeMenu() end

--- Compatibility: returns true if dragStrip is non-nil. Config is applied via setDragRaceData in general.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:118
---@param dragStrip any
function gameplay_drag_dragBridge.configureDragStrip(dragStrip) end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:471
function gameplay_drag_dragBridge.createTimeslipData() end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:421
---@param vehicleId any
function gameplay_drag_dragBridge.generateHashFromFile(vehicleId) end

--- Builds a list of opponent configs (model, config, paint) matching dial time and vehicle permission rules.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:280
---@param vehId any
---@param dial any
---@param vehiclePermissionRules any
---@param amount any
---@param offset any
function gameplay_drag_dragBridge.generateOpponentsGroup(vehId, dial, vehiclePermissionRules, amount, offset) end

--- Returns vehicle ID of the playable racer, or nil.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:232
function gameplay_drag_dragBridge.getActiveRacerId() end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:374
function gameplay_drag_dragBridge.getData() end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:417
function gameplay_drag_dragBridge.getDialTimes() end

--- Returns dial data for the local playable racer, or nil when unavailable.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:764
function gameplay_drag_dragBridge.getDragDialData() end

--- Returns all display data for the drag info HUD widget, or nil when no race is loaded.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:572
function gameplay_drag_dragBridge.getDragInfoData() end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:429
function gameplay_drag_dragBridge.getDragIsStarted() end

--- Returns playable racer data (vehicleId, lane, timers, phases, isFinished, etc.) or nil.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:151
function gameplay_drag_dragBridge.getDragRaceData() end

--- Returns runtime data for playable racer (phase, position, speed, timers, etc.) or nil.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:175
function gameplay_drag_dragBridge.getDragRaceRuntimeData() end

--- Returns strip info (stripName, dragType, context, lanes, phases, prefabs) for dragStripId or current data.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:202
---@param dragStripId any
function gameplay_drag_dragBridge.getDragStripInfo(dragStripId) end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:487
---@param id any
function gameplay_drag_dragBridge.getHistory(id) end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:439
function gameplay_drag_dragBridge.getPlayerRaceResult() end

--- Returns full racer table for vehicleId, or {}.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:379
---@param vehicleId any
function gameplay_drag_dragBridge.getRacerData(vehicleId) end

--- Returns data for Vue rules screen. Uses same method as IMGUI (loadDragDataForFacility). Forward to rulesMenu.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:521
---@param facilityIdOrStripId any
function gameplay_drag_dragBridge.getRulesScreenData(facilityIdOrStripId) end

--- Returns lane info for the first strip on the current level.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:807
function gameplay_drag_dragBridge.getStripLaneInfo() end

--- Returns timers table for vehicleId, or {}.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:367
---@param vehicleId any
function gameplay_drag_dragBridge.getTimers(vehicleId) end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:720
function gameplay_drag_dragBridge.getTreeLightUIState() end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:435
function gameplay_drag_dragBridge.getWinnersData() end

--- Returns true if a drag race is started (countdown or running).
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:227
function gameplay_drag_dragBridge.isDragRaceActive() end

--- Loads drag data from file, loads prefabs, sets context and drag type extension.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:386
---@param filepath any
function gameplay_drag_dragBridge.loadDragDataForMission(filepath) end

--- Loads drag strip by ID: tries loadCompleteDragRaceData then loadDragStripData. Returns strip data or nil.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:101
---@param dragStripId any
function gameplay_drag_dragBridge.loadDragStrip(dragStripId) end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:854
function gameplay_drag_dragBridge.onDragClear() end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:840
---@param data any
function gameplay_drag_dragBridge.onDragDataSet(data) end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:874
function gameplay_drag_dragBridge.onDragRaceListChanged() end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:866
function gameplay_drag_dragBridge.onDragRacePlayersUpdated() end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:878
function gameplay_drag_dragBridge.onDragRaceStarted() end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:870
function gameplay_drag_dragBridge.onDragRaceStateChanged() end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:834
---@param data any
function gameplay_drag_dragBridge.onDragRacersSetup(data) end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:847
---@param opts any
function gameplay_drag_dragBridge.onDragReset(opts) end

--- Clears tether when menu is closed.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:554
function gameplay_drag_dragBridge.onMenuClosed() end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:862
---@param vehId any
---@param oldPhase any
---@param newPhase any
---@param newPhaseName any
function gameplay_drag_dragBridge.onRacerPhaseTransition(vehId, oldPhase, newPhase, newPhaseName) end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:883
function gameplay_drag_dragBridge.onUpdate() end

--- Opens drag history UI for facility; starts tether if career active.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:495
---@param facility any
function gameplay_drag_dragBridge.openHistoryScreen(facility) end

--- Opens Vue drag rules & setup screen for facility; starts tether if career active.
--- For testing: also opens IMGUI rules menu with only the Multiplayer tab.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:505
---@param facility any
function gameplay_drag_dragBridge.openRulesScreen(facility) end

--- Opens Vue drag rules screen by strip id (e.g. from MP gamemode UI). Same backend as POI rules; host can change rules at any time.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:515
---@param levelId any
---@param stripId any
function gameplay_drag_dragBridge.openRulesScreenForStrip(levelId, stripId) end

--- Resets race state. No args = full reset. Otherwise forwards the options table to core.reset(opts).
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:139
---@param opts any
function gameplay_drag_dragBridge.reset(opts) end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:479
function gameplay_drag_dragBridge.screenshotTimeslip() end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:475
function gameplay_drag_dragBridge.sendTimeslipDataToUi() end

--- Sets the dial for the local playable racer. Convenience wrapper so Vue doesn't need to resolve vehicleId.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:793
---@param value any
function gameplay_drag_dragBridge.setLocalPlayerDial(value) end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:404
---@param vehicleId any
---@param dialValue any
function gameplay_drag_dragBridge.setRacerDial(vehicleId, dialValue) end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:408
---@param dials any
function gameplay_drag_dragBridge.setRacersDial(dials) end

--- Sets multiple racers from vehicleIds (array of { id, lane, isPlayable, dial }).
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:346
---@param vehicleIds any
function gameplay_drag_dragBridge.setVehicles(vehicleIds) end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:341
---@param vehicleId any
---@param lane any
function gameplay_drag_dragBridge.setupRacer(vehicleId, lane) end

--- Shows the dial control panel in the topLeft utility apps container.
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:802
function gameplay_drag_dragBridge.showDialControl() end

--- Starts a drag race; delegates to general.startDragRaceActivity(lane or 1).
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:123
---@param vehicleId any
---@param lane any
function gameplay_drag_dragBridge.startDragRace(vehicleId, lane) end

---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:395
---@param lane any
function gameplay_drag_dragBridge.startDragRaceActivity(lane) end

--- Clears current drag data (stops race). Uses general.clear().
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:133
function gameplay_drag_dragBridge.stopDragRace() end

--- Clears drag data and unloads extensions. Uses general.clear().
---Source : lua/ge/extensions/gameplay/drag/dragBridge.lua:413
function gameplay_drag_dragBridge.unloadRace() end

