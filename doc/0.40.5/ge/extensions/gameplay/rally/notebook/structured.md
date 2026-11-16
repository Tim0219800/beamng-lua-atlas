# `gameplay_rally_notebook_structured`

*File: `lua/ge/extensions/gameplay/rally/notebook/structured.lua` · VM: Game Engine (GE) · 378 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/notebook/structured")` (file under extensions/ but not a regular extension)

"Structured" storage of a rally pacenote in six fixed slots (string keys "1" to "6", which are also the reading order): 1 = caution, 2 and 3 = modifiers before the corner, 4 = corner, 5 and 6 = modifiers after. An empty slot is {}. Each item is a typed table { type = ..., ... }; the active style provides the labels. The module also migrates the old v1 (list) and v2 (4 slots) schemas on deserialization. The module returns an object constructor (class C) and exposes M.* helpers that accept an object or a raw table.

## Example

```lua
local Structured = require('extensions/gameplay/rally/notebook/structured')
local s = Structured()
s:setOrderedItems({ {type='caution', level=2}, {type='corner', descriptor='hairpin'} })
print(s:slotItem(4).descriptor) -- 'hairpin'
```

## Notes

- Current schema: 3 (six slots). Items beyond the six slots: ignored with a 'W' log (tag rallyStructured).
- Canonical corner: descriptor, shape, measurementType (omitted if 'single'; only single/split2/split3 are valid), riskIntensity (-1, 1 or nil), lengthMode ('shorter'|'longer'|'skip'|nil). The old fields lengthFeel, radiusChange, intensityVariation are migrated (intensityVariation -1 -> shape 'opens', 1 -> 'tightens').
- setOrderedItems distributes: caution -> slot 1, corner -> slot 4, modifiers -> 2/3 before the corner, 5/6 after.
- Item types other than caution/corner are atomic modifiers copied as is (deepcopy).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_notebook_structured.orderedItems(structured)` | Utility version: returns the ordered list of non-empty items of a structured object or a raw table (also handles the old v2 schemas). (dynamically assigned) | dyn |
| `gameplay_rally_notebook_structured.setOrderedItems(structured, items)` | Utility version: replaces the content with an ordered list of items, distributed into the slots. Calls the instance method if it exists, otherwise writes items and schemaVersion into the table. (dynamically assigned) | dyn |
| `gameplay_rally_notebook_structured.slotItem(structured, index)` | Utility version: returns the item of a slot, or nil if it is empty. (dynamically assigned) | dyn |
| `gameplay_rally_notebook_structured.slotItems(structured)` | Utility version: returns the normalized table of the six slots (keys "1".."6"), migrating v1/v2 schemas if needed. (dynamically assigned) | dyn |

### Parameter details

#### `gameplay_rally_notebook_structured.orderedItems(structured)`

Utility version: returns the ordered list of non-empty items of a structured object or a raw table (also handles the old v2 schemas). (dynamically assigned)

- `structured` (*table*) : Structured object or raw table (with or without an items field).
- **returns**: table[] Items in slot order; {} if the argument is not a table.

#### `gameplay_rally_notebook_structured.setOrderedItems(structured, items)`

Utility version: replaces the content with an ordered list of items, distributed into the slots. Calls the instance method if it exists, otherwise writes items and schemaVersion into the table. (dynamically assigned)

- `structured` (*table*) : Structured object or raw table (modified in place).
- `items` (*table[]*) : Typed items.

#### `gameplay_rally_notebook_structured.slotItem(structured, index)`

Utility version: returns the item of a slot, or nil if it is empty. (dynamically assigned)

- `structured` (*table*) : Structured object or raw table.
- `index` (*integer*) : Slot number from 1 to 6.
- **returns**: table|nil Item { type = ... } or nil.

#### `gameplay_rally_notebook_structured.slotItems(structured)`

Utility version: returns the normalized table of the six slots (keys "1".."6"), migrating v1/v2 schemas if needed. (dynamically assigned)

- `structured` (*table*) : Structured object or raw table.
- **returns**: table<string, table> Slot map; empty slots = {}.

## Class `C`

Object returned by Structured(): fields schemaVersion and items (map of the six slots).

| Method | Description | Line |
|---|---|---|
| `C:hasItems()` | true if at least one slot is filled. | 311 |
| `C:init()` | Constructor: current schema, six empty slots. | 248 |
| `C:itemCount()` | Number of non-empty items. | 307 |
| `C:onDeserialized(data)` | Reloads from saved data (data.items, data.schemaVersion), migrating the v1 (ordered list) and v2 (four slots) schemas to schema v3. | 253 |
| `C:onSerialize()` | Returns { schemaVersion, items } where items is the normalized map of the six slots. | 274 |
| `C:orderedItems()` | List of non-empty items in the order of slots 1 to 6. | 281 |
| `C:setOrderedItems(items)` | Replaces the content from an ordered list (caution -> 1, corner -> 4, modifiers -> 2/3 before or 5/6 after the corner). Surplus items are ignored with a warning. | 297 |
| `C:setSlotItems(items)` | Replaces the content from a slot map (keys "1".."6" or integers). | 302 |
| `C:slotItem(index)` | Item of a slot, or nil if it is empty. | 289 |
| `C:slotItems()` | Normalized copy of the map of the six slots. | 285 |

## Class `M`

Module table: helpers orderedItems, slotItems, slotItem, setOrderedItems (see functions). Calling the module as a function creates an instance of C.

| Method | Description | Line |
|---|---|---|
| `M.orderedItems(structured)` |  | 315 |
| `M.setOrderedItems(structured, items)` |  | 359 |
| `M.slotItem(structured, index)` |  | 342 |
| `M.slotItems(structured)` |  | 327 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/notebook/structured.lua`.*
