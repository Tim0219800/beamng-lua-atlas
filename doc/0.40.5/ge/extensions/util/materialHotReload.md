# `util_materialHotReload`

*File: `lua/ge/extensions/util/materialHotReload.lua` · VM: Game Engine (GE) · 44 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_materialHotReload`: `extensions.load("util_materialHotReload")`, then the global `util_materialHotReload`

Hot reload of *.materials.json and *.material.json files: when one of them is modified on disk, the extension rereads it (loadJsonMaterialsFile, which updates the Material objects in memory) then calls reload() on each "Material" class material declared in the file. Useful to a material/texture creator to see changes without restarting the level.

## Example

```lua
extensions.load('util_materialHotReload')
```

## Notes

- The extension sets itself to the "manual" unload mode (setExtensionUnloadMode): it stays loaded across levels.
- Only "modified" events are handled; file creation or deletion is ignored.
- In onFileChanged, the parameter named type shadows the global function type(); this is not a problem in this function because it does not call it.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_materialHotReload.onFileChanged(filename, type)` | Hook called when a watched file changes on disk. If it is a modification of a materials file, reloads the file and the affected materials, then logs the number of materials reloaded. *(internal)* *(hook)* | 30 |
| `util_materialHotReload.onInit()` | Called at extension initialization: requests that it stay loaded across level or mode changes. *(internal)* *(hook)* | 36 |

### Parameter details

#### `util_materialHotReload.onFileChanged(filename, type)`

Hook called when a watched file changes on disk. If it is a modification of a materials file, reloads the file and the affected materials, then logs the number of materials reloaded.

- `filename` (*string*) : Path of the modified file
- `type` (*string*) : Change type; only "modified" is handled

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/materialHotReload.lua`.*
