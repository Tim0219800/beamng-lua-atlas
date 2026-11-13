---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/race/pathnode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/race/pathnode.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_race_pathnode
local gameplay_race_pathnode = {}

---Source : lua/ge/extensions/gameplay/race/pathnode.lua:248
---@param hit any
---@param pRot any
---@param zOff any
---@param scl any
---@param side any
---@param alignMode any
function gameplay_race_pathnode:convertRayHitToTransform(hit, pRot, zOff, scl, side, alignMode) end

---Source : lua/ge/extensions/gameplay/race/pathnode.lua:174
---@param drawMode any
---@param clr any
---@param extraText any
function gameplay_race_pathnode:drawDebug(drawMode, clr, extraText) end

---Source : lua/ge/extensions/gameplay/race/pathnode.lua:168
function gameplay_race_pathnode:getPaddedCenter() end

---Source : lua/ge/extensions/gameplay/race/pathnode.lua:87
function gameplay_race_pathnode:getRecovery() end

---Source : lua/ge/extensions/gameplay/race/pathnode.lua:90
function gameplay_race_pathnode:getReverseRecovery() end

---Source : lua/ge/extensions/gameplay/race/pathnode.lua:301
function gameplay_race_pathnode:getRoutePoint() end

---Source : lua/ge/extensions/gameplay/race/pathnode.lua:269
---@param posOffset any
---@param rotOffset any
---@param sclOffset any
---@param alignMode any
function gameplay_race_pathnode:getSideTransforms(posOffset, rotOffset, sclOffset, alignMode) end

---Source : lua/ge/extensions/gameplay/race/pathnode.lua:309
function gameplay_race_pathnode:getStaticRoutePoint() end

---Source : lua/ge/extensions/gameplay/race/pathnode.lua:7
---@param path any
---@param name any
---@param forceId any
function gameplay_race_pathnode:init(path, name, forceId) end

---Source : lua/ge/extensions/gameplay/race/pathnode.lua:78
---@param pos any
function gameplay_race_pathnode:inside(pos) end

---Source : lua/ge/extensions/gameplay/race/pathnode.lua:94
---@param fromCorners any
---@param toCorners any
function gameplay_race_pathnode:intersectCorners(fromCorners, toCorners) end

---Source : lua/ge/extensions/gameplay/race/pathnode.lua:148
---@param data any
---@param oldIdMap any
function gameplay_race_pathnode:onDeserialized(data, oldIdMap) end

---Source : lua/ge/extensions/gameplay/race/pathnode.lua:128
function gameplay_race_pathnode:onSerialize() end

---Source : lua/ge/extensions/gameplay/race/pathnode.lua:47
---@param pos any
---@param radius any
---@param normal any
function gameplay_race_pathnode:setManual(pos, radius, normal) end

---Source : lua/ge/extensions/gameplay/race/pathnode.lua:71
---@param scl any
function gameplay_race_pathnode:setNavRadiusScale(scl) end

---Source : lua/ge/extensions/gameplay/race/pathnode.lua:55
---@param navgraphName any
---@param fallback any
function gameplay_race_pathnode:setNavgraph(navgraphName, fallback) end

---Source : lua/ge/extensions/gameplay/race/pathnode.lua:33
---@param normal any
function gameplay_race_pathnode:setNormal(normal) end

---Source : lua/ge/extensions/gameplay/race/pathnode.lua:294
---@param rp any
function gameplay_race_pathnode:setRoutePoint(rp) end

---Source : lua/ge/extensions/gameplay/race/pathnode.lua:305
---@param rp any
function gameplay_race_pathnode:setStaticRoutePoint(rp) end

