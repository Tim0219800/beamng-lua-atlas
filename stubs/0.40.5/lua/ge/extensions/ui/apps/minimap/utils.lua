---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps/minimap/utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shared utilities of the minimap: world / map coordinate conversion (affine transform recomputed at each setMinimapState), clamping within the map limits (circle or square), drawing of simple shapes (circle, line, edge pointer, 50 m grid) and color palettes (Default, Monochrome, Green, Blue, Orange, Grayscale). The minimap module calls setMinimapState every frame; the other modules (roads, route, vehicles) use it to draw. A modder adding a marker on the minimap mostly uses simpleCircleWithEdgePointer and worldToMapXY.
--- Access: extension `ui_apps_minimap_utils`: `extensions.load("ui_apps_minimap_utils")`, then the global `ui_apps_minimap_utils`
---@class ui_apps_minimap_utils
---@field centerPointer nil Exported from a local variable that does not exist: always nil.
---@field colors table<string, color> Exposed colors: orange, orangeMuted, grayMuted, roadBgTransparentBlack, navBgBlack, gridWhite, navBgWhite, navFgBlue.
---@field dpi number Screen scale factor of the minimap, updated by setMinimapState (1 at start).
ui_apps_minimap_utils = {}

--- Clamps pos (modified in place) within the map rectangle expanded by buffer.
---Source: lua/ge/extensions/ui/apps/minimap/utils.lua:152
---@param pos vec3 Map point, modified.
---@param buffer number|nil Margin in pixels (0 by default).
function ui_apps_minimap_utils.clampToMinimapBounds(pos, buffer) end

--- Draws a pointer on the map edge for a world position outside the map (ROUTE_POINTER layer). Draws nothing and returns false if the position is inside.
---Source: lua/ge/extensions/ui/apps/minimap/utils.lua:213
---@param pos vec3 Target world position.
---@param fill color|nil Fill color.
---@param strikeClr color|nil Ignored (outline always white).
---@param radius number|nil Radius in pixels (6 by default).
---@param maxDistance number|nil Max distance to show the pointer (unlimited by default).
---@return boolean  true if a pointer was drawn.
function ui_apps_minimap_utils.drawEdgePointer(pos, fill, strikeClr, radius, maxDistance) end

--- Draws a background grid with a line every 50 world meters, on the BG_GRID layer, around the camera.
---Source: lua/ge/extensions/ui/apps/minimap/utils.lua:251
function ui_apps_minimap_utils.drawGrid() end

--- Returns the active color set (the default index).
---Source: lua/ge/extensions/ui/apps/minimap/utils.lua:385
---@return table  Current color set.
function ui_apps_minimap_utils.getCurrentStyleColors() end

--- Returns the index of the default color set (always 1).
---Source: lua/ge/extensions/ui/apps/minimap/utils.lua:380
---@return integer  Index.
function ui_apps_minimap_utils.getDefaultStyleColorSet() end

--- Returns the list of color sets (Default, Monochrome, Green, Blue, Orange, Grayscale) with color, colorLow, colorLowest, clrFocus, clrFocusMuted, gridWhite, navFg, navBg, grayMuted.
---Source: lua/ge/extensions/ui/apps/minimap/utils.lua:375
---@return table<integer, table>  Array of color sets.
function ui_apps_minimap_utils.getStyleColorSet() end

--- Returns the six coefficients of the world to map affine transform, to pass to the td's transformed drawing functions.
---Source: lua/ge/extensions/ui/apps/minimap/utils.lua:108
---@return number  XX.
---@return number  XYCoef.
---@return number  YX.
---@return number  YY.
---@return number  XOffset.
---@return number  YOffset.
function ui_apps_minimap_utils.getWorldToMapTransform() end

--- Tests whether a map point is inside the map rectangle, optionally shrunk by a margin.
---Source: lua/ge/extensions/ui/apps/minimap/utils.lua:144
---@param pos vec3 Map point.
---@param buffer number|nil Inner margin in pixels (0 by default).
---@return boolean  true if strictly inside.
function ui_apps_minimap_utils.isInsideMinimapBounds(pos, buffer) end

--- Converts a map point (pixels) to a world point (z = 0 before adding the camera position).
---Source: lua/ge/extensions/ui/apps/minimap/utils.lua:135
---@param p vec3 Map point.
---@return vec3  World point.
function ui_apps_minimap_utils.mapToWorld(p) end

--- Brings pos (modified in place) back to the map edge (circle of radius width/2 - inset in circle mode, rectangle otherwise) while keeping the direction from the center.
---Source: lua/ge/extensions/ui/apps/minimap/utils.lua:159
---@param pos vec3 Map point, modified.
---@param inset number|nil Inset from the edge in pixels (0 by default).
---@param maxDistance number|nil Not used.
---@return vec3  pos.
---@return boolean  true if the point was brought back to the edge.
function ui_apps_minimap_utils.setClampToBounds(pos, inset, maxDistance) end

--- Receives from the main minimap the size, center, camera, scale, drawing object, offset, mode (circle by default or square) and dpi, then recomputes the world to map transform coefficients.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/apps/minimap/utils.lua:37
---@param w number Map width in pixels.
---@param h number Map height in pixels.
---@param cx number Map center X.
---@param cy number Map center Y.
---@param cp vec3 Camera position (world).
---@param cr quat Camera rotation.
---@param cri quat Inverse camera rotation.
---@param s number Scale: meters per pixel.
---@param si number Inverse of the scale.
---@param textureDraw table Drawing object (circleMarker, edgePointer, line, lineRoundEndTransformed…).
---@param ox number|nil Horizontal map offset (0 by default).
---@param oy number|nil Vertical map offset (0 by default).
---@param minimapMode string|nil 'circle' (default) or anything else for a square/rectangular map.
---@param dpi number|nil dpi factor (1 by default).
function ui_apps_minimap_utils.setMinimapState(w, h, cx, cy, cp, cr, cri, s, si, textureDraw, ox, oy, minimapMode, dpi) end

--- Draws a circular marker at a world position, on the GAMEPLAY_MARKERS layer (orange with white outline by default).
---Source: lua/ge/extensions/ui/apps/minimap/utils.lua:203
---@param pos vec3 World position.
---@param fill color|nil Fill color.
---@param strikeClr color|nil Outline color.
---@param radius number|nil Radius in pixels (6 by default).
function ui_apps_minimap_utils.simpleCircle(pos, fill, strikeClr, radius) end

--- Draws an edge pointer if the position is off the map, otherwise a simple circle at that position.
---Source: lua/ge/extensions/ui/apps/minimap/utils.lua:217
---@param pos vec3 World position.
---@param fill color|nil Fill.
---@param strikeClr color|nil Outline.
---@param radius number|nil Radius (6 by default).
function ui_apps_minimap_utils.simpleCircleWithEdgePointer(pos, fill, strikeClr, radius) end

--- Draws a round-ended segment between two world positions, on the GAMEPLAY_MARKERS layer.
---Source: lua/ge/extensions/ui/apps/minimap/utils.lua:207
---@param pos1 vec3 World start.
---@param pos2 vec3 World end.
---@param fill color|nil Fill color.
---@param strikeClr color|nil Outline color.
function ui_apps_minimap_utils.simpleLine(pos1, pos2, fill, strikeClr) end

--- Uses the segment's midpoint: edge pointer if it is off the map, otherwise a simple line.
---Source: lua/ge/extensions/ui/apps/minimap/utils.lua:224
---@param pos1 vec3 World start.
---@param pos2 vec3 World end.
---@param fill color|nil Fill.
---@param strikeClr color|nil Outline.
function ui_apps_minimap_utils.simpleLineWithEdgePointer(pos1, pos2, fill, strikeClr) end

--- Converts both ends of a world segment to map coordinates.
---Source: lua/ge/extensions/ui/apps/minimap/utils.lua:101
---@param x1 number World X of A.
---@param y1 number World Y of A.
---@param x2 number World X of B.
---@param y2 number World Y of B.
---@return number  Map X of A.
---@return number  Map Y of A.
---@return number  Map X of B.
---@return number  Map Y of B.
function ui_apps_minimap_utils.worldLineToMapXY(x1, y1, x2, y2) end

--- Converts a world point to a map point (allocating version, recomputed with subtraction, division by the scale and rotation). Prefer worldToMapXY for loops.
---Source: lua/ge/extensions/ui/apps/minimap/utils.lua:73
---@param p vec3 World point.
---@return vec3  Map point (z = 0).
function ui_apps_minimap_utils.worldToMap(p) end

--- Converts world coordinates (x, y) to map coordinates.
---Source: lua/ge/extensions/ui/apps/minimap/utils.lua:96
---@param x number World X.
---@param y number World Y.
---@return number  Map X.
---@return number  Map Y.
function ui_apps_minimap_utils.worldToMapXY(x, y) end

--- Converts source (world x, y) to map coordinates and writes them into target (z = 0), without allocation.
---Source: lua/ge/extensions/ui/apps/minimap/utils.lua:87
---@param target vec3 Output vector (may be the same as source).
---@param source vec3 World point.
function ui_apps_minimap_utils.worldToMapXYZ(target, source) end

