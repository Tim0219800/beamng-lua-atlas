# `career_modules_milestones_generalMilestones_branches`

*File: `lua/ge/extensions/career/modules/milestones/generalMilestones/branches.lua` · VM: Game Engine (GE) · 97 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_milestones_generalMilestones_branches`: `extensions.load("career_modules_milestones_generalMilestones_branches")`, then the global `career_modules_milestones_generalMilestones_branches`

Career branch level and skill milestones. For each non-"isInDevelopment" branch of career_branches.getSortedBranches(), creates a branch_<id> milestone whose tiers are the levels (requiredValue). Branches give a majorLinear reward and also appear in the general filter; skills (isSkill) give a minorLinear reward. Notifies the player when the next level's threshold is reached.

## Notes

- In onPlayerAttributesChanged, `return` is used when the changed attribute has no milestone: the following attributes of the change table are then not processed (probably `goto continue` was intended).
- Triggers the onBranchTierReached(branchKey, step+1) hook when a tier is reached.
- Icons per parent branch: motorsport raceFlag, labourer deliveryTruckArrows, specialized carChase01, adventurer jump.
- If the branch has no color, it takes that of its parent branch.

**Dependencies (loaded first):** `career_branches`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_milestones_generalMilestones_branches.onGeneralMilestonesCollect(milestonesList)` | Hook: adds to milestonesList one milestone per branch/skill and creates its save data if absent. *(internal)* *(hook)* | 16 |
| `career_modules_milestones_generalMilestones_branches.onGeneralMilestonesSetupCallbacks()` | Hook: sets the next notification target of each branch milestone. *(internal)* *(hook)* | 57 |
| `career_modules_milestones_generalMilestones_branches.onPlayerAttributesChanged(change)` | Hook: when a branch attribute increases and exceeds the target, triggers onBranchTierReached, shows the milestone toast, advances notificationStep and recomputes the target. *(internal)* *(hook)* | 76 |
| `career_modules_milestones_generalMilestones_branches.setNotificationTarget(attKey)` | Computes the target of the next tier to notify (notificationStep + 1) and stores it in milestoneConfig._target; does nothing if all tiers are notified. | 65 |

### Parameter details

#### `career_modules_milestones_generalMilestones_branches.onGeneralMilestonesCollect(milestonesList)`

Hook: adds to milestonesList one milestone per branch/skill and creates its save data if absent.

- `milestonesList` (*table[]*) : List to fill.

#### `career_modules_milestones_generalMilestones_branches.onPlayerAttributesChanged(change)`

Hook: when a branch attribute increases and exceeds the target, triggers onBranchTierReached, shows the milestone toast, advances notificationStep and recomputes the target.

- `change` (*table<string, number>*) : Change per attribute.

#### `career_modules_milestones_generalMilestones_branches.setNotificationTarget(attKey)`

Computes the target of the next tier to notify (notificationStep + 1) and stores it in milestoneConfig._target; does nothing if all tiers are notified.

- `attKey` (*string*) : Branch attribute key.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: career_branches. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onBranchTierReached` — listened to by 1 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/milestones/generalMilestones/branches.lua`.*
