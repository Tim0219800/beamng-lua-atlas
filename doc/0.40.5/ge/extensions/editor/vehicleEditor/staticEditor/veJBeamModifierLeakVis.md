# `editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis`

*File: `lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamModifierLeakVis.lua` · VM: Game Engine (GE) · 1102 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis`: `extensions.load("editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis")`, then the global `editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis`

"JBeam Modifier Leaking Visualizer" app of the Static Editor. In JBeam, a modifier (for example beamSpring, nodeWeight, frictionCoef) placed in a line stays active for the following lines, even in the following parts of a vehicle (it "leaks"). This tool analyzes the parts of the loaded vehicle in load order, with their AST data, computes which modifiers leak from one part to another in each section, and displays them in a table (sections as buttons, parts as rows, modifiers as columns). Sections that leak are colored red. An "Ignore Default Values" checkbox (EXPERIMENTAL) ignores the values equal to the engine's default values (hard-coded modifiersDefaultValues table).

## Example

```lua
extensions.load('editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis')
editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis.open()
```

## Notes

- Requires a vehicle loaded in the editor (vEditor.vehicle); otherwise the window shows nothing after opening.
- The parts are obtained by a recursive walk of vEditor.vehData.config.partsTree in slot order (slots2 or slots); each JBeam file is re-read and parsed into an AST (json-ast) only once thanks to a local cache.
- The special string values (for example "|NORMAL", "NM_xxx" for a node material) are converted as the JBeam loader does (replaceSpecialValues, with particles.getMaterialIDByName).
- ImGui limits tables to 64 columns: if a section has more modifiers, a warning message says so and not all are displayed.
- The modifiersDefaultValues table is incomplete (the interface itself states "Not all default values accounted for").
- The local variable runTest is false: the internal test counters (comparison with vEditor.vdata) are disabled.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis.onDeserialized(data)` | Hook called after a Lua reload: restores the window state. *(internal)* *(hook)* | 1091 |
| `editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis.onSerialize()` | Hook called before a Lua reload: saves the window state. *(internal)* *(hook)* | 1085 |
| `editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis.onUpdate()` | Extension hook called every frame: draws the "Start Analysis" button, the default values checkbox, the section buttons and the modifiers table when the window is open and a vehicle is loaded. *(internal)* *(hook)* | 904 |
| `editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis.open()` | Opens the app window (windowOpen[0] = true). | 1081 |

### Parameter details

#### `editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis.onDeserialized(data)`

Hook called after a Lua reload: restores the window state.

- `data` (*table*) : table produced by onSerialize

#### `editor_vehicleEditor_staticEditor_veJBeamModifierLeakVis.onSerialize()`

Hook called before a Lua reload: saves the window state.

- **returns**: table {windowOpen = boolean}

## Fields

| Field | Type | Description |
|---|---|---|
| `menuEntry` | string | Text of the Apps menu entry: "JBeam Modifier Leaking Visualizer". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamModifierLeakVis.lua`.*
