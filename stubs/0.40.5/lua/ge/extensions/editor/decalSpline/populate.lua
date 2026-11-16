---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/decalSpline/populate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module that populates a spline with decal instances (DecalData + engine instances) along its length, for the Decal Spline tool. It samples the spline by arc length with a step of (4.0 m decal length + spline.spacing), distributes the components (materials) alternately or randomly according to their probability, orients each decal with the Frenet frame, Z jitter and pre-rotation, and places it in the middle of its cell. It maintains the shared DecalData templates in a "DecalSpline - Templates ..." SimGroup under MissionGroup, with instance counters to delete a template that has become unused.
--- Access: extension `editor_decalSpline_populate`: `extensions.load("editor_decalSpline_populate")`, then the global `editor_decalSpline_populate`
---@class editor_decalSpline_populate
editor_decalSpline_populate = {}

--- Takes back the decals released by release() that are still present in the scene (found by uid via Engine.Render.DecalMgr), with their templates and their folder, and restores the counters.
---Source: lua/ge/extensions/editor/decalSpline/populate.lua:291
---@param spline table spline taking back its decals
---@param kept table table returned by release()
function editor_decalSpline_populate.adopt(spline, kept) end

--- Indicates whether the tool holds decals for this spline.
---Source: lua/ge/extensions/editor/decalSpline/populate.lua:265
---@param spline table spline tested
---@return boolean  true if at least one instance exists
function editor_decalSpline_populate.hasAny(spline) end

--- Creates the decal instances along the spline, creating the DecalData templates as needed (texRows, texCols, material).
---Source: lua/ge/extensions/editor/decalSpline/populate.lua:171
---@param spline table decal spline (divPoints, tangents, normals, spacing, jitter, components 1 to 4...)
---@param splines table[] all splines, cleaned if the templates folder must be recreated
function editor_decalSpline_populate.populateDecalSpline(spline, splines) end

--- When rows/columns (numRows/numCols) change for a component, copies these values to the other components that use the same material and clamps their frame to numRows*numCols-1.
---Source: lua/ge/extensions/editor/decalSpline/populate.lua:313
---@param spline table modified spline
---@param componentIdx integer number of the modified component, from 1 to 4
function editor_decalSpline_populate.propagateRowsCols(spline, componentIdx) end

--- For a Lua reload: lets go of the decals of a locked spline without deleting them and returns their uids by material, with the templates used and the folder id, so that adopt() can take them back. Their templates stay counted.
---Source: lua/ge/extensions/editor/decalSpline/populate.lua:275
---@param spline table locked spline
---@return table  {folderId, uids = {material = uid[]}, templates = {material = id}}
function editor_decalSpline_populate.release(spline) end

--- Deletes the folder (SimGroup) of the shared templates, unless decals kept by a locked spline during a Lua reload still use it.
---Source: lua/ge/extensions/editor/decalSpline/populate.lua:160
function editor_decalSpline_populate.removeFolder() end

--- Removes the spline's decal instances from the scene (editor.deleteDecalInstance), decrements the counters then deletes the templates whose counter drops below 1.
---Source: lua/ge/extensions/editor/decalSpline/populate.lua:129
---@param spline table spline whose decals are removed
function editor_decalSpline_populate.tryRemove(spline) end

