---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/geometry.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Geometry module of the Road Architect editor (GE). It turns a road's reference nodes into discretized points along a spline, then computes for each point and each lane the four corners of the cross section, the normal and lateral vectors, the banking, etc. The result is stored in road.renderData and is used for display and for creating DecalRoads/meshes. A modder only uses it to recompute or read this data from an editing tool.
--- Access: extension `editor_roadArchitect_geometry`: `extensions.load("editor_roadArchitect_geometry")`, then the global `editor_roadArchitect_geometry`
---@class editor_roadArchitect_geometry
editor_roadArchitect_geometry = {}

--- Computes the render data of the given road and stores it in road.renderData. Chooses the fitting according to the road: civil engineering style (road.isCivilEngRoads[0]), circular arc (road.isArc, three nodes) or centripetal Catmull-Rom spline by default. Beforehand, applies terrain projection, auto-banking and hairpin widening if these options are active.
---Source: lua/ge/extensions/editor/roadArchitect/geometry.lua:533
---@param road table Road Architect road (nodes, profile, laneKeys, leftKeys, rightKeys, renderData, tunnels, imgui options...). Modified in place.
function editor_roadArchitect_geometry.computeRoadRenderData(road) end

