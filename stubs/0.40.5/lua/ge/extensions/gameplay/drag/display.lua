---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/display.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_drag_display` : `extensions.load("gameplay_drag_display")`, puis la globale `gameplay_drag_display`
---@class gameplay_drag_display
---@field alwaysShowStageApp boolean
---@field dependencies table
gameplay_drag_display = {}

---Source : lua/ge/extensions/gameplay/drag/display.lua:117
---@param visible any
function gameplay_drag_display.broadcastTreeLightStaging(visible) end

---Source : lua/ge/extensions/gameplay/drag/display.lua:684
function gameplay_drag_display.clearAll() end

---Source : lua/ge/extensions/gameplay/drag/display.lua:1651
---@param vehId any
function gameplay_drag_display.dragRaceEndLineReached(vehId) end

---Source : lua/ge/extensions/gameplay/drag/display.lua:1655
function gameplay_drag_display.dragRaceVehicleStopped() end

---Source : lua/ge/extensions/gameplay/drag/display.lua:684
function gameplay_drag_display.onBeforeDragUnloadAllExtensions() end

---Source : lua/ge/extensions/gameplay/drag/display.lua:1724
---@param options any
function gameplay_drag_display.onDragClear(options) end

--- Called when general sets drag data (setDragRaceData). Inits tree lights and display digits for current strip.
--- In MP, display digits are preserved (cleared only at race start or gamemode stop).
---Source : lua/ge/extensions/gameplay/drag/display.lua:1733
---@param data any
function gameplay_drag_display.onDragDataSet(data) end

--- When a remote racer's timer values arrive via network, update their display signs and UI.
---Source : lua/ge/extensions/gameplay/drag/display.lua:1758
---@param raceId any
---@param mpPlayerId any
---@param timerName any
---@param timerValue any
function gameplay_drag_display.onDragRaceTimerUpdated(raceId, mpPlayerId, timerName, timerValue) end

---Source : lua/ge/extensions/gameplay/drag/display.lua:1711
---@param options any
function gameplay_drag_display.onDragReset(options) end

---Source : lua/ge/extensions/gameplay/drag/display.lua:695
function gameplay_drag_display.onExtensionLoaded() end

---Source : lua/ge/extensions/gameplay/drag/display.lua:1350
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_drag_display.onPreRender(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/drag/display.lua:1303
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_drag_display.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/drag/display.lua:1365
---@param lane any
function gameplay_drag_display.onWinnerLightOn(lane) end

---Source : lua/ge/extensions/gameplay/drag/display.lua:1472
---@param vehId any
function gameplay_drag_display.preStageLightOff(vehId) end

---Source : lua/ge/extensions/gameplay/drag/display.lua:1437
---@param vehId any
function gameplay_drag_display.preStageLightOn(vehId) end

---Source : lua/ge/extensions/gameplay/drag/display.lua:1681
function gameplay_drag_display.resetDragRaceValues() end

---Source : lua/ge/extensions/gameplay/drag/display.lua:1597
---@param vehId any
function gameplay_drag_display.setDisqualifiedLights(vehId) end

---Source : lua/ge/extensions/gameplay/drag/display.lua:1537
---@param vehId any
function gameplay_drag_display.stageLightOff(vehId) end

---Source : lua/ge/extensions/gameplay/drag/display.lua:1500
---@param vehId any
function gameplay_drag_display.stageLightOn(vehId) end

---Source : lua/ge/extensions/gameplay/drag/display.lua:1568
---@param vehId any
---@param dial any
function gameplay_drag_display.startDragCountdown(vehId, dial) end

---Source : lua/ge/extensions/gameplay/drag/display.lua:1644
---@param vehId any
function gameplay_drag_display.stoppingVehicleDrag(vehId) end

---Source : lua/ge/extensions/gameplay/drag/display.lua:455
---@param lane any
---@param lightState any
function gameplay_drag_display.updateTreeLightsFromNetwork(lane, lightState) end

