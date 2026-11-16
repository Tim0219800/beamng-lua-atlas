# `editor_dynamicDecals_loadSave`

*File: `lua/ge/extensions/editor/dynamicDecals/loadSave.lua` · VM: Game Engine (GE) · 153 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecals_loadSave`: `extensions.load("editor_dynamicDecals_loadSave")`, then the global `editor_dynamicDecals_loadSave`

"Load/Save" section of the Dynamic Decals tool. Lets you save the layer stack to a `.dyndecals.json` project file ("Save as..." / "Save") and load one ("Load from file") in Overwrite (replace) or Append (add) mode. The default folder is /art/dynamicDecals/projects/. The last used path is kept across extension reloads (onSerialize / onDeserialized).

## Notes

- After a load, if res.status.code ~= 0, the response is displayed with dump() and a "Baking Issues" warning-level notification is added.
- The "Save" button is disabled as long as the current path has no extension (i.e. remains the default folder).
- Typo in the exported name: getCurrentPorjectFilePath ("Porject").
- The loading modes come from api.loadingModes (field `key`); loadingMode is 0 (Overwrite) or 1 (Append).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecals_loadSave.editorPreferenceValueChanged(path, value)` | Hook called when a preference changes. Does nothing here. *(internal)* | 88 |
| `editor_dynamicDecals_loadSave.getCurrentPorjectFilePath()` | Returns the path of the last project file used (or the default folder). | 145 |
| `editor_dynamicDecals_loadSave.loadFileDialog()` | Opens the file dialog (filter .dyndecals.json) then calls api.loadLayerStackFromFile(path, mode) and stores the path. | 22 |
| `editor_dynamicDecals_loadSave.onDeserialized(data)` | Hook called after reload with the data from onSerialize; restores lastProjectFilePath (default: projects folder). *(internal)* *(hook)* | 141 |
| `editor_dynamicDecals_loadSave.onSerialize()` | Extension reload hook: returns {lastProjectFilePath} to keep. *(internal)* *(hook)* | 135 |
| `editor_dynamicDecals_loadSave.registerEditorPreferences(prefsRegistry)` | Declares no preference (body commented out). *(internal)* | 82 |
| `editor_dynamicDecals_loadSave.saveAsFileDialog()` | Opens the "Save as" dialog (overwrite confirmation) then calls api.saveLayerStackToFile and stores the path. | 39 |
| `editor_dynamicDecals_loadSave.setup(tool_in)` | Called by the tool: gets API, notification and docs, prepares the list of loading modes, registers the "Load/Save" section (order 20) and the "Save & Load" documentation page. *(internal)* | 117 |

### Parameter details

#### `editor_dynamicDecals_loadSave.editorPreferenceValueChanged(path, value)`

Hook called when a preference changes. Does nothing here.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_dynamicDecals_loadSave.getCurrentPorjectFilePath()`

Returns the path of the last project file used (or the default folder).

- **returns**: string Project path.

#### `editor_dynamicDecals_loadSave.onDeserialized(data)`

Hook called after reload with the data from onSerialize; restores lastProjectFilePath (default: projects folder).

- `data` (*table*) : Table returned by onSerialize.

#### `editor_dynamicDecals_loadSave.onSerialize()`

Extension reload hook: returns {lastProjectFilePath} to keep.

- **returns**: table Data to restore.

#### `editor_dynamicDecals_loadSave.registerEditorPreferences(prefsRegistry)`

Declares no preference (body commented out).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_dynamicDecals_loadSave.setup(tool_in)`

Called by the tool: gets API, notification and docs, prepares the list of loading modes, registers the "Load/Save" section (order 20) and the "Save & Load" documentation page.

- `tool_in` (*table*) : Reference to the editor_dynamicDecalsTool tool.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecals/loadSave.lua`.*
