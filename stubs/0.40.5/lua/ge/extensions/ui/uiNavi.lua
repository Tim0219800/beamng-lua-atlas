---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/uiNavi.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_uiNavi` : `extensions.load("ui_uiNavi")`, puis la globale `ui_uiNavi`
---@class ui_uiNavi
ui_uiNavi = {}

---Source : lua/ge/extensions/ui/uiNavi.lua:9
---@param x any
---@param y any
---@param z any
function ui_uiNavi.findClosestRoad(x, y, z) end

---Source : lua/ge/extensions/ui/uiNavi.lua:183
function ui_uiNavi.getBusStops() end

---Source : lua/ge/extensions/ui/uiNavi.lua:119
function ui_uiNavi.getMissions() end

---Source : lua/ge/extensions/ui/uiNavi.lua:44
function ui_uiNavi.getPointsOfInterest() end

---Source : lua/ge/extensions/ui/uiNavi.lua:13
function ui_uiNavi.getSpawnpoints() end

---Source : lua/ge/extensions/ui/uiNavi.lua:453
function ui_uiNavi.onExtensionLoaded() end

--- public interface
---Source : lua/ge/extensions/ui/uiNavi.lua:228
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function ui_uiNavi.onGuiUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/ui/uiNavi.lua:437
---@param oid any
---@param nid any
function ui_uiNavi.onVehicleSwitched(oid, nid) end

--- dev things
---Source : lua/ge/extensions/ui/uiNavi.lua:172
---@param posX any
---@param posY any
function ui_uiNavi.planRoute(posX, posY) end

---Source : lua/ge/extensions/ui/uiNavi.lua:123
function ui_uiNavi.requestMissions() end

---Source : lua/ge/extensions/ui/uiNavi.lua:60
function ui_uiNavi.requestPoi() end

---Source : lua/ge/extensions/ui/uiNavi.lua:386
function ui_uiNavi.requestUIDashboardMap() end

---Source : lua/ge/extensions/ui/uiNavi.lua:411
---@param dashboard any
---@param initmap any
---@param vehId any
function ui_uiNavi.requestVehicleDashboardMap(dashboard, initmap, vehId) end

---Source : lua/ge/extensions/ui/uiNavi.lua:145
function ui_uiNavi.route_end() end

--- // TODO: figure out good distance
---Source : lua/ge/extensions/ui/uiNavi.lua:158
---@param oldPos any
---@param newPos any
function ui_uiNavi.route_requestStatus(oldPos, newPos) end

--- // WARNING: multiseat might result in several active players (?)
---  // in this case we will currently only render the path for the last player.
---  // in the future we might want to support rendering several paths
---Source : lua/ge/extensions/ui/uiNavi.lua:139
---@param wp any
---@param pos any
function ui_uiNavi.route_start(wp, pos) end

---Source : lua/ge/extensions/ui/uiNavi.lua:127
---@param m any
function ui_uiNavi.setMissions(m) end

