# `editor_vehicleEditor_staticEditor_veJBeamTableVis`

*File: `lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamTableVis.lua` · VM: Game Engine (GE) · 201 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleEditor_staticEditor_veJBeamTableVis`: `extensions.load("editor_vehicleEditor_staticEditor_veJBeamTableVis")`, then the global `editor_vehicleEditor_staticEditor_veJBeamTableVis`

"JBeam Table Visualizer" app of the vehicle editor's Static Editor. It loads a .jbeam file chosen via a file selector, recursively looks for tables of numbers that can be plotted as a curve (for example an engine's torque curves), and displays them with plotHelperUtil (Catmull-Rom curve, auto scaling). A Refresh button re-reads the file from disk.

## Example

```lua
extensions.load('editor_vehicleEditor_staticEditor_veJBeamTableVis')
editor_vehicleEditor_staticEditor_veJBeamTableVis.open()
```

## Notes

- Is listed in the Static Editor's Apps menu thanks to M.menuEntry = 'JBeam Table Visualizer' (calls open()).
- A table is "plottable" when its subtables all have the same size and the first and second elements of the rows (except the first) are numbers. The header (first row whose first element is text) is removed from the original table by removeHeader, which modifies the data loaded in memory.
- The paths are displayed as "section > subsection" in the dropdown list.
- onUpdate draws nothing as long as vEditor.vehicle is nil; the file selector opens in /vehicles/ with the .jbeam filter.
- Parsing uses json.decode (copied from common/jbeam/io.lua), so the file must be valid JSON (not extended JBeam with comments).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleEditor_staticEditor_veJBeamTableVis.onDeserialized(data)` | Hook called after a Lua reload: restores the window state. *(internal)* *(hook)* | 190 |
| `editor_vehicleEditor_staticEditor_veJBeamTableVis.onSerialize()` | Hook called before a Lua reload: saves the open/closed state of the window. *(internal)* *(hook)* | 184 |
| `editor_vehicleEditor_staticEditor_veJBeamTableVis.onUpdate(dt)` | Extension hook called every frame: if the window is open and a vehicle is loaded in the editor, draws the file open button, the list of plottable data, the Refresh button and the graph. *(internal)* *(hook)* | 136 |
| `editor_vehicleEditor_staticEditor_veJBeamTableVis.open()` | Opens the app window (windowOpen[0] = true). Called by the Static Editor's Apps menu. | 180 |

### Parameter details

#### `editor_vehicleEditor_staticEditor_veJBeamTableVis.onDeserialized(data)`

Hook called after a Lua reload: restores the window state.

- `data` (*table*) : table produced by onSerialize

#### `editor_vehicleEditor_staticEditor_veJBeamTableVis.onSerialize()`

Hook called before a Lua reload: saves the open/closed state of the window.

- **returns**: table {windowOpen = boolean}

#### `editor_vehicleEditor_staticEditor_veJBeamTableVis.onUpdate(dt)`

Extension hook called every frame: if the window is open and a vehicle is loaded in the editor, draws the file open button, the list of plottable data, the Refresh button and the graph.

- `dt` (*number*) : time delta (s), passed to the plot

## Fields

| Field | Type | Description |
|---|---|---|
| `menuEntry` | string | Text of the Apps menu entry: "JBeam Table Visualizer". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamTableVis.lua`.*
