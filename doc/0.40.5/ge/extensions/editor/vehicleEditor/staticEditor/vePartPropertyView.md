# `editor_vehicleEditor_staticEditor_vePartPropertyView`

*File: `lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartPropertyView.lua` · VM: Game Engine (GE) · 76 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleEditor_staticEditor_vePartPropertyView`: `extensions.load("editor_vehicleEditor_staticEditor_vePartPropertyView")`, then the global `editor_vehicleEditor_staticEditor_vePartPropertyView`

"Part Properties" window of the Static Editor. It shows in a generic inspector the scalar (non-table) properties of the table selected in the editor (vEditor.propertyTableEditTarget), and writes changes directly into that table. Numbers are editable as float, booleans as checkbox, everything else as string.

## Notes

- The keys '__astNodeIdx' and '__schemaProcessed' as well as all table values are ignored.
- The inspector is created with editor/api/genericInspector; the setter writes newValue into lastEditTarget[fieldName] (so it modifies the in-memory JBeam data).
- Minor bug: an edited string is written back as is (string) even if the original field was a number converted to float; only the field value changes, the field type is not revalidated.
- The type field of an integer is 'float' (every number is treated as float).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleEditor_staticEditor_vePartPropertyView.onEditorGui()` | Editor hook called every frame: rebuilds the field list when the edit target changes, then draws the generic inspector. *(internal)* *(hook)* | 39 |
| `editor_vehicleEditor_staticEditor_vePartPropertyView.onEditorInitialized()` | Editor hook called at initialization: registers the window (500x400, vehicleEditor tool) and creates the generic inspector with its setter. *(internal)* *(hook)* | 55 |
| `editor_vehicleEditor_staticEditor_vePartPropertyView.open()` | Shows the "Part Properties" window (editor.showWindow). | 51 |

## Fields

| Field | Type | Description |
|---|---|---|
| `menuEntry` | string | Apps menu entry text: "Part Properties". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartPropertyView.lua`.*
