# `editor_util_plotHelperUtil`

*Fichier : `lua/ge/extensions/editor/util/plotHelperUtil.lua` · VM : Game Engine (GE) · 615 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/util/plotHelperUtil")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_util_plotHelperUtil")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:draw(width, height, dt)` | Main method to call on every graphics update | 230 |
| `C:drawCatmullSpline()` |  | 368 |
| `C:drawData()` |  | 500 |
| `C:drawGridAndAxesLabels()` | Draws the gridlines | 402 |
| `C:generateCatmullSplinePoints()` | From lua/vehicle/ve_utils.lua and modified to allow multiple y values | 324 |
| `C:getOptimalTickIncrement(ticks, range)` | Figure out the optimal increment to get closet to ticks<br> increments of 1, 2, or 5 (in relation to magnitude of range using incOneMagLess) | 485 |
| `C:getOrderOfMagnitude(num)` | Returns exponent of num represented in scientific notation (a * 10^x, where x is returned) | 599 |
| `C:graphPtToImSS(x, y, clampVal)` | Returns IMGUI coordinates (screen space) on graph from graph coordinates | 555 |
| `C:graphPtToImWS(x, y)` | Returns IMGUI coordinates (window space) on graph from graph coordinates | 580 |
| `C:init(params)` | USAGE<br> params.scale = {xMin, xMax, yMin, yMax} or nil<br> params.initData = data or nil<br> params.autoScale = true or false<br> params.showCatmullRomCurve = true or false<br> params.catmullromCurveLines = x or nil (x > 200 preferably) | 34 |
| `C:moveGraph(dt)` | Moves graph when dragging mouse with left mouse button | 181 |
| `C:normToImSS(x, y)` | Returns IMGUI coordinates (screen space) on graph from normalized coordinates<br> x,y = 0 : bottom left<br> x,y = 1 : top right | 550 |
| `C:normToImWS(x, y)` | Returns IMGUI coordinates (window space) on graph from normalized coordinates<br> x,y = 0 : bottom left<br> x,y = 1 : top right | 575 |
| `C:overlayTextLines(lines)` |  | 311 |
| `C:roundToDigits(num, dec)` |  | 592 |
| `C:scaleToFitData()` | Sets the domain/range of the graph to fit all data points in view | 136 |
| `C:scaleX(x)` |  | 603 |
| `C:scaleY(y)` |  | 604 |
| `C:setAnnotationX(annotation)` |  | 131 |
| `C:setData(data)` | Method to set graph data<br> Must be in this format (multiple y values for one x allowed):<br> {{x0, y0, ...}, {x1, y1, ...}, ...} | 80 |
| `C:setDataMulti(data)` | Method to set graph data<br> Must be in this format (multiple y values for one x allowed):<br> {{x0, y0, ...}, {x1, y1, ...}, ...} | 94 |
| `C:setScale(xMin, xMax, yMin, yMax)` | Sets the domain/range of the graph.<br> All parameters are optional so you can just set one of them and leave rest nil for example | 164 |
| `C:setSeriesColors(colors)` | sets the names of the series. is a list of names. Color should be a {r,g,b,a} format, 0-1 values | 116 |
| `C:setSeriesFormat(format)` | sets the names of the series. is a list of names | 127 |
| `C:setSeriesNames(names)` | sets the names of the series. is a list of names | 106 |
| `C:zoomGraph(dt)` | Zooms graph with mouse scroll wheel and based on mouse position | 212 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/util/plotHelperUtil.lua`.*
