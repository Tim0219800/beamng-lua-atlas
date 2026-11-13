---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/meshSpline/populationEngine.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_meshSpline_populationEngine` : `extensions.load("editor_meshSpline_populationEngine")`, puis la globale `editor_meshSpline_populationEngine`
---@class editor_meshSpline_populationEngine
editor_meshSpline_populationEngine = {}

---Source : lua/ge/extensions/editor/meshSpline/populationEngine.lua:10
---@param spline any
function editor_meshSpline_populationEngine.clearDerivedGeometry(spline) end

---Source : lua/ge/extensions/editor/meshSpline/populationEngine.lua:75
---@param positions any
---@param tangents any
---@param normals any
---@param index any
---@param outPosition any
---@param outTangent any
---@param outUp any
---@param previousAcross any
function editor_meshSpline_populationEngine.intervalFrame(positions, tangents, normals, index, outPosition, outTangent, outUp, previousAcross) end

--- When `useEvenFit` is true, `spacing` is treated as a TARGET: an item is locked to both ends and the interior is spaced
---  as evenly as possible near that target (see geom.sampleSplineEvenFit). Otherwise it's the usual fixed-period walk.
---Source : lua/ge/extensions/editor/meshSpline/populationEngine.lua:46
---@param spline any
---@param spacing any
---@param outPositions any
---@param outTangents any
---@param outNormals any
---@param useEvenFit any
function editor_meshSpline_populationEngine.sample(spline, spacing, outPositions, outTangents, outNormals, useEvenFit) end

---Source : lua/ge/extensions/editor/meshSpline/populationEngine.lua:19
---@param spline any
---@param minimumDivisions any
function editor_meshSpline_populationEngine.updateGeometry(spline, minimumDivisions) end

