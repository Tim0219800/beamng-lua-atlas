---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadDecorations.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Automatically places decorative objects (TSStatic, for example reflectors or posts) on each side of a DecalRoad, at regular intervals. The objects are placed at terrain height, registered under "decoration.<road>.<file>.<n>" and grouped in a SimGroup added to MissionGroup. A modder calls it from an editor script.
--- Access: extension `editor_roadDecorations`: `extensions.load("editor_roadDecorations")`, then the global `editor_roadDecorations`
---@class editor_roadDecorations
editor_roadDecorations = {}

--- Creates a SimGroup and places in it, every `period` meters, a TSStatic on each side of the road (collisionType 'Collision Mesh', scale 1). The positions are snapped to the terrain (core_terrain.getTerrainHeight) then offset by zOff.
---Source: lua/ge/extensions/editor/roadDecorations.lua:112
---@param roadName string|integer Unique name of the DecalRoad (see bug: must be numeric).
---@param shapeName string Path of the .dae file to place.
---@param distance number Lateral offset from the road edge, in meters.
---@param period number Interval between two pairs of objects, in meters.
---@param rotation quat|nil Extra rotation applied to the objects (nil = none).
---@param zOff number Vertical offset added to the terrain height.
---@param align boolean true: the left side is placed as the exact opposite of the right side (same road length).
---@return integer|nil  Identifier of the created SimGroup, or nil if the road does not exist.
function editor_roadDecorations.decorateProps(roadName, shapeName, distance, period, rotation, zOff, align) end

--- Searches a polyline (road edge) for the point located at the given length from the start, then offsets it laterally. Returns nil if the length exceeds the polyline.
---Source: lua/ge/extensions/editor/roadDecorations.lua:7
---@param spline table<integer, vec3> Points of the road edge (at least 2).
---@param length number Distance from the start, in meters.
---@param distance number Lateral offset toward the outside of the road, in meters.
---@param left boolean true for the left edge (reversed direction), false for the right edge.
---@return table|nil  {point = offset vec3, rotation = quat, edgePos = vec3 on the edge, edgeIdx = integer (C++ index, 0-based)} or nil.
function editor_roadDecorations.findOffsetPoint(spline, length, distance, left) end

