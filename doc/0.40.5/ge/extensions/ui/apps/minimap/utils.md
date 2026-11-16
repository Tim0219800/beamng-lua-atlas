# `ui_apps_minimap_utils`

*File: `lua/ge/extensions/ui/apps/minimap/utils.lua` · VM: Game Engine (GE) · 391 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_apps_minimap_utils`: `extensions.load("ui_apps_minimap_utils")`, then the global `ui_apps_minimap_utils`

Shared utilities of the minimap: world / map coordinate conversion (affine transform recomputed at each setMinimapState), clamping within the map limits (circle or square), drawing of simple shapes (circle, line, edge pointer, 50 m grid) and color palettes (Default, Monochrome, Green, Blue, Orange, Grayscale). The minimap module calls setMinimapState every frame; the other modules (roads, route, vehicles) use it to draw. A modder adding a marker on the minimap mostly uses simpleCircleWithEdgePointer and worldToMapXY.

## Example

```lua
ui_apps_minimap_utils.simpleCircleWithEdgePointer(vec3(100, 200, 0), ui_apps_minimap_utils.colors.orange, nil, 8)
```

## Notes

- No drawing function works before the first setMinimapState (td, width, height… are nil).
- The world to map matrix: x_map = x*XX + y*XYCoef + XOffset; y_map = x*YX + y*YY + YOffset; the map's Y axis is inverted.
- Bug: M.centerPointer is exported but the local variable centerPointer does not exist; the field is nil.
- The local function worldToMapXYInverse (world from map) is defined but never exported; mapToWorld, for its part, uses centerX/centerY and the inverse rotation.
- drawEdgePointer ignores its strikeClr parameter: the outline is always white and the border clrNavBg (white). setClampToBounds does not use it either: its maxDistance parameter is unused.
- Colors are color(r,g,b,a) objects with components from 0 to 255.
- The color set used is always index 1 (Default): defaultStyleRoadColorSet is a local constant, not modifiable from outside.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_apps_minimap_utils.clampToMinimapBounds(pos, buffer)` | Clamps pos (modified in place) within the map rectangle expanded by buffer. | 152 |
| `ui_apps_minimap_utils.drawEdgePointer(pos, fill, strikeClr, radius, maxDistance)` | Draws a pointer on the map edge for a world position outside the map (ROUTE_POINTER layer). Draws nothing and returns false if the position is inside. | 213 |
| `ui_apps_minimap_utils.drawGrid()` | Draws a background grid with a line every 50 world meters, on the BG_GRID layer, around the camera. | 251 |
| `ui_apps_minimap_utils.getCurrentStyleColors()` | Returns the active color set (the default index). | 385 |
| `ui_apps_minimap_utils.getDefaultStyleColorSet()` | Returns the index of the default color set (always 1). | 380 |
| `ui_apps_minimap_utils.getStyleColorSet()` | Returns the list of color sets (Default, Monochrome, Green, Blue, Orange, Grayscale) with color, colorLow, colorLowest, clrFocus, clrFocusMuted, gridWhite, navFg, navBg, grayMuted. | 375 |
| `ui_apps_minimap_utils.getWorldToMapTransform()` | Returns the six coefficients of the world to map affine transform, to pass to the td's transformed drawing functions. | 108 |
| `ui_apps_minimap_utils.isInsideMinimapBounds(pos, buffer)` | Tests whether a map point is inside the map rectangle, optionally shrunk by a margin. | 144 |
| `ui_apps_minimap_utils.mapToWorld(p)` | Converts a map point (pixels) to a world point (z = 0 before adding the camera position). | 135 |
| `ui_apps_minimap_utils.setClampToBounds(pos, inset, maxDistance)` | Brings pos (modified in place) back to the map edge (circle of radius width/2 - inset in circle mode, rectangle otherwise) while keeping the direction from the center. | 159 |
| `ui_apps_minimap_utils.setMinimapState(w, h, cx, cy, cp, cr, cri, s, si, textureDraw, ox, oy, minimapMode, dpi)` | Receives from the main minimap the size, center, camera, scale, drawing object, offset, mode (circle by default or square) and dpi, then recomputes the world to map transform coefficients. *(internal)* | 37 |
| `ui_apps_minimap_utils.simpleCircle(pos, fill, strikeClr, radius)` | Draws a circular marker at a world position, on the GAMEPLAY_MARKERS layer (orange with white outline by default). | 203 |
| `ui_apps_minimap_utils.simpleCircleWithEdgePointer(pos, fill, strikeClr, radius)` | Draws an edge pointer if the position is off the map, otherwise a simple circle at that position. | 217 |
| `ui_apps_minimap_utils.simpleLine(pos1, pos2, fill, strikeClr)` | Draws a round-ended segment between two world positions, on the GAMEPLAY_MARKERS layer. | 207 |
| `ui_apps_minimap_utils.simpleLineWithEdgePointer(pos1, pos2, fill, strikeClr)` | Uses the segment's midpoint: edge pointer if it is off the map, otherwise a simple line. | 224 |
| `ui_apps_minimap_utils.worldLineToMapXY(x1, y1, x2, y2)` | Converts both ends of a world segment to map coordinates. | 101 |
| `ui_apps_minimap_utils.worldToMap(p)` | Converts a world point to a map point (allocating version, recomputed with subtraction, division by the scale and rotation). Prefer worldToMapXY for loops. | 73 |
| `ui_apps_minimap_utils.worldToMapXY(x, y)` | Converts world coordinates (x, y) to map coordinates. | 96 |
| `ui_apps_minimap_utils.worldToMapXYZ(target, source)` | Converts source (world x, y) to map coordinates and writes them into target (z = 0), without allocation. | 87 |

### Parameter details

#### `ui_apps_minimap_utils.clampToMinimapBounds(pos, buffer)`

Clamps pos (modified in place) within the map rectangle expanded by buffer.

- `pos` (*vec3*) : Map point, modified.
- `buffer` (*number|nil*) : Margin in pixels (0 by default).

#### `ui_apps_minimap_utils.drawEdgePointer(pos, fill, strikeClr, radius, maxDistance)`

Draws a pointer on the map edge for a world position outside the map (ROUTE_POINTER layer). Draws nothing and returns false if the position is inside.

- `pos` (*vec3*) : Target world position.
- `fill` (*color|nil*) : Fill color.
- `strikeClr` (*color|nil*) : Ignored (outline always white).
- `radius` (*number|nil*) : Radius in pixels (6 by default).
- `maxDistance` (*number|nil*) : Max distance to show the pointer (unlimited by default).
- **returns**: boolean true if a pointer was drawn.

#### `ui_apps_minimap_utils.getCurrentStyleColors()`

Returns the active color set (the default index).

- **returns**: table Current color set.

#### `ui_apps_minimap_utils.getDefaultStyleColorSet()`

Returns the index of the default color set (always 1).

- **returns**: integer Index.

#### `ui_apps_minimap_utils.getStyleColorSet()`

Returns the list of color sets (Default, Monochrome, Green, Blue, Orange, Grayscale) with color, colorLow, colorLowest, clrFocus, clrFocusMuted, gridWhite, navFg, navBg, grayMuted.

- **returns**: table<integer, table> Array of color sets.

#### `ui_apps_minimap_utils.getWorldToMapTransform()`

Returns the six coefficients of the world to map affine transform, to pass to the td's transformed drawing functions.

- **returns**: number XX.
- **returns**: number XYCoef.
- **returns**: number YX.
- **returns**: number YY.
- **returns**: number XOffset.
- **returns**: number YOffset.

#### `ui_apps_minimap_utils.isInsideMinimapBounds(pos, buffer)`

Tests whether a map point is inside the map rectangle, optionally shrunk by a margin.

- `pos` (*vec3*) : Map point.
- `buffer` (*number|nil*) : Inner margin in pixels (0 by default).
- **returns**: boolean true if strictly inside.

#### `ui_apps_minimap_utils.mapToWorld(p)`

Converts a map point (pixels) to a world point (z = 0 before adding the camera position).

- `p` (*vec3*) : Map point.
- **returns**: vec3 World point.

#### `ui_apps_minimap_utils.setClampToBounds(pos, inset, maxDistance)`

Brings pos (modified in place) back to the map edge (circle of radius width/2 - inset in circle mode, rectangle otherwise) while keeping the direction from the center.

- `pos` (*vec3*) : Map point, modified.
- `inset` (*number|nil*) : Inset from the edge in pixels (0 by default).
- `maxDistance` (*number|nil*) : Not used.
- **returns**: vec3 pos.
- **returns**: boolean true if the point was brought back to the edge.

#### `ui_apps_minimap_utils.setMinimapState(w, h, cx, cy, cp, cr, cri, s, si, textureDraw, ox, oy, minimapMode, dpi)`

Receives from the main minimap the size, center, camera, scale, drawing object, offset, mode (circle by default or square) and dpi, then recomputes the world to map transform coefficients.

- `w` (*number*) : Map width in pixels.
- `h` (*number*) : Map height in pixels.
- `cx` (*number*) : Map center X.
- `cy` (*number*) : Map center Y.
- `cp` (*vec3*) : Camera position (world).
- `cr` (*quat*) : Camera rotation.
- `cri` (*quat*) : Inverse camera rotation.
- `s` (*number*) : Scale: meters per pixel.
- `si` (*number*) : Inverse of the scale.
- `textureDraw` (*table*) : Drawing object (circleMarker, edgePointer, line, lineRoundEndTransformed…).
- `ox` (*number|nil*) : Horizontal map offset (0 by default).
- `oy` (*number|nil*) : Vertical map offset (0 by default).
- `minimapMode` (*string|nil*) : 'circle' (default) or anything else for a square/rectangular map.
- `dpi` (*number|nil*) : dpi factor (1 by default).

#### `ui_apps_minimap_utils.simpleCircle(pos, fill, strikeClr, radius)`

Draws a circular marker at a world position, on the GAMEPLAY_MARKERS layer (orange with white outline by default).

- `pos` (*vec3*) : World position.
- `fill` (*color|nil*) : Fill color.
- `strikeClr` (*color|nil*) : Outline color.
- `radius` (*number|nil*) : Radius in pixels (6 by default).

#### `ui_apps_minimap_utils.simpleCircleWithEdgePointer(pos, fill, strikeClr, radius)`

Draws an edge pointer if the position is off the map, otherwise a simple circle at that position.

- `pos` (*vec3*) : World position.
- `fill` (*color|nil*) : Fill.
- `strikeClr` (*color|nil*) : Outline.
- `radius` (*number|nil*) : Radius (6 by default).

#### `ui_apps_minimap_utils.simpleLine(pos1, pos2, fill, strikeClr)`

Draws a round-ended segment between two world positions, on the GAMEPLAY_MARKERS layer.

- `pos1` (*vec3*) : World start.
- `pos2` (*vec3*) : World end.
- `fill` (*color|nil*) : Fill color.
- `strikeClr` (*color|nil*) : Outline color.

#### `ui_apps_minimap_utils.simpleLineWithEdgePointer(pos1, pos2, fill, strikeClr)`

Uses the segment's midpoint: edge pointer if it is off the map, otherwise a simple line.

- `pos1` (*vec3*) : World start.
- `pos2` (*vec3*) : World end.
- `fill` (*color|nil*) : Fill.
- `strikeClr` (*color|nil*) : Outline.

#### `ui_apps_minimap_utils.worldLineToMapXY(x1, y1, x2, y2)`

Converts both ends of a world segment to map coordinates.

- `x1` (*number*) : World X of A.
- `y1` (*number*) : World Y of A.
- `x2` (*number*) : World X of B.
- `y2` (*number*) : World Y of B.
- **returns**: number Map X of A.
- **returns**: number Map Y of A.
- **returns**: number Map X of B.
- **returns**: number Map Y of B.

#### `ui_apps_minimap_utils.worldToMap(p)`

Converts a world point to a map point (allocating version, recomputed with subtraction, division by the scale and rotation). Prefer worldToMapXY for loops.

- `p` (*vec3*) : World point.
- **returns**: vec3 Map point (z = 0).

#### `ui_apps_minimap_utils.worldToMapXY(x, y)`

Converts world coordinates (x, y) to map coordinates.

- `x` (*number*) : World X.
- `y` (*number*) : World Y.
- **returns**: number Map X.
- **returns**: number Map Y.

#### `ui_apps_minimap_utils.worldToMapXYZ(target, source)`

Converts source (world x, y) to map coordinates and writes them into target (z = 0), without allocation.

- `target` (*vec3*) : Output vector (may be the same as source).
- `source` (*vec3*) : World point.

## Fields

| Field | Type | Description |
|---|---|---|
| `centerPointer` | nil | Exported from a local variable that does not exist: always nil. ⚠ reference `centerPointer` not defined in the file (probably nil) |
| `colors` | table<string, color> | Exposed colors: orange, orangeMuted, grayMuted, roadBgTransparentBlack, navBgBlack, gridWhite, navBgWhite, navFgBlue. |
| `dpi` | number | Screen scale factor of the minimap, updated by setMinimapState (1 at start). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/apps/minimap/utils.lua`.*
