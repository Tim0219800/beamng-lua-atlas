---@meta
-- tim19Atlas stub generated from lua/common/libs/ezSVG/EzSVG.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- EzSVG: third-party library (Patrick Borgeat, 2012, taken over by BeamNG) to generate SVG files from Lua. You create elements (Circle, Rect, Line, Path, Polyline, Text, Group, gradients...), add them to a group or a document (add) then write the file with Document:writeTo. A stack of default styles (setStyle, pushStyle, popStyle) applies to the elements created. Useful for exporting drawings (roads, graphs) from a script.
--- Access: `require("libs/ezSVG/EzSVG")`
---@class libs_ezSVG_EzSVG
---@field knownTags table<integer, string> List of known SVG tags (rect, circle, ellipse, line, polyline, polygon, path, text, tspan, textPath, image, svg, g, defs, tref, linearGradient, radialGradient, stop, use, symbol, pattern, mask) for which a default style exists.
---@field styleStack table Stack of style sets saved by pushStyle.
local libs_ezSVG_EzSVG = {}

--- Creates a circle.
---Source: lua/common/libs/ezSVG/EzSVG.lua:421
---@param cx number Center X
---@param cy number Center Y
---@param r number Radius
---@param style table|nil Style
function libs_ezSVG_EzSVG.Circle(cx, cy, r, style) end

--- Creates the root SVG document (svg group with xmlns, size and optional background). Has add and writeTo(filename).
---Source: lua/common/libs/ezSVG/EzSVG.lua:850
---@param width number Width
---@param height number Height
---@param bgcolor string|nil Background color (adds a rectangle)
---@param style table|nil Style
---@return table  Document
function libs_ezSVG_EzSVG.Document(width, height, bgcolor, style) end

--- Creates an ellipse.
---Source: lua/common/libs/ezSVG/EzSVG.lua:430
---@param cx number Center X
---@param cy number Center Y
---@param rx number X radius
---@param ry number Y radius
---@param style table|nil Style
function libs_ezSVG_EzSVG.Ellipse(cx, cy, rx, ry, style) end

--- Creates a <g> group containing other elements (add method).
---Source: lua/common/libs/ezSVG/EzSVG.lua:709
---@param style table|nil Style
function libs_ezSVG_EzSVG.Group(style) end

--- Creates a referenced image.
---Source: lua/common/libs/ezSVG/EzSVG.lua:641
---@param href string Image URL or path
---@param x number X
---@param y number Y
---@param width number Width
---@param height number Height
---@param style table|nil Style
function libs_ezSVG_EzSVG.Image(href, x, y, width, height, style) end

--- Creates a line segment.
---Source: lua/common/libs/ezSVG/EzSVG.lua:440
---@param x1 number Start X
---@param y1 number Start Y
---@param x2 number End X
---@param y2 number End Y
---@param style table|nil Style
function libs_ezSVG_EzSVG.Line(x1, y1, x2, y2, style) end

--- Creates a linear gradient (stops added afterwards on the object).
---Source: lua/common/libs/ezSVG/EzSVG.lua:750
---@param x1 number Start X
---@param y1 number Start Y
---@param x2 number End X
---@param y2 number End Y
---@param userSpaceUnits boolean|nil Use user units (inferred from the name)
---@param spread string|nil Spread method (spreadMethod)
---@param style table|nil Style
function libs_ezSVG_EzSVG.LinearGradient(x1, y1, x2, y2, userSpaceUnits, spread, style) end

--- Creates a <mask> mask.
---Source: lua/common/libs/ezSVG/EzSVG.lua:817
---@param x number X
---@param y number Y
---@param width number Width
---@param height number Height
---@param maskUnits string|nil SVG attribute
---@param maskContentUnits string|nil SVG attribute
---@param style table|nil Style
function libs_ezSVG_EzSVG.Mask(x, y, width, height, maskUnits, maskContentUnits, style) end

--- Creates a <path> whose d commands are built by methods on the object.
---Source: lua/common/libs/ezSVG/EzSVG.lua:450
---@param style table|nil Style
function libs_ezSVG_EzSVG.Path(style) end

--- Creates a <pattern> fill pattern.
---Source: lua/common/libs/ezSVG/EzSVG.lua:800
---@param x number X
---@param y number Y
---@param width number Width
---@param height number Height
---@param preserveAspectRatio string|nil SVG attribute
---@param patternUnits string|nil SVG attribute
---@param patternContentUnits string|nil SVG attribute
---@param viewbox string|nil SVG viewBox attribute
---@param style table|nil Style
function libs_ezSVG_EzSVG.Pattern(x, y, width, height, preserveAspectRatio, patternUnits, patternContentUnits, viewbox, style) end

--- Creates a closed polygon.
---Source: lua/common/libs/ezSVG/EzSVG.lua:624
---@param points table<integer, number> Flat list of coordinates {x1, y1, ...}
---@param style table|nil Style
function libs_ezSVG_EzSVG.Polygon(points, style) end

--- Creates an open polyline.
---Source: lua/common/libs/ezSVG/EzSVG.lua:620
---@param points table<integer, number> Flat list of coordinates {x1, y1, x2, y2, ...}
---@param style table|nil Style
function libs_ezSVG_EzSVG.Polyline(points, style) end

--- Creates a radial gradient.
---Source: lua/common/libs/ezSVG/EzSVG.lua:764
---@param cx number Center X
---@param cy number Center Y
---@param r number Radius
---@param fx number|nil Focus X
---@param fy number|nil Focus Y
---@param userSpaceUnits boolean|nil Use user units (inferred from the name)
---@param spread string|nil Spread method
---@param style table|nil Style
function libs_ezSVG_EzSVG.RadialGradient(cx, cy, r, fx, fy, userSpaceUnits, spread, style) end

--- Creates a rectangle, optionally with rounded corners.
---Source: lua/common/libs/ezSVG/EzSVG.lua:628
---@param x number X
---@param y number Y
---@param width number Width
---@param height number Height
---@param rx number|nil Corner radius in X
---@param ry number|nil Corner radius in Y
---@param style table|nil Style
function libs_ezSVG_EzSVG.Rect(x, y, width, height, rx, ry, style) end

--- Creates a nested <svg> element (positioned group).
---Source: lua/common/libs/ezSVG/EzSVG.lua:901
---@param x number X
---@param y number Y
---@param width number Width
---@param height number Height
---@param style table|nil Style
function libs_ezSVG_EzSVG.SVG(x, y, width, height, style) end

--- Creates a <symbol> (reusable template via Use).
---Source: lua/common/libs/ezSVG/EzSVG.lua:791
---@param preserveAspectRatio string|nil SVG attribute
---@param viewBox string|nil SVG attribute
---@param style table|nil Style
function libs_ezSVG_EzSVG.Symbol(preserveAspectRatio, viewBox, style) end

--- Creates a text element.
---Source: lua/common/libs/ezSVG/EzSVG.lua:664
---@param text string Content
---@param x number X
---@param y number Y
---@param style table|nil Style
function libs_ezSVG_EzSVG.Text(text, x, y, style) end

--- Creates a text reference (<tref>) to another element.
---Source: lua/common/libs/ezSVG/EzSVG.lua:702
---@param href any Referenced element or identifier (inferred from code)
---@param style table|nil Style
function libs_ezSVG_EzSVG.TextRef(href, style) end

--- Creates a <use> that reuses an element defined elsewhere.
---Source: lua/common/libs/ezSVG/EzSVG.lua:779
---@param href any Element or identifier to reuse
---@param x number|nil X
---@param y number|nil Y
---@param width number|nil Width
---@param height number|nil Height
---@param style table|nil Style
function libs_ezSVG_EzSVG.Use(href, x, y, width, height, style) end

--- Resets the default styles of all known tags (empty tables).
---Source: lua/common/libs/ezSVG/EzSVG.lua:379
function libs_ezSVG_EzSVG.clearStyle() end

--- Gray: rgb(v, v, v).
---Source: lua/common/libs/ezSVG/EzSVG.lua:919
---@param v number Level 0..255
---@return string  Color
function libs_ezSVG_EzSVG.gray(v) end

--- Converts a TSV color into an rgb() string. The three components are in 0..255 (divided by 255).
---Source: lua/common/libs/ezSVG/EzSVG.lua:923
---@param h number Hue 0..255
---@param s number Saturation 0..255
---@param v number Value 0..255
---@return string  rgb(...) color
function libs_ezSVG_EzSVG.hsv(h, s, v) end

--- Restores the saved default styles; error if the stack is empty.
---Source: lua/common/libs/ezSVG/EzSVG.lua:399
function libs_ezSVG_EzSVG.popStyle() end

--- Saves a copy of the default styles on the stack.
---Source: lua/common/libs/ezSVG/EzSVG.lua:386
function libs_ezSVG_EzSVG.pushStyle() end

--- Formats an SVG color "rgb(r, g, b)" (values 0..255, rounded down to the integer).
---Source: lua/common/libs/ezSVG/EzSVG.lua:915
---@param r number Red
---@param g number Green
---@param b number Blue
---@return string  Color
function libs_ezSVG_EzSVG.rgb(r, g, b) end

--- Sets a default style, for one tag or for all. Accepts either (key, value, tag?), or (style table, tag?).
---Source: lua/common/libs/ezSVG/EzSVG.lua:407
---@param key string|table Property name (stroke_width...) or table of properties
---@param value any Value (or tag name if key is a table)
---@param tag string|nil Targeted tag; all if nil
function libs_ezSVG_EzSVG.setStyle(key, value, tag) end

return libs_ezSVG_EzSVG
