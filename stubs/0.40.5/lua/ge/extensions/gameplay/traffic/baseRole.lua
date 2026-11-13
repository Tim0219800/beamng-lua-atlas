---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/traffic/baseRole.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/traffic/baseRole.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_traffic_baseRole
local gameplay_traffic_baseRole = {}

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:171
---@param data any
function gameplay_traffic_baseRole:applyPersonality(data) end

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:191
---@param id any
function gameplay_traffic_baseRole:checkTargetVisible(id) end

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:99
function gameplay_traffic_baseRole:clearFlowgraph() end

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:202
---@param state any
function gameplay_traffic_baseRole:freezeTrafficSignals(state) end

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:152
function gameplay_traffic_baseRole:generatePersonality() end

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:9
---@param veh any
---@param name any
---@param data any
function gameplay_traffic_baseRole:init(veh, name, data) end

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:243
function gameplay_traffic_baseRole:onActiveDone() end

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:261
---@param otherId any
---@param data any
function gameplay_traffic_baseRole:onCollision(otherId, data) end

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:255
---@param data any
function gameplay_traffic_baseRole:onCrashDamage(data) end

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:287
---@param data any
---@param veh any
function gameplay_traffic_baseRole:onDeserialized(data, veh) end

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:264
---@param id1 any
---@param id2 any
---@param data any
function gameplay_traffic_baseRole:onOtherCollision(id1, id2, data) end

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:258
---@param otherId any
---@param data any
function gameplay_traffic_baseRole:onOtherCrashDamage(otherId, data) end

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:267
---@param eventType any
---@param otherId any
---@param data any
function gameplay_traffic_baseRole:onOtherEvent(eventType, otherId, data) end

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:246
function gameplay_traffic_baseRole:onRefresh() end

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:252
function gameplay_traffic_baseRole:onRoleEnded() end

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:249
function gameplay_traffic_baseRole:onRoleStarted() end

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:276
function gameplay_traffic_baseRole:onSerialize() end

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:270
---@param tickTime any
function gameplay_traffic_baseRole:onTrafficTick(tickTime) end

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:273
---@param dt any
---@param dtSim any
function gameplay_traffic_baseRole:onUpdate(dt, dtSim) end

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:65
function gameplay_traffic_baseRole:postInit() end

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:137
function gameplay_traffic_baseRole:resetAction() end

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:118
---@param name any
---@param args any
function gameplay_traffic_baseRole:setAction(name, args) end

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:130
---@param baseAggression any
---@param ignorePersonality any
function gameplay_traffic_baseRole:setAggression(baseAggression, ignorePersonality) end

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:108
---@param id any
function gameplay_traffic_baseRole:setTarget(id) end

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:75
---@param fgFile any
---@param varData any
function gameplay_traffic_baseRole:setupFlowgraph(fgFile, varData) end

---Source : lua/ge/extensions/gameplay/traffic/baseRole.lua:240
function gameplay_traffic_baseRole:tryRandomEvent() end

