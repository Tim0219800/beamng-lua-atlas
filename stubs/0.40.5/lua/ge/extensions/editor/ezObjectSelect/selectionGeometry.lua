---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Selection geometry of the Easy Select tool: box validation, computation of an object's 8 world corners (oriented box via getObjBox + transform + scale, world-aligned box for vehicles or as a fallback), camera context, bounds signatures to detect that an object has moved, and creation of screen-projected "proxies" (convex hull polygon, area, centroid, distances, volume). These proxies are used to choose the object under the mouse.
--- Access: extension `editor_ezObjectSelect_selectionGeometry`: `extensions.load("editor_ezObjectSelect_selectionGeometry")`, then the global `editor_ezObjectSelect_selectionGeometry`
---@class editor_ezObjectSelect_selectionGeometry
editor_ezObjectSelect_selectionGeometry = {}

--- Compares two signatures element by element.
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:91
---@param first table|nil
---@param second table|nil
---@return boolean  false if one is nil or of different length
function editor_ezObjectSelect_selectionGeometry.boundsSignaturesEqual(first, second) end

--- Captures the editor camera (core_camera position, quat, FOV) and the main imgui viewport.
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:99
---@return table|nil  {pos, rangeOrigin, right, forward, up, halfTan, aspect, width, height, viewportX, viewportY, nearDistance} or nil if data is missing or the viewport is empty
function editor_ezObjectSelect_selectionGeometry.createCameraContext() end

--- Builds an object's proxy for the camera: screen polygon of the convex hull of the corners (clipped at the near plane), area, centroid, camera/view distances, volume, oriented box.
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:414
---@param obj userdata Scene object
---@param camera table Context from createCameraContext
---@param boundsSignature table|nil Signature already computed (otherwise computed)
---@return table|nil  {source, sourceId, boundsType, worldCorners, polygon, area, centroid, cameraDistance, viewDistance, volume, cameraInside, orientedBox, boundsSignature}
---@return string|nil  failure reason if nil
function editor_ezObjectSelect_selectionGeometry.createProjectedProxy(obj, camera, boundsSignature) end

--- Shortcut: createProjectedProxy then updateCursorMetrics then updateRayEntry.
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:464
---@param obj userdata
---@param camera table
---@param mousePosition table {x, y}
---@param rayOrigin vec3|nil
---@param rayDirection vec3|nil
---@return table|nil  proxy
---@return string|nil  failure reason
function editor_ezObjectSelect_selectionGeometry.createProxy(obj, camera, mousePosition, rayOrigin, rayDirection) end

--- Returns a list of numbers describing the current bounds of an object (type, transform, scale, box). Used to compare two states with boundsSignaturesEqual. The result table is reused if provided.
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:55
---@param obj userdata Scene object
---@param result table|nil Table to fill (reused)
---@return table|nil  signature, or nil if no valid box
function editor_ezObjectSelect_selectionGeometry.getBoundsSignature(obj, result) end

--- Box volume (extents x absolute scale for oriented objects).
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:185
---@param obj userdata|nil Scene object
---@return number|nil  volume in m3 (world units), nil if invalid or not finite
function editor_ezObjectSelect_selectionGeometry.getObjectVolume(obj) end

--- The 8 world corners of an object's box.
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:181
---@param obj userdata Scene object
---@return table|nil  list of 8 vec3 (or nil)
---@return string  bounds type, or "invalidBounds"
function editor_ezObjectSelect_selectionGeometry.getWorldCorners(obj) end

--- Adds to the proxy cursorDistance (distance in pixels from the cursor to the polygon, 0 if inside) and centerBias (distance to the centroid divided by the square root of the area).
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:449
---@param proxy table Proxy
---@param mousePosition table {x, y} relative to the viewport
---@return table  the same proxy
function editor_ezObjectSelect_selectionGeometry.updateCursorMetrics(proxy, mousePosition) end

--- Adds proxy.rayEntry: entry distance of the ray into the oriented box (math.huge if it misses it or without a ray).
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:458
---@param proxy table Proxy
---@param rayOrigin vec3|nil
---@param rayDirection vec3|nil
---@return table  the same proxy
function editor_ezObjectSelect_selectionGeometry.updateRayEntry(proxy, rayOrigin, rayDirection) end

--- Tests that a box has finite minExtents/maxExtents (|v| < 1e10, no NaN) and min <= max on each axis.
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:23
---@param box table|nil Box with minExtents and maxExtents
---@return boolean
function editor_ezObjectSelect_selectionGeometry.validBox(box) end

