# `career_modules_milestones_generalMilestones_money`

*File: `lua/ge/extensions/career/modules/milestones/generalMilestones/money.lua` · VM: Game Engine (GE) · 150 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_milestones_generalMilestones_money`: `extensions.load("career_modules_milestones_generalMilestones_money")`, then the global `career_modules_milestones_generalMilestones_money`

Career money milestones. Each milestone accumulates, for a mode (gains or losses) and tags, the amounts tracked by career_modules_playerAttributes.getAttribute("money")[mode][tag] (absolute value). Seven milestones: gains (tag reward), spending (buying), parts bought (partsBought), vehicles bought (vehicleBought), sales (selling), deliveries (delivery), fines (fine). Two Steam achievements are tied to gains: FIRST_PAYCHECK (10,000) and SIX_FIGURES (100,000).

## Notes

- Generic tiers (gains/spending): 1000, 2000, 5000, 10000, 20000, 50000, 100000, 200000, 500000, 1000000. Other milestones: their own short values (e.g. fine {500,1500,5000}).
- Only the "reward" gains and "buying" spending milestones have the general filter; all have money.
- Milestone id = money_<mode>--<tags joined by ->.
- Achievements are unlocked via gameplay_achievement.unlockAchievement as soon as the total exceeds the amount, on each tier notification.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_milestones_generalMilestones_money.onGeneralMilestonesCollect(milestonesList)` | Hook: creates one milestone per mode configuration and adds it to milestonesList (save data created if absent). *(internal)* *(hook)* | 75 |
| `career_modules_milestones_generalMilestones_money.onGeneralMilestonesSetupCallbacks()` | Hook: sets the notification target of each money milestone. *(internal)* *(hook)* | 111 |
| `career_modules_milestones_generalMilestones_money.onPlayerAttributesChanged(change)` | Hook: if the money attribute changed, checks each milestone, unlocks any achievements, notifies the reached tier and advances notificationStep. *(internal)* *(hook)* | 129 |
| `career_modules_milestones_generalMilestones_money.setNotificationTarget(milestoneConfig)` | Stores in milestoneConfig._target the target of the next tier to notify (nothing if all are notified). | 119 |

### Parameter details

#### `career_modules_milestones_generalMilestones_money.onGeneralMilestonesCollect(milestonesList)`

Hook: creates one milestone per mode configuration and adds it to milestonesList (save data created if absent).

- `milestonesList` (*table[]*) : List to fill.

#### `career_modules_milestones_generalMilestones_money.onPlayerAttributesChanged(change)`

Hook: if the money attribute changed, checks each milestone, unlocks any achievements, notifies the reached tier and advances notificationStep.

- `change` (*table<string, number>*) : Change per attribute.

#### `career_modules_milestones_generalMilestones_money.setNotificationTarget(milestoneConfig)`

Stores in milestoneConfig._target the target of the next tier to notify (nothing if all are notified).

- `milestoneConfig` (*table*) : Milestone configuration.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/milestones/generalMilestones/money.lua`.*
