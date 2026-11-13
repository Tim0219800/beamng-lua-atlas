---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/core.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_drag_core` : `extensions.load("gameplay_drag_core")`, puis la globale `gameplay_drag_core`
---@class gameplay_drag_core
---@field dependencies table
gameplay_drag_core = {}

---Source : lua/ge/extensions/gameplay/drag/core.lua:1330
---@param data any
function gameplay_drag_core.allRacersFinished(data) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:532
---@param data any
function gameplay_drag_core.calculateStateChecksum(data) end

--- # Clear drag state. Accepts an options table with named fields (all default to false):
---  hooks           : fire extensions.hook("onDragClear")
---  transitionLock  : clear phase transition locks
---  localRace       : clear MP local client active race
---  extensions      : unload lazy-loaded drag extensions
---  data            : unload prefabs and nil out dragData
---  context         : reset gameplayContext to "freeroam"
---  ui              : hide drag UI apps and clear messages
---  treeLightStaging: trigger staging tree light UI off
---Source : lua/ge/extensions/gameplay/drag/core.lua:700
---@param opts any
function gameplay_drag_core.clear(opts) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1601
---@param poiKey any
function gameplay_drag_core.clearPoiJoinRequest(poiKey) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:914
---@param raceId any
function gameplay_drag_core.clearRaceState(raceId) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1572
function gameplay_drag_core.createTimeslipData() end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1575
function gameplay_drag_core.createTimeslipPanelData() end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1390
function gameplay_drag_core.finalizeMPPostRace() end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1449
function gameplay_drag_core.getCurrentSavePath() end

--- Single source of truth for drag data (strip, racers, timers, etc.). In MP and SP, core owns it.
---Source : lua/ge/extensions/gameplay/drag/core.lua:205
function gameplay_drag_core.getData() end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1489
---@param levelIdentifier any
function gameplay_drag_core.getDragDataForLevel(levelIdentifier) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:37
function gameplay_drag_core.getDragGamemode() end

---Source : lua/ge/extensions/gameplay/drag/core.lua:964
function gameplay_drag_core.getDragIsStarted() end

---Source : lua/ge/extensions/gameplay/drag/core.lua:910
function gameplay_drag_core.getExpectedStagingRacerCount() end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1480
function gameplay_drag_core.getExtension() end

---Source : lua/ge/extensions/gameplay/drag/core.lua:969
function gameplay_drag_core.getGameplayContext() end

--- Number of lanes for strip data (poiData or dragData). Returns at least 1.
---Source : lua/ge/extensions/gameplay/drag/core.lua:1512
---@param data any
function gameplay_drag_core.getMaxLanes(data) end

--- Stable key for a drag strip (level:name). Used for one lobby per strip in MP.
---Source : lua/ge/extensions/gameplay/drag/core.lua:1518
---@param poiData any
function gameplay_drag_core.getPoiKey(poiData) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:918
---@param raceId any
function gameplay_drag_core.getRaceState(raceId) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:806
---@param vehicleId any
function gameplay_drag_core.getRacerData(vehicleId) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:589
function gameplay_drag_core.getResetState() end

--- Called by MP host to check if all racers are staged; general only reads data. Returns (allStaged, currentDragData) or (false, nil).
---Source : lua/ge/extensions/gameplay/drag/core.lua:1339
function gameplay_drag_core.getStagingCheckData() end

---Source : lua/ge/extensions/gameplay/drag/core.lua:797
---@param vehicleId any
function gameplay_drag_core.getTimers(vehicleId) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1525
function gameplay_drag_core.isDragEnabled() end

---Source : lua/ge/extensions/gameplay/drag/core.lua:818
---@param data any
function gameplay_drag_core.isJoinWindowOpen(data) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1597
---@param poiKey any
function gameplay_drag_core.isPoiJoinRequestSent(poiKey) end

--- Mission-facing helper: load drag strip data, prefabs, context, and set runtime drag data.
--- Returns loaded data table on success, nil on failure.
---Source : lua/ge/extensions/gameplay/drag/core.lua:521
---@param filepath any
function gameplay_drag_core.loadDragDataForMission(filepath) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:182
---@param filepath any
function gameplay_drag_core.loadDragStripData(filepath) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1443
---@param status any
---@param mission any
function gameplay_drag_core.onAnyMissionChanged(status, mission) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1466
function gameplay_drag_core.onCareerActive() end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1268
---@param raceId any
function gameplay_drag_core.onDragRaceCancelled(raceId) end

--- Resolves the disconnecting client to a player and delegates to onDragRacePlayerLeft.
---Source : lua/ge/extensions/gameplay/drag/core.lua:1315
---@param client any
function gameplay_drag_core.onDragRaceClientDisconnected(client) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1011
---@param mappedTime any
---@param randValue any
function gameplay_drag_core.onDragRaceCountdownStart(mappedTime, randValue) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1112
---@param raceId any
---@param lane any
---@param poiData any
---@param treeType any
function gameplay_drag_core.onDragRaceJoinAccepted(raceId, lane, poiData, treeType) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1251
function gameplay_drag_core.onDragRaceListChanged() end

--- Marks the racer belonging to a player as DQ+finished when they disconnect mid-race.
---Source : lua/ge/extensions/gameplay/drag/core.lua:1273
---@param player any
function gameplay_drag_core.onDragRacePlayerLeft(player) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1258
---@param raceId any
function gameplay_drag_core.onDragRaceReset(raceId) end

--- When host broadcasts race start, clients advance all racers to race phase (phase 3).
---Source : lua/ge/extensions/gameplay/drag/core.lua:1090
---@param raceStartTime any
function gameplay_drag_core.onDragRaceStart(raceStartTime) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1134
---@param raceId any
function gameplay_drag_core.onDragRaceStarted(raceId) end

--- In MP, when network timer values arrive, check if we now have values for ALL racers.
---  Once all synced: update display signs, generate win data + winning lights, create timeslip + save history.
---Source : lua/ge/extensions/gameplay/drag/core.lua:1621
---@param raceId any
---@param mpPlayerId any
---@param timerName any
---@param timerValue any
function gameplay_drag_core.onDragRaceTimerUpdated(raceId, mpPlayerId, timerName, timerValue) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1074
---@param lane any
---@param lightState any
function gameplay_drag_core.onDragRaceTreeLights(lane, lightState) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1083
---@param lane any
function gameplay_drag_core.onDragRaceWinningLights(lane) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1324
function gameplay_drag_core.onExtensionLoaded() end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1660
function gameplay_drag_core.onExtensionUnloaded() end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1586
---@param levelIdentifier any
---@param elements any
function gameplay_drag_core.onGetRawPoiListForLevel(levelIdentifier, elements) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1589
---@param elements any
function gameplay_drag_core.onGetRawPoiListForTutorial(elements) end

--- Called when player leaves the drag strip zone (offline). Clears and unloads drag. Also called from onUpdate when zone check detects player outside.
---Source : lua/ge/extensions/gameplay/drag/core.lua:1351
function gameplay_drag_core.onPlayerLeftDragArea() end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1460
---@param currentSavePath any
function gameplay_drag_core.onSaveCurrentProfile(currentSavePath) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1407
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_drag_core.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:999
---@param vehicleId any
function gameplay_drag_core.onVehicleDestroyed(vehicleId) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:973
---@param vehicleId any
function gameplay_drag_core.onVehicleResetted(vehicleId) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:985
---@param oldId any
---@param newId any
function gameplay_drag_core.onVehicleSwitched(oldId, newId) end

--- # Reset race state. Accepts an options table with named fields (all default to false/nil):
---  raceState       : reset isStarted/isCompleted flags
---  racers          : reset each racer's phase/DQ/finished state
---  clearRacers     : remove all racers from data
---  timeslip        : clear timeslip UI
---  transitionLock  : clear phase transition locks and remote staging hold timers
---  treeLightStaging: trigger staging tree light UI
---  hooks           : fire extensions.hook("onDragReset")
---  raceId          : race identifier (passed to hook)
---Source : lua/ge/extensions/gameplay/drag/core.lua:644
---@param opts any
function gameplay_drag_core.reset(opts) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1453
---@param timeslip any
function gameplay_drag_core.saveDialTimes(timeslip) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:71
function gameplay_drag_core.sendTimeslipDataToUi() end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1470
function gameplay_drag_core.setCareerRewards() end

---Source : lua/ge/extensions/gameplay/drag/core.lua:493
---@param data any
function gameplay_drag_core.setDragRaceData(data) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:906
---@param count any
function gameplay_drag_core.setExpectedStagingRacerCount(count) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1484
---@param ext any
function gameplay_drag_core.setExtension(ext) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:789
---@param vehicleId any
function gameplay_drag_core.setPlayableVehicle(vehicleId) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:1598
---@param poiKey any
---@param val any
function gameplay_drag_core.setPoiJoinRequestSent(poiKey, val) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:897
---@param raceId any
---@param updates any
function gameplay_drag_core.setRaceState(raceId, updates) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:741
---@param vehicleId any
---@param dialValue any
function gameplay_drag_core.setRacerDial(vehicleId, dialValue) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:356
---@param racer any
---@param vehicle any
function gameplay_drag_core.setRacerWheelGeometry(racer, vehicle) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:768
---@param dials any
function gameplay_drag_core.setRacersDial(dials) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:384
---@param vehicleId any
---@param lane any
function gameplay_drag_core.setupRacer(vehicleId, lane) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:827
---@param lane any
---@param vehicleId any
function gameplay_drag_core.startDragRaceActivity(lane, vehicleId) end

---Source : lua/ge/extensions/gameplay/drag/core.lua:553
---@param data any
function gameplay_drag_core.validateResetState(data) end

