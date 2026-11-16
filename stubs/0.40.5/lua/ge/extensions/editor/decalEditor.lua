---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/decalEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- World Editor decal editor ("Edit Decal" edit mode, "Decal Editor" window, "DecalEditor" action map). Two tabs: "Templates" (list of DecalData with * for modified ones; create, delete, save one or all templates) and "Instances" (list and properties of placed decals, template replacement, duplication). In Templates mode, a click on the terrain creates an instance of the selected template; instances are visualized by debug spheres colored by id, selectable with the mouse (Ctrl+click = multi-selection) and movable with the axis gizmo (Shift + drag = duplicate). All actions are undoable via editor.history, and decals are saved before the level is saved.
--- Access: extension `editor_decalEditor`: `extensions.load("editor_decalEditor")`, then the global `editor_decalEditor`
---@class editor_decalEditor
editor_decalEditor = {}

--- Hook called when the gizmo alignment (local/world) changes; if instances are selected in Edit Decal mode, repositions the gizmo.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/decalEditor.lua:282
function editor_decalEditor.onEditorAxisGizmoAligmentChanged() end

--- Hook called before the level is saved; saves all decal templates (editor.saveDecals).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/decalEditor.lua:1335
function editor_decalEditor.onEditorBeforeSaveLevel() end

--- Hook called every editor frame; if the Edit Decal mode is active, draws the window (sphere opacity slider, "Show info labels" checkbox, Templates and Instances tabs).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/decalEditor.lua:1359
function editor_decalEditor.onEditorGui() end

--- Hook called at editor initialization: declares editor.editModes.decalEditMode (onActivate, onDeactivate, onUpdate, onDeleteSelection, create_decal icon, auxiliary shortcuts) and registers the 400x600 window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/decalEditor.lua:1316
function editor_decalEditor.onEditorInitialized() end

--- Hook called when a field changes in the inspector; for each modified DecalData, marks it dirty in scenetree.decalPersistMan and notifies the instances that use it (editor.notifyDecalModified).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/decalEditor.lua:1339
---@param selectedIds integer[] ids of the selected objects
---@param fieldName string modified field
---@param fieldValue any new value
---@param arrayIndex integer index in the array field
function editor_decalEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex) end

--- Hook called to draw the inspector header; in Edit Decal mode, shows the material preview of the selected template.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/decalEditor.lua:1017
---@param inspectorInfo table inspector info (unused)
function editor_decalEditor.onEditorInspectorHeaderGui(inspectorInfo) end

--- Hook called when the extension is loaded; writes "initialized" to the log.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/decalEditor.lua:1301
function editor_decalEditor.onExtensionLoaded() end

