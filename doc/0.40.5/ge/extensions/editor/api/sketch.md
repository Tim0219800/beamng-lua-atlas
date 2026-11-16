# `editor_api_sketch`

*File: `lua/ge/extensions/editor/api/sketch.lua` · VM: Game Engine (GE) · 36 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_api_sketch`: `extensions.load("editor_api_sketch")`, then the global `editor_api_sketch`

Editor API module for "sketches" (drawings in the world). In this version it is only a shell: initialize(editor) adds three functions (createSketch, deleteSketch, getSketches) to the editor object whose body is empty (TODO comment). The planned hooks are listed in a comment: onEditorSketchCreated, onEditorSketchDelete, onEditorSketchChanged.

## Notes

- The three functions do nothing and return nil: they are still to be implemented (TODO in the code).
- The onEditorSketchCreated/Delete/Changed hooks are only mentioned in a comment, nothing triggers them in this file.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_api_sketch.initialize(editorInstance)` | Registers createSketch, deleteSketch and getSketches on the editor object passed as an argument. Called by the editor API loader. *(internal)* | 26 |

### Parameter details

#### `editor_api_sketch.initialize(editorInstance)`

Registers createSketch, deleteSketch and getSketches on the editor object passed as an argument. Called by the editor API loader.

- `editorInstance` (*table*) : Global editor object of the editor on which the functions are added.

## Class `editor`

Editor object of the editor, enriched by initialize. All these methods are empty stubs.

Object `editor` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `editor.createSketch(position, size)` | Planned to create a sketch. Empty body (TODO). | 14 |
| `editor.deleteSketch(sketchObjectId)` | Planned to delete a sketch. Empty body (TODO). | 18 |
| `editor.getSketches()` | Planned to list the sketches. Empty body (TODO), returns nil. | 22 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/sketch.lua`.*
