---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/mapJsonEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor for the navgraph file levels/<level>/map.json (menu Window > Roads > Map Json Editor). This file contains manual road segments: ordered, named chains of BeamNGWaypoint with overrides for drivability, direction, lanes, speed limit, etc. The waypoints are scene objects, the file only references them by name. map.lua watches the file and reloads the navgraph when it is written. The tool draws the segments and waypoints in 3D (debugDrawer) and adds an "Edit Map Json" edit mode.
--- Access: extension `editor_mapJsonEditor`: `extensions.load("editor_mapJsonEditor")`, then the global `editor_mapJsonEditor`
---@class editor_mapJsonEditor
editor_mapJsonEditor = {}

--- Reads a map.json file, resets the selection and rescans the scene's waypoints.
---Source: lua/ge/extensions/editor/mapJsonEditor.lua:133
---@param fp string|nil File path; the current level's map.json if nil.
---@return boolean  true if the file was read, false otherwise (no level or file unreadable).
function editor_mapJsonEditor.loadFile(fp) end

--- Restores the state after a Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/mapJsonEditor.lua:798
---@param d table|nil Table returned by onSerialize.
function editor_mapJsonEditor.onDeserialized(d) end

--- Called on level exit: clears data, path, selection and caches.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/mapJsonEditor.lua:784
function editor_mapJsonEditor.onEditorExitLevel() end

--- Draws the tool window (open/new, SAVE, list of segments and nodes, display options) and the 3D drawing every frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/mapJsonEditor.lua:659
function editor_mapJsonEditor.onEditorGui() end

--- Defines the mapJsonEditMode edit mode, registers the window and the menu entry (Roads group).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/mapJsonEditor.lua:758
function editor_mapJsonEditor.onEditorInitialized() end

--- When the tool window is hidden, goes back to the objectSelect edit mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/mapJsonEditor.lua:772
---@param windowName string Name of the hidden window.
function editor_mapJsonEditor.onEditorToolWindowHide(windowName) end

--- Called before a Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/mapJsonEditor.lua:794
---@return table  {data, filePath, dirty}.
function editor_mapJsonEditor.onSerialize() end

--- When the tool window gets focus, activates the mapJsonEditMode edit mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/mapJsonEditor.lua:778
---@param windowName string Window name.
function editor_mapJsonEditor.onWindowGotFocus(windowName) end

--- Writes the segments to the file (the navgraph reloads when the file changes). Does nothing if there is no data; logs an error if the write fails.
---Source: lua/ge/extensions/editor/mapJsonEditor.lua:200
---@param fp string|nil Target path; current path or the level's map.json by default.
function editor_mapJsonEditor.saveFile(fp) end

--- Shows the window, activates the mapJsonEditMode edit mode, loads the level's map.json if not already open, then rescans the waypoints.
---Source: lua/ge/extensions/editor/mapJsonEditor.lua:745
function editor_mapJsonEditor.show() end

