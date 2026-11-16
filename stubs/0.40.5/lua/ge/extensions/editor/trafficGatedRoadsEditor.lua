---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/trafficGatedRoadsEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor "Traffic Gated Roads" (Traffic menu): places spheres (displayed as vertical cylinders 20 m high, adjustable radius) in the world and saves them to a JSON file, by default /gameplay/trafficGatedRoads.json. Each sphere has id, name, pos {x,y,z}, quat {x,y,z,w} and radius (10 by default). Ctrl+click adds a sphere, Shift+click duplicates the selection, click selects, Del deletes; a gizmo moves, rotates or scales. The role of this data in traffic is not defined in this file.
--- Access: extension `editor_trafficGatedRoadsEditor`: `extensions.load("editor_trafficGatedRoadsEditor")`, then the global `editor_trafficGatedRoadsEditor`
---@class editor_trafficGatedRoadsEditor
editor_trafficGatedRoadsEditor = {}

--- True when the current edit mode is "Edit Traffic Gated Roads": the gizmo is then allowed.
---Source: lua/ge/extensions/editor/trafficGatedRoadsEditor.lua:441
---@return boolean  Active edit mode.
function editor_trafficGatedRoadsEditor.allowGizmo() end

--- Loads a JSON file of spheres (jsonReadFile). On failure, logs an error and changes nothing. Otherwise replaces the data, remembers the path, clears the selection and recomputes nextId.
---Source: lua/ge/extensions/editor/trafficGatedRoadsEditor.lua:209
---@param fp string|nil File path; no effect if nil.
function editor_trafficGatedRoadsEditor.loadData(fp) end

--- Hook called after a Lua reload: restores the state returned by onSerialize.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/trafficGatedRoadsEditor.lua:423
---@param d table|nil Serialized state.
function editor_trafficGatedRoadsEditor.onDeserialized(d) end

--- Hook called every interface frame: draws the window (File menu, SAVE, sphere list, name, position, radius, Snap to Terrain checkbox), handles the mouse, draws the cylinders with debugDrawer:drawCylinder and the gizmo (move, rotate, scale).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/trafficGatedRoadsEditor.lua:230
function editor_trafficGatedRoadsEditor.onEditorGui() end

--- Editor hook: creates the trafficGatedRoadsEditMode edit mode (left click = Select), registers the window (400x500) and the Traffic menu entry.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/trafficGatedRoadsEditor.lua:389
function editor_trafficGatedRoadsEditor.onEditorInitialized() end

--- Hook called when a tool window is hidden: if it is this one, returns to objectSelect mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/trafficGatedRoadsEditor.lua:402
---@param windowName string Name of the hidden window.
function editor_trafficGatedRoadsEditor.onEditorToolWindowHide(windowName) end

--- Hook called before a Lua reload: returns the state to keep.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/trafficGatedRoadsEditor.lua:414
---@return table  { data, filePath, selectedIdx, nextId }.
function editor_trafficGatedRoadsEditor.onSerialize() end

--- Hook called when a window gains focus: if it is this one, re-enables the edit mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/trafficGatedRoadsEditor.lua:408
---@param windowName string Window name.
function editor_trafficGatedRoadsEditor.onWindowGotFocus(windowName) end

--- Writes the data to a JSON file (jsonWriteFile, human-readable formatting) and remembers the path.
---Source: lua/ge/extensions/editor/trafficGatedRoadsEditor.lua:203
---@param fp string|nil Path; defaults to the current path.
function editor_trafficGatedRoadsEditor.saveData(fp) end

--- Clears the object selection, shows the window and switches to the trafficGatedRoadsEditMode edit mode.
---Source: lua/ge/extensions/editor/trafficGatedRoadsEditor.lua:375
function editor_trafficGatedRoadsEditor.show() end

