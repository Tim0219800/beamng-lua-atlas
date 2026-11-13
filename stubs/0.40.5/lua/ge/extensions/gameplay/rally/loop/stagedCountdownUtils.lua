---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_rally_loop_stagedCountdownUtils` : `extensions.load("gameplay_rally_loop_stagedCountdownUtils")`, puis la globale `gameplay_rally_loop_stagedCountdownUtils`
---@class gameplay_rally_loop_stagedCountdownUtils
gameplay_rally_loop_stagedCountdownUtils = {}

---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:54
---@param wallClockSecs any
function gameplay_rally_loop_stagedCountdownUtils.buildRallyClockData(wallClockSecs) end

---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:30
---@param duration any
function gameplay_rally_loop_stagedCountdownUtils.calculateImmediateMinuteCountdown(duration) end

---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:64
---@param pos any
---@param rot any
---@param normals any
function gameplay_rally_loop_stagedCountdownUtils.drawDebugPlane(pos, rot, normals) end

---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:145
---@param vehPos any
---@param inside any
function gameplay_rally_loop_stagedCountdownUtils.drawDebugVehiclePoint(vehPos, inside) end

---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:174
---@param im any
---@param nodeData any
---@param formatTimeFromSeconds any
function gameplay_rally_loop_stagedCountdownUtils.drawMiddleInfo(im, nodeData, formatTimeFromSeconds) end

---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:227
---@param im any
---@param state any
---@param duration any
---@param timer any
---@param STATE_COUNTDOWN_RUNNING any
---@param STATE_FINISHED any
function gameplay_rally_loop_stagedCountdownUtils.drawMiddleProgress(im, state, duration, timer, STATE_COUNTDOWN_RUNNING, STATE_FINISHED) end

---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:95
---@param vehPos any
---@param planePos any
---@param rot any
---@param tmpPlaneNormal any
---@param tmpToVehicle any
---@param tmpClosestPoint any
---@param tmpMidPoint any
function gameplay_rally_loop_stagedCountdownUtils.drawVehicleToPlaneDebug(vehPos, planePos, rot, tmpPlaneNormal, tmpToVehicle, tmpClosestPoint, tmpMidPoint) end

---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:150
---@param vehId any
---@param logTag any
function gameplay_rally_loop_stagedCountdownUtils.freezeVehicle(vehId, logTag) end

---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:9
function gameplay_rally_loop_stagedCountdownUtils.getEnvironmentWallClockSecs() end

---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:17
---@param defaultDuration any
---@param defaultMaxAnnounced any
function gameplay_rally_loop_stagedCountdownUtils.getStageCountdownSettings(defaultDuration, defaultMaxAnnounced) end

---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:50
---@param environmentStartTimeSecs any
---@param epochTime any
function gameplay_rally_loop_stagedCountdownUtils.getWallClockTime(environmentStartTimeSecs, epochTime) end

---Source : lua/ge/extensions/gameplay/rally/loop/stagedCountdownUtils.lua:162
---@param vehId any
---@param logTag any
function gameplay_rally_loop_stagedCountdownUtils.unfreezeVehicle(vehId, logTag) end

