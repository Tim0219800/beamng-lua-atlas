---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/assemblySpline/distribution.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Computes, for the Assembly Spline tool, which mesh to place at each location along the spline for each rigid component and each bridge of the molecule. Each component is a group (base mesh + variations): if isRandom, each location draws a variation according to its normalized randomWeight weights; otherwise the enabled variations are alternated in round robin. Only considers components enabled for the spline (mol.getRigidEnabled / getBridgeEnabled).
--- Access: extension `editor_assemblySpline_distribution`: `extensions.load("editor_assemblySpline_distribution")`, then the global `editor_assemblySpline_distribution`
---@class editor_assemblySpline_distribution
editor_assemblySpline_distribution = {}

--- Computes the mesh maps for all rigid components and bridges of the molecule.
---Source: lua/ge/extensions/editor/assemblySpline/distribution.lua:114
---@param molecule table Molecule with the rigids and bridges lists (each entry: mesh, variations, isRandom, randomWeight).
---@param numPlacements integer Number of locations along the spline.
---@param spline table Assembly spline (for the enabled/disabled state of components).
---@return table  rigidMaps: for each rigid (same index as molecule.rigids), array of meshPath per location.
---@return table  bridgeMaps: same for bridges, over numPlacements - 1 locations.
function editor_assemblySpline_distribution.computeMeshMap(molecule, numPlacements, spline) end

