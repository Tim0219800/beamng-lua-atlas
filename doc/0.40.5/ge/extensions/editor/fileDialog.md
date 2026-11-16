# `editor_fileDialog`

*File: `lua/ge/extensions/editor/fileDialog.lua` · VM: Game Engine (GE) · 980 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_fileDialog`: `extensions.load("editor_fileDialog")`, then the global `editor_fileDialog`

Editor ImGui file dialog (open / save a file or choose a folder) on the game's virtual file system (FS). It offers navigation, recent folders, favorites, column sorting, search, file type filters, image preview (jpg, jpeg, png, dds), folder creation and overwrite confirmation. An editor tool modder calls it via openFile / saveFile with a callback.

## Example

```lua
extensions.load("editor_fileDialog")
editor_fileDialog.openFile(function(data)
  print(data.filepath)
end, {{"Any files", "*"}, {"JSON", ".json"}}, false, "/art/", false)
```

## Notes

- Only one dialog at a time: if the window is already visible, openFile/saveFile return false (error logged). The callback must be a function, otherwise false.
- An empty or nil defaultPath is replaced by "/" with a warning.
- filenameSuffix is a list of {label, pattern} pairs; the pattern is a string (e.g. ".json", "*") or a table of extensions. If the first filter is "*" and there are several, the second is selected by default.
- The callback receives a table {path, action ("Open"/"Save"), filename, filepath, filetype}; it is called via pcall (an error in the callback is caught).
- Saved preferences: files.fileDialog.maxFilePreviewSize (128-1024), gridLines, favourites, columns.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_fileDialog.onEditorActivated()` | Editor activation hook; empty. *(internal)* *(hook)* | 918 |
| `editor_fileDialog.onEditorDeactivated()` | Editor deactivation hook; empty. *(internal)* *(hook)* | 921 |
| `editor_fileDialog.onEditorGui()` | Hook called every editor GUI frame: draws the "fileDialog" window if it is visible (hides it if no file cache exists), plus the smart search window. *(internal)* *(hook)* | 409 |
| `editor_fileDialog.onEditorInitialized()` | Hook called at editor initialization: registers the windows (fileDialog 640x480, recentDirsWindow, smartSearchItems), the image icons, restores column visibility and hides the window. *(internal)* *(hook)* | 924 |
| `editor_fileDialog.onEditorRegisterPreferences(prefsRegistry)` | Hook called to declare the preferences of the "files / fileDialog" category. *(internal)* *(hook)* | 956 |
| `editor_fileDialog.onExtensionLoaded()` | Extension load hook; empty. *(internal)* *(hook)* | 915 |
| `editor_fileDialog.openFile(callbackFn, filenameSuffix, selectFolder, defaultPath, preview, caseSensitivePattern)` | Opens the dialog in "Open" mode. Calls callbackFn with the information of the chosen file (or folder). | 907 |
| `editor_fileDialog.saveFile(callbackFn, filenameSuffix, selectFolder, defaultPath, overwriteDialogText)` | Opens the dialog in "Save" mode (no preview). Appends the extension of the chosen filter to the typed name if missing and asks for confirmation on overwrite. | 911 |

### Parameter details

#### `editor_fileDialog.onEditorRegisterPreferences(prefsRegistry)`

Hook called to declare the preferences of the "files / fileDialog" category.

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_fileDialog.openFile(callbackFn, filenameSuffix, selectFolder, defaultPath, preview, caseSensitivePattern)`

Opens the dialog in "Open" mode. Calls callbackFn with the information of the chosen file (or folder).

- `callbackFn` (*function*) : function(data); data = {path, action, filename, filepath, filetype}.
- `filenameSuffix` (*table|nil*) : Filters {{label, pattern}, ...}; default {{"Any files", "*"}}. Ignored if selectFolder.
- `selectFolder` (*boolean|nil*) : true to choose a folder.
- `defaultPath` (*string|nil*) : Starting folder (default "/").
- `preview` (*boolean|nil*) : Show a file preview.
- `caseSensitivePattern` (*boolean|nil*) : Case-sensitive pattern filter.
- **returns**: boolean true if the dialog opens, false if already open or invalid callback.

#### `editor_fileDialog.saveFile(callbackFn, filenameSuffix, selectFolder, defaultPath, overwriteDialogText)`

Opens the dialog in "Save" mode (no preview). Appends the extension of the chosen filter to the typed name if missing and asks for confirmation on overwrite.

- `callbackFn` (*function*) : function(data), same format as openFile.
- `filenameSuffix` (*table|nil*) : Filters {{label, pattern}, ...}.
- `selectFolder` (*boolean|nil*) : true to choose a folder.
- `defaultPath` (*string|nil*) : Starting folder.
- `overwriteDialogText` (*string|nil*) : Overwrite confirmation text (default: "Are you sure you want to overwrite this file").
- **returns**: boolean true if the dialog opens.

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `findFiles`, `stat`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/fileDialog.lua`.*
