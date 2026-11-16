---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/subtools/fence/anchors.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Automatic fence discovery in the Easy Object Select tool. From a starting TSStatic (whose mesh is in the list of allowed assets), it looks for neighboring TSStatics whose anchors (midpoints of the short sides of the box, via objectBoxAnchors) mutually match within options.distance, builds the connection graph, orders the pieces, detects a loop and computes the spline junction points. draw() draws these junctions with debugDrawer.
--- Access: extension `editor_ezObjectSelect_subtools_fence_anchors`: `extensions.load("editor_ezObjectSelect_subtools_fence_anchors")`, then the global `editor_ezObjectSelect_subtools_fence_anchors`
---@class editor_ezObjectSelect_subtools_fence_anchors
editor_ezObjectSelect_subtools_fence_anchors = {}

--- Does a breadth-first walk over the fence pieces connected to the seed. Returns nil and a message if the starting object is not an eligible piece.
---Source: lua/ge/extensions/editor/ezObjectSelect/subtools/fence/anchors.lua:184
---@param seedObjectId integer ID of the starting TSStatic object.
---@param options table|nil assetPaths (string[], allowed meshes), distance (m, default 0.5, min 0.001), maximumPieces (default 2048).
---@return table|nil  {ids (ordered), graph, descriptors, joints (vec3[]), isLoop, capped}.
---@return string|nil  Error message if nil.
function editor_ezObjectSelect_subtools_fence_anchors.discover(seedObjectId, options) end

--- Draws with debugDrawer:drawLine the polyline of the junctions (and the closing segment if loop) from the discover result.
---Source: lua/ge/extensions/editor/ezObjectSelect/subtools/fence/anchors.lua:251
---@param result table|nil Result of discover; does nothing if nil.
function editor_ezObjectSelect_subtools_fence_anchors.draw(result) end

