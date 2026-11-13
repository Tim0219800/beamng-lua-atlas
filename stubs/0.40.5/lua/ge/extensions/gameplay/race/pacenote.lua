---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/race/pacenote.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/race/pacenote.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_race_pacenote
local gameplay_race_pacenote = {}

---Source : lua/ge/extensions/gameplay/race/pacenote.lua:116
---@param drawMode any
---@param clr any
---@param extraText any
function gameplay_race_pacenote:drawDebug(drawMode, clr, extraText) end

---Source : lua/ge/extensions/gameplay/race/pacenote.lua:8
---@param path any
---@param name any
---@param forceId any
function gameplay_race_pacenote:init(path, name, forceId) end

---Source : lua/ge/extensions/gameplay/race/pacenote.lua:59
---@param pos any
function gameplay_race_pacenote:inside(pos) end

---Source : lua/ge/extensions/gameplay/race/pacenote.lua:69
---@param fromCorners any
---@param toCorners any
function gameplay_race_pacenote:intersectCorners(fromCorners, toCorners) end

---Source : lua/ge/extensions/gameplay/race/pacenote.lua:108
---@param data any
---@param oldIdMap any
function gameplay_race_pacenote:onDeserialized(data, oldIdMap) end

---Source : lua/ge/extensions/gameplay/race/pacenote.lua:95
function gameplay_race_pacenote:onSerialize() end

---Source : lua/ge/extensions/gameplay/race/pacenote.lua:34
---@param pos any
---@param radius any
---@param normal any
function gameplay_race_pacenote:setManual(pos, radius, normal) end

---Source : lua/ge/extensions/gameplay/race/pacenote.lua:42
---@param navgraphName any
---@param fallback any
function gameplay_race_pacenote:setNavgraph(navgraphName, fallback) end

---Source : lua/ge/extensions/gameplay/race/pacenote.lua:25
---@param normal any
function gameplay_race_pacenote:setNormal(normal) end

