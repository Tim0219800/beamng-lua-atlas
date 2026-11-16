---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/meshSpline/populationEngine.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small geometry engine used by the Mesh Spline tool: it computes the derived geometry of a spline (subdivided points, widths, tangents, normals) from its control nodes (Catmull-Rom, free, projected onto the terrain or by raycast), then samples positions along this curve to place meshes. Relies on editor/toolUtilities/geom and util. Called by splineMgr and populate, not by a modder directly.
--- Access: extension `editor_meshSpline_populationEngine`: `extensions.load("editor_meshSpline_populationEngine")`, then the global `editor_meshSpline_populationEngine`
---@class editor_meshSpline_populationEngine
editor_meshSpline_populationEngine = {}

--- Clears the spline's derived tables: divPoints, divWidths, tangents, binormals, normals and discMap.
---Source: lua/ge/extensions/editor/meshSpline/populationEngine.lua:10
---@param spline table Mesh Spline tool spline.
function editor_meshSpline_populationEngine.clearDerivedGeometry(spline) end

--- Computes the local frame (position, tangent, up vector) of the interval between samples index and index+1 (geom.ribbonIntervalFrame).
---Source: lua/ge/extensions/editor/meshSpline/populationEngine.lua:75
---@param positions table Sampled positions.
---@param tangents table Sampled tangents.
---@param normals table Sampled normals.
---@param index integer Start index of the interval (1-based).
---@param outPosition vec3 Receives the position (inferred from code).
---@param outTangent vec3 Receives the tangent (inferred from code).
---@param outUp vec3 Receives the up vector (inferred from code).
---@param previousAcross vec3|nil Transverse vector of the previous interval, for continuity (inferred from code).
---@return boolean  false if positions[index] or positions[index+1] does not exist, otherwise true.
function editor_meshSpline_populationEngine.intervalFrame(positions, tangents, normals, index, outPosition, outTangent, outUp, previousAcross) end

--- Samples the spline at regular intervals. With useEvenFit, spacing is a target: an element is locked at both ends and the interior is spaced as uniformly as possible (geom.sampleSplineEvenFit, accounts for isLoop). Otherwise walks at a fixed period (geom.sampleSpline).
---Source: lua/ge/extensions/editor/meshSpline/populationEngine.lua:46
---@param spline table Spline with divPoints, tangents, normals, isLoop.
---@param spacing number Period in meters between two positions.
---@param outPositions table Table filled with the positions.
---@param outTangents table Table filled with the tangents.
---@param outNormals table Table filled with the normals.
---@param useEvenFit boolean|nil Enables end-locked sampling.
---@return table  outPositions.
---@return table  outTangents.
---@return table  outNormals.
function editor_meshSpline_populationEngine.sample(spline, spacing, outPositions, outTangents, outNormals, useEvenFit) end

--- Recomputes the spline's derived geometry. With fewer than 2 nodes, clears the geometry and returns false. If isConformToTerrain: lowers the nodes onto the terrain (terrainOnly) or by vertical raycast, then uses catmullRomConformToTerrain / catmullRomRaycast; otherwise catmullRomFree.
---Source: lua/ge/extensions/editor/meshSpline/populationEngine.lua:19
---@param spline table Spline with nodes, widths, nmls, isConformToTerrain, terrainOnly, rayPostFloat.
---@param minimumDivisions integer Minimum number of subdivisions per segment (passed to geom).
---@return boolean  true if the spline has at least 2 subdivided points after computation.
function editor_meshSpline_populationEngine.updateGeometry(spline, minimumDivisions) end

