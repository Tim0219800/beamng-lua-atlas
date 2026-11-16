---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/meshEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Code shared by the editors of "mesh"-type node objects (MeshRoad and River) of the world editor. It is not an extension loaded by extensions.load: meshRoadEditor.lua and riverEditor.lua load it with dofile() then set M.type, M.preferencesName and M.niceName before wiring its "_"-suffixed functions to their edit mode. It handles the selection of the mesh and its nodes, creation by Alt+click, node insertion, width dragging, field copy/paste, deletion, undo/redo history, highlighting and preferences (default width, depth, height).
--- Access: extension `editor_meshEditor`: `extensions.load("editor_meshEditor")`, then the global `editor_meshEditor`
---@class editor_meshEditor
editor_meshEditor = {}

--- Called by the action map (copy): remembers the fields of the selected mesh (editor.copyFields) for a later paste or to initialize a new mesh. Does nothing if no mesh is selected.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshEditor.lua:964
function editor_meshEditor.copySettingsAM() end

--- Called when the edit mode is activated: computes the mode name ("Edit" .. M.type) and synchronizes the selection with the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshEditor.lua:1060
function editor_meshEditor.onActivate_() end

--- Deletes the selection: the selected nodes if the mesh keeps more than 2, otherwise the whole mesh. Goes through the editor history (undo/redo).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshEditor.lua:269
function editor_meshEditor.onDeleteSelection() end

--- Called when the edit mode is exited: deselects the node and clears the object selection.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshEditor.lua:1055
function editor_meshEditor.onDeselect_() end

--- Hook: when the axis gizmo alignment changes (and this mode is active), repositions the gizmo on the selected node. The name contains the game's typo "Aligment".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshEditor.lua:1040
function editor_meshEditor.onEditorAxisGizmoAligmentChanged_() end

--- Hook: when an inspector field changes, regenerates the meshes of the handled type if the field is segmentLength or subdivideLength.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshEditor.lua:1029
---@param selectedIds integer[] Ids of the objects whose field changed.
---@param fieldName string Name of the modified field.
---@param fieldValue any New value (unused here).
---@param arrayIndex integer|nil Index in an array field (unused here).
function editor_meshEditor.onEditorInspectorFieldChanged_(selectedIds, fieldName, fieldValue, arrayIndex) end

--- Hook: draws, in the inspector header, the panel of the selected nodes' properties (width, depth, height) when this mode is active and a mesh with selected nodes exists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshEditor.lua:354
---@param inspectorInfo table Inspector information provided by the editor.
function editor_meshEditor.onEditorInspectorHeaderGui_(inspectorInfo) end

--- Hook: when the object selection changes (mode active), keeps the id of the first object of type M.type as the current mesh.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshEditor.lua:1047
function editor_meshEditor.onEditorObjectSelectionChanged_() end

--- Hook: recomputes the height offset (heightOffset) when the preference <preferencesName>.general.defaultHeight changes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshEditor.lua:1011
---@param path string Full path of the modified preference.
---@param value number New value.
function editor_meshEditor.onEditorPreferenceValueChanged_(path, value) end

--- Hook: registers the preferences category M.preferencesName with defaultWidth (10), defaultDepth (5), defaultHeight (2), dragWidth, highlightNearby and highlightNearbyDistance (100 m).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshEditor.lua:1015
---@param prefsRegistry table Editor preferences registry.
function editor_meshEditor.onEditorRegisterPreferences_(prefsRegistry) end

--- Selects all the nodes of the current mesh (indices 0 to getNodeCount()-1).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshEditor.lua:53
function editor_meshEditor.onSelectAll() end

--- Draws the mode toolbar: default width and depth, "Highlight nearby" checkbox and highlight distance in meters. The values are written to the preferences.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshEditor.lua:984
function editor_meshEditor.onToolbar_() end

--- Called every frame while the mode is active: detects the hovered node or mesh, handles the mouse raycast, Alt+click creation of meshes and nodes, width dragging, highlighting and debugDrawer drawing (spheres and help texts).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshEditor.lua:735
function editor_meshEditor.onUpdate_() end

--- Called by the action map (paste): applies the remembered fields to the selected mesh via a "PasteMeshFields" history action (undo/redo possible). Does nothing without a selected mesh or without a copy.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshEditor.lua:129
function editor_meshEditor.pasteFieldsAM() end

