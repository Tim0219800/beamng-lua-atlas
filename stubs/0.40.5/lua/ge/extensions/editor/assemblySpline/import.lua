---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/assemblySpline/import.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_assemblySpline_import` : `extensions.load("editor_assemblySpline_import")`, puis la globale `editor_assemblySpline_import`
---@class editor_assemblySpline_import
editor_assemblySpline_import = {}

--- Convert the selected TSStatic objects to an assembly spline.
---Source : lua/ge/extensions/editor/assemblySpline/import.lua:566
---@param collection any
function editor_assemblySpline_import.convertTSStatics2AssemblySpline(collection) end

--- Handle delayed spline updates.
---  [We need to wait until the collision mesh has been updated, then update the spline which was created by the import.]
---Source : lua/ge/extensions/editor/assemblySpline/import.lua:42
function editor_assemblySpline_import.handleDelayedSplineUpdates() end

--- Import an assembly spline from the given selection polygon.
---Source : lua/ge/extensions/editor/assemblySpline/import.lua:651
---@param polygon any
function editor_assemblySpline_import.importFromPolygon(polygon) end

--- Validate if a TSStatic object has tool-compatible anchor points.
---Source : lua/ge/extensions/editor/assemblySpline/import.lua:145
---@param obj any
function editor_assemblySpline_import.validateToolCompatibleTSStatic(obj) end

