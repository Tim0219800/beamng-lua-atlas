# `editor_vehicleEditor_staticEditor_veJBeamBeautifier`

*File: `lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamBeautifier.lua` · VM: Game Engine (GE) · 443 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleEditor_staticEditor_veJBeamBeautifier`: `extensions.load("editor_vehicleEditor_staticEditor_veJBeamBeautifier")`, then the global `editor_vehicleEditor_staticEditor_veJBeamBeautifier`

"JBeam Beautifier" app of the Static Editor. It reformats .jbeam files (one file or a whole folder) by aligning in columns the arrays of the chosen sections (beams, nodes, quads, slots, slots2, triangles), with an option to align the header line and round numbers (0 to 5 decimals). It works on the file's AST (json-ast) and only changes whitespace and, if requested, the rounding.

## Example

```lua
extensions.load('editor_vehicleEditor_staticEditor_veJBeamBeautifier')
editor_vehicleEditor_staticEditor_veJBeamBeautifier.open()
```

## Notes

- WARNING: the .jbeam file is rewritten in place (writeFile(filePath, ...)) without a backup. The comparison test between data before/after (function test) is commented out in beautifyJBeamFile: no equivalence check is done.
- A file is rejected (log E) if it is not readable, if it does not decode with jsonDebug.decode, if it produces decoding warnings, or if its AST does not parse.
- Only array lines that fit on a single line are aligned; arrays spread over several lines are left as is.
- Default settings: nodes and triangles checked, the other sections unchecked; header alignment enabled; rounding disabled; 3 decimals.
- The "Beautify JBeam Files" button is disabled as long as the path is empty. The path field is filled by the "Select Folder to Beautify" (folder) and "Select File to Beautify" (file) buttons which open editor_fileDialog on /vehicles/. If the path is a file, only that file is processed; otherwise all *.jbeam in the folder, recursively (FS:findFiles).
- The result of the operation is written to the console ("Done!").

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleEditor_staticEditor_veJBeamBeautifier.onDeserialized(data)` | Hook called after a Lua reload: restores the window state. *(internal)* *(hook)* | 432 |
| `editor_vehicleEditor_staticEditor_veJBeamBeautifier.onSerialize()` | Hook called before a Lua reload: saves the window state. *(internal)* *(hook)* | 426 |
| `editor_vehicleEditor_staticEditor_veJBeamBeautifier.onUpdate()` | Extension hook called every frame: draws the window (sections to process, settings, folder/file selection, launch button) when it is open. *(internal)* *(hook)* | 361 |
| `editor_vehicleEditor_staticEditor_veJBeamBeautifier.open()` | Opens the app window (windowOpen[0] = true). | 422 |

### Parameter details

#### `editor_vehicleEditor_staticEditor_veJBeamBeautifier.onDeserialized(data)`

Hook called after a Lua reload: restores the window state.

- `data` (*table*) : table produced by onSerialize

#### `editor_vehicleEditor_staticEditor_veJBeamBeautifier.onSerialize()`

Hook called before a Lua reload: saves the window state.

- **returns**: table {windowOpen = boolean}

## Fields

| Field | Type | Description |
|---|---|---|
| `menuEntry` | string | Text of the Apps menu entry: "JBeam Beautifier". |

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamBeautifier.lua`.*
