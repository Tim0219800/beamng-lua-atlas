# `campaign_rewards`

*File: `lua/ge/extensions/campaign/rewards.lua` · VM: Game Engine (GE) · 142 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `campaign_rewards`: `extensions.load("campaign_rewards")`, then the global `campaign_rewards`

Computation and granting of campaign scenario rewards. From scenarioData.onEvent.onSucceed (or onFail), getRewards selects the rewards; processRewards adds them to the inventory (core_inventory.addItem with the key "$$$_"..type) and returns what was won as well as the choices to be made by the player ("choices" key). processUserSelection applies the player's choice and sends the other options to the dealer (campaign_dealer.addToStock).

## Notes

- Medal keys are recognized by statistics_statistics.getMedalRanking(key) >= 0; the other keys of rewards are always granted.
- In processRewards, "choices" must be an array (otherwise an error is logged) and is stored in M.pendingUserChoices[scenarioKey].
- Bug: iterateRewardsConst reads a global "players" that is defined nowhere in this file; the function fails or iterates over nothing if it does not exist elsewhere.
- getScenarioReward is empty: its whole body is commented out and it always returns nil.
- processUserSelection only handles the first key of pendingUserChoices[scenarioKey] then returns; the selected index is 1-based, and the other entries of the list go to the dealer.

## Functions

| Function | Description | Line |
|---|---|---|
| `campaign_rewards.getRewards(scenarioKey, scenarioData, scenarioResult, medal)` | Returns the scenario's rewards table: onSucceed if the result is not failed, otherwise onFail. Includes the reward for the medal obtained and all keys that are not medals. | 17 |
| `campaign_rewards.getScenarioReward(scenarioData, eventName)` | Function intended to read the rewards of an event; its body is entirely commented out in this version. | 119 |
| `campaign_rewards.iterateRewardsConst(player, callback)` | Calls callback(key, value) for each entry of players[player] (global table not defined in this file). | 10 |
| `campaign_rewards.processRewards(scenarioKey, scenarioData, scenarioResult, medal)` | Adds the rewards to the inventory, stores the pending choices, and returns a table merging what is won (accumulated numbers or lists) and the proposed choices. | 53 |
| `campaign_rewards.processUserSelection(scenarioKey, selectionIndex)` | Applies the player's choice: adds the chosen item to the inventory and sends all the other options of the list to the dealer. | 97 |

### Parameter details

#### `campaign_rewards.getRewards(scenarioKey, scenarioData, scenarioResult, medal)`

Returns the scenario's rewards table: onSucceed if the result is not failed, otherwise onFail. Includes the reward for the medal obtained and all keys that are not medals.

- `scenarioKey` (*string*) : Scenario identifier (not used in the computation).
- `scenarioData` (*table*) : Scenario data with onEvent.onSucceed / onFail.
- `scenarioResult` (*table*) : Result; the failed field is read.
- `medal` (*string|nil*) : Medal obtained.
- **returns**: table|nil Rewards, or nil if there are none.

#### `campaign_rewards.getScenarioReward(scenarioData, eventName)`

Function intended to read the rewards of an event; its body is entirely commented out in this version.

- `scenarioData` (*table*) : Scenario data.
- `eventName` (*string*) : Event name.
- **returns**: nil Always nil.

#### `campaign_rewards.iterateRewardsConst(player, callback)`

Calls callback(key, value) for each entry of players[player] (global table not defined in this file).

- `player` (*any*) : Player key in the global table players.
- `callback` (*function*) : Receives (key, value).

#### `campaign_rewards.processRewards(scenarioKey, scenarioData, scenarioResult, medal)`

Adds the rewards to the inventory, stores the pending choices, and returns a table merging what is won (accumulated numbers or lists) and the proposed choices.

- `scenarioKey` (*string*) : Scenario identifier.
- `scenarioData` (*table*) : Scenario data.
- `scenarioResult` (*table*) : Scenario result.
- `medal` (*string|nil*) : Medal obtained.
- **returns**: table Rewards won plus an optional "choices" field.

#### `campaign_rewards.processUserSelection(scenarioKey, selectionIndex)`

Applies the player's choice: adds the chosen item to the inventory and sends all the other options of the list to the dealer.

- `scenarioKey` (*string*) : Scenario with pending choices.
- `selectionIndex` (*integer*) : Index (1-based) of the selected option.

## Fields

| Field | Type | Description |
|---|---|---|
| `pendingUserChoices` | table<string, table> | Pending choices by scenario key, filled by processRewards. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/campaign/rewards.lua`.*
