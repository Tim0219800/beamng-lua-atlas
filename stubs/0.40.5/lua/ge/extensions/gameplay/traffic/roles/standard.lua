---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/traffic/roles/standard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/traffic/roles/standard.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_traffic_roles_standard
local gameplay_traffic_roles_standard = {}

---Source : lua/ge/extensions/gameplay/traffic/roles/standard.lua:15
function gameplay_traffic_roles_standard:init() end

---Source : lua/ge/extensions/gameplay/traffic/roles/standard.lua:109
---@param otherId any
---@param data any
function gameplay_traffic_roles_standard:onCollision(otherId, data) end

---Source : lua/ge/extensions/gameplay/traffic/roles/standard.lua:86
---@param data any
function gameplay_traffic_roles_standard:onCrashDamage(data) end

---Source : lua/ge/extensions/gameplay/traffic/roles/standard.lua:130
---@param id1 any
---@param id2 any
---@param data any
function gameplay_traffic_roles_standard:onOtherCollision(id1, id2, data) end

---Source : lua/ge/extensions/gameplay/traffic/roles/standard.lua:97
---@param otherId any
---@param data any
function gameplay_traffic_roles_standard:onOtherCrashDamage(otherId, data) end

---Source : lua/ge/extensions/gameplay/traffic/roles/standard.lua:149
---@param eventType any
---@param otherId any
---@param data any
function gameplay_traffic_roles_standard:onOtherEvent(eventType, otherId, data) end

---Source : lua/ge/extensions/gameplay/traffic/roles/standard.lua:60
function gameplay_traffic_roles_standard:onRefresh() end

---Source : lua/ge/extensions/gameplay/traffic/roles/standard.lua:158
---@param tickTime any
function gameplay_traffic_roles_standard:onTrafficTick(tickTime) end

---Source : lua/ge/extensions/gameplay/traffic/roles/standard.lua:274
---@param dt any
---@param dtSim any
function gameplay_traffic_roles_standard:onUpdate(dt, dtSim) end

