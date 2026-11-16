# `career_modules_milestones_general`

*File: `lua/ge/extensions/career/modules/milestones/general.lua` · VM: Game Engine (GE) · 169 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_milestones_general`: `extensions.load("career_modules_milestones_general")`, then the global `career_modules_milestones_general`

Manager of the career's "general milestones". When the career activates, it collects via the onGeneralMilestonesCollect hook the configurations provided by subsystems (generalMilestones/*), initializes their save data ({claimedStep, notificationStep}) in career_modules_milestones_milestones.saveData.general, then calls onGeneralMilestonesSetupCallbacks. It builds the UI entry of each milestone (getMilestone) and handles reward claiming (claim).

## Example

```lua
career_modules_milestones_general.claim("stat_distance")
```

## Notes

- A milestone configuration contains: id, filter, maxStep, icon, color, getValue(), getLabel(step, value, target), getDescription(...), getProgressLabel(...), getTarget(step), getRewards(step); getTarget(0) must be 0 if minValueIsPreviousStepTarget or for the progress bar.
- Rewards are lists of {attributeKey, rewardAmount}; claim sums them per attribute and adds them via playerAttributes.addAttributes (tags milestone, reward, gameplay).
- Probable bug: the sort at the end of onCareerActive applies to the module table `milestones` (career_modules_milestones_milestones) and not to milestoneConfigs, so it has no useful effect. The order stays the collection order.
- printDebug writes milestones.csv and assumes getRewards(s) returns at least two rewards (r[1], r[2]): crashes otherwise (linear rewards give only one).

**Dependencies (loaded first):** `career_modules_milestones_milestones`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_milestones_general.claim(id)` | Claims the milestone's current tier: sums the rewards of getRewards(claimedStep), credits them, increments claimedStep, calls the onGeneralMilestoneClaimed(config) hook and shows a success toast. | 47 |
| `career_modules_milestones_general.getMilestone(id)` | Builds the milestone's UI card for the next tier: label, description, progress bar, rewards, claimable (value >= target), claimFunction and claimRefreshFunction. If all tiers are done (maxStep exceeded), returns a card with completed = true. | 69 |
| `career_modules_milestones_general.onCareerActive(active)` | Hook: resets and re-collects the milestone configurations (onGeneralMilestonesCollect hook), creates missing save data (warns if claimedStep is absent) and calls the onGeneralMilestonesSetupCallbacks hook. *(internal)* *(hook)* | 16 |
| `career_modules_milestones_general.onGetMilestones(list, filter)` | Milestone list hook: adds to list the card of each milestone whose filter contains one of the requested filters (all if the filter is empty). *(internal)* *(hook)* | 131 |
| `career_modules_milestones_general.printDebug()` | Debug tool: exports all tiers (id, step, name, description, target, first two rewards) to milestones.csv. | 151 |

### Parameter details

#### `career_modules_milestones_general.claim(id)`

Claims the milestone's current tier: sums the rewards of getRewards(claimedStep), credits them, increments claimedStep, calls the onGeneralMilestoneClaimed(config) hook and shows a success toast.

- `id` (*string*) : Milestone identifier.

#### `career_modules_milestones_general.getMilestone(id)`

Builds the milestone's UI card for the next tier: label, description, progress bar, rewards, claimable (value >= target), claimFunction and claimRefreshFunction. If all tiers are done (maxStep exceeded), returns a card with completed = true.

- `id` (*string*) : Milestone identifier.
- **returns**: table Milestone card for the interface.

#### `career_modules_milestones_general.onCareerActive(active)`

Hook: resets and re-collects the milestone configurations (onGeneralMilestonesCollect hook), creates missing save data (warns if claimedStep is absent) and calls the onGeneralMilestonesSetupCallbacks hook.

- `active` (*boolean*) : Nothing if false.

#### `career_modules_milestones_general.onGetMilestones(list, filter)`

Milestone list hook: adds to list the card of each milestone whose filter contains one of the requested filters (all if the filter is empty).

- `list` (*table[]*) : List to fill.
- `filter` (*string[]|nil*) : Requested filter identifiers.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: career_modules_milestones_milestones. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onGeneralMilestoneClaimed` — listened to by 1 module(s)
- `onGeneralMilestonesCollect` — listened to by 7 module(s)
- `onGeneralMilestonesSetupCallbacks` — listened to by 5 module(s)

**UI events (guihooks.trigger):** `toastrMsg`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/milestones/general.lua`.*
