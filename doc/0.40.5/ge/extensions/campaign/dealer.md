# `campaign_dealer`

*File: `lua/ge/extensions/campaign/dealer.lua` · VM: Game Engine (GE) · 134 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `campaign_dealer`: `extensions.load("campaign_dealer")`, then the global `campaign_dealer`

Campaign dealer: holds a stock (M.state.stock) keyed by uppercase item type. A stock is either a list of tables (vehicles {model, config}) or an accumulated number. Saved and restored with the campaign (onSaveCampaign / onResumeCampaign). The buy function is empty (not implemented).

## Example

```lua
campaign_dealer.addToStock('$$$_vehicles', {model='pickup', config='base'})
local stock = campaign_dealer.getStock('$$$_VEHICLES')
```

## Notes

- addToStock and removeFromStock uppercase itemType; getStock does not: it must therefore be given the type already in uppercase.
- Probable bug: existItem considers an entry a duplicate as soon as a single field of the existing entry equals that of valueObj (not all fields); two vehicles of the same model with a different config are therefore seen as identical.
- removeFromStock compares the model and config of the entries and leaves debug prints; for a numeric stock it subtracts the value.
- onDeserialized only logs; onResumeCampaign replaces M.state with the received data (without copying).

## Functions

| Function | Description | Line |
|---|---|---|
| `campaign_dealer.addToStock(itemType, valueObj)` | Adds an object (table, no duplicates according to existItem) or a quantity (number) to the stock of the given type. Creates the entry if needed. | 32 |
| `campaign_dealer.buy(itemType, index)` | Intended to buy an object from the stock; the body is empty in this version. | 98 |
| `campaign_dealer.getStock(itemType)` | Returns a deep copy of the stock of a type (creates an empty list if absent). | 61 |
| `campaign_dealer.onDeserialized(data)` | Hook called after deserialization; only logs. *(internal)* *(hook)* | 108 |
| `campaign_dealer.onResumeCampaign(campaignInProgress, data)` | Campaign resume hook: replaces M.state with data. *(internal)* *(hook)* | 118 |
| `campaign_dealer.onSaveCampaign(saveCallback)` | Campaign save hook: calls saveCallback(M.__globalAlias__, copy of the state). *(internal)* *(hook)* | 113 |
| `campaign_dealer.onSerialize()` | Serialization hook: returns a deep copy of M.state. *(internal)* *(hook)* | 102 |
| `campaign_dealer.removeFromStock(itemType, valueObj)` | Removes from the stock the first entry whose model and config match (table value) or subtracts the quantity (number value). | 68 |

### Parameter details

#### `campaign_dealer.addToStock(itemType, valueObj)`

Adds an object (table, no duplicates according to existItem) or a quantity (number) to the stock of the given type. Creates the entry if needed.

- `itemType` (*string*) : Stock type (converted to uppercase).
- `valueObj` (*table|number*) : Object to add or quantity.

#### `campaign_dealer.buy(itemType, index)`

Intended to buy an object from the stock; the body is empty in this version.

- `itemType` (*string*) : Stock type.
- `index` (*integer*) : Position of the object (inferred from the name).

#### `campaign_dealer.getStock(itemType)`

Returns a deep copy of the stock of a type (creates an empty list if absent).

- `itemType` (*string*) : Stock type, as registered (uppercase).
- **returns**: table|number Copy of the stock.

#### `campaign_dealer.onDeserialized(data)`

Hook called after deserialization; only logs.

- `data` (*table*) : Deserialized data (not used).

#### `campaign_dealer.onResumeCampaign(campaignInProgress, data)`

Campaign resume hook: replaces M.state with data.

- `campaignInProgress` (*any*) : Current campaign (not used).
- `data` (*table*) : Saved state.

#### `campaign_dealer.onSaveCampaign(saveCallback)`

Campaign save hook: calls saveCallback(M.__globalAlias__, copy of the state).

- `saveCallback` (*function*) : Receives (module global alias, data).

#### `campaign_dealer.onSerialize()`

Serialization hook: returns a deep copy of M.state.

- **returns**: table Copy of the state.

#### `campaign_dealer.removeFromStock(itemType, valueObj)`

Removes from the stock the first entry whose model and config match (table value) or subtracts the quantity (number value).

- `itemType` (*string*) : Stock type (converted to uppercase).
- `valueObj` (*table|number*) : Object {model, config} to remove or quantity.

## Fields

| Field | Type | Description |
|---|---|---|
| `state` | table | Saved state: {stock = table<string, table\|number>}. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/campaign/dealer.lua`.*
