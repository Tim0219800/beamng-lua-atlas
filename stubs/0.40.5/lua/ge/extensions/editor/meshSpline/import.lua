---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/meshSpline/import.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_meshSpline_import` : `extensions.load("editor_meshSpline_import")`, puis la globale `editor_meshSpline_import`
---@class editor_meshSpline_import
editor_meshSpline_import = {}

--- Convert the selected TSStatic objects to a mesh spline.
---Source : lua/ge/extensions/editor/meshSpline/import.lua:508
---@param collection any
function editor_meshSpline_import.convertTSStatics2MeshSpline(collection) end

--- Handle delayed spline updates.
---  [We need to wait until the collision mesh has been updated, then update the spline which was created by the import.]
---Source : lua/ge/extensions/editor/meshSpline/import.lua:35
function editor_meshSpline_import.handleDelayedSplineUpdates() end

--- Import a mesh spline from the given selection polygon.
---Source : lua/ge/extensions/editor/meshSpline/import.lua:627
---@param polygon any
function editor_meshSpline_import.importFromPolygon(polygon) end

