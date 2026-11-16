---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/hints.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the hints of the freeform delivery mode: each delivery hint (id, targetAreaIds, message, subtext) is displayed as a message in the task list (SetTasklistTask) as long as the player is inside one of its target areas (zone, location or parkingSpot), then disappears (DiscardTasklistItem) when they leave. Called by gameplay_freeformDelivery_freeformDelivery, not by the engine.
--- Access: extension `gameplay_freeformDelivery_hints`: `extensions.load("gameplay_freeformDelivery_hints")`, then the global `gameplay_freeformDelivery_hints`
---@class gameplay_freeformDelivery_hints
gameplay_freeformDelivery_hints = {}

--- Removes all displayed hints from the tasklist and forgets the active delivery.
---Source: lua/ge/extensions/gameplay/freeformDelivery/hints.lua:179
function gameplay_freeformDelivery_hints.cleanup() end

--- Initializes the hints from delivery.hints and stores the active delivery. Logs the number of hints loaded.
---Source: lua/ge/extensions/gameplay/freeformDelivery/hints.lua:92
---@param delivery table Loaded delivery (hints, targetAreas, sites).
function gameplay_freeformDelivery_hints.setup(delivery) end

--- To be called every frame: displays the hints whose target area contains the player and hides the others. No effect if no delivery is active or if the player's position is unknown.
---Source: lua/ge/extensions/gameplay/freeformDelivery/hints.lua:128
---@param dtReal number Real time delta (unused).
---@param dtSim number Simulated time delta (unused).
---@param dtRaw number Raw time delta (unused).
---@param profiler table|nil Optional LuaProfiler for measuring sections.
function gameplay_freeformDelivery_hints.update(dtReal, dtSim, dtRaw, profiler) end

