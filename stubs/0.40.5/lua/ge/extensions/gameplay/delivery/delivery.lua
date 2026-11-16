---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/delivery/delivery.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Delivery object returned by the module constructor. Fields: vehId, state ('disabled' initially), timer (s), events, pickup {pos, radius}, locations, roundtripDistance (m), locationIndex, failReason, sites, baseTime, timePerKm.
---@class gameplay_delivery_delivery
local gameplay_delivery_delivery = {}

--- Computes the distance in meters of the trip pickup -> locations in order -> pickup, adding up the length of the paths on the road graph and the distances to the nearest road point.
---Source: lua/ge/extensions/gameplay/delivery/delivery.lua:66
---@return number  Total distance in meters.
function gameplay_delivery_delivery:calculateRoundtrip() end

--- Tests for failure: damage above maxDamage (failReason 'damage') or time elapsed (failReason 'time'); the timer does not decrease if isPartiallyInsideLocationOneFrame is true. On failure, state = 'failed'.
---Source: lua/ge/extensions/gameplay/delivery/delivery.lua:137
---@param dt number Time delta (s).
function gameplay_delivery_delivery:checkFail(dt) end

--- Empties the events table.
---Source: lua/ge/extensions/gameplay/delivery/delivery.lua:133
function gameplay_delivery_delivery:clearEvents() end

--- Returns the current delivery location, only in the 'active' state.
---Source: lua/ge/extensions/gameplay/delivery/delivery.lua:165
---@return table|nil  Location (sites object), nil otherwise.
function gameplay_delivery_delivery:getCurrentLocation() end

--- Reward factor proportional to progress: ((locationIndex - 1) / number of locations) × locationRewardFactor (0.5).
---Source: lua/ge/extensions/gameplay/delivery/delivery.lua:26
---@return number  Factor between 0 and 0.5; 0 if there are no locations.
function gameplay_delivery_delivery:getCurrentRewardFactor() end

--- Initializes the state (disabled, timer 0, empty lists) and the failure parameters. Called by the constructor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/delivery/delivery.lua:7
function gameplay_delivery_delivery:init() end

--- Validates the current delivery: raises the proceedDelivery event and moves to the next location; after the last one, switches to the 'return' state.
---Source: lua/ge/extensions/gameplay/delivery/delivery.lua:114
---@return boolean  true if all deliveries are done ('return' state).
function gameplay_delivery_delivery:proceedDelivery() end

--- Picks count locations from self.sites.locations whose customFields.tags contains the tag; shuffles the list if there are more than count.
---Source: lua/ge/extensions/gameplay/delivery/delivery.lua:40
---@param tag string Tag searched in customFields.tags.
---@param count integer Number of locations to pick.
---@return table  Picked locations (see notes on edge cases).
function gameplay_delivery_delivery:selectLocations(tag, count) end

--- Sets the allotted time parameters.
---Source: lua/ge/extensions/gameplay/delivery/delivery.lua:95
---@param baseTime number Base time in seconds.
---@param timePerKm number Extra seconds per kilometer of round trip.
function gameplay_delivery_delivery:setTimeParameters(baseTime, timePerKm) end

--- Prepares the delivery: stores sites and pickup point, picks the locations, computes the distance and the timer, then switches to the 'start' state.
---Source: lua/ge/extensions/gameplay/delivery/delivery.lua:100
---@param sites table Sites object with locations.objects.
---@param pickupPos vec3|table Pickup position.
---@param pickupRadius number Pickup radius (m).
---@param tag string Tag of the delivery locations.
---@param count integer Number of deliveries.
function gameplay_delivery_delivery:setup(sites, pickupPos, pickupRadius, tag, count) end

--- Switches to the 'active' state and selects the first location (locationIndex = 1).
---Source: lua/ge/extensions/gameplay/delivery/delivery.lua:109
function gameplay_delivery_delivery:startDelivery() end

--- Per-frame update: in the 'active' state, checks the failure conditions. No effect if the state is 'disabled'.
---Source: lua/ge/extensions/gameplay/delivery/delivery.lua:124
---@param dt number Time delta (s).
function gameplay_delivery_delivery:update(dt) end

