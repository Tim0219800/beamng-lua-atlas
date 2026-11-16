---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/shapeEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- World editor Shape Editor: a window that previews a 3D model (.dae and others) through the C++ ShapePreview object, with an orbital camera and several tabs (Details, Render, Nodes, Sequence, Material, Imposter, and LOD WIP if createMeshLOD exists). It can export to Collada or Wavefront obj, read the nodes, animation sequences and materials, manage the imposter and generate LODs. The mesh constructor settings are stored in a .cs file next to the model ('//JSON:' prefix). A modder uses it to inspect a TSStatic or an asset.
--- Access: extension `editor_shapeEditor`: `extensions.load("editor_shapeEditor")`, then the global `editor_shapeEditor`
---@class editor_shapeEditor
editor_shapeEditor = {}

--- Restore hook after a Lua reload: recreates ShapePreview, reloads the model and the highlight material.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/shapeEditor.lua:927
---@param data table Data returned by onSerialize.
function editor_shapeEditor.onDeserialized(data) end

--- Hook called when the editor is deactivated: restores the preview material and removes the highlight material.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/shapeEditor.lua:962
function editor_shapeEditor.onEditorDeactivated() end

--- Hook called when leaving the level: clears the preview shape.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/shapeEditor.lua:938
function editor_shapeEditor.onEditorExitLevel() end

--- Draw hook called every frame: draws the window, the 3D render and the tabs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/shapeEditor.lua:436
function editor_shapeEditor.onEditorGui() end

--- Editor initialization hook: creates ShapePreview, adds the 'Shape Editor' menu entry (Assets group) and registers the window (800x600).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/shapeEditor.lua:67
function editor_shapeEditor.onEditorInitialized() end

--- Hook called to draw the inspector header: adds the 'Open in Shape Editor' button for the first selected object if it is of class TSStatic.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/shapeEditor.lua:899
---@param inspectorInfo table Inspector info; its selection.object key contains the selected ids.
function editor_shapeEditor.onEditorInspectorHeaderGui(inspectorInfo) end

--- Hook called when the selection changes: if the window is visible and the autoOpenSelectedObject preference is enabled, loads the model of the selected TSStatic.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/shapeEditor.lua:942
function editor_shapeEditor.onEditorObjectSelectionChanged() end

--- Hook: registers the shapeEditor category and the general.autoOpenSelectedObject preference.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/shapeEditor.lua:952
---@param prefsRegistry table Editor preferences registry.
function editor_shapeEditor.onEditorRegisterPreferences(prefsRegistry) end

--- Serialization hook (Lua reload): returns meshFile and highlightMaterialName.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/shapeEditor.lua:920
---@return table  {meshFile, highlightMaterialName}.
function editor_shapeEditor.onSerialize() end

--- Loads a model into the preview: sets it in ShapePreview, resets the orbit, shows the window, reads the shape info (details/LODs, sequences), the mesh constructor .cs file and the imposter settings.
---Source: lua/ge/extensions/editor/shapeEditor.lua:907
---@param filename string Path of the 3D model, e.g. /levels/.../x.dae.
function editor_shapeEditor.showShapeEditorLoadFile(filename) end

