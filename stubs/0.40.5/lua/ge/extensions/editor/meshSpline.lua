---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/meshSpline.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mesh Spline tool of the world editor: you draw a spline (nodes, widths, normals) along which static meshes (TSStatic) are repeated, for example guardrails, barriers or lampposts. This file handles the tool window, mouse/keyboard input, spline rendering, import from existing TSStatic (polygon or scenetree context menu), terraforming, session saving and "baking" (locking the spline so its meshes are saved with the level). The splines' state lives in meshSpline/splineMgr.lua; the placement of the meshes in meshSpline/populate.lua.
--- Access: extension `editor_meshSpline`: `extensions.load("editor_meshSpline")`, then the global `editor_meshSpline`
---@class editor_meshSpline
editor_meshSpline = {}

--- Calls fn(mesh, true) for each mesh the tool holds for the spline with the given id (the "each" of splineLock). Does nothing if the spline no longer exists.
---Source: lua/ge/extensions/editor/meshSpline.lua:108
---@param id string Identifier of the mesh spline.
---@param fn function Callback called with the mesh and true.
function editor_meshSpline.eachObjectById(id, fn) end

--- Hook called when leaving the map: deletes all the mesh splines, including disabled ones.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshSpline.lua:1907
function editor_meshSpline.onClientEndMission() end

--- Deserialization hook: recreates the splines, takes back the meshes of locked splines (pop.adopt), clamps the selected index and recomputes the id-to-index table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshSpline.lua:164
---@param data table|nil Data returned by onSerialize.
function editor_meshSpline.onDeserialized(data) end

--- Hook called every frame by the world editor: applies the deferred import, rebuilds "dirty" splines even if the tool is inactive (for linked splines), then, if the tool is active, draws its window, handles mesh audition, the import polygon, mouse/keyboard events and rendering. Tool inactive: only draws the spline outlines.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshSpline.lua:1782
function editor_meshSpline.onEditorGui() end

--- World editor initialization hook: creates the meshSplineEditMode mode, registers the "meshSpline" window and the audition window, and adds the "Convert to Mesh Spline" entry to the scenetree context menu (valid if at least 2 TSStatic are selected).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshSpline.lua:1886
function editor_meshSpline.onEditorInitialized() end

--- Extension serialization hook (before Lua reload): leaves the audition view, releases the meshes of locked splines, serializes each spline, then deletes all the splines. Returns an empty table if there are none.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshSpline.lua:141
---@return table  List of the serialized splines.
function editor_meshSpline.onSerialize() end

--- Locks or unlocks the mesh spline with the given id and rebuilds it immediately. Before locking, first rebuilds a "dirty" spline so that what is displayed gets locked. Does nothing if the id is unknown. Also used by the Master Spline for its linked children.
---Source: lua/ge/extensions/editor/meshSpline.lua:98
---@param id string Identifier (UUID) of the mesh spline.
---@param isLocked boolean true to lock (isEnabled = false), false to unlock.
function editor_meshSpline.setLockedById(id, isLocked) end

--- Sets the index of the selected node (selection shared between tools).
---Source: lua/ge/extensions/editor/meshSpline.lua:138
---@param idx integer Node index, 1-based.
function editor_meshSpline.setSelectedNodeIdx(idx) end

--- Sets the index of the selected spline (selection shared between tools).
---Source: lua/ge/extensions/editor/meshSpline.lua:135
---@param idx integer Spline index, 1-based.
function editor_meshSpline.setSelectedSplineIdx(idx) end

