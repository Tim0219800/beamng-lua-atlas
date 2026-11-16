---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/meshSpline/import.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Import into the Mesh Spline tool: turns TSStatic objects already placed in the level into an equivalent mesh spline. The TSStatic are ordered into a polyline (editor/toolUtilities/fitPoly), simplified (RDP), analyzed (mesh pattern, start and end caps) then converted; the original objects are deleted, along with their empty groups, and the operation is recorded in the history (undo/redo). Called from meshSpline.lua (scenetree context menu or selection polygon).
--- Access: extension `editor_meshSpline_import`: `extensions.load("editor_meshSpline_import")`, then the global `editor_meshSpline_import`
---@class editor_meshSpline_import
editor_meshSpline_import = {}

--- Converts the given TSStatic into a mesh spline: filters the valid TSStatic, orders them into a polyline, creates the spline, deletes the original objects (and their groups that became empty), records the history action and triggers the collision reload.
---Source: lua/ge/extensions/editor/meshSpline/import.lua:508
---@param collection integer[] Object identifiers (typically editor.selection.object).
function editor_meshSpline_import.convertTSStatics2MeshSpline(collection) end

--- Handles the deferred update after an import: if an import has just happened, counts frames; at the 2nd, marks the last mesh spline as isDirty to force its rebuild once the collision is reloaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/meshSpline/import.lua:35
function editor_meshSpline_import.handleDelayedSplineUpdates() end

--- Imports a mesh spline from a selection polygon drawn by the user: collects the TSStatic whose position is inside the polygon (pos:inPolygon) then converts them.
---Source: lua/ge/extensions/editor/meshSpline/import.lua:627
---@param polygon table Selection polygon (list of points) provided by toolUtilities/polygon.
function editor_meshSpline_import.importFromPolygon(polygon) end

