---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/assemblySpline/populate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Places the TSStatic meshes of an assembly spline in the level: from the spline geometry (divPoints, tangents, normals), the molecule and the distribution map (distribution.computeMeshMap), it positions the rigids along the curve (spacing, vertical offset, sag, pre-rotation, jitter, random seed) and stretches/orients the bridges between two rigids. The meshes are stored in pools per spline and per mesh path for reuse, and are children of the spline's SimGroup. Also handles the locked state (splineLock): a locked spline whose meshes exist is not re-placed.
--- Access: extension `editor_assemblySpline_populate`: `extensions.load("editor_assemblySpline_populate")`, then the global `editor_assemblySpline_populate`
---@class editor_assemblySpline_populate
editor_assemblySpline_populate = {}

--- Takes back as-is the meshes released by release (those still present in the scene) and remembers the lock state.
---Source: lua/ge/extensions/editor/assemblySpline/populate.lua:516
---@param spline table Assembly spline.
---@param ids table<string, integer[]> Result of release.
function editor_assemblySpline_populate.adopt(spline, ids) end

--- Calls fn(mesh, true) for each mesh the tool holds for the spline (the "each" of splineLock).
---Source: lua/ge/extensions/editor/assemblySpline/populate.lua:54
---@param spline table Assembly spline.
---@param fn function Callback fn(mesh, true).
function editor_assemblySpline_populate.eachObject(spline, fn) end

--- Updates the spline in the scene. If the spline is locked (isEnabled false) and its meshes exist, only applies the lock state without moving them; otherwise (re)places all meshes.
---Source: lua/ge/extensions/editor/assemblySpline/populate.lua:490
---@param spline table Assembly spline.
---@param splineIdx integer Spline index.
---@param molecule table Molecule (spline.moleculeDescription).
function editor_assemblySpline_populate.populateAssemblySpline(spline, splineIdx, molecule) end

--- Lua reload: the tool lets go of the meshes of a locked spline without deleting them (they are part of the level) and returns their ids by mesh path.
---Source: lua/ge/extensions/editor/assemblySpline/populate.lua:500
---@param spline table Assembly spline.
---@return table<string, integer[]>  Mesh ids by meshPath.
function editor_assemblySpline_populate.release(spline) end

--- Deletes all meshes of the spline (scene objects and pools) and forgets its applied lock state.
---Source: lua/ge/extensions/editor/assemblySpline/populate.lua:460
---@param spline table Assembly spline.
function editor_assemblySpline_populate.tryRemove(spline) end

