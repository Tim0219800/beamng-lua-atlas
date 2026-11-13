---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_rally_notebook_pacenoteWaypoint
local gameplay_rally_notebook_pacenoteWaypoint = {}

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:135
---@param pn_drawMode any
function gameplay_rally_notebook_pacenoteWaypoint:colorForWpType(pn_drawMode) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:155
---@param hover any
---@param text any
---@param clr_shape any
---@param alpha_shape any
---@param alpha_text any
---@param clr_text_fg any
---@param clr_text_bg any
---@param radius_factor any
---@param globalOpacity any
function gameplay_rally_notebook_pacenoteWaypoint:drawDebug(hover, text, clr_shape, alpha_shape, alpha_text, clr_text_fg, clr_text_bg, radius_factor, globalOpacity) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:225
---@param i any
---@param noteText any
function gameplay_rally_notebook_pacenoteWaypoint:drawDebugRecce(i, noteText) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:349
function gameplay_rally_notebook_pacenoteWaypoint:getOriginalDistToTarget() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:336
function gameplay_rally_notebook_pacenoteWaypoint:getRoutePoint() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:353
function gameplay_rally_notebook_pacenoteWaypoint:getStaticOriginalDistToTarget() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:345
function gameplay_rally_notebook_pacenoteWaypoint:getStaticRoutePoint() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:17
---@param pacenote any
---@param name any
---@param pos any
---@param forceId any
function gameplay_rally_notebook_pacenoteWaypoint:init(pacenote, name, pos, forceId) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:324
function gameplay_rally_notebook_pacenoteWaypoint:isCe() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:320
function gameplay_rally_notebook_pacenoteWaypoint:isCs() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:307
function gameplay_rally_notebook_pacenoteWaypoint:isLockable() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:311
function gameplay_rally_notebook_pacenoteWaypoint:isLocked() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:357
function gameplay_rally_notebook_pacenoteWaypoint:nameWithPacenote() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:90
---@param data any
---@param oldIdMap any
function gameplay_rally_notebook_pacenoteWaypoint:onDeserialized(data, oldIdMap) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:79
function gameplay_rally_notebook_pacenoteWaypoint:onSerialize() end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:59
---@param pos any
---@param radius any
---@param normal any
function gameplay_rally_notebook_pacenoteWaypoint:setManual(pos, radius, normal) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:70
---@param normal any
function gameplay_rally_notebook_pacenoteWaypoint:setNormal(normal) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:66
---@param newpos any
function gameplay_rally_notebook_pacenoteWaypoint:setPos(newpos) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:328
---@param rp any
function gameplay_rally_notebook_pacenoteWaypoint:setRoutePoint(rp) end

---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:340
---@param rp any
function gameplay_rally_notebook_pacenoteWaypoint:setStaticRoutePoint(rp) end

