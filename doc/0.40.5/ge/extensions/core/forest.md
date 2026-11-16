# `core_forest`

*File: `lua/ge/extensions/core/forest.lua` · VM: Game Engine (GE) · 25 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_forest`: `extensions.load("core_forest")`, then the global `core_forest`

GE extension `core_forest`: provides cached access to the scene's `Forest` object (the level's instanced forest/vegetation). A modder uses it to get this object without searching the scene again.

## Example

```lua
local forest = core_forest.getForestObject()
if forest then print(forest:getId()) end
```

## Notes

- The id of the first object of class Forest found is stored in forestId; if the object is deleted, a new search is done at the next call. Only the first Forest in the scene is used.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_forest.getForestObject()` | Returns the scene's Forest object (first of class 'Forest'), with its id cached. | 9 |

### Parameter details

#### `core_forest.getForestObject()`

Returns the scene's Forest object (first of class 'Forest'), with its id cached.

- **returns**: userdata|nil Forest object, nil if there is none in the level.

## Calls into the engine (C++)

- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/forest.lua`.*
