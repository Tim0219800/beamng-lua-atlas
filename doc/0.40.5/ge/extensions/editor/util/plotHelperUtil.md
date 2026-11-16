# `editor_util_plotHelperUtil`

*File: `lua/ge/extensions/editor/util/plotHelperUtil.lua` · VM: Game Engine (GE) · 615 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/util/plotHelperUtil")` (file under extensions/ but not a regular extension)

Editor helper: imgui 2D graph (grid, axes, points, optional Catmull-Rom curve, crosshair, vertical annotations) with mouse panning (left-button drag) and wheel zoom. The module returns a constructor: require('/lua/ge/extensions/editor/util/plotHelperUtil')(params). Useful to plot curves (e.g. JBeam tables) in an editor window. Each instance gets a unique id (local counter) for its imgui identifiers.

## Example

```lua
local plot = require('/lua/ge/extensions/editor/util/plotHelperUtil')({autoScale = true, showCatmullRomCurve = true})
plot:setData({{0, 0, 1}, {1, 2, 3}, {2, 4, 5}}) -- {x, y1, y2...}
plot:setSeriesNames({'A', 'B'})
-- in onEditorGui, in an imgui window:
plot:draw(400, 300, dt)
```

## Notes

- Format of the setData data: {{x0, y0, y1, ...}, ...}; setDataMulti already expects series: data[series][i] = {x, y}.
- 50 px margin (borderSize) around the plot area; a point out of bounds gives nil in graphPtToImSS / graphPtToImWS (except clampVal).
- init: without parameters, scale -5..5, showCatmullRomCurve = true, catmullDataPoints = 10 (field never read again: the code uses catmullromCurveLines, 10 by default). allowZoom is true by default (params.allowZoom or true, set to false only if params.allowZoom == false).
- Default label formats: '%0.3f' (formatX, formatY); point size 4, thickness 2.
- Inconsistency in the code: setScale computes centerPos as the half-extent ((max-min)/2) and not the center; the comments of setSeriesColors and setSeriesFormat say "names" through copy-paste.
- draw returns early, without EndChild, if self.data is nil (BeginChild1 already called).

## Class `C`

Graph instance.

The module returns a constructor: `local obj = require("editor_util_plotHelperUtil")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:draw(width, height, dt)` | Main method to call on every graph update, in an imgui window: handles the mouse, creates an imgui child and draws the grid, data, Catmull-Rom curve, crosshair and annotations. | 230 |
| `C:drawCatmullSpline()` | Draws the computed Catmull-Rom curve. | 368 |
| `C:drawData()` | Draws the points of each series (series color or rainbowColor). | 500 |
| `C:drawGridAndAxesLabels()` | Draws the grid and the axis labels. | 402 |
| `C:generateCatmullSplinePoints()` | Generates the Catmull-Rom curve points for each series (adapted from lua/vehicle/ve_utils.lua, modified for several y); series with fewer than 2 points ignored, series with 2 points copied as is. | 324 |
| `C:getOptimalTickIncrement(ticks, range)` | Computes the tick increment (1, 2 or 5 depending on the order of magnitude) closest to the desired number of ticks. | 485 |
| `C:getOrderOfMagnitude(num)` | Returns the exponent x of num written as a * 10^x. | 599 |
| `C:graphPtToImSS(x, y, clampVal)` | Imgui coordinates (screen space) of a graph point; nil if the point is out of bounds, except with clampVal (values clamped to 0..1). | 555 |
| `C:graphPtToImWS(x, y)` | Imgui coordinates (window space) of a graph point; nil if out of bounds. | 580 |
| `C:init(params)` | Initializes the graph. params.scale = {xMin, xMax, yMin, yMax}, params.initData, params.autoScale, params.showCatmullRomCurve, params.catmullromCurveLines (> 200 recommended), params.allowZoom, pointSize, pointThickness, formatX, formatY. | 34 |
| `C:moveGraph(dt)` | Pans the graph when dragging with the left button (the initial click must be inside the graph). | 181 |
| `C:normToImSS(x, y)` | Imgui coordinates (screen space) from normalized coordinates: (0,0) bottom left, (1,1) top right. | 550 |
| `C:normToImWS(x, y)` | Like normToImSS but in window space. | 575 |
| `C:overlayTextLines(lines)` | Displays lines of text overlaid at the top left of the graph. | 311 |
| `C:roundToDigits(num, dec)` | Rounds num to dec decimals. | 592 |
| `C:scaleToFitData()` | Adjusts the domain and range to contain all points, with a 10% margin on each side. No effect without data. | 136 |
| `C:scaleX(x)` | Converts a normalized fraction x (0..1) to a graph x value according to the current scale. | 603 |
| `C:scaleY(y)` | Converts a normalized fraction y (0..1) to a graph y value according to the current scale. | 604 |
| `C:setAnnotationX(annotation)` | Sets the vertical annotations: list of {x, label} pairs, drawn as a line and text in the graph. | 131 |
| `C:setData(data)` | Sets the data in the format {{x0, y0, y1, ...}, ...} (several y values per x), converted to series then passed to setDataMulti. | 80 |
| `C:setDataMulti(data)` | Sets the data per series: data[series] = list of {x, y}. Recomputes the scale if autoScale, and the Catmull-Rom points if showCatmullRomCurve. | 94 |
| `C:setScale(xMin, xMax, yMin, yMax)` | Sets the graph bounds; each parameter is optional (nil = unchanged). | 164 |
| `C:setSeriesColors(colors)` | Sets the series colors in the format {r, g, b, a} with values from 0 to 1 (converts to U32). Without a color, the series uses rainbowColor. | 116 |
| `C:setSeriesFormat(format)` | Directly replaces the series format table (name, color, uColor per series). | 127 |
| `C:setSeriesNames(names)` | Sets the series names (list); default name tostring(i). | 106 |
| `C:zoomGraph(dt)` | Wheel zoom according to the mouse position; no effect if allowZoom is false or if the mouse is outside the graph. | 212 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/util/plotHelperUtil.lua`.*
