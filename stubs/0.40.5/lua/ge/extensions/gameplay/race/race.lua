---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/race/race.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/race/race.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_race_race
local gameplay_race_race = {}

---Source : lua/ge/extensions/gameplay/race/race.lua:615
---@param id any
function gameplay_race_race:abortRace(id) end

---Source : lua/ge/extensions/gameplay/race/race.lua:47
function gameplay_race_race:calcAIPath() end

---Source : lua/ge/extensions/gameplay/race/race.lua:361
---@param lastId any
---@param newId any
function gameplay_race_race:changeRaceVehicle(lastId, newId) end

---Source : lua/ge/extensions/gameplay/race/race.lua:1166
---@param id any
function gameplay_race_race:clearEvents(id) end

---Source : lua/ge/extensions/gameplay/race/race.lua:667
---@param id any
---@param endTime any
function gameplay_race_race:completeLap(id, endTime) end

---Source : lua/ge/extensions/gameplay/race/race.lua:628
---@param id any
---@param recovery any
function gameplay_race_race:createRecoveryPoint(id, recovery) end

---Source : lua/ge/extensions/gameplay/race/race.lua:109
---@param data any
function gameplay_race_race:debugDraw(data) end

---Source : lua/ge/extensions/gameplay/race/race.lua:118
---@param data any
---@param dt any
function gameplay_race_race:detectOffTrack(data, dt) end

---Source : lua/ge/extensions/gameplay/race/race.lua:822
---@param id any
---@param dt any
function gameplay_race_race:detectRollingStart(id, dt) end

---Source : lua/ge/extensions/gameplay/race/race.lua:1028
---@param id any
---@param dt any
function gameplay_race_race:digestEvents(id, dt) end

---Source : lua/ge/extensions/gameplay/race/race.lua:330
---@param sus any
function gameplay_race_race:doSuspend(sus) end

---Source : lua/ge/extensions/gameplay/race/race.lua:1175
---@param id any
function gameplay_race_race:drawDebug(id) end

---Source : lua/ge/extensions/gameplay/race/race.lua:734
---@param id any
function gameplay_race_race:findNextPathnodes(id) end

---Source : lua/ge/extensions/gameplay/race/race.lua:1315
---@param timeDiff any
function gameplay_race_race:formatTimeDifference(timeDiff) end

---Source : lua/ge/extensions/gameplay/race/race.lua:67
---@param pointA any
---@param pointB any
---@param inNextAiPathIdx any
---@param inPrevAiPathIdx any
---@param outNextAiPathIdx any
---@param outPrevAiPathIdx any
function gameplay_race_race:getDistOnNav(pointA, pointB, inNextAiPathIdx, inPrevAiPathIdx, outNextAiPathIdx, outPrevAiPathIdx) end

---Source : lua/ge/extensions/gameplay/race/race.lua:1327
function gameplay_race_race:getTimeDifferencesToFirst() end

---Source : lua/ge/extensions/gameplay/race/race.lua:182
---@param dt any
function gameplay_race_race:getTrackedData(dt) end

--- this should probably be improved at some point
---Source : lua/ge/extensions/gameplay/race/race.lua:602
---@param id any
function gameplay_race_race:getVehiclePosition(id) end

---Source : lua/ge/extensions/gameplay/race/race.lua:1005
---@param id any
function gameplay_race_race:handlePacenotes(id) end

---Source : lua/ge/extensions/gameplay/race/race.lua:650
---@param id any
function gameplay_race_race:handleRecover(id) end

---Source : lua/ge/extensions/gameplay/race/race.lua:636
---@param id any
function gameplay_race_race:hasRecoveryPosition(id) end

---Source : lua/ge/extensions/gameplay/race/race.lua:1194
---@param id any
---@param im any
function gameplay_race_race:inDrawEventlog(id, im) end

---Source : lua/ge/extensions/gameplay/race/race.lua:1300
---@param lTimes any
---@param im any
function gameplay_race_race:inDrawLapTimes(lTimes, im) end

---Source : lua/ge/extensions/gameplay/race/race.lua:1280
---@param sTimes any
---@param im any
---@param mode any
---@param prefix any
function gameplay_race_race:inDrawSegmentTimes(sTimes, im, mode, prefix) end

---Source : lua/ge/extensions/gameplay/race/race.lua:1220
---@param id any
---@param im any
---@param detail any
function gameplay_race_race:inDrawTimes(id, im, detail) end

---Source : lua/ge/extensions/gameplay/race/race.lua:7
function gameplay_race_race:init() end

---Source : lua/ge/extensions/gameplay/race/race.lua:278
---@param dt any
function gameplay_race_race:onUpdate(dt) end

---Source : lua/ge/extensions/gameplay/race/race.lua:1308
---@param time any
function gameplay_race_race:raceTime(time) end

--- returns only true if a recovery state exists
---Source : lua/ge/extensions/gameplay/race/race.lua:644
---@param id any
function gameplay_race_race:requestRecover(id) end

---Source : lua/ge/extensions/gameplay/race/race.lua:51
---@param path any
function gameplay_race_race:setPath(path) end

---Source : lua/ge/extensions/gameplay/race/race.lua:35
---@param file any
function gameplay_race_race:setPathFile(file) end

---Source : lua/ge/extensions/gameplay/race/race.lua:57
---@param ids any
function gameplay_race_race:setVehicleIds(ids) end

---Source : lua/ge/extensions/gameplay/race/race.lua:349
---@param id any
---@param keepLapProgress any
function gameplay_race_race:skipLap(id, keepLapProgress) end

---Source : lua/ge/extensions/gameplay/race/race.lua:395
---@param id any
---@param aggression any
function gameplay_race_race:startAiVehicle(id, aggression) end

---Source : lua/ge/extensions/gameplay/race/race.lua:469
function gameplay_race_race:startRace() end

---Source : lua/ge/extensions/gameplay/race/race.lua:461
---@param id any
function gameplay_race_race:stopAiVehicle(id) end

---Source : lua/ge/extensions/gameplay/race/race.lua:584
function gameplay_race_race:stopRace() end

---Source : lua/ge/extensions/gameplay/race/race.lua:852
---@param id any
---@param dt any
function gameplay_race_race:updateVehicle(id, dt) end

