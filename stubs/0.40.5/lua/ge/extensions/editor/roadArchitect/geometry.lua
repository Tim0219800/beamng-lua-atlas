---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/geometry.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_roadArchitect_geometry` : `extensions.load("editor_roadArchitect_geometry")`, puis la globale `editor_roadArchitect_geometry`
---@class editor_roadArchitect_geometry
editor_roadArchitect_geometry = {}

--- Computes the geometric data for the given road, ready for rendering.
---  This function performs either CR-spline-fitting or line-spline-arc-spline-line (civil engineering style) fitting to the reference nodes.
---  The structure is indexed as [point][lane id][1:12] where:
---   [1:4] are the cross sectional points, clockwise from top-left,
---   [5:6] are the unit normal/lateral vectors (same for all lanes),
---   [7] is the lane midpoint position at the point,
---   [8] is the lane type (string).
---   [9:11] is the lane width and left/right relative heights.
---   [12] is the signed lateral rotation angle (super-elevation), same for all lanes.
---   [13] The lateral lane offset value (same for every lane, at this disc. pt).
---Source : lua/ge/extensions/editor/roadArchitect/geometry.lua:533
---@param road any
function editor_roadArchitect_geometry.computeRoadRenderData(road) end

