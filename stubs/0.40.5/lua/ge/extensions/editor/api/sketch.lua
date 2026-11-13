---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/sketch.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_api_sketch` : `extensions.load("editor_api_sketch")`, puis la globale `editor_api_sketch`
---@class editor_api_sketch
editor_api_sketch = {}

---Source : lua/ge/extensions/editor/api/sketch.lua:26
---@param editorInstance any
function editor_api_sketch.initialize(editorInstance) end

--- Classe locale `editor` de lua/ge/extensions/editor/api/sketch.lua
---@class editor_api_sketch_editor
local editor_api_sketch_editor = {}

---Source : lua/ge/extensions/editor/api/sketch.lua:14
---@param position any
---@param size any
function editor_api_sketch_editor.createSketch(position, size) end

---Source : lua/ge/extensions/editor/api/sketch.lua:18
---@param sketchObjectId any
function editor_api_sketch_editor.deleteSketch(sketchObjectId) end

---Source : lua/ge/extensions/editor/api/sketch.lua:22
function editor_api_sketch_editor.getSketches() end

