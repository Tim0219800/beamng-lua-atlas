---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/meshSpline/populate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Placement of static meshes along a mesh spline. From the spline geometry, it samples positions (period = mesh length + spacing, floor of 10% of the length or 0.1 m), picks the components (central mesh, caps, aliases), manages pools of TSStatic in the spline's scene folder, applies jitter, vertical offset and rotation, and synchronizes the locked state. A spline is "discrete" (lampposts, spacing > 5 m) or "tiled" (barriers end to end).
--- Access: extension `editor_meshSpline_populate`: `extensions.load("editor_meshSpline_populate")`, then the global `editor_meshSpline_populate`
---@class editor_meshSpline_populate
editor_meshSpline_populate = {}

--- Takes back the meshes released by release() (those still in the scene), as they are, and remembers the spline's lock state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshSpline/populate.lua:464
---@param spline table Mesh spline.
---@param ids table<string, integer[]> Table returned by release().
function editor_meshSpline_populate.adopt(spline, ids) end

--- Calls fn(mesh, true) for each mesh the tool holds for this spline (the "each" of splineLock).
---Source: lua/ge/extensions/editor/meshSpline/populate.lua:252
---@param spline table Mesh spline.
---@param fn function Callback called with the mesh and true.
function editor_meshSpline_populate.eachObject(spline, fn) end

--- For the "Lock ends" label: returns the effective center-to-center spacing (m) and the number of intervals the uniform fit would produce, i.e. n = max(1, round(length / period)) and length / n. Returns nil if the computation is impossible (fewer than 2 points, no mesh length).
---Source: lua/ge/extensions/editor/meshSpline/populate.lua:487
---@param spline table|nil Mesh spline.
---@return number|nil  Effective spacing in meters.
---@return integer|nil  Number of intervals.
function editor_meshSpline_populate.evenFitInfo(spline) end

--- Tells whether the spline is "discrete" (elements placed on the sampling points, like lampposts) rather than tiled: true if spacing exceeds 5 m. The interface uses it to show the "Lock ends" option.
---Source: lua/ge/extensions/editor/meshSpline/populate.lua:480
---@param spline table|nil Mesh spline.
---@return boolean|nil  true/false, or nil/false if the spline or its spacing is absent.
function editor_meshSpline_populate.isDiscreteSpline(spline) end

--- Floor of the "Spacing" slider for this piece: the value that reaches the minimum allowed period (maximum overlap). Below that, the period would be clamped anyway.
---Source: lua/ge/extensions/editor/meshSpline/populate.lua:65
---@param spline table Mesh spline with extentsL_Center / extentsW_Center and rot.
---@return number|nil  Minimum spacing in meters, nil if the mesh length is not yet measured.
function editor_meshSpline_populate.minSpacingFor(spline) end

--- Populates the spline with static mesh instances along its length: samples, distributes the components, adjusts the mesh pools then positions and orients each instance. Exits without doing anything if the spline is locked with its meshes, if the length or the central mesh path is missing, or if there are fewer than 2 subdivided points.
---Source: lua/ge/extensions/editor/meshSpline/populate.lua:294
---@param spline table Mesh spline to populate.
---@param splineIdx integer Index of the spline in the list (1-based).
function editor_meshSpline_populate.populateMeshSpline(spline, splineIdx) end

--- For a Lua reload: the tool lets go of the meshes of a locked spline without deleting them (they belong to the level) and returns their ids per component, for adopt().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshSpline/populate.lua:449
---@param spline table Locked mesh spline.
---@return table<string, integer[]>  Mesh ids by component identifier.
function editor_meshSpline_populate.release(spline) end

--- Removes the spline's static meshes from the scene (if they still exist) and forgets their state.
---Source: lua/ge/extensions/editor/meshSpline/populate.lua:429
---@param spline table Mesh spline.
function editor_meshSpline_populate.tryRemove(spline) end

