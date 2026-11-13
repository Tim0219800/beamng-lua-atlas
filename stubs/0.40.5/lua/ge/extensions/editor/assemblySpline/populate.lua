---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/assemblySpline/populate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_assemblySpline_populate` : `extensions.load("editor_assemblySpline_populate")`, puis la globale `editor_assemblySpline_populate`
---@class editor_assemblySpline_populate
editor_assemblySpline_populate = {}

--- Takes back the meshes release() let go of (those still in the scene), as they are.
---Source : lua/ge/extensions/editor/assemblySpline/populate.lua:516
---@param spline any
---@param ids any
function editor_assemblySpline_populate.adopt(spline, ids) end

--- Calls fn(mesh, true) for every mesh the tool holds for the spline (the splineLock `each`).
---Source : lua/ge/extensions/editor/assemblySpline/populate.lua:54
---@param spline any
---@param fn any
function editor_assemblySpline_populate.eachObject(spline, fn) end

--- A locked spline whose meshes exist only has its lock state applied: the tool does not move them. Otherwise it is placed.
---Source : lua/ge/extensions/editor/assemblySpline/populate.lua:490
---@param spline any
---@param splineIdx any
---@param molecule any
function editor_assemblySpline_populate.populateAssemblySpline(spline, splineIdx, molecule) end

--- Lua reload: the tool lets go of a locked spline's meshes without deleting them (they are the level's) and returns their ids
---  per mesh path, for adopt() to pick up again.
---Source : lua/ge/extensions/editor/assemblySpline/populate.lua:500
---@param spline any
function editor_assemblySpline_populate.release(spline) end

--- Tries to remove all the meshes for the given spline.
---Source : lua/ge/extensions/editor/assemblySpline/populate.lua:460
---@param spline any
function editor_assemblySpline_populate.tryRemove(spline) end

