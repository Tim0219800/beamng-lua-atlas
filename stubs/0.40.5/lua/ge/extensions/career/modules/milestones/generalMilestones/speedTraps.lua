---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/milestones/generalMilestones/speedTraps.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Milestones related to speed traps (gameplay_speedTraps) in career: speed record reached in front of a speed trap (velocitySpeedTrapMilestone, tiers 70, 90, 120, 150, 180 and 220 km/h stored in m/s) and total number of speed trap triggers by the player (speedTrapTriggerCounterMilestone, 10 tiers of 15 triggers). The per-individual-speed-trap and "all speed traps" milestones are disabled (commented-out code).
--- Access: extension `career_modules_milestones_generalMilestones_speedTraps`: `extensions.load("career_modules_milestones_generalMilestones_speedTraps")`, then the global `career_modules_milestones_generalMilestones_speedTraps`
---@class career_modules_milestones_generalMilestones_speedTraps
---@field onGeneralMilestoneClaimed any
career_modules_milestones_generalMilestones_speedTraps = {}

--- Hook: creates the two active milestones (speed record and counter) with their save data (maxVelocityReachedByPlayer, triggerCount) and adds them to milestonesList.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/speedTraps.lua:10
---@param milestonesList table[] List to fill.
function career_modules_milestones_generalMilestones_speedTraps.onGeneralMilestonesCollect(milestonesList) end

--- Hook called when a speed trap triggers: updates the player's speed record, notifies all speed tiers passed, and increments the trigger counter.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/milestones/generalMilestones/speedTraps.lua:123
---@param speedTrapData table Speed trap data (speedLimit, subjectID...).
---@param playerSpeed number Measured speed in m/s.
---@param overSpeed number Speed excess (not used here).
function career_modules_milestones_generalMilestones_speedTraps.onSpeedTrapTriggered(speedTrapData, playerSpeed, overSpeed) end

