# `ui_liveries_saves`

*File: `lua/ge/extensions/ui/liveries/saves.lua` · VM: Game Engine (GE) · 186 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_liveries_saves`: `extensions.load("ui_liveries_saves")`, then the global `ui_liveries_saves`

Manages livery saves (dynamic decals editor) in settings/dynamicDecals/*.dynDecals.json. Allows listing, creating, renaming, deleting, saving and reloading a layer stack, and stores the name of the current save of the editing session. Relies on the editor_api_dynamicDecals extension for the actual serialization.

## Notes

- File names must match ^[a-zA-Z0-9_-]+$ (letters, digits, _ and -); otherwise save/create/load/rename return false with a warning in the log.
- Files are stored in settings/dynamicDecals/ with the extension .dynDecals.json.
- exists and delete do not call name validation: they directly test the built path.
- create and save return the file path (string) on success, and false on failure; load, rename and delete return a boolean.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_liveries_saves.clearCurrentSave()` | Forgets the current save and the staged skin (stagedApplySkinName). | 115 |
| `ui_liveries_saves.consumeStagedApplySkin()` | Returns the name of the skin staged by a save with applySkin and clears it (single read, intended for when the editor exits). | 120 |
| `ui_liveries_saves.create(filename)` | Writes the current layer stack to a new file via editor_api_dynamicDecals.saveLayerStackToFile. Does not check whether the file already exists and does not change the current save. | 52 |
| `ui_liveries_saves.delete(filename)` | Deletes the save file. If it was the current save, resets the session state via clearCurrentSave (the staged skin is no longer applied). | 90 |
| `ui_liveries_saves.exists(filename)` | Returns whether a save with this name exists in settings/dynamicDecals/. | 32 |
| `ui_liveries_saves.getAll()` | Lists all existing saves. Each entry contains name, location (path), created, modified and fileSize. | 36 |
| `ui_liveries_saves.getCurrentSaveName()` | Returns the name of the last save loaded or saved in this editing session. | 111 |
| `ui_liveries_saves.getFilename(file)` | Extracts the save name (without folder or .dynDecals.json extension) from a file path. | 19 |
| `ui_liveries_saves.load(filename)` | Loads a save into the editor via editor_api_dynamicDecals.loadLayerStackFromFile (called under pcall). Sets the current save and clears the staged skin. | 163 |
| `ui_liveries_saves.rename(filename, newFilename)` | Renames a save. Fails if the new name is invalid, the old file does not exist, the new name is already taken or the rename fails. Updates the current save name if it was this file. | 62 |
| `ui_liveries_saves.save(filename, applySkin)` | Saves the livery: refuses a name that is invalid or already taken by a save other than the current one, requires a player vehicle, writes the layer stack then exports the skin (exportSkin) under the same name. Then sets the current save and, if applySkin is true, stages the skin for when the editor exits. | 137 |

### Parameter details

#### `ui_liveries_saves.consumeStagedApplySkin()`

Returns the name of the skin staged by a save with applySkin and clears it (single read, intended for when the editor exits).

- **returns**: string|nil Name of the skin to apply, or nil.

#### `ui_liveries_saves.create(filename)`

Writes the current layer stack to a new file via editor_api_dynamicDecals.saveLayerStackToFile. Does not check whether the file already exists and does not change the current save.

- `filename` (*string*) : Name without extension (validated).
- **returns**: string|boolean Path of the written file, or false if the name is invalid.

#### `ui_liveries_saves.delete(filename)`

Deletes the save file. If it was the current save, resets the session state via clearCurrentSave (the staged skin is no longer applied).

- `filename` (*string*) : Name without extension.
- **returns**: boolean true if the file existed and was deleted.

#### `ui_liveries_saves.exists(filename)`

Returns whether a save with this name exists in settings/dynamicDecals/.

- `filename` (*string*) : Name without extension.
- **returns**: boolean true if the file exists.

#### `ui_liveries_saves.getAll()`

Lists all existing saves. Each entry contains name, location (path), created, modified and fileSize.

- **returns**: table[] Array of entries {name, location, created, modified, fileSize}.

#### `ui_liveries_saves.getCurrentSaveName()`

Returns the name of the last save loaded or saved in this editing session.

- **returns**: string|nil nil for a new unsaved livery.

#### `ui_liveries_saves.getFilename(file)`

Extracts the save name (without folder or .dynDecals.json extension) from a file path.

- `file` (*string*) : Full path of a save file.
- **returns**: string Name without extension.

#### `ui_liveries_saves.load(filename)`

Loads a save into the editor via editor_api_dynamicDecals.loadLayerStackFromFile (called under pcall). Sets the current save and clears the staged skin.

- `filename` (*string*) : Name without extension (validated).
- **returns**: boolean true if loading succeeded.

#### `ui_liveries_saves.rename(filename, newFilename)`

Renames a save. Fails if the new name is invalid, the old file does not exist, the new name is already taken or the rename fails. Updates the current save name if it was this file.

- `filename` (*string*) : Current name.
- `newFilename` (*string*) : New name (validated).
- **returns**: boolean true if the rename succeeded.

#### `ui_liveries_saves.save(filename, applySkin)`

Saves the livery: refuses a name that is invalid or already taken by a save other than the current one, requires a player vehicle, writes the layer stack then exports the skin (exportSkin) under the same name. Then sets the current save and, if applySkin is true, stages the skin for when the editor exits.

- `filename` (*string*) : Name without extension (validated).
- `applySkin` (*boolean|nil*) : If true, the exported skin will be applied when the editor exits (see consumeStagedApplySkin).
- **returns**: string|boolean Path of the written file, or false on failure (invalid name, duplicate, no vehicle).

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`, `removeFile`, `renameFile`, `stat`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/liveries/saves.lua`.*
