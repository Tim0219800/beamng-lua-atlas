---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/util/plotHelperUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/editor/util/plotHelperUtil.lua (instanciée par la fonction renvoyée par le module)
---@class editor_util_plotHelperUtil
local editor_util_plotHelperUtil = {}

--- Main method to call on every graphics update
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:230
---@param width any
---@param height any
---@param dt any
function editor_util_plotHelperUtil:draw(width, height, dt) end

---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:368
function editor_util_plotHelperUtil:drawCatmullSpline() end

---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:500
function editor_util_plotHelperUtil:drawData() end

--- Draws the gridlines
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:402
function editor_util_plotHelperUtil:drawGridAndAxesLabels() end

--- From lua/vehicle/ve_utils.lua and modified to allow multiple y values
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:324
function editor_util_plotHelperUtil:generateCatmullSplinePoints() end

--- Figure out the optimal increment to get closet to ticks
---  increments of 1, 2, or 5 (in relation to magnitude of range using incOneMagLess)
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:485
---@param ticks any
---@param range any
function editor_util_plotHelperUtil:getOptimalTickIncrement(ticks, range) end

--- Returns exponent of num represented in scientific notation (a * 10^x, where x is returned)
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:599
---@param num any
function editor_util_plotHelperUtil:getOrderOfMagnitude(num) end

--- Returns IMGUI coordinates (screen space) on graph from graph coordinates
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:555
---@param x any
---@param y any
---@param clampVal any
function editor_util_plotHelperUtil:graphPtToImSS(x, y, clampVal) end

--- Returns IMGUI coordinates (window space) on graph from graph coordinates
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:580
---@param x any
---@param y any
function editor_util_plotHelperUtil:graphPtToImWS(x, y) end

--- USAGE
---  params.scale = {xMin, xMax, yMin, yMax} or nil
---  params.initData = data or nil
---  params.autoScale = true or false
---  params.showCatmullRomCurve = true or false
---  params.catmullromCurveLines = x or nil (x > 200 preferably)
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:34
---@param params any
function editor_util_plotHelperUtil:init(params) end

--- Moves graph when dragging mouse with left mouse button
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:181
---@param dt any
function editor_util_plotHelperUtil:moveGraph(dt) end

--- Returns IMGUI coordinates (screen space) on graph from normalized coordinates
---  x,y = 0 : bottom left
---  x,y = 1 : top right
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:550
---@param x any
---@param y any
function editor_util_plotHelperUtil:normToImSS(x, y) end

--- Returns IMGUI coordinates (window space) on graph from normalized coordinates
---  x,y = 0 : bottom left
---  x,y = 1 : top right
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:575
---@param x any
---@param y any
function editor_util_plotHelperUtil:normToImWS(x, y) end

---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:311
---@param lines any
function editor_util_plotHelperUtil:overlayTextLines(lines) end

---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:592
---@param num any
---@param dec any
function editor_util_plotHelperUtil:roundToDigits(num, dec) end

--- Sets the domain/range of the graph to fit all data points in view
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:136
function editor_util_plotHelperUtil:scaleToFitData() end

---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:603
---@param x any
function editor_util_plotHelperUtil:scaleX(x) end

---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:604
---@param y any
function editor_util_plotHelperUtil:scaleY(y) end

---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:131
---@param annotation any
function editor_util_plotHelperUtil:setAnnotationX(annotation) end

--- Method to set graph data
---  Must be in this format (multiple y values for one x allowed):
---  {{x0, y0, ...}, {x1, y1, ...}, ...}
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:80
---@param data any
function editor_util_plotHelperUtil:setData(data) end

--- Method to set graph data
---  Must be in this format (multiple y values for one x allowed):
---  {{x0, y0, ...}, {x1, y1, ...}, ...}
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:94
---@param data any
function editor_util_plotHelperUtil:setDataMulti(data) end

--- Sets the domain/range of the graph.
---  All parameters are optional so you can just set one of them and leave rest nil for example
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:164
---@param xMin any
---@param xMax any
---@param yMin any
---@param yMax any
function editor_util_plotHelperUtil:setScale(xMin, xMax, yMin, yMax) end

--- sets the names of the series. is a list of names. Color should be a {r,g,b,a} format, 0-1 values
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:116
---@param colors any
function editor_util_plotHelperUtil:setSeriesColors(colors) end

--- sets the names of the series. is a list of names
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:127
---@param format any
function editor_util_plotHelperUtil:setSeriesFormat(format) end

--- sets the names of the series. is a list of names
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:106
---@param names any
function editor_util_plotHelperUtil:setSeriesNames(names) end

--- Zooms graph with mouse scroll wheel and based on mouse position
---Source : lua/ge/extensions/editor/util/plotHelperUtil.lua:212
---@param dt any
function editor_util_plotHelperUtil:zoomGraph(dt) end

