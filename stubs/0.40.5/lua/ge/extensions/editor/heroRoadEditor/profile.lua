---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/profile.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Cross-section profile of a Hero Road Editor group. Turns the lane, crown and shoulder parameters into a 2D cut per station (lateral offset o, vertical deviation dz relative to the centerline plane) and a superelevation (bank) angle driven by curvature. mesh.lua sweeps these cuts along the road to build the surface. Also handles widening in curves, placed widenings (laybys, lanes, intersections), flat ends and an anti-fold cap on the inner edge.
--- Access: extension `editor_heroRoadEditor_profile`: `extensions.load("editor_heroRoadEditor_profile")`, then the global `editor_heroRoadEditor_profile`
---@class editor_heroRoadEditor_profile
---@field MAT_ROAD string Material key of the 'road' band (resolved to a real material in mesh.lua).
---@field MAT_SHOULDER string Material key of the 'shoulder' band.
editor_heroRoadEditor_profile = {}

--- Builds the per-station cuts and the superelevation for the group. Each cut is a list of points {o, dz} from left to right.
---Source: lua/ge/extensions/editor/heroRoadEditor/profile.lua:283
---@param group table Hero Road group (divPoints, tangents, divCurv, discMap, corners, widenings, junctions, profile parameters).
---@return table|nil  Array over divPoints of { pts = {{o, dz}, ...}, bank = angle in radians }, or nil if the geometry is not ready.
---@return string[]|nil  Material key per band (MAT_ROAD or MAT_SHOULDER), one entry per cut segment.
function editor_heroRoadEditor_profile.build(group) end

--- Smallest centerline radius (m) that the group can round before the inner-edge fold cap bites: inner half-width (max width + shoulder + chamfer + half of the max widening) divided by 0.8, plus 1.5 m margin.
---Source: lua/ge/extensions/editor/heroRoadEditor/profile.lua:349
---@param group table Hero Road group.
---@return number  Minimum safe radius in meters.
function editor_heroRoadEditor_profile.minSafeRadius(group) end

--- Cut of a straight section (full crown, no superelevation or fold cap) for the interface's read-only preview.
---Source: lua/ge/extensions/editor/heroRoadEditor/profile.lua:360
---@param group table Hero Road group.
---@return table  List of points {o, dz}.
---@return string[]  Material per band.
function editor_heroRoadEditor_profile.previewCrossSection(group) end

