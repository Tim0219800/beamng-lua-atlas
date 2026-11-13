---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_rally_loop_speedingDetector
local gameplay_rally_loop_speedingDetector = {}

---Source : lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua:42
---@param sample any
function gameplay_rally_loop_speedingDetector:addSample(sample) end

---Source : lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua:155
function gameplay_rally_loop_speedingDetector:drawDebug() end

---Source : lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua:49
function gameplay_rally_loop_speedingDetector:getAverageSpeed() end

---Source : lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua:35
function gameplay_rally_loop_speedingDetector:getCurrentSpeedKph() end

---Source : lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua:9
---@param manager any
function gameplay_rally_loop_speedingDetector:init(manager) end

---Source : lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua:60
---@param maxSpeedOver any
---@param maxProbability any
function gameplay_rally_loop_speedingDetector:stochasticPenalty(maxSpeedOver, maxProbability) end

---Source : lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua:86
---@param dtSim any
---@param limitKph any
---@param strictMode any
function gameplay_rally_loop_speedingDetector:update(dtSim, limitKph, strictMode) end

