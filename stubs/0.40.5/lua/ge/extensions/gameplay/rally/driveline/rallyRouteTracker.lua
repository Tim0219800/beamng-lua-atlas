---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_rally_driveline_rallyRouteTracker
local gameplay_rally_driveline_rallyRouteTracker = {}

---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:202
---@param projection any
---@param allowJump any
function gameplay_rally_driveline_rallyRouteTracker:_acceptProjection(projection, allowJump) end

--- Diagnostic-only: mirrors projectLocal's window math for debug capture.
---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:238
---@param segmentIdx any
---@param forceFullSearch any
function gameplay_rally_driveline_rallyRouteTracker:_computeDebugWindow(segmentIdx, forceFullSearch) end

---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:220
---@param pos any
---@param projection any
function gameplay_rally_driveline_rallyRouteTracker:_snapshotDeparture(pos, projection) end

---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:212
---@param pos any
---@param projection any
function gameplay_rally_driveline_rallyRouteTracker:_updateRecoveryCandidate(pos, projection) end

---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:186
function gameplay_rally_driveline_rallyRouteTracker:getCorridorWidth() end

---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:190
function gameplay_rally_driveline_rallyRouteTracker:getOptions() end

---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:334
---@param backoffDistance any
function gameplay_rally_driveline_rallyRouteTracker:getRecoveryDistToTarget(backoffDistance) end

---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:347
function gameplay_rally_driveline_rallyRouteTracker:getState() end

---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:134
---@param path any
---@param options any
function gameplay_rally_driveline_rallyRouteTracker:init(path, options) end

---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:194
---@param pos any
---@param options any
function gameplay_rally_driveline_rallyRouteTracker:project(pos, options) end

---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:142
---@param pos any
function gameplay_rally_driveline_rallyRouteTracker:reset(pos) end

---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:178
---@param width any
function gameplay_rally_driveline_rallyRouteTracker:setCorridorWidth(width) end

---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:169
---@param enabled any
function gameplay_rally_driveline_rallyRouteTracker:setDebugCapture(enabled) end

---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:173
---@param path any
function gameplay_rally_driveline_rallyRouteTracker:setPath(path) end

---Source : lua/ge/extensions/gameplay/rally/driveline/rallyRouteTracker.lua:249
---@param pos any
---@param updateOptions any
function gameplay_rally_driveline_rallyRouteTracker:update(pos, updateOptions) end

