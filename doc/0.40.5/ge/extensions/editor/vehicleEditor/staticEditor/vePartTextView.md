# `editor_vehicleEditor_staticEditor_vePartTextView`

*File: `lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartTextView.lua` · VM: Game Engine (GE) · 337 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleEditor_staticEditor_vePartTextView`: `extensions.load("editor_vehicleEditor_staticEditor_vePartTextView")`, then the global `editor_vehicleEditor_staticEditor_vePartTextView`

"Part Text View" window of the Static Editor. It displays the JBeam file of the selected part as a sequence of colored syntax tree (AST, json-ast library) nodes (strings, comments, lists, objects), with line numbers and automatic scrolling to nodes selected elsewhere in the editor. Double-clicking a string, number or boolean node edits it ("Edit Node" modal window). The menu offers Reload, Save, Close and Delete.

## Example

```lua
extensions.load('editor_vehicleEditor_staticEditor_vePartTextView')
editor_vehicleEditor_staticEditor_vePartTextView.open()
```

## Notes

- Save writes vEditor.astFilename with jsonAST.stringify(vEditor.ast.ast): the source JBeam file is rewritten directly on disk.
- Delete calls FS:removeFile(jbeamFilename): it deletes the part's JBeam file (without confirmation).
- Bug: the Delete entry runs "ast = nil" (global variable) instead of vEditor.ast = nil; the displayed AST is therefore not invalidated.
- Bug: the bool case of the edit window uses the variable nodeEditBoolInput, which is never defined; in practice _editNode directly toggles a boolean and does not reopen the modal for this type.
- Rendering uses ImGuiListClipper to draw only the visible rows; on the first render (initTextView) all rows are iterated to compute the maximum width.
- The part is read with jbeamIO.getPart(ioCtx, partName) under pcall; on failure the window stays empty.
- Data read from vEditor: ast.ast.nodes, ast.transient.linesIndexes, hierarchy, nodeIdxToLineNum, selectedASTNodeMap, scrollToNode, selectedPart, vehData.ioCtx.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleEditor_staticEditor_vePartTextView.onEditorGui()` | Editor hook called every frame: loads the selected part, draws the menu bar, the file info (creation and modification dates), the AST node table and the edit modal window. No effect without a vehicle or selected part. *(internal)* *(hook)* | 175 |
| `editor_vehicleEditor_staticEditor_vePartTextView.onEditorInitialized()` | Editor hook called at initialization: registers the window (500x400, vehicleEditor tool) and the "editASTNode" modal window. *(internal)* *(hook)* | 327 |
| `editor_vehicleEditor_staticEditor_vePartTextView.open()` | Shows the "Part Text View" window (editor.showWindow). | 323 |

## Fields

| Field | Type | Description |
|---|---|---|
| `menuEntry` | string | Apps menu entry text: "Part Text View". |

## Calls into the engine (C++)

- `FS:` `removeFile`, `stat`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleEditor/staticEditor/vePartTextView.lua`.*
