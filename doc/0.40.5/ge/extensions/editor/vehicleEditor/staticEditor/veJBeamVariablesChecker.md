# `editor_vehicleEditor_staticEditor_veJBeamVariablesChecker`

*File: `lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamVariablesChecker.lua` · VM: Game Engine (GE) · 138 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleEditor_staticEditor_veJBeamVariablesChecker`: `extensions.load("editor_vehicleEditor_staticEditor_veJBeamVariablesChecker")`, then the global `editor_vehicleEditor_staticEditor_veJBeamVariablesChecker`

"JBeam Variables Checker" app of the Static Editor. The "Start Analysis" button walks through all the vehicle folders, reads their .pc (configuration) and .jbeam files, and checks that the variable values (defaults in the JBeam and values imposed by the .pc) respect the variable's min/max bounds. Out-of-range values are reported in the console with a warning (log W) indicating where the variable and the value are defined.

## Example

```lua
extensions.load('editor_vehicleEditor_staticEditor_veJBeamVariablesChecker')
editor_vehicleEditor_staticEditor_veJBeamVariablesChecker.open()
```

## Notes

- The results only go to the console; the interface only displays "Results get printed to the console.". The analysis prints "Done!" at the end.
- The .pc files are converted with extensions.core_vehicle_partmgmt.buildConfigFromString(vehDir, pcFilePath), then vehConfig.vars (variable to value) is grouped by variable.
- A part's variables table is normalized with jbeam/tableSchema (process(partData, false, true)) before reading partData.variables.
- The bounds are reordered with min/max and the value is clamped on the copy vv (the out-of-range value is only reported, not fixed on disk).
- If a .jbeam is not valid JSON, parseFile returns nil and analyzeJBeamFile(nil) would cause an error (pairs(nil)): no safeguard in the code.
- The code contains an unused ::continue:: label before im.End().

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleEditor_staticEditor_veJBeamVariablesChecker.onDeserialized(data)` | Hook called after a Lua reload: restores the window state. *(internal)* *(hook)* | 127 |
| `editor_vehicleEditor_staticEditor_veJBeamVariablesChecker.onSerialize()` | Hook called before a Lua reload: saves the window state. *(internal)* *(hook)* | 121 |
| `editor_vehicleEditor_staticEditor_veJBeamVariablesChecker.onUpdate()` | Extension hook called every frame: draws the window with the "Start Analysis" button when it is open. *(internal)* *(hook)* | 102 |
| `editor_vehicleEditor_staticEditor_veJBeamVariablesChecker.open()` | Opens the app window (windowOpen[0] = true). | 117 |

### Parameter details

#### `editor_vehicleEditor_staticEditor_veJBeamVariablesChecker.onDeserialized(data)`

Hook called after a Lua reload: restores the window state.

- `data` (*table*) : table produced by onSerialize

#### `editor_vehicleEditor_staticEditor_veJBeamVariablesChecker.onSerialize()`

Hook called before a Lua reload: saves the window state.

- **returns**: table {windowOpen = boolean}

## Fields

| Field | Type | Description |
|---|---|---|
| `menuEntry` | string | Text of the Apps menu entry: "JBeam Variables Checker". |

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamVariablesChecker.lua`.*
