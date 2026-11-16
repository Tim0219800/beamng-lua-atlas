---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dataBlockEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- World Editor DataBlock (SimDataBlock) editor, accessible through the Assets > "DataBlock Editor" menu. Two-tab window: "Existing" (tree of datablocks grouped by class, with a * for modified datablocks, Save and Delete buttons) and "New" (choice of a class then a "Create new DataBlock" window with name and optional copy of the values of an existing datablock). Field editing is done in the standard inspector; the extension marks the datablock as modified when a field changes. Also adds editor.openDatablockEditor(dataBlockId, previousInspectorObjectId) to open the editor from another tool.
--- Access: extension `editor_dataBlockEditor`: `extensions.load("editor_dataBlockEditor")`, then the global `editor_dataBlockEditor`
---@class editor_dataBlockEditor
editor_dataBlockEditor = {}

--- Hook called every editor frame: draws the DataBlock Editor window, the creation window and the deletion confirmation if the window is visible.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dataBlockEditor.lua:138
function editor_dataBlockEditor.onEditorGui() end

--- Hook called at World Editor initialization: adds the menu entry (Assets group), registers the "dataBlockEditor" and "createDataBlock" windows, loads the class list and defines editor.openDatablockEditor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dataBlockEditor.lua:114
function editor_dataBlockEditor.onEditorInitialized() end

--- Hook called when a field is modified in the inspector; if the first selected object is a datablock, marks it as modified (editor.setDataBlockDirty).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dataBlockEditor.lua:285
---@param selectedIds integer[] ids of the selected objects
---@param fieldName string modified field
---@param fieldValue any new value
---@param arrayIndex integer index in the array field
function editor_dataBlockEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex) end

--- Hook called to draw the inspector header; if a datablock is selected after a call to openDatablockEditor, shows the "<< Back To Previously Selected Object" button that restores the previous selection.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dataBlockEditor.lua:101
---@param inspectorInfo table inspector info (unused)
function editor_dataBlockEditor.onEditorInspectorHeaderGui(inspectorInfo) end

--- Hook called when the object selection changes; forgets the previously selected object for the "Back" button.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dataBlockEditor.lua:292
function editor_dataBlockEditor.onEditorObjectSelectionChanged() end

--- Hook called when the extension is loaded; writes "initialized" to the log.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dataBlockEditor.lua:123
function editor_dataBlockEditor.onExtensionLoaded() end

