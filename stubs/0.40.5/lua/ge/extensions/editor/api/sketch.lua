---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/sketch.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor API module for "sketches" (drawings in the world). In this version it is only a shell: initialize(editor) adds three functions (createSketch, deleteSketch, getSketches) to the editor object whose body is empty (TODO comment). The planned hooks are listed in a comment: onEditorSketchCreated, onEditorSketchDelete, onEditorSketchChanged.
--- Access: extension `editor_api_sketch`: `extensions.load("editor_api_sketch")`, then the global `editor_api_sketch`
---@class editor_api_sketch
editor_api_sketch = {}

--- Registers createSketch, deleteSketch and getSketches on the editor object passed as an argument. Called by the editor API loader.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/sketch.lua:26
---@param editorInstance table Global editor object of the editor on which the functions are added.
function editor_api_sketch.initialize(editorInstance) end

--- Editor object of the editor, enriched by initialize. All these methods are empty stubs.
---@class editor_api_sketch_editor
local editor_api_sketch_editor = {}

--- Planned to create a sketch. Empty body (TODO).
---Source: lua/ge/extensions/editor/api/sketch.lua:14
---@param position any Sketch position (inferred from the name).
---@param size any Sketch size (inferred from the name).
function editor_api_sketch_editor.createSketch(position, size) end

--- Planned to delete a sketch. Empty body (TODO).
---Source: lua/ge/extensions/editor/api/sketch.lua:18
---@param sketchObjectId integer Sketch object id (inferred from the name).
function editor_api_sketch_editor.deleteSketch(sketchObjectId) end

--- Planned to list the sketches. Empty body (TODO), returns nil.
---Source: lua/ge/extensions/editor/api/sketch.lua:22
function editor_api_sketch_editor.getSketches() end

