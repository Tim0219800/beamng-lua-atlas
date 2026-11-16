---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/endScreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small module of the freeform delivery mode (freeformDelivery) that gathers the statistics displayed at the end of a delivery: elapsed time, goal progress (via gameplay_freeformDelivery_goals.getProgress) and damage of each vehicle of the delivery (read from map.objects). Contains no UI: it only builds the results table.
--- Access: extension `gameplay_freeformDelivery_endScreen`: `extensions.load("gameplay_freeformDelivery_endScreen")`, then the global `gameplay_freeformDelivery_endScreen`
---@class gameplay_freeformDelivery_endScreen
gameplay_freeformDelivery_endScreen = {}

--- Builds the end-of-delivery statistics table: duration (raw and formatted by gameplay_freeformDelivery_utils.formatTime), number of goals total/completed/required/required completed, damage per vehicle (vehData.damage) and the allRequiredComplete flag.
---Source: lua/ge/extensions/gameplay/freeformDelivery/endScreen.lua:8
---@param delivery table Data of the loaded delivery (vehicles list with id and name).
---@param startTime number Start time in seconds, measured with os.clock().
---@return table|nil  {time, timeStr, goalsTotal, goalsCompleted, goalsRequired, goalsRequiredCompleted, vehicleDamages = {[deliveryId] = {name, damage}}, allRequiredComplete}, or nil on error.
function gameplay_freeformDelivery_endScreen.collectStatistics(delivery, startTime) end

