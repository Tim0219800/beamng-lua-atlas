# `editor_vehicleEditor_staticEditor_vePartList`

*File: `lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartList.lua` · VM: Game Engine (GE) · 255 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleEditor_staticEditor_vePartList`: `extensions.load("editor_vehicleEditor_staticEditor_vePartList")`, then the global `editor_vehicleEditor_staticEditor_vePartList`

"Part List" window of the vehicle editor's Static Editor. It lists the available JBeam parts of the loaded vehicle (or only the active parts, "Active" checkbox), with columns Name, Filename and Last modified, sorting by column and text search (name or file). Clicking a row selects the part (vEditor.selectedPart) and opens the Part Tree and Part Text View windows; double-clicking a column copies the part name or the file name to the clipboard; right click opens the file's folder.

## Example

```lua
extensions.load('editor_vehicleEditor_staticEditor_vePartList')
editor_vehicleEditor_staticEditor_vePartList.open()
```

## Notes

- Uses jbeam/io: getAvailableParts(ioCtx) and getPart(ioCtx, partName), with vEditor.vehData.ioCtx and vEditor.vehData.vdata.activePartsData.
- When the list is built, the part whose slotType is 'main' becomes the selected part.
- The modification date (FS:stat(file).modtime) is displayed as relative text: "last minute", "last hour", "last 24h: date", "last week: date", then date only.
- The Filename and Last modified columns are hidden by default (TableColumnFlags_DefaultHide).
- The search is a case-sensitive substring search of the typed text against the lowercased name/file (partName:lower():find(text, 1, true)): input containing uppercase letters matches nothing.
- onSerialize/onDeserialized preserve vEditor.selectedPart across a Lua reload.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleEditor_staticEditor_vePartList.onDeserialized(data)` | Hook called after a Lua reload: restores vEditor.selectedPart. *(internal)* *(hook)* | 244 |
| `editor_vehicleEditor_staticEditor_vePartList.onEditorGui()` | Editor hook called every frame: builds the part list on the first pass (or after the Active filter changes), then draws the window, the sorted/filtered table and the context menu. Does nothing without a vehicle loaded in the editor. *(internal)* *(hook)* | 52 |
| `editor_vehicleEditor_staticEditor_vePartList.onEditorInitialized()` | Editor hook called at initialization: registers the window (500x400, vehicleEditor tool). *(internal)* *(hook)* | 233 |
| `editor_vehicleEditor_staticEditor_vePartList.onSerialize()` | Hook called before a Lua reload: saves the selected part. *(internal)* *(hook)* | 238 |
| `editor_vehicleEditor_staticEditor_vePartList.open()` | Shows the "Part List" window (editor.showWindow). | 229 |

### Parameter details

#### `editor_vehicleEditor_staticEditor_vePartList.onDeserialized(data)`

Hook called after a Lua reload: restores vEditor.selectedPart.

- `data` (*table*) : table produced by onSerialize

#### `editor_vehicleEditor_staticEditor_vePartList.onSerialize()`

Hook called before a Lua reload: saves the selected part.

- **returns**: table {selectedPart = string|nil}

## Fields

| Field | Type | Description |
|---|---|---|
| `menuEntry` | string | Apps menu entry text: "Part List". |

## Calls into the engine (C++)

- `FS:` `stat`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartList.lua`.*
