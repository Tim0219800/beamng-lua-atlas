# `career_modules_milestones_generalMilestones_speedTraps`

*File: `lua/ge/extensions/career/modules/milestones/generalMilestones/speedTraps.lua` · VM: Game Engine (GE) · 189 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_milestones_generalMilestones_speedTraps`: `extensions.load("career_modules_milestones_generalMilestones_speedTraps")`, then the global `career_modules_milestones_generalMilestones_speedTraps`

Milestones related to speed traps (gameplay_speedTraps) in career: speed record reached in front of a speed trap (velocitySpeedTrapMilestone, tiers 70, 90, 120, 150, 180 and 220 km/h stored in m/s) and total number of speed trap triggers by the player (speedTrapTriggerCounterMilestone, 10 tiers of 15 triggers). The per-individual-speed-trap and "all speed traps" milestones are disabled (commented-out code).

## Notes

- Bug: `M.onGeneralMilestoneClaimed = registerStastisticCallback` references a variable that does not exist in this file (copy-paste from statistic.lua): it is nil, so the exported field is nil.
- The trigger counter does not stop at maxStep (10): getTarget(step) = step*15 is never nil, so triggerCount keeps increasing and so does notificationStep.
- onSpeedTrapTriggered ignores speed traps without a speedLimit and those triggered by a vehicle other than player vehicle 0.
- Speeds are in m/s (km/h / 3.6).

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_milestones_generalMilestones_speedTraps.onGeneralMilestonesCollect(milestonesList)` | Hook: creates the two active milestones (speed record and counter) with their save data (maxVelocityReachedByPlayer, triggerCount) and adds them to milestonesList. *(internal)* *(hook)* | 10 |
| `career_modules_milestones_generalMilestones_speedTraps.onSpeedTrapTriggered(speedTrapData, playerSpeed, overSpeed)` | Hook called when a speed trap triggers: updates the player's speed record, notifies all speed tiers passed, and increments the trigger counter. *(internal)* *(hook)* | 123 |

### Parameter details

#### `career_modules_milestones_generalMilestones_speedTraps.onGeneralMilestonesCollect(milestonesList)`

Hook: creates the two active milestones (speed record and counter) with their save data (maxVelocityReachedByPlayer, triggerCount) and adds them to milestonesList.

- `milestonesList` (*table[]*) : List to fill.

#### `career_modules_milestones_generalMilestones_speedTraps.onSpeedTrapTriggered(speedTrapData, playerSpeed, overSpeed)`

Hook called when a speed trap triggers: updates the player's speed record, notifies all speed tiers passed, and increments the trigger counter.

- `speedTrapData` (*table*) : Speed trap data (speedLimit, subjectID...).
- `playerSpeed` (*number*) : Measured speed in m/s.
- `overSpeed` (*number*) : Speed excess (not used here).

## Fields

| Field | Type | Description |
|---|---|---|
| `onGeneralMilestoneClaimed` | any | after a milestone is claimed, also re-register the watch ⚠ reference `registerStastisticCallback` not defined in the file (probably nil) |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/milestones/generalMilestones/speedTraps.lua`.*
