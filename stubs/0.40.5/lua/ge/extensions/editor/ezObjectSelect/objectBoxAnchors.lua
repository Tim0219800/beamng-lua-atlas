---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/objectBoxAnchors.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Computes anchor points on the bottom of an object's bounding box for the Easy Select tool. Three patterns are produced: shortEdge (middle of the short side, at z min), longEdge (middle of the long side) and shortEdgeOrigin (like shortEdge but at local z = 0, at the origin level). The "long" axis is X if the scaled extent in X >= that in Y. Used to describe reference edges for moving/snapping.
--- Access: extension `editor_ezObjectSelect_objectBoxAnchors`: `extensions.load("editor_ezObjectSelect_objectBoxAnchors")`, then the global `editor_ezObjectSelect_objectBoxAnchors`
---@class editor_ezObjectSelect_objectBoxAnchors
editor_ezObjectSelect_objectBoxAnchors = {}

--- Describes a local box (methods getCenter/getExtents and minExtents/maxExtents). Returns nil if the box is not valid.
---Source: lua/ge/extensions/editor/ezObjectSelect/objectBoxAnchors.lua:54
---@param box table Local bounding box
---@param scale vec3|nil Object scale (default 1,1,1)
---@return table|nil  {isLongX, scaledX, scaledY, shortEdge, longEdge, shortEdgeOrigin}, each edge having firstLocal/secondLocal
function editor_ezObjectSelect_objectBoxAnchors.describeBox(box, scale) end

--- Same as describeBox for a simple mesh box {minExtents, maxExtents, center, extents}. nil if a field is missing.
---Source: lua/ge/extensions/editor/ezObjectSelect/objectBoxAnchors.lua:59
---@param meshBox table Mesh box
---@param scale vec3|nil Scale (default 1,1,1)
---@return table|nil  Same structure as describeBox
function editor_ezObjectSelect_objectBoxAnchors.describeMeshBox(meshBox, scale) end

--- Describes a scene object in world coordinates. Uses getObjBox + getTransform + getScale if possible; otherwise falls back to the world box getWorldBox. Each pattern contains first, second, firstOffset, secondOffset, centerOffset (offsets relative to the object's position).
---Source: lua/ge/extensions/editor/ezObjectSelect/objectBoxAnchors.lua:88
---@param obj userdata Scene object (must have getPosition)
---@return table|nil  {isLongX, scaledX, scaledY, shortEdge, longEdge, shortEdgeOrigin} or nil if no valid box
function editor_ezObjectSelect_objectBoxAnchors.describeObject(obj) end

