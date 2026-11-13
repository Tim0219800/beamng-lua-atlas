---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/race/segment.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/race/segment.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_race_segment
local gameplay_race_segment = {}

---Source : lua/ge/extensions/gameplay/race/segment.lua:78
---@param pos any
---@param radius any
---@param name any
---@param index any
function gameplay_race_segment:addCapsule(pos, radius, name, index) end

---Source : lua/ge/extensions/gameplay/race/segment.lua:96
---@param point any
---@param id any
function gameplay_race_segment:capsuleContains(point, id) end

---Source : lua/ge/extensions/gameplay/race/segment.lua:43
function gameplay_race_segment:checkMode() end

---Source : lua/ge/extensions/gameplay/race/segment.lua:107
---@param point any
---@param state any
function gameplay_race_segment:contains(point, state) end

---Source : lua/ge/extensions/gameplay/race/segment.lua:176
---@param drawMode any
function gameplay_race_segment:drawDebug(drawMode) end

---Source : lua/ge/extensions/gameplay/race/segment.lua:67
function gameplay_race_segment:fillNavpath() end

---Source : lua/ge/extensions/gameplay/race/segment.lua:139
---@param point any
---@param state any
function gameplay_race_segment:finished(point, state) end

---Source : lua/ge/extensions/gameplay/race/segment.lua:23
function gameplay_race_segment:getBeNavpath() end

---Source : lua/ge/extensions/gameplay/race/segment.lua:86
function gameplay_race_segment:getCapsuleCount() end

---Source : lua/ge/extensions/gameplay/race/segment.lua:87
---@param i any
function gameplay_race_segment:getCapsuleNode(i) end

---Source : lua/ge/extensions/gameplay/race/segment.lua:32
function gameplay_race_segment:getFrom() end

---Source : lua/ge/extensions/gameplay/race/segment.lua:33
function gameplay_race_segment:getTo() end

---Source : lua/ge/extensions/gameplay/race/segment.lua:11
---@param path any
---@param name any
---@param forceId any
function gameplay_race_segment:init(path, name, forceId) end

---Source : lua/ge/extensions/gameplay/race/segment.lua:240
function gameplay_race_segment:isValid() end

---Source : lua/ge/extensions/gameplay/race/segment.lua:160
---@param data any
---@param oldIdMap any
function gameplay_race_segment:onDeserialized(data, oldIdMap) end

---Source : lua/ge/extensions/gameplay/race/segment.lua:144
function gameplay_race_segment:onSerialize() end

---Source : lua/ge/extensions/gameplay/race/segment.lua:82
---@param index any
function gameplay_race_segment:removeCapsule(index) end

---Source : lua/ge/extensions/gameplay/race/segment.lua:34
---@param from any
function gameplay_race_segment:setFrom(from) end

---Source : lua/ge/extensions/gameplay/race/segment.lua:55
---@param mode any
function gameplay_race_segment:setMode(mode) end

---Source : lua/ge/extensions/gameplay/race/segment.lua:38
---@param to any
function gameplay_race_segment:setTo(to) end

