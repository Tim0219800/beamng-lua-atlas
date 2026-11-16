---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/roadSectionPenaltyKeeper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Road section penalty detector. Fields: manager, recalcCount, violationCount, lastCheckTime.
---@class gameplay_rally_loop_roadSectionPenaltyKeeper
local gameplay_rally_loop_roadSectionPenaltyKeeper = {}

--- Increments violationCount and returns the penalty data {type = 'liaison_deviation', amount, data = {violationNumber, recalcCount}} with amount = 30, 60, 120 then 180 s.
---Source: lua/ge/extensions/gameplay/rally/loop/roadSectionPenaltyKeeper.lua:37
---@return table  Penalty data.
function gameplay_rally_loop_roadSectionPenaltyKeeper:createPenaltyData() end

--- Stores the manager and resets the counters. Called by the constructor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/roadSectionPenaltyKeeper.lua:20
---@param manager table rallyLoopManager (uses manager.clock and manager:recordRouteRecalcPenalty).
function gameplay_rally_loop_roadSectionPenaltyKeeper:init(manager) end

--- Called every frame by the manager. Every 10 s (manager.clock time), if recalcCount > 5 and violationCount < MAX_VIOLATIONS, calls manager:recordRouteRecalcPenalty(createPenaltyData()) and resets recalcCount to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/loop/roadSectionPenaltyKeeper.lua:58
---@return boolean|nil  false if the 10 s window has not elapsed, otherwise nil.
function gameplay_rally_loop_roadSectionPenaltyKeeper:onUpdate() end

--- Increments the route recalculation counter; call it on each detected route recalculation.
---Source: lua/ge/extensions/gameplay/rally/loop/roadSectionPenaltyKeeper.lua:33
function gameplay_rally_loop_roadSectionPenaltyKeeper:registerRecalc() end

--- Resets recalcCount and violationCount to 0.
---Source: lua/ge/extensions/gameplay/rally/loop/roadSectionPenaltyKeeper.lua:28
function gameplay_rally_loop_roadSectionPenaltyKeeper:reset() end

