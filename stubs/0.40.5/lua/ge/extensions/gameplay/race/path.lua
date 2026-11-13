---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/race/path.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/race/path.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_race_path
local gameplay_race_path = {}

--- this creates an automatic configuration.
---  It takes the first (= lowest ID) pathnode and creates a path from there, using segments.
---  assumes there is only one "first" segment.
---Source : lua/ge/extensions/gameplay/race/path.lua:57
function gameplay_race_path:autoConfig() end

---Source : lua/ge/extensions/gameplay/race/path.lua:606
function gameplay_race_path:classify() end

---Source : lua/ge/extensions/gameplay/race/path.lua:382
function gameplay_race_path:copy() end

---Source : lua/ge/extensions/gameplay/race/path.lua:222
function gameplay_race_path:drawAiRouteDebug() end

---Source : lua/ge/extensions/gameplay/race/path.lua:215
---@param drawMode any
function gameplay_race_path:drawDebug(drawMode) end

---Source : lua/ge/extensions/gameplay/race/path.lua:194
---@param from any
---@param to any
function gameplay_race_path:findSegments(from, to) end

---Source : lua/ge/extensions/gameplay/race/path.lua:311
---@param name any
function gameplay_race_path:findStartPositionByName(name) end

---Source : lua/ge/extensions/gameplay/race/path.lua:427
---@param list any
---@param closed any
function gameplay_race_path:fromCheckpointList(list, closed) end

---Source : lua/ge/extensions/gameplay/race/path.lua:399
---@param lapConfig any
---@param closed any
function gameplay_race_path:fromLapConfig(lapConfig, closed) end

---Source : lua/ge/extensions/gameplay/race/path.lua:469
---@param trackInfo any
---@param usePrefabs any
function gameplay_race_path:fromTrack(trackInfo, usePrefabs) end

---Source : lua/ge/extensions/gameplay/race/path.lua:245
function gameplay_race_path:getAiPath() end

---Source : lua/ge/extensions/gameplay/race/path.lua:638
function gameplay_race_path:getLastPathnode() end

---Source : lua/ge/extensions/gameplay/race/path.lua:7
function gameplay_race_path:getNextUniqueIdentifier() end

---Source : lua/ge/extensions/gameplay/race/path.lua:14
---@param name any
function gameplay_race_path:init(name) end

---Source : lua/ge/extensions/gameplay/race/path.lua:352
---@param data any
function gameplay_race_path:onDeserialized(data) end

---Source : lua/ge/extensions/gameplay/race/path.lua:320
function gameplay_race_path:onSerialize() end

---Source : lua/ge/extensions/gameplay/race/path.lua:629
function gameplay_race_path:recalculateSegments() end

--- switches start/endNode, all segments and direction of pathnodes. startPositions are not changed.
---Source : lua/ge/extensions/gameplay/race/path.lua:389
function gameplay_race_path:reverse() end

