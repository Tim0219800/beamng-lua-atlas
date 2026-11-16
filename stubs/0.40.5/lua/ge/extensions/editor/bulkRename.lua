---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/bulkRename.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Bulk Rename" window (Assets menu) of the level editor: renames scene objects in bulk. You choose the field to rename (name or internalName), the set of objects (current selection, or objects whose name matches a pattern with * and ?), and a rename pattern where %n inserts a counter (%4n = 4 digits with zeros), and %o the old name. A preview table shows old name, new name, ID and collision ID; the rename goes through objectHistoryActions.changeObjectFieldMultipleValuesWithUndo (undoable).
--- Access: extension `editor_bulkRename`: `extensions.load("editor_bulkRename")`, then the global `editor_bulkRename`
---@class editor_bulkRename
editor_bulkRename = {}

--- Hook called when the editor is activated; empty function.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/bulkRename.lua:245
function editor_bulkRename.onEditorActivated() end

--- Called every editor frame: draws the Bulk Rename window (options, patterns, RENAME button, preview table).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/bulkRename.lua:139
function editor_bulkRename.onEditorGui() end

--- Registers the "bulkRename" window (600x600) and the "Bulk Rename" menu entry (Assets group).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/bulkRename.lua:256
function editor_bulkRename.onEditorInitialized() end

--- Hook called when the editor object selection changes; recomputes the name preview.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/bulkRename.lua:248
function editor_bulkRename.onEditorObjectSelectionChanged() end

--- Hook called when the extension is loaded; empty function.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/bulkRename.lua:261
function editor_bulkRename.onExtensionLoaded() end

