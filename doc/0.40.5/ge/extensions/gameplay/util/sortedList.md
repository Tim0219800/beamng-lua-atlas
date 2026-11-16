# `gameplay_util_sortedList`

*File: `lua/ge/extensions/gameplay/util/sortedList.lua` · VM: Game Engine (GE) · 113 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/util/sortedList")` (file under extensions/ but not a regular extension)

List of objects ordered by `sortOrder`, with an index by id (objects) and by name (byName). It builds objects through a provided constructor, and handles sorting, moving, serialization and debug drawing. The module returns a list constructor; it is used for gameplay editor collections (sites, zones, etc.).

## Example

```lua
local liste = require("gameplay/util/sortedList")("zones", parent, function(parent, name, forceId) return maClasse(parent, name, forceId) end)
local obj = liste:create("zone1")
liste:buildNamesDir()
```

## Notes

- Created objects must have id, name, sortOrder, drawDebug(), onSerialize() and onDeserialized().
- objects has a metatable: reading a nonexistent id returns {name = "Missing!", missing = true, id = -1} instead of nil.
- byName is only updated by buildNamesDir(); in case of duplicate names, the first sorted object wins.
- create() forces obj.isProcedural = false; only non-procedural objects are serialized.
- In onDeserialized, old ids are recorded in oldIdMap[oldId] = new id.
- The postClear, postRemove and postCreate hooks default to nop and can be replaced on the instance.

## Class `C`

Ordered list. Fields: name, parent, objectConstructor, objects (id -> object), sorted (sorted array), byName.

The module returns a constructor: `local obj = require("gameplay_util_sortedList")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:buildNamesDir()` | Rebuilds the byName index. | 74 |
| `C:clear()` | Clears the list (objects, sorted, byName) then calls postClear. | 22 |
| `C:create(name, forceId, skipSort)` | Creates an element via objectConstructor, registers it and re-sorts (unless skipSort), then calls postCreate. | 32 |
| `C:drawDebug(drawMode)` | Calls drawDebug(drawMode) on each element. | 83 |
| `C:init(name, parent, objectConstructor)` | Creates the (empty) list. | 10 |
| `C:move(id, dir)` | Swaps an element's position with its neighbor in the given direction. | 63 |
| `C:onDeserialized(data, oldIdMap)` | Clears the list and recreates the elements from the data. | 98 |
| `C:onSerialize(parent)` | Returns the list of serialized non-procedural elements, in order. | 89 |
| `C:remove(obj)` | Removes an element (object or id), re-sorts then calls postRemove. | 43 |
| `C:sort()` | Rebuilds sorted according to sortOrder and renumbers sortOrder from 1 to N. | 52 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/util/sortedList.lua`.*
