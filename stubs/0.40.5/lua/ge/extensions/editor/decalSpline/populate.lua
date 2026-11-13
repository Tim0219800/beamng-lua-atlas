---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/decalSpline/populate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_decalSpline_populate` : `extensions.load("editor_decalSpline_populate")`, puis la globale `editor_decalSpline_populate`
---@class editor_decalSpline_populate
editor_decalSpline_populate = {}

--- Takes back the decals release() let go of (those still in the scene), as they are, with their templates and folder.
---Source : lua/ge/extensions/editor/decalSpline/populate.lua:291
---@param spline any
---@param kept any
function editor_decalSpline_populate.adopt(spline, kept) end

--- True if the tool holds any decals for the spline.
---Source : lua/ge/extensions/editor/decalSpline/populate.lua:265
---@param spline any
function editor_decalSpline_populate.hasAny(spline) end

--- Populates a decal spline with instances of decals along its length.
---Source : lua/ge/extensions/editor/decalSpline/populate.lua:171
---@param spline any
---@param splines any
function editor_decalSpline_populate.populateDecalSpline(spline, splines) end

--- On a change of num rows/num cols, we need to update the same properties in the other components.
---Source : lua/ge/extensions/editor/decalSpline/populate.lua:313
---@param spline any
---@param componentIdx any
function editor_decalSpline_populate.propagateRowsCols(spline, componentIdx) end

--- Lua reload: the tool lets go of a locked spline's decals without deleting them (they are the level's) and returns their
---  uids per material, with the templates they use, for adopt() to pick up again. Their templates stay counted, so removing the
---  other splines leaves them (and the template folder) in place.
---Source : lua/ge/extensions/editor/decalSpline/populate.lua:275
---@param spline any
function editor_decalSpline_populate.release(spline) end

--- Removes the folder for the shared templates (not while decals a locked spline kept across a Lua reload still use them).
---Source : lua/ge/extensions/editor/decalSpline/populate.lua:160
function editor_decalSpline_populate.removeFolder() end

--- Attempts to removes the decals of the decal spline, from the scene.
---Source : lua/ge/extensions/editor/decalSpline/populate.lua:129
---@param spline any
function editor_decalSpline_populate.tryRemove(spline) end

