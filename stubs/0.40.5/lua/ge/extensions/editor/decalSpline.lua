---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/decalSpline.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- World Editor "Decal Spline" tool: you draw a spline (nodes, default width 10 m) along which decals are placed automatically from up to 4 components (material, texture rows/columns, frame, spacing, jitter). The file is the entry point of the tool ("decalSpline" window, "Decal Spline" edit mode); the logic is split between editor/decalSpline/splineMgr, editor/decalSpline/populate and the editor/toolUtilities utilities (splineInput, render/spline, session, bake, panCamera, materialSelectionMgr...). It also handles saving the splines in the level (onSerialize/onDeserialized, which survives Lua reload) and session import/export.
--- Access: extension `editor_decalSpline`: `extensions.load("editor_decalSpline")`, then the global `editor_decalSpline`
---@class editor_decalSpline
editor_decalSpline = {}

--- Hook called when leaving the map; deletes all decal splines.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/decalSpline.lua:1745
function editor_decalSpline.onClientEndMission() end

--- Restore hook after Lua reload: recreates the splines from the serialized data, takes back the decals kept from locked splines (populate.adopt), clamps the selected index and recomputes the id to index table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/decalSpline.lua:127
---@param data table|nil list of serialized splines (ignored if empty)
function editor_decalSpline.onDeserialized(data) end

--- Hook called every editor frame. Updates the modified splines; if the tool is not active, only draws the outlines. Otherwise handles the main window, the pan camera, material selection, mouse/keyboard events (splineInput) and the rendering of the splines.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/decalSpline.lua:1664
function editor_decalSpline.onEditorGui() end

--- Hook called at editor initialization: declares editor.editModes.decalSplineEditMode (decalRoad icon) and registers the 300x700 window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/decalSpline.lua:1731
function editor_decalSpline.onEditorInitialized() end

--- Save hook before Lua reload: returns the list of serialized splines ({} if there are none) and deletes the in-memory splines.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/decalSpline.lua:108
---@return table  serialized splines
function editor_decalSpline.onSerialize() end

--- Locks or unlocks the spline with the given id and rebuilds it immediately (also used by the Master Spline for its linked children). The decals are saved by the persistence manager in both cases: the lock only makes the spline non-editable. Does nothing if the id is unknown.
---Source: lua/ge/extensions/editor/decalSpline.lua:96
---@param id integer spline id
---@param isLocked boolean true to lock
function editor_decalSpline.setLockedById(id, isLocked) end

--- Sets the index of the selected node (selection shared between tools).
---Source: lua/ge/extensions/editor/decalSpline.lua:92
---@param idx integer node index, 1-based
function editor_decalSpline.setSelectedNodeIdx(idx) end

--- Sets the index of the selected spline (selection shared between tools).
---Source: lua/ge/extensions/editor/decalSpline.lua:89
---@param idx integer spline index, 1-based
function editor_decalSpline.setSelectedSplineIdx(idx) end

