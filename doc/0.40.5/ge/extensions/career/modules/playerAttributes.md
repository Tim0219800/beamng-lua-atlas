# `career_modules_playerAttributes`

*File: `lua/ge/extensions/career/modules/playerAttributes.lua` · VM: Game Engine (GE) · 328 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_playerAttributes`: `extensions.load("career_modules_playerAttributes")`, then the global `career_modules_playerAttributes`

Central registry of the player's career attributes: money, beamXP, vouchers, one attribute per branch/skill (branch.attributeKey) and <orgId>Reputation per organization. Each attribute has a value, cumulative gains and losses per tag (+ "all"), and optionally min/max. Every change goes through addAttributes (or setAttributes), which updates the statistics, keeps the change log, writes to career_modules_log and emits the onPlayerAttributesChanged(change, reason) hook. Saved to career/playerAttributes.json and career/attributeLog.json.

## Example

```lua
career_modules_playerAttributes.addAttributes({money = 250, beamXP = 10}, {label = "ui.career.attributeLog.unknownReason", tags = {"gameplay", "reward"}})
local money = career_modules_playerAttributes.getAttributeValue("money")
```

## Notes

- reason = {label, tags}. label is a translation key or a table {txt, context}; tags is a list converted into a dictionary. Without reason, a warning is logged with the call stack.
- Tags are used by milestones: money.gains/losses[tag] feed career_modules_milestones_generalMilestones_money (reward, buying, selling, delivery, fine, partsBought, vehicleBought).
- A change to an attribute ending in "Reputation" calls career_career.interactWithOrganization(orgId).
- Values are bounded by attribute.min/max (reputation: -50 to 700).
- Gameplay tag with money (outside the tutorial) unlocks the FIRST_ASSIGNMENT achievement; fine tag with money unlocks PAID_THE_PRICE.
- Bug: M.logAttributeChange = logAttributeChange references an undefined variable: the exported field is nil.
- init() (not exported) is called only by onExtensionLoaded when attributes is nil; the career's starting mode may provide initPlayerAttributes(M), otherwise the starting money is 10000 (label startingCapital).
- Compatibility: bonusStars becomes vouchers if the save version is < 37; old branch names are remapped via career_branches.oldAttributeNamesToNewNames.
- onLogbookGetEntries is an empty hook.

**Dependencies (loaded first):** `career_career`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_playerAttributes.addAttributes(change, reason)` | Adds the given changes to the attributes (creating them if absent), updates gains/losses per tag, records the entry in attributeLog, writes a career log and emits onPlayerAttributesChanged(change, reason). | 66 |
| `career_modules_playerAttributes.getAllAttributes()` | Returns the table of all attributes (direct reference, not copied). | 152 |
| `career_modules_playerAttributes.getAttribute(attributeName)` | Returns the full object of an attribute {value, gains, losses, min, max}. | 145 |
| `career_modules_playerAttributes.getAttributeLog()` | Returns the attribute change log ({attributeChange, reason, time}). | 320 |
| `career_modules_playerAttributes.getAttributeValue(attributeName)` | Returns the numeric value of an attribute (0 if it does not exist). | 148 |
| `career_modules_playerAttributes.getCareerHistoryInfo(historyType)` | Returns the title (translation key) of the history screen: gameplay or financial (default). | 215 |
| `career_modules_playerAttributes.getFinancialHistory(limit)` | Money change history, from most recent to oldest. | 207 |
| `career_modules_playerAttributes.getGameplayHistory(limit)` | Gameplay reward history (changes whose tags contain gameplay), with display names and icons. | 211 |
| `career_modules_playerAttributes.getRecentFinancialChanges(limit)` | Recent financial history (the last 5 money changes by default), from most recent to oldest. | 203 |
| `career_modules_playerAttributes.getRewardDisplayName(attributeKey)` | Returns the display translation key of an attribute: money, beamXP, vouchers, reputation, branch XP {txt, context} or the raw key. | 22 |
| `career_modules_playerAttributes.onCareerActive(active)` | Hook: creates the <orgId>Reputation attribute (min/max from career_modules_reputation) for each organization that does not have one. *(internal)* *(hook)* | 294 |
| `career_modules_playerAttributes.onExtensionLoaded()` | Hook: if the career is active, initializes the attributes then loads playerAttributes.json and attributeLog.json with compatibility conversions (returns false otherwise). *(internal)* *(hook)* | 226 |
| `career_modules_playerAttributes.onLogbookGetEntries(_)` | Logbook integration hook (empty body). *(internal)* *(hook)* | 307 |
| `career_modules_playerAttributes.onSaveCurrentProfile(currentSavePath)` | Save hook: writes playerAttributes.json and attributeLog.json to <save>/career/. *(internal)* *(hook)* | 288 |
| `career_modules_playerAttributes.setAttributes(newValues, reason)` | Sets absolute values by calling addAttributes with the difference from the current value. | 136 |

### Parameter details

#### `career_modules_playerAttributes.addAttributes(change, reason)`

Adds the given changes to the attributes (creating them if absent), updates gains/losses per tag, records the entry in attributeLog, writes a career log and emits onPlayerAttributesChanged(change, reason).

- `change` (*table<string, number>*) : Change per attribute (positive = gain, negative = loss).
- `reason` (*{label: string|table, tags: string[]}|nil*) : Reason: label and list of tags.

#### `career_modules_playerAttributes.getAllAttributes()`

Returns the table of all attributes (direct reference, not copied).

- **returns**: table<string, table> Attributes by name.

#### `career_modules_playerAttributes.getAttribute(attributeName)`

Returns the full object of an attribute {value, gains, losses, min, max}.

- `attributeName` (*string*) : Attribute name.
- **returns**: table|nil Attribute, nil if it does not exist.

#### `career_modules_playerAttributes.getAttributeLog()`

Returns the attribute change log ({attributeChange, reason, time}).

- **returns**: table[] Logbook entries.

#### `career_modules_playerAttributes.getAttributeValue(attributeName)`

Returns the numeric value of an attribute (0 if it does not exist).

- `attributeName` (*string*) : Attribute name.
- **returns**: number Value.

#### `career_modules_playerAttributes.getCareerHistoryInfo(historyType)`

Returns the title (translation key) of the history screen: gameplay or financial (default).

- `historyType` (*string*) : "gameplay" or anything else for financial.
- **returns**: {title: string} Title.

#### `career_modules_playerAttributes.getFinancialHistory(limit)`

Money change history, from most recent to oldest.

- `limit` (*integer|nil*) : Maximum number (all if nil).
- **returns**: table[] History rows.

#### `career_modules_playerAttributes.getGameplayHistory(limit)`

Gameplay reward history (changes whose tags contain gameplay), with display names and icons.

- `limit` (*integer|nil*) : Maximum number (all if nil).
- **returns**: table[] History rows.

#### `career_modules_playerAttributes.getRecentFinancialChanges(limit)`

Recent financial history (the last 5 money changes by default), from most recent to oldest.

- `limit` (*integer|nil*) : Maximum number, 5 by default.
- **returns**: {reason: any, time: integer, rewards: table[]}[] History rows.

#### `career_modules_playerAttributes.getRewardDisplayName(attributeKey)`

Returns the display translation key of an attribute: money, beamXP, vouchers, reputation, branch XP {txt, context} or the raw key.

- `attributeKey` (*string*) : Attribute key.
- **returns**: string|table Translation key or table {txt, context}.

#### `career_modules_playerAttributes.onCareerActive(active)`

Hook: creates the <orgId>Reputation attribute (min/max from career_modules_reputation) for each organization that does not have one.

- `active` (*boolean*) : Nothing if false.

#### `career_modules_playerAttributes.onLogbookGetEntries(_)`

Logbook integration hook (empty body).

- `_` (*any*) : Not used.

#### `career_modules_playerAttributes.onSaveCurrentProfile(currentSavePath)`

Save hook: writes playerAttributes.json and attributeLog.json to <save>/career/.

- `currentSavePath` (*string*) : Save folder.

#### `career_modules_playerAttributes.setAttributes(newValues, reason)`

Sets absolute values by calling addAttributes with the difference from the current value.

- `newValues` (*table<string, number>*) : New value per attribute.
- `reason` (*table|nil*) : Same format as for addAttributes.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: career_career. |
| `logAttributeChange` | nil | Always nil: references a local variable that does not exist in the file (bug). ⚠ reference `logAttributeChange` not defined in the file (probably nil) |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onPlayerAttributesChanged` — listened to by 3 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/playerAttributes.lua`.*
