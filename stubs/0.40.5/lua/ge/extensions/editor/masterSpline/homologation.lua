---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/masterSpline/homologation.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Master Spline tool utility to "homologate" a spline against a road standard preset (roadDesignStandards): it measures the geometric deviations (slope, turn radius, banking, width gradient) and corrects them iteratively. The active mode is spline.splineAnalysisMode: 0 slope, 1 radius, 2 banking, 3 width. The preset comes from spline.homologationPreset.
--- Access: extension `editor_masterSpline_homologation`: `extensions.load("editor_masterSpline_homologation")`, then the global `editor_masterSpline_homologation`
---@class editor_masterSpline_homologation
editor_masterSpline_homologation = {}

--- Analyzes the spline with the current metric (spline.splineAnalysisMode) and fills the matching normalized error array, from divPoints/divWidths and the homologation preset.
---Source: lua/ge/extensions/editor/masterSpline/homologation.lua:218
---@param spline table Spline with nodes, divPoints, divWidths, nmls, homologationPreset and splineAnalysisMode.
function editor_masterSpline_homologation.analyseSpline(spline) end

--- Returns the number of optimization iterations to run per frame (5).
---Source: lua/ge/extensions/editor/masterSpline/homologation.lua:46
---@return integer  Iterations per frame.
function editor_masterSpline_homologation.getOptimisationIterationsPerFrame() end

--- Recomputes the geometry (catmullRomFree), analyzes the spline, marks it isDirty, then runs numIter iterations of the optimizer matching the mode (slope, radius, banking or width). Modifies the nodes, normals or widths in place.
---Source: lua/ge/extensions/editor/masterSpline/homologation.lua:406
---@param spline table Spline to optimize.
---@param numIter integer Number of iterations to run in this call (typically getOptimisationIterationsPerFrame()).
function editor_masterSpline_homologation.optimiseSpline(spline, numIter) end

