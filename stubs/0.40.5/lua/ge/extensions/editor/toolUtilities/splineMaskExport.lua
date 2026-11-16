---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/splineMaskExport.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Exports ribbon surfaces (splines) as a 16-bit PNG mask (GFXFormatR16) at the terrain grid size. Each texel is 65535 if its world center is inside a quadrilateral, 0 otherwise. Used by spline tools to make a mask usable by the terrain editor (painting). Requires a loaded terrain and the editor_terrainEditor extension.
--- Access: extension `editor_toolUtilities_splineMaskExport`: `extensions.load("editor_toolUtilities_splineMaskExport")`, then the global `editor_toolUtilities_splineMaskExport`
---@class editor_toolUtilities_splineMaskExport
editor_toolUtilities_splineMaskExport = {}

--- Builds a kd-tree of the sources' quadrilaterals (enlarged by `margin`), rasterizes a bitmap of the terrain size and saves it as PNG.
---Source: lua/ge/extensions/editor/toolUtilities/splineMaskExport.lua:19
---@param filepath string Path of the .png file to write.
---@param sources table Table of tables of quadrilaterals representing the ribbon surfaces.
---@param margin number|nil Margin added around the quadrilaterals (0 by default), in meters (inferred from code).
function editor_toolUtilities_splineMaskExport.export(filepath, sources, margin) end

