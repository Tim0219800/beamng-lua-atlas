# `career_modules_milestones_generalMilestones_statistic`

*File: `lua/ge/extensions/career/modules/milestones/generalMilestones/statistic.lua` · VM: Game Engine (GE) · 124 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_milestones_generalMilestones_statistic`: `extensions.load("career_modules_milestones_generalMilestones_statistic")`, then the global `career_modules_milestones_generalMilestones_statistic`

Milestones based on gameplay statistics (gameplay_statistic): distance traveled (vehicle/total_odometer.length, in m, 8 tiers from 10 to 300 km), career play time (general/mode/career.time, in s, 5 h tiers), rollovers (vehicle/rollover) and airtime (vehicle/airtime.time, in s). majorLinear reward. Notification relies on statistic callbacks registered for the next tier.

## Notes

- registerStastisticCallback (original typo in the name) tests `step < milestone.maxStep` instead of <=: the last tier (8) is never notified.
- The callback is registered with gameplay_statistic.callbackRegister and removed with callbackRemove; _statCallback and _callbackTrigger are used to store it.
- onGeneralMilestoneClaimed is an alias of registerStastisticCallback: after a claim, the callback is re-registered for the next tier.
- onGeneralMilestonesSetupCallbacks declares an unused `milestone` parameter (shadowed by the loop).

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_milestones_generalMilestones_statistic.clearStatisticCallback(milestone)` | Removes the milestone's statistic callback if it exists. | 88 |
| `career_modules_milestones_generalMilestones_statistic.onGeneralMilestoneClaimed(milestone)` | Hook called after a milestone is claimed: alias of registerStastisticCallback to re-register the watching. *(internal)* *(hook)* | 95 |
| `career_modules_milestones_generalMilestones_statistic.onGeneralMilestonesCollect(milestonesList)` | Hook: builds the four statistic milestones (stat_distance, stat_playtime, stat_rollover, jump) and adds them to milestonesList. *(internal)* *(hook)* | 8 |
| `career_modules_milestones_generalMilestones_statistic.onGeneralMilestonesSetupCallbacks(milestone)` | Hook: registers the statistic callback of each milestone. *(internal)* *(hook)* | 81 |
| `career_modules_milestones_generalMilestones_statistic.registerStastisticCallback(milestone)` | Registers a callback triggered when the watched statistic reaches the next tier's target; the callback notifies the milestone and stores notificationStep. | 95 |

### Parameter details

#### `career_modules_milestones_generalMilestones_statistic.clearStatisticCallback(milestone)`

Removes the milestone's statistic callback if it exists.

- `milestone` (*table*) : Milestone configuration.

#### `career_modules_milestones_generalMilestones_statistic.onGeneralMilestoneClaimed(milestone)`

Hook called after a milestone is claimed: alias of registerStastisticCallback to re-register the watching.

- `milestone` (*table*) : Configuration of the claimed milestone.

#### `career_modules_milestones_generalMilestones_statistic.onGeneralMilestonesCollect(milestonesList)`

Hook: builds the four statistic milestones (stat_distance, stat_playtime, stat_rollover, jump) and adds them to milestonesList.

- `milestonesList` (*table[]*) : List to fill.

#### `career_modules_milestones_generalMilestones_statistic.onGeneralMilestonesSetupCallbacks(milestone)`

Hook: registers the statistic callback of each milestone.

- `milestone` (*any*) : Not used.

#### `career_modules_milestones_generalMilestones_statistic.registerStastisticCallback(milestone)`

Registers a callback triggered when the watched statistic reaches the next tier's target; the callback notifies the milestone and stores notificationStep.

- `milestone` (*table*) : Milestone configuration (watchStatisticKey, getTarget...).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/milestones/generalMilestones/statistic.lua`.*
