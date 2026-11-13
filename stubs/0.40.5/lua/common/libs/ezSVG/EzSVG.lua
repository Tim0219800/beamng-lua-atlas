---@meta
-- tim19Atlas stub generated from lua/common/libs/ezSVG/EzSVG.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Copyright (c) 2012 Patrick Borgeat
---
--- Permission is hereby granted, free of charge, to any person obtaining a copy
--- of this software and associated documentation files (the "Software"), to deal
--- in the Software without restriction, including without limitation the rights
--- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
--- copies of the Software, and to permit persons to whom the Software is
--- furnished to do so, subject to the following conditions:
---
--- The above copyright notice and this permission notice shall be included in
--- all copies or substantial portions of the Software.
---
--- Except as contained in this notice, the name(s) of the above copyright holders
--- shall not be used in advertising or otherwise to promote the sale, use or
--- other dealings in this Software without prior written authorization.
---
--- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
--- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
--- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
--- THE SOFTWARE.
---
--- via https://github.com/BeamNG/EzSVG
---  example usage:
---
--- local svg = require('libs/EzSVG/EzSVG')
--- local line = svg.Polyline({0, 0, 100, 100}, {
---   fill = 'none',
---   stroke = svg.rgb(255, 0, 0),
---   stroke_width = 1,
---   stroke_opacity=0.4,
--- })
--- svg:add(line)
--- svg:writeTo('test.svg')
---
--- --
--- Accès : `require("libs/ezSVG/EzSVG")`
---@class libs_ezSVG_EzSVG
---@field knownTags table
---@field styleStack table
local libs_ezSVG_EzSVG = {}

---Source : lua/common/libs/ezSVG/EzSVG.lua:421
---@param cx any
---@param cy any
---@param r any
---@param style any
function libs_ezSVG_EzSVG.Circle(cx, cy, r, style) end

---Source : lua/common/libs/ezSVG/EzSVG.lua:850
---@param width any
---@param height any
---@param bgcolor any
---@param style any
function libs_ezSVG_EzSVG.Document(width, height, bgcolor, style) end

---Source : lua/common/libs/ezSVG/EzSVG.lua:430
---@param cx any
---@param cy any
---@param rx any
---@param ry any
---@param style any
function libs_ezSVG_EzSVG.Ellipse(cx, cy, rx, ry, style) end

---Source : lua/common/libs/ezSVG/EzSVG.lua:709
---@param style any
function libs_ezSVG_EzSVG.Group(style) end

---Source : lua/common/libs/ezSVG/EzSVG.lua:641
---@param href any
---@param x any
---@param y any
---@param width any
---@param height any
---@param style any
function libs_ezSVG_EzSVG.Image(href, x, y, width, height, style) end

---Source : lua/common/libs/ezSVG/EzSVG.lua:440
---@param x1 any
---@param y1 any
---@param x2 any
---@param y2 any
---@param style any
function libs_ezSVG_EzSVG.Line(x1, y1, x2, y2, style) end

---Source : lua/common/libs/ezSVG/EzSVG.lua:750
---@param x1 any
---@param y1 any
---@param x2 any
---@param y2 any
---@param userSpaceUnits any
---@param spread any
---@param style any
function libs_ezSVG_EzSVG.LinearGradient(x1, y1, x2, y2, userSpaceUnits, spread, style) end

---Source : lua/common/libs/ezSVG/EzSVG.lua:817
---@param x any
---@param y any
---@param width any
---@param height any
---@param maskUnits any
---@param maskContentUnits any
---@param style any
function libs_ezSVG_EzSVG.Mask(x, y, width, height, maskUnits, maskContentUnits, style) end

---Source : lua/common/libs/ezSVG/EzSVG.lua:450
---@param style any
function libs_ezSVG_EzSVG.Path(style) end

---Source : lua/common/libs/ezSVG/EzSVG.lua:800
---@param x any
---@param y any
---@param width any
---@param height any
---@param preserveAspectRatio any
---@param patternUnits any
---@param patternContentUnits any
---@param viewbox any
---@param style any
function libs_ezSVG_EzSVG.Pattern(x, y, width, height, preserveAspectRatio, patternUnits, patternContentUnits, viewbox, style) end

---Source : lua/common/libs/ezSVG/EzSVG.lua:624
---@param points any
---@param style any
function libs_ezSVG_EzSVG.Polygon(points, style) end

---Source : lua/common/libs/ezSVG/EzSVG.lua:620
---@param points any
---@param style any
function libs_ezSVG_EzSVG.Polyline(points, style) end

---Source : lua/common/libs/ezSVG/EzSVG.lua:764
---@param cx any
---@param cy any
---@param r any
---@param fx any
---@param fy any
---@param userSpaceUnits any
---@param spread any
---@param style any
function libs_ezSVG_EzSVG.RadialGradient(cx, cy, r, fx, fy, userSpaceUnits, spread, style) end

---Source : lua/common/libs/ezSVG/EzSVG.lua:628
---@param x any
---@param y any
---@param width any
---@param height any
---@param rx any
---@param ry any
---@param style any
function libs_ezSVG_EzSVG.Rect(x, y, width, height, rx, ry, style) end

---Source : lua/common/libs/ezSVG/EzSVG.lua:901
---@param x any
---@param y any
---@param width any
---@param height any
---@param style any
function libs_ezSVG_EzSVG.SVG(x, y, width, height, style) end

---Source : lua/common/libs/ezSVG/EzSVG.lua:791
---@param preserveAspectRatio any
---@param viewBox any
---@param style any
function libs_ezSVG_EzSVG.Symbol(preserveAspectRatio, viewBox, style) end

---Source : lua/common/libs/ezSVG/EzSVG.lua:664
---@param text any
---@param x any
---@param y any
---@param style any
function libs_ezSVG_EzSVG.Text(text, x, y, style) end

---Source : lua/common/libs/ezSVG/EzSVG.lua:702
---@param href any
---@param style any
function libs_ezSVG_EzSVG.TextRef(href, style) end

---Source : lua/common/libs/ezSVG/EzSVG.lua:779
---@param href any
---@param x any
---@param y any
---@param width any
---@param height any
---@param style any
function libs_ezSVG_EzSVG.Use(href, x, y, width, height, style) end

---Source : lua/common/libs/ezSVG/EzSVG.lua:379
function libs_ezSVG_EzSVG.clearStyle() end

---Source : lua/common/libs/ezSVG/EzSVG.lua:919
---@param v any
function libs_ezSVG_EzSVG.gray(v) end

---Source : lua/common/libs/ezSVG/EzSVG.lua:923
---@param h any
---@param s any
---@param v any
function libs_ezSVG_EzSVG.hsv(h, s, v) end

---Source : lua/common/libs/ezSVG/EzSVG.lua:399
function libs_ezSVG_EzSVG.popStyle() end

---Source : lua/common/libs/ezSVG/EzSVG.lua:386
function libs_ezSVG_EzSVG.pushStyle() end

---Source : lua/common/libs/ezSVG/EzSVG.lua:915
---@param r any
---@param g any
---@param b any
function libs_ezSVG_EzSVG.rgb(r, g, b) end

---Source : lua/common/libs/ezSVG/EzSVG.lua:407
---@param key any
---@param value any
---@param tag any
function libs_ezSVG_EzSVG.setStyle(key, value, tag) end

return libs_ezSVG_EzSVG
