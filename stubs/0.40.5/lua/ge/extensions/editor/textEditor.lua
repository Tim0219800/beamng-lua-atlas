---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/textEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor extension that provides a multiline 'Text Editor' window to modify the text content of a scene object field (e.g. a long field of an object). It registers by exposing editor.newTextEditorInstance(objIds, fieldName). The Ok button applies the value via objectHistoryActions.changeObjectFieldWithUndo (undoable), Cancel closes without changing anything.
--- Access: extension `editor_textEditor`: `extensions.load("editor_textEditor")`, then the global `editor_textEditor`
---@class editor_textEditor
editor_textEditor = {}

--- Hook called after reload: recreates one instance per entry of the saved state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/textEditor.lua:84
---@param state table Result of onSerialize.
function editor_textEditor.onDeserialize(state) end

--- Hook called every frame of the editor interface: creates/displays each open Text Editor window, with a multiline input area and Cancel/Ok buttons. Removes the instance when the window is no longer visible.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/textEditor.lua:28
function editor_textEditor.onEditorGui() end

--- Hook called at editor initialization: publishes editor.newTextEditorInstance.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/textEditor.lua:98
function editor_textEditor.onEditorInitialized() end

--- Serialization hook (Lua reload): returns a copy of the open instances without the text buffer (textInput).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/textEditor.lua:90
---@return table  Instances (objIds, fieldName) without textInput.
function editor_textEditor.onSerialize() end

