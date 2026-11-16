---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/tools/editor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- MCP tools for the World Editor: enable/disable, state, selection, undo/redo, edit modes, open/save a level, list classes, create objects and modify their transform, with undo history. Loads editor_main on demand.
--- Access: extension `mcp_tools_editor`: `extensions.load("mcp_tools_editor")`, then the global `mcp_tools_editor`
---@class mcp_tools_editor
---@field schemas table<string, table> Schemas of the editor tools.
mcp_tools_editor = {}

--- Clears the selection.
---Source: lua/ge/extensions/mcp/tools/editor.lua:112
---@return string  Message.
---@return boolean  true on error.
function mcp_tools_editor.clear_editor_selection() end

--- Creates a scene object (worldEditorCppApi.createObject), configures fields, name, position, scale, yaw, adds it to the parent and records a CreateObject history action.
---Source: lua/ge/extensions/mcp/tools/editor.lua:293
---@param args table|nil {class?|classname?: string, shape?|shapeName?: string, name?: string, pos?: {x,y,z}, scale?: number|{x,y,z}, yaw?: number°, parent?: string, parentId?: integer, fields?: table, field?: string, value?: any, index?: string, collisionType?: string, decalType?: string}
---@return string  JSON {id, name, class, parentId, shapeName?}.
---@return boolean  true on error.
function mcp_tools_editor.create_editor_object(args) end

--- Deletes the selected objects (undoable).
---Source: lua/ge/extensions/mcp/tools/editor.lua:120
---@return string  Message.
---@return boolean  true if nothing is selected or on error.
function mcp_tools_editor.delete_editor_selection() end

--- Opens a level in the editor (editor.openLevel, loses unsaved changes, asynchronous). Appends a trailing '/' to a folder.
---Source: lua/ge/extensions/mcp/tools/editor.lua:205
---@param args table {name?: string, path?: string}
---@return string  Message.
---@return boolean  true on error.
function mcp_tools_editor.editor_load_level(args) end

--- Redoes history steps.
---Source: lua/ge/extensions/mcp/tools/editor.lua:141
---@param args table|nil {steps?: integer (default 1)}
---@return string  Message.
---@return boolean  true on error.
function mcp_tools_editor.editor_redo(args) end

--- Saves the current level (editor.saveLevel).
---Source: lua/ge/extensions/mcp/tools/editor.lua:223
---@return string  "saved level: …".
---@return boolean  true if there is no level path.
function mcp_tools_editor.editor_save_level() end

--- Editor state: active, initialized, dirty, levelName, levelPath, editMode, selectionCount, undoCount, redoCount, headless.
---Source: lua/ge/extensions/mcp/tools/editor.lua:68
---@return string  JSON.
---@return boolean  true if editor_main fails to load.
function mcp_tools_editor.editor_status() end

--- Undoes history steps.
---Source: lua/ge/extensions/mcp/tools/editor.lua:133
---@param args table|nil {steps?: integer (default 1)}
---@return string  Message.
---@return boolean  true on error.
function mcp_tools_editor.editor_undo(args) end

--- Frames the editor camera on the selection (fitViewToSelectionSmooth or fitViewToSelection).
---Source: lua/ge/extensions/mcp/tools/editor.lua:171
---@return string  Message.
---@return boolean  true if nothing is selected or on error.
function mcp_tools_editor.fit_view_to_selection() end

--- Currently selected objects.
---Source: lua/ge/extensions/mcp/tools/editor.lua:95
---@return string  JSON {count, objects:[{id, name, class}]}.
---@return boolean  true on error.
function mcp_tools_editor.get_editor_selection() end

--- Lists the registered edit modes and the current mode.
---Source: lua/ge/extensions/mcp/tools/editor.lua:149
---@return string  JSON {current, modes}.
---@return boolean  true on error.
function mcp_tools_editor.list_edit_modes() end

--- Lists (500 max, sorted) the classes derived from SimObject via Sim.getSimObjectDerivedClassNames.
---Source: lua/ge/extensions/mcp/tools/editor.lua:273
---@param args table|nil {pattern?: string} case-insensitive substring.
---@return string  JSON {count, classes}.
---@return boolean  true on error.
function mcp_tools_editor.list_editor_classes(args) end

--- Selects objects by id, ids[] or name.
---Source: lua/ge/extensions/mcp/tools/editor.lua:103
---@param args table {id?, ids?: integer[], name?: string, mode?: 'new'|'add'|'remove'|'toggle' (default new)}
---@return string  JSON {count, ids}.
---@return boolean  true on error.
function mcp_tools_editor.select_editor_objects(args) end

--- Changes the edit mode by name (editor.selectEditMode).
---Source: lua/ge/extensions/mcp/tools/editor.lua:159
---@param args table {name: string} (from list_edit_modes).
---@return string  Message.
---@return boolean  true on error.
function mcp_tools_editor.set_edit_mode(args) end

--- Enables or disables the World Editor (editor.setEditorActive).
---Source: lua/ge/extensions/mcp/tools/editor.lua:86
---@param args table {active: boolean, safeMode?: boolean}
---@return string  "editor activating/deactivating".
---@return boolean  true on error.
function mcp_tools_editor.set_editor_active(args) end

--- Applies position/rotation/scale to objects in a single undoable history transaction.
---Source: lua/ge/extensions/mcp/tools/editor.lua:435
---@param args table {items?: {id|name, pos?, euler?|rot?, scale?}[], id?, ids?, name?, pos?, euler?, rot?, rotation?, scale?}. Without a target, uses the selection.
---@return string  JSON {count, ids}.
---@return boolean  true on error.
function mcp_tools_editor.set_editor_transform(args) end

