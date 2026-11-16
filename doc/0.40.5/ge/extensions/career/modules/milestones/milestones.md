# `career_modules_milestones_milestones`

*File: `lua/ge/extensions/career/modules/milestones/milestones.lua` · VM: Game Engine (GE) · 231 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_milestones_milestones`: `extensions.load("career_modules_milestones_milestones")`, then the global `career_modules_milestones_milestones`

Central career milestones module: save data (milestones.json), aggregated list for the UI via the onGetMilestones hook, reward claiming (one by one or all), unclaimed milestone counter and notifications. Also provides common reward functions and colors for the subsystems (generalMilestones/*).

## Example

```lua
local data = career_modules_milestones_milestones.getMilestones({"money"})
for _, m in ipairs(data.list) do print(m.label, m.claimable) end
```

## Notes

- saveData is loaded from <save>/career/milestones.json; saveData.unclaimedMilestonesCount is 0 by default and saveData.general is filled by milestones/general.lua.
- Each call to getMilestones recomputes the list, reassigns claimIds (list index) and recounts unclaimedMilestonesCount; claimIds are valid only for the last generated list.
- claim(id) calls claimFunction then claimRefreshFunction, and sends guihooks milestoneClaimed (unless noGuiEvent).
- onGetMilestones in this file is empty (stub); the work is done by milestones/general.lua.
- sortByTimeAndId is defined but never used.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_milestones_milestones.claim(id, noGuiEvent)` | Claims the milestone identified by its claimId (index in the last list). Runs its claimFunction, updates the refresh functions and notifies the UI (milestoneClaimed with replacementEntry). | 47 |
| `career_modules_milestones_milestones.claimAllUnclaimed()` | Claims all claimable milestones of the full list, re-runs getMilestones and sends guihooks allMilestonesClaimed. | 67 |
| `career_modules_milestones_milestones.getMilestones(filter)` | Collects milestones via the onGetMilestones(list, filter) hook, assigns claimIds, counts claimable milestones and returns the list with the available filters. | 89 |
| `career_modules_milestones_milestones.loadSaveData()` | Loads saveData from career/milestones.json of the current profile. *(internal)* | 136 |
| `career_modules_milestones_milestones.majorLinear(step)` | Reward function: 250 * (step + 1) in money. | 186 |
| `career_modules_milestones_milestones.milestoneReached(label)` | Shows a "milestone reached" toast (string label or {txt, context}) and increments unclaimedMilestonesCount. Intended to possibly be deferred during a mission. | 122 |
| `career_modules_milestones_milestones.minorLinear(step)` | Reward function: 100 * (step + 1) in money. | 185 |
| `career_modules_milestones_milestones.onCareerActive(active)` | Hook: shows a toast if there are unclaimed milestones. *(internal)* *(hook)* | 169 |
| `career_modules_milestones_milestones.onExtensionLoaded()` | Hook: loads saveData if the career is already active (returns false otherwise). *(internal)* *(hook)* | 145 |
| `career_modules_milestones_milestones.onGetMilestones(list)` | Empty hook (stub); adding the cards is done by milestones/general.lua. *(internal)* *(hook)* | 112 |
| `career_modules_milestones_milestones.onMilestonesRouteEnter(context, toRoute, fromRoute, data)` | UI router lifecycle: calls onPauseEnter of ui_pause_routeLifecycleCallbacks if it exists and adds data.milestones.filterOptions. *(internal)* *(hook)* | 218 |
| `career_modules_milestones_milestones.onMilestonesRouteMount(context, toRoute, fromRoute, data)` | UI router lifecycle: calls onPauseMount then adds data.milestones.filterOptions (translated filter options). *(internal)* *(hook)* | 223 |
| `career_modules_milestones_milestones.onSaveCurrentProfile(currentSavePath)` | Save hook: writes saveData to <save>/career/milestones.json. *(internal)* *(hook)* | 150 |
| `career_modules_milestones_milestones.requestMilestones(filter)` | Sends getMilestones(filter) to the UI via guihooks milestonesData. | 116 |
| `career_modules_milestones_milestones.unclaimedMilestonesCount()` | Number of milestones reached and unclaimed. | 155 |

### Parameter details

#### `career_modules_milestones_milestones.claim(id, noGuiEvent)`

Claims the milestone identified by its claimId (index in the last list). Runs its claimFunction, updates the refresh functions and notifies the UI (milestoneClaimed with replacementEntry).

- `id` (*integer*) : claimId from the current list.
- `noGuiEvent` (*boolean|nil*) : If true, does not send the UI event.
- **returns**: table|nil New milestone card (next tier) or nil.

#### `career_modules_milestones_milestones.claimAllUnclaimed()`

Claims all claimable milestones of the full list, re-runs getMilestones and sends guihooks allMilestonesClaimed.

- **returns**: {claimed: integer, unclaimedMilestonesCount: integer} Number claimed and remaining counter.

#### `career_modules_milestones_milestones.getMilestones(filter)`

Collects milestones via the onGetMilestones(list, filter) hook, assigns claimIds, counts claimable milestones and returns the list with the available filters.

- `filter` (*string[]|nil*) : Filters (general, mission, branch, delivery, money, speedTrap, insurance, all...).
- **returns**: {list: table[], filters: string[]} Cards and sorted filter keys.

#### `career_modules_milestones_milestones.majorLinear(step)`

Reward function: 250 * (step + 1) in money.

- `step` (*integer*) : Tier index (starting from 0).
- **returns**: {attributeKey: string, rewardAmount: number}[] A money reward.

#### `career_modules_milestones_milestones.milestoneReached(label)`

Shows a "milestone reached" toast (string label or {txt, context}) and increments unclaimedMilestonesCount. Intended to possibly be deferred during a mission.

- `label` (*string|table*) : Text or translation table {txt, context}.

#### `career_modules_milestones_milestones.minorLinear(step)`

Reward function: 100 * (step + 1) in money.

- `step` (*integer*) : Tier index (starting from 0).
- **returns**: {attributeKey: string, rewardAmount: number}[] A money reward.

#### `career_modules_milestones_milestones.onCareerActive(active)`

Hook: shows a toast if there are unclaimed milestones.

- `active` (*boolean*) : Nothing if false.

#### `career_modules_milestones_milestones.onGetMilestones(list)`

Empty hook (stub); adding the cards is done by milestones/general.lua.

- `list` (*table[]*) : List to fill.

#### `career_modules_milestones_milestones.onMilestonesRouteEnter(context, toRoute, fromRoute, data)`

UI router lifecycle: calls onPauseEnter of ui_pause_routeLifecycleCallbacks if it exists and adds data.milestones.filterOptions.

- `context` (*any*) : Router context.
- `toRoute` (*any*) : Target route.
- `fromRoute` (*any*) : Previous route.
- `data` (*table*) : routeData.

#### `career_modules_milestones_milestones.onMilestonesRouteMount(context, toRoute, fromRoute, data)`

UI router lifecycle: calls onPauseMount then adds data.milestones.filterOptions (translated filter options).

- `context` (*any*) : Router context.
- `toRoute` (*any*) : Target route.
- `fromRoute` (*any*) : Previous route.
- `data` (*table*) : routeData.

#### `career_modules_milestones_milestones.onSaveCurrentProfile(currentSavePath)`

Save hook: writes saveData to <save>/career/milestones.json.

- `currentSavePath` (*string*) : Save folder.

#### `career_modules_milestones_milestones.requestMilestones(filter)`

Sends getMilestones(filter) to the UI via guihooks milestonesData.

- `filter` (*string[]|nil*) : Filters.

#### `career_modules_milestones_milestones.unclaimedMilestonesCount()`

Number of milestones reached and unclaimed.

- **returns**: integer Saved counter.

## Fields

| Field | Type | Description |
|---|---|---|
| `colorGeneralGray` | string | CSS color var(--bng-cool-gray-700-rgb). |
| `colorMissionBlue` | string | CSS color var(--bng-add-blue-500-rgb). |
| `colorOrange` | string | CSS color var(--bng-orange-500-rgb). |
| `saveData` | table | Saved data: general (per id: claimedStep, notificationStep) and unclaimedMilestonesCount. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onGetMilestones` — listened to by 2 module(s)

**UI events (guihooks.trigger):** `allMilestonesClaimed`, `milestoneClaimed`, `milestonesData`, `toastrMsg`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/milestones/milestones.lua`.*
