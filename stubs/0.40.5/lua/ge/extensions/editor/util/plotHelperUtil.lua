---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/util/plotHelperUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Graph instance.
---@class editor_util_plotHelperUtil
local editor_util_plotHelperUtil = {}

--- Main method to call on every graph update, in an imgui window: handles the mouse, creates an imgui child and draws the grid, data, Catmull-Rom curve, crosshair and annotations.
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:230
---@param width number Width in pixels.
---@param height number Height in pixels.
---@param dt number Time delta.
function editor_util_plotHelperUtil:draw(width, height, dt) end

--- Draws the computed Catmull-Rom curve.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:368
function editor_util_plotHelperUtil:drawCatmullSpline() end

--- Draws the points of each series (series color or rainbowColor).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:500
function editor_util_plotHelperUtil:drawData() end

--- Draws the grid and the axis labels.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:402
function editor_util_plotHelperUtil:drawGridAndAxesLabels() end

--- Generates the Catmull-Rom curve points for each series (adapted from lua/vehicle/ve_utils.lua, modified for several y); series with fewer than 2 points ignored, series with 2 points copied as is.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:324
function editor_util_plotHelperUtil:generateCatmullSplinePoints() end

--- Computes the tick increment (1, 2 or 5 depending on the order of magnitude) closest to the desired number of ticks.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:485
---@param ticks integer Target number of ticks.
---@param range number Extent of the axis.
---@return number  Increment.
function editor_util_plotHelperUtil:getOptimalTickIncrement(ticks, range) end

--- Returns the exponent x of num written as a * 10^x.
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:599
---@param num number Nonzero number.
---@return integer  floor(log10(abs(num))).
function editor_util_plotHelperUtil:getOrderOfMagnitude(num) end

--- Imgui coordinates (screen space) of a graph point; nil if the point is out of bounds, except with clampVal (values clamped to 0..1).
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:555
---@param x number Graph x value.
---@param y number Graph y value.
---@param clampVal boolean|nil Clamp within the graph.
---@return ImVec2|nil  Screen position.
function editor_util_plotHelperUtil:graphPtToImSS(x, y, clampVal) end

--- Imgui coordinates (window space) of a graph point; nil if out of bounds.
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:580
---@param x number Graph x value.
---@param y number Graph y value.
---@return ImVec2|nil  Window position.
function editor_util_plotHelperUtil:graphPtToImWS(x, y) end

--- Initializes the graph. params.scale = {xMin, xMax, yMin, yMax}, params.initData, params.autoScale, params.showCatmullRomCurve, params.catmullromCurveLines (> 200 recommended), params.allowZoom, pointSize, pointThickness, formatX, formatY.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:34
---@param params table|nil Options (see description).
function editor_util_plotHelperUtil:init(params) end

--- Pans the graph when dragging with the left button (the initial click must be inside the graph).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:181
---@param dt number Time delta (unused).
function editor_util_plotHelperUtil:moveGraph(dt) end

--- Imgui coordinates (screen space) from normalized coordinates: (0,0) bottom left, (1,1) top right.
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:550
---@param x number 0 to 1.
---@param y number 0 to 1.
---@return ImVec2  Screen position.
function editor_util_plotHelperUtil:normToImSS(x, y) end

--- Like normToImSS but in window space.
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:575
---@param x number 0 to 1.
---@param y number 0 to 1.
---@return ImVec2  Window position.
function editor_util_plotHelperUtil:normToImWS(x, y) end

--- Displays lines of text overlaid at the top left of the graph.
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:311
---@param lines string[]|nil Lines of text.
function editor_util_plotHelperUtil:overlayTextLines(lines) end

--- Rounds num to dec decimals.
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:592
---@param num number Value.
---@param dec integer Number of decimals.
---@return number  Rounded value.
function editor_util_plotHelperUtil:roundToDigits(num, dec) end

--- Adjusts the domain and range to contain all points, with a 10% margin on each side. No effect without data.
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:136
function editor_util_plotHelperUtil:scaleToFitData() end

--- Converts a normalized fraction x (0..1) to a graph x value according to the current scale.
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:603
---@param x number 0 to 1.
---@return number  x value.
function editor_util_plotHelperUtil:scaleX(x) end

--- Converts a normalized fraction y (0..1) to a graph y value according to the current scale.
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:604
---@param y number 0 to 1.
---@return number  y value.
function editor_util_plotHelperUtil:scaleY(y) end

--- Sets the vertical annotations: list of {x, label} pairs, drawn as a line and text in the graph.
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:131
---@param annotation table[]|nil Pairs {x, label}.
function editor_util_plotHelperUtil:setAnnotationX(annotation) end

--- Sets the data in the format {{x0, y0, y1, ...}, ...} (several y values per x), converted to series then passed to setDataMulti.
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:80
---@param data number[][] Rows {x, y1, y2...}.
function editor_util_plotHelperUtil:setData(data) end

--- Sets the data per series: data[series] = list of {x, y}. Recomputes the scale if autoScale, and the Catmull-Rom points if showCatmullRomCurve.
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:94
---@param data table Series of points {x, y}.
function editor_util_plotHelperUtil:setDataMulti(data) end

--- Sets the graph bounds; each parameter is optional (nil = unchanged).
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:164
---@param xMin number|nil Left bound.
---@param xMax number|nil Right bound.
---@param yMin number|nil Bottom bound.
---@param yMax number|nil Top bound.
function editor_util_plotHelperUtil:setScale(xMin, xMax, yMin, yMax) end

--- Sets the series colors in the format {r, g, b, a} with values from 0 to 1 (converts to U32). Without a color, the series uses rainbowColor.
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:116
---@param colors number[][] Colors {r,g,b,a}.
function editor_util_plotHelperUtil:setSeriesColors(colors) end

--- Directly replaces the series format table (name, color, uColor per series).
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:127
---@param format table Formats per series.
function editor_util_plotHelperUtil:setSeriesFormat(format) end

--- Sets the series names (list); default name tostring(i).
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:106
---@param names string[] Names.
function editor_util_plotHelperUtil:setSeriesNames(names) end

--- Wheel zoom according to the mouse position; no effect if allowZoom is false or if the mouse is outside the graph.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/plotHelperUtil.lua:212
---@param dt number Time delta (the zoom depends on it).
function editor_util_plotHelperUtil:zoomGraph(dt) end

