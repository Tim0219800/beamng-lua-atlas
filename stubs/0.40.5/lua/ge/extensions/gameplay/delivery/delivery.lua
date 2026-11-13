---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/delivery/delivery.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/delivery/delivery.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_delivery_delivery
local gameplay_delivery_delivery = {}

---Source : lua/ge/extensions/gameplay/delivery/delivery.lua:66
function gameplay_delivery_delivery:calculateRoundtrip() end

---Source : lua/ge/extensions/gameplay/delivery/delivery.lua:137
---@param dt any
function gameplay_delivery_delivery:checkFail(dt) end

---Source : lua/ge/extensions/gameplay/delivery/delivery.lua:133
function gameplay_delivery_delivery:clearEvents() end

---Source : lua/ge/extensions/gameplay/delivery/delivery.lua:165
function gameplay_delivery_delivery:getCurrentLocation() end

---Source : lua/ge/extensions/gameplay/delivery/delivery.lua:26
function gameplay_delivery_delivery:getCurrentRewardFactor() end

---Source : lua/ge/extensions/gameplay/delivery/delivery.lua:7
function gameplay_delivery_delivery:init() end

---Source : lua/ge/extensions/gameplay/delivery/delivery.lua:114
function gameplay_delivery_delivery:proceedDelivery() end

---Source : lua/ge/extensions/gameplay/delivery/delivery.lua:40
---@param tag any
---@param count any
function gameplay_delivery_delivery:selectLocations(tag, count) end

---Source : lua/ge/extensions/gameplay/delivery/delivery.lua:95
---@param baseTime any
---@param timePerKm any
function gameplay_delivery_delivery:setTimeParameters(baseTime, timePerKm) end

---Source : lua/ge/extensions/gameplay/delivery/delivery.lua:100
---@param sites any
---@param pickupPos any
---@param pickupRadius any
---@param tag any
---@param count any
function gameplay_delivery_delivery:setup(sites, pickupPos, pickupRadius, tag, count) end

---Source : lua/ge/extensions/gameplay/delivery/delivery.lua:109
function gameplay_delivery_delivery:startDelivery() end

---Source : lua/ge/extensions/gameplay/delivery/delivery.lua:124
---@param dt any
function gameplay_delivery_delivery:update(dt) end

