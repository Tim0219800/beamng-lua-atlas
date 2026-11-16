---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/assemblySpline.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Assembly Spline" tool of the world editor: you draw a spline and the tool automatically places TSStatic meshes from an "assembly kit" (folder assets/meshes/props/assembly_kit/) along it, e.g. fences or rails whose elements connect through 'nail.*' anchors. It registers as an edit mode (gyroscope icon), has an ImGui window 'assemblySpline', handles serialization of splines in the editor session, import from existing TSStatics (scene tree right-click menu "Convert to Assembly Spline" or selection polygon), locking/baking and terraforming. The logic is split between splineMgr, molecule, populate, distribution and import.
--- Access: extension `editor_assemblySpline`: `extensions.load("editor_assemblySpline")`, then the global `editor_assemblySpline`
---@class editor_assemblySpline
editor_assemblySpline = {}

--- Calls fn on each scene object of the spline with the given id (delegates to pop.eachObject). Nothing if the spline no longer exists.
---Source: lua/ge/extensions/editor/assemblySpline.lua:109
---@param id integer Spline id.
---@param fn function Callback applied to each object.
function editor_assemblySpline.eachObjectById(id, fn) end

--- Hook called when leaving the map: deletes all assembly splines.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/assemblySpline.lua:1768
function editor_assemblySpline.onClientEndMission() end

--- Hook called after reload with the onSerialize data: recreates the splines, re-adopts the kept objects, rebuilds the id->index table, the mesh kits and the molecules.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/assemblySpline.lua:161
---@param data table|nil Serialized splines.
function editor_assemblySpline.onDeserialized(data) end

--- Hook called every frame by the editor: handles deferred import updates, updates dirty splines, displays the tool window, selection polygon drawing, mouse/keyboard input on nodes and the debugDraw rendering of the splines.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/assemblySpline.lua:1646
function editor_assemblySpline.onEditorGui() end

--- Hook called at editor initialization: creates the assemblySplineEditMode edit mode, registers the window and adds the "Convert to Assembly Spline" menu entry to the scene tree (valid if at least 2 compatible TSStatics are selected).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/assemblySpline.lua:1748
function editor_assemblySpline.onEditorInitialized() end

--- Extension serialization hook (before Lua reload): serializes all splines then removes them from the scene.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/assemblySpline.lua:142
---@return table  Array of serialized splines.
function editor_assemblySpline.onSerialize() end

--- Locks or unlocks the assembly spline with the given id and rebuilds it immediately (also used by the Master Spline for its linked children, and by baking). Locking first forces the update of a dirty spline. Does nothing if the id is not found.
---Source: lua/ge/extensions/editor/assemblySpline.lua:99
---@param id integer Spline id.
---@param isLocked boolean true to lock (isEnabled = false).
function editor_assemblySpline.setLockedById(id, isLocked) end

--- Sets the index of the selected node (selection shared between tools).
---Source: lua/ge/extensions/editor/assemblySpline.lua:139
---@param idx integer Index (1-based).
function editor_assemblySpline.setSelectedNodeIdx(idx) end

--- Sets the index of the selected spline (selection shared between tools).
---Source: lua/ge/extensions/editor/assemblySpline.lua:136
---@param idx integer Index (1-based).
function editor_assemblySpline.setSelectedSplineIdx(idx) end

