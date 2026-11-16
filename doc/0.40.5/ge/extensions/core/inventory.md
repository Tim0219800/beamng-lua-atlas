# `core_inventory`

*File: `lua/ge/extensions/core/inventory.lua` · VM: Game Engine (GE) · 216 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_inventory`: `extensions.load("core_inventory")`, then the global `core_inventory`

GE extension `core_inventory`: simple inventory for the campaign/scenarios. Stores per type (UPPERCASE key) either a numeric counter (money) or a list of objects (vehicles, parts). Provides functions to add, remove and read items, and interprets the `onEvent` blocks of the campaign files (rewards or losses depending on the medal earned).

## Example

```lua
core_inventory.addItem('$$$_MONEY', 200)
core_inventory.addItem('$$$_VEHICLE', {model='etk800', config='etk800_m', color='1 1 1 1'})
print(core_inventory.getItem('$$$_MONEY'))      -- 200 (the key must be uppercase)
local liste = core_inventory.getItemList('$$$_VEHICLE')
```

## Notes

- Types are converted to UPPERCASE by addItem/removeItem, but NOT by getItem/getItemList: you must pass the type in uppercase (e.g. '$$$_MONEY') to read what you added.
- A type containing numbers is a counter (addItem adds, removeItem subtracts, no lower limit); with a table, the type becomes a list. The first addition sets the nature of the type.
- Duplicates: addItem of a table adds nothing if an existing element has ALL its fields equal to the corresponding fields of the new value (key-by-key comparison starting from the existing element). removeItem of a table deletes the first element whose model and config equal those of valueObj (the other fields are ignored).
- processOnEvent: keys of an onEvent block: 'remove' (removes) or any other key (adds); the key is prefixed with '$$$_' and uppercased. In 'remove', the sub-keys 'gold'/'silver'/'bronze' are only applied if they equal earnedMedal; the other sub-keys are removed unconditionally.
- Inconsistency: onSerialize returns a copy of itemsTable but onDeserialized is empty; after an extensions reload the inventory is therefore not restored by this mechanism (only onResumeCampaign reloads it). existItem returns nil (not false) for an empty list; getItem returns the last element found if several have the same itemId.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_inventory.addItem(itemType, valueObj)` | Adds to the inventory: sum of a number or insertion of an object (without duplicates). Ignored if itemType or valueObj is nil/false. | 29 |
| `core_inventory.getItem(itemType, itemId)` | Reads a type. For a counter returns its value (0 if absent); for a list returns a copy of the element whose itemId equals itemId. | 85 |
| `core_inventory.getItemList(itemType)` | Deep copy of a type's list; creates an empty list for this type if absent (side effect). | 101 |
| `core_inventory.onDeserialized(data)` | Restore hook: does nothing (see notes). *(internal)* *(hook)* | 196 |
| `core_inventory.onResumeCampaign(campaignInProgress, data)` | Campaign resume hook: replaces itemsTable with the saved data. *(internal)* *(hook)* | 185 |
| `core_inventory.onSaveCampaign(saveCallback)` | Campaign save hook: calls saveCallback(extension alias, copy of itemsTable). *(internal)* *(hook)* | 180 |
| `core_inventory.onSerialize()` | Serialization hook before extensions reload: returns a copy of itemsTable. *(internal)* *(hook)* | 190 |
| `core_inventory.processOnEvent(onEventData, earnedMedal)` | Applies a campaign 'onEvent' block: direct 'add' keys (type -> value or list) and 'remove' block (by medal or unconditional). | 129 |
| `core_inventory.removeItem(itemType, valueObj)` | Removes from the inventory: subtracts a number or deletes the object whose model and config match. | 58 |

### Parameter details

#### `core_inventory.addItem(itemType, valueObj)`

Adds to the inventory: sum of a number or insertion of an object (without duplicates). Ignored if itemType or valueObj is nil/false.

- `itemType` (*string*) : Object type (converted to uppercase), by convention prefixed '$$$_'.
- `valueObj` (*number|table*) : Quantity to add, or object (e.g. {model, config, color}).

#### `core_inventory.getItem(itemType, itemId)`

Reads a type. For a counter returns its value (0 if absent); for a list returns a copy of the element whose itemId equals itemId.

- `itemType` (*string*) : Exact type (already in uppercase).
- `itemId` (*any*) : Value of the itemId field searched for (list only).
- **returns**: number|table|nil Quantity, copy of the element, or nil if not found in a list.

#### `core_inventory.getItemList(itemType)`

Deep copy of a type's list; creates an empty list for this type if absent (side effect).

- `itemType` (*string*) : Exact type (already in uppercase).
- **returns**: table Copy of the list (or of the numeric counter if it is a number).

#### `core_inventory.onDeserialized(data)`

Restore hook: does nothing (see notes).

- `data` (*table*) : Data from onSerialize (unused).

#### `core_inventory.onResumeCampaign(campaignInProgress, data)`

Campaign resume hook: replaces itemsTable with the saved data.

- `campaignInProgress` (*any*) : Current campaign (not used).
- `data` (*table*) : Saved data.

#### `core_inventory.onSaveCampaign(saveCallback)`

Campaign save hook: calls saveCallback(extension alias, copy of itemsTable).

- `saveCallback` (*function*) : Function (extensionName, data).

#### `core_inventory.onSerialize()`

Serialization hook before extensions reload: returns a copy of itemsTable.

- **returns**: table Inventory.

#### `core_inventory.processOnEvent(onEventData, earnedMedal)`

Applies a campaign 'onEvent' block: direct 'add' keys (type -> value or list) and 'remove' block (by medal or unconditional).

- `onEventData` (*table|nil*) : onEvent block; nil = nothing.
- `earnedMedal` (*string|nil*) : 'bronze', 'silver' or 'gold': selects the sub-block of 'remove'.

#### `core_inventory.removeItem(itemType, valueObj)`

Removes from the inventory: subtracts a number or deletes the object whose model and config match.

- `itemType` (*string*) : Object type (converted to uppercase).
- `valueObj` (*number|table*) : Quantity to remove, or object with model and config.

## Fields

| Field | Type | Description |
|---|---|---|
| `itemsTable` | table<string, number|table[]> | Inventory: type (UPPERCASE) -> counter or list of objects. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/inventory.lua`.*
