# `editor_toolUtilities_foliagePicker`

*File: `lua/ge/extensions/editor/toolUtilities/foliagePicker.lua` · VM: Game Engine (GE) · 150 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_foliagePicker`: `extensions.load("editor_toolUtilities_foliagePicker")`, then the global `editor_toolUtilities_foliagePicker`

Shared imgui species picker (level ForestItemData) for the editor's vegetation tools. Displays a checkbox list with a weight slider per checked species, plus buttons (check all, uncheck all, rescan). It reads and writes the tables target.species and target.speciesWeights.

## Example

```lua
local picker = require('editor/toolUtilities/foliagePicker')
-- in a tool's imgui drawing:
picker.draw(zone, {id = 'ts', onBeginEdit = snap, onCommit = commit, onChange = markDirty})
```

## Notes

- The species list is cached and shared between tools; it is scanned on first use (empty list = rescan) via foliageScatter.listForestItemData.
- If no species is checked, the interface shows that nothing will be planted.
- The opts.height option is documented as being 150 by default, but the code uses the constant LIST_H = 180.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_foliagePicker.draw(target, opts)` | Draws the picker for the target: checkbox list, weight sliders (0 to 1) and check all / uncheck all / rescan buttons. To be called every frame from a tool's imgui code. | 53 |
| `editor_toolUtilities_foliagePicker.getList()` | Returns the cached species list, scanning it if it is empty. | 32 |
| `editor_toolUtilities_foliagePicker.refresh()` | Rescans the level's ForestItemData and fills the shared cache. | 26 |
| `editor_toolUtilities_foliagePicker.setTicked(target, nm, on)` | Checks a species (with the default weight 1.0 if it has none) or unchecks it. | 38 |

### Parameter details

#### `editor_toolUtilities_foliagePicker.draw(target, opts)`

Draws the picker for the target: checkbox list, weight sliders (0 to 1) and check all / uncheck all / rescan buttons. To be called every frame from a tool's imgui code.

- `target` (*table*) : Target with the .species and .speciesWeights tables.
- `opts` (*table*) : id (required, unique imgui id suffix), height (px), onBeginEdit() -> undo token, onCommit(label, token) for the history, onChange() to mark the state as modified.

#### `editor_toolUtilities_foliagePicker.getList()`

Returns the cached species list, scanning it if it is empty.

- **returns**: string[] Names of the level's ForestItemData.

#### `editor_toolUtilities_foliagePicker.refresh()`

Rescans the level's ForestItemData and fills the shared cache.

- **returns**: string[] List of species names.

#### `editor_toolUtilities_foliagePicker.setTicked(target, nm, on)`

Checks a species (with the default weight 1.0 if it has none) or unchecks it.

- `target` (*table*) : Target with the species and speciesWeights tables.
- `nm` (*string*) : Species name.
- `on` (*boolean*) : true to check, false to uncheck.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/foliagePicker.lua`.*
