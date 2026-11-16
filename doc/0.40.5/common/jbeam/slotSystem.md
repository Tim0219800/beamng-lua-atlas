# `jbeam_slotSystem`

*File: `lua/common/jbeam/slotSystem.lua` · VM: Common (GE + vehicle) · 527 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/slotSystem")`

jbeam slot system: from the vehicle configuration (chosen parts), it recursively walks the slots (slots / slots2 sections) of the main part, picks for each slot the user's part, otherwise the slot's default part, checks type compatibility (slotType) and builds the tree of chosen parts, the state tables and a merge 'journal'. unifyPartJournal replays this journal to merge all parts into a single vehicle (unifyParts). Used by the jbeam loader; a modder does not normally call it, but its rules describe how parts fit together.

## Example

```lua
local slotSystem = require('jbeam/slotSystem')
local rootPart, unifyJournal, unifyJournalC, chosenPartsTree, slotPartMap, activePartsData, activeParts = slotSystem.findParts(ioCtx, vehicleConfig)
slotSystem.unifyPartJournal(ioCtx, unifyJournal)
```

## Notes

- User part configuration: either vehicleConfig.parts (flat table slotId or slot path -> part name, 'none' = empty slot), or vehicleConfig.partsTree (tree {children = {slotId = {chosenPartName, children}}}). Value '' = deliberately empty slot (decisionMethod 'user-empty').
- Decision for each slot (decisionMethod): 'user' (requested part, if it exists and fits), 'default' (slot.default, 'default-empty' if default == ''), otherwise the slot is left empty with an error message if a requested part cannot be found. A part of incompatible type is rejected with an error and replaced by the default value.
- Slot identifier: slotDef.name or slotDef.type; slot path: '/<slot>/<sub-slot>/...'; part path: slot path + part name. slotDef.maxRecursion limits the number of occurrences of the same slotId in the chain; beyond 50 levels of recursion the code logs an error (probable cycle).
- The slot options (everything except name, type, allowTypes, denyTypes, default, description, maxRecursion) are inherited by the child part's sections: unifyParts inserts them as an options row (with partOrigin = part name, partPath) before the part's rows, then a reset row (values '') after. variables is removed from the options (handled by jbeam/variables) and coreSlot is cleared.
- Merge (unifyParts, local): the slots, slots2 and information sections are not merged; tabular sections are appended end to end; for dictionary sections, a key starting with '$' followed by an operator and a number ('$+name', '$*name', '$<name' = min, '$>name' = max) combines the numeric value with the existing one; other values overwrite (except slotType and partName).
- Probable BUG (slots version 1): in partFitsSlot, when part.slotType is a table, the condition is `not tableContains(part.slotType, slot.type)`: it returns true if the type is NOT contained and falls through to 'Part type does not match' otherwise, i.e. inverted relative to the intent.
- Probable BUG (slots2): when part.slotType is a table and slot.denyTypes is nil, tableContains(slot.denyTypes, ...) is called with nil (behavior depends on tableContains).
- findParts returns seven values; without a main part (vehicleConfig.mainPartName not found) or without an available slots table, it logs an error and returns nil.

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_slotSystem.findParts(ioCtx, vehicleConfig)` | Recursively chooses the parts of all slots starting from the main part vehicleConfig.mainPartName. Returns the root part, the merge journal (parts in child-before-parent order), the 'C' merge journal (parent-before-child order), the tree of chosen parts, the slot->part table, the active parts data (deep copy) and the part path -> name table. *(internal)* | 441 |
| `jbeam_slotSystem.partFitsSlot(part, slot)` | Determines whether a part can go in a slot. Version 1: compares part.slotType (string or array) to slot.type. Version 2: slot.allowTypes (whitelist) and slot.denyTypes (blacklist), part.slotType string or array. Returns a boolean and an optional error message. | 182 |
| `jbeam_slotSystem.unifyPartJournal(ioCtx, unifyJournal)` | Replays the merge journal: for each entry calls unifyParts(parent, child, level, slotOptions, path) to merge the sections of each child part into its parent part, until a single root part remains. ioCtx is not used. *(internal)* | 513 |

### Parameter details

#### `jbeam_slotSystem.findParts(ioCtx, vehicleConfig)`

Recursively chooses the parts of all slots starting from the main part vehicleConfig.mainPartName. Returns the root part, the merge journal (parts in child-before-parent order), the 'C' merge journal (parent-before-child order), the tree of chosen parts, the slot->part table, the active parts data (deep copy) and the part path -> name table.

- `ioCtx` (*table*) : context of the jbeam/io module (access to parts and slots)
- `vehicleConfig` (*table*) : vehicle configuration: mainPartName, mainPartPath, parts or partsTree
- **returns**: table|nil rootPart (main part)
- **returns**: table unifyJournal: list {partParent, partChild, level, slotOptions, partPath, slotDef}
- **returns**: table unifyJournalC
- **returns**: table chosenPartsTree (tree: id, path, suitablePartNames, unsuitablePartNames, chosenPartName, partPath, children, decisionMethod)
- **returns**: table<string, string> slotPartMap: slot path -> part name ('' = empty)
- **returns**: table<string, table> activePartsData: part name -> data
- **returns**: table<string, string> activeParts: part path -> name

#### `jbeam_slotSystem.partFitsSlot(part, slot)`

Determines whether a part can go in a slot. Version 1: compares part.slotType (string or array) to slot.type. Version 2: slot.allowTypes (whitelist) and slot.denyTypes (blacklist), part.slotType string or array. Returns a boolean and an optional error message.

- `part` (*table*) : jbeam part (slotType field: string or list of strings)
- `slot` (*table*) : slot definition (type for v1, allowTypes / denyTypes for v2)
- **returns**: boolean the part fits
- **returns**: string|nil reason for rejection ('Part type does not match slot type', 'Part type not in allowed types', 'No matching allowed types found', 'Part type is in deny list', 'Invalid slot configuration')

#### `jbeam_slotSystem.unifyPartJournal(ioCtx, unifyJournal)`

Replays the merge journal: for each entry calls unifyParts(parent, child, level, slotOptions, path) to merge the sections of each child part into its parent part, until a single root part remains. ioCtx is not used.

- `ioCtx` (*table*) : io context (not used)
- `unifyJournal` (*table[]*) : journal returned by findParts (second result)
- **returns**: boolean always true

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/slotSystem.lua`.*
