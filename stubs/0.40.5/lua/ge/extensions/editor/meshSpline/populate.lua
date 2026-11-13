---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/meshSpline/populate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_meshSpline_populate` : `extensions.load("editor_meshSpline_populate")`, puis la globale `editor_meshSpline_populate`
---@class editor_meshSpline_populate
editor_meshSpline_populate = {}

--- Takes back the meshes release() let go of (those still in the scene), as they are.
---Source : lua/ge/extensions/editor/meshSpline/populate.lua:464
---@param spline any
---@param ids any
function editor_meshSpline_populate.adopt(spline, ids) end

--- Calls fn(mesh, true) for every mesh the tool holds for the spline (the splineLock `each`).
---Source : lua/ge/extensions/editor/meshSpline/populate.lua:252
---@param spline any
---@param fn any
function editor_meshSpline_populate.eachObject(spline, fn) end

--- For the 'Lock ends' UI label: given the current spline, returns the effective centre-to-centre spacing (m) and the
---  number of gaps that even-fit would produce, so the user sees the real spacing they'll get (e.g. "≈ 19.0 m"). Returns
---  nil when it can't be computed (too few points / no mesh length yet).
---Source : lua/ge/extensions/editor/meshSpline/populate.lua:487
---@param spline any
function editor_meshSpline_populate.evenFitInfo(spline) end

--- A spline is 'discrete' (props sitting on sample points, e.g. lamps) rather than 'tiling' (barriers abutting end-to-end)
---  when its gap exceeds the threshold. The UI uses this to show the discrete-only 'Lock ends' toggle.
---Source : lua/ge/extensions/editor/meshSpline/populate.lua:480
---@param spline any
function editor_meshSpline_populate.isDiscreteSpline(spline) end

--- Slider floor for Spacing on this piece: the value that reaches the minimum allowed period (max overlap) for its length.
---  Below this the period would be clamped anyway, so we stop the slider here to keep it a live, honest control.
---Source : lua/ge/extensions/editor/meshSpline/populate.lua:65
---@param spline any
function editor_meshSpline_populate.minSpacingFor(spline) end

--- Populates a mesh spline with instances of a static mesh along its length.
---Source : lua/ge/extensions/editor/meshSpline/populate.lua:294
---@param spline any
---@param splineIdx any
function editor_meshSpline_populate.populateMeshSpline(spline, splineIdx) end

--- Lua reload: the tool lets go of a locked spline's meshes without deleting them (they are the level's) and returns their ids
---  per component, for adopt() to pick up again.
---Source : lua/ge/extensions/editor/meshSpline/populate.lua:449
---@param spline any
function editor_meshSpline_populate.release(spline) end

--- Attempts to removes the static meshes of the mesh spline, from the scene.
---Source : lua/ge/extensions/editor/meshSpline/populate.lua:429
---@param spline any
function editor_meshSpline_populate.tryRemove(spline) end

