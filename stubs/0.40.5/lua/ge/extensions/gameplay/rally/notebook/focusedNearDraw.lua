---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/notebook/focusedNearDraw.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Debug drawing of the rally note (pacenotes) editor: when the camera is close to the notes, only draws the portion of the road (snaproad) and the notes near the point the camera is aimed at. The aimed point (pivot) is the snaproad position closest to the camera ray. The road prisms are progressively shrunk toward the minimum window (nearbyCount notes on each side) as the camera gets closer. Used by the editor's pacenotes tool.
--- Access: extension `gameplay_rally_notebook_focusedNearDraw`: `extensions.load("gameplay_rally_notebook_focusedNearDraw")`, then the global `gameplay_rally_notebook_focusedNearDraw`
---@class gameplay_rally_notebook_focusedNearDraw
gameplay_rally_notebook_focusedNearDraw = {}

--- Prepares the drawing context: note entries (start/end distances along the route), pivot, window [startDistance, endDistance] of the route to draw. The window goes from the minimum window (neighboring notes) to the whole route depending on the camera distance.
---Source: lua/ge/extensions/gameplay/rally/notebook/focusedNearDraw.lua:253
---@param path table Notebook (path.pacenotes.sorted).
---@param snaproad table Snaproad (must have totalRouteLength).
---@param pacenoteToolsState table Tool state.
---@param maxDistance number|nil Maximum camera-to-notes distance in meters (default 650).
---@param nearbyCount integer|nil Number of notes kept on each side of the pivot (default 3).
---@return table|nil  {entries, pivotLoc, pointDistances, startDistance, endDistance, totalLength} or nil if there is nothing to draw.
function gameplay_rally_notebook_focusedNearDraw.buildContext(path, snaproad, pacenoteToolsState, maxDistance, nearbyCount) end

--- Draws the road prisms of the context window, then each note whose extent overlaps the window via pacenote:drawDebugPacenoteNoSelection.
---Source: lua/ge/extensions/gameplay/rally/notebook/focusedNearDraw.lua:350
---@param context table|nil Result of buildContext.
---@param path table Notebook (not used directly).
---@param snaproad table Snaproad.
---@param pacenoteToolsState table Tool state.
---@param globalOpacity number|nil Global opacity (default 1).
---@param prismWidth number|nil Prism width in meters (default 1.945).
---@param drawOnTop boolean|nil true to draw over the geometry (no depth test).
function gameplay_rally_notebook_focusedNearDraw.draw(context, path, snaproad, pacenoteToolsState, globalOpacity, prismWidth, drawOnTop) end

--- Returns the location on the snaproad closest to the ray from the camera (position, segment, xnorm, distanceAlongRoute...). If the snaproad does not expose _allPoints, or if the camera has no direction, uses the snaproad point closest to the camera. The result is cached as long as the camera does not move.
---Source: lua/ge/extensions/gameplay/rally/notebook/focusedNearDraw.lua:104
---@param pacenoteToolsState table Tool state (serves as cache).
---@param snaproad table Snaproad object (closestSnapResult, _allPoints, routeLocationForPoint).
---@param cameraPos vec3 Camera position.
---@param pointDistances table<integer, number>|nil Cumulative distances along the route, by point index or id.
---@return table|nil  Location {pos, fromPoint, toPoint, nearestPoint, segmentIndex, xnorm, distanceAlongRoute, distSq, rayPos} or nil.
function gameplay_rally_notebook_focusedNearDraw.getCameraLookSnaproadLocation(pacenoteToolsState, snaproad, cameraPos, pointDistances) end

