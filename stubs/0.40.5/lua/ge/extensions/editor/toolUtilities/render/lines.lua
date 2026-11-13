---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/render/lines.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_render_lines` : `extensions.load("editor_toolUtilities_render_lines")`, puis la globale `editor_toolUtilities_render_lines`
---@class editor_toolUtilities_render_lines
editor_toolUtilities_render_lines = {}

---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:62
---@param p0 any
---@param p1 any
function editor_toolUtilities_render_lines.drawActiveSegLine(p0, p1) end

--- Not culled.
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:98
---@param p0 any
---@param p1 any
function editor_toolUtilities_render_lines.drawArcSegment(p0, p1) end

---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:86
---@param p0 any
---@param p1 any
---@param v any
---@param lim any
function editor_toolUtilities_render_lines.drawBarCeilingLine(p0, p1, v, lim) end

---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:71
---@param p0 any
---@param p1 any
---@param v any
---@param lim any
function editor_toolUtilities_render_lines.drawDropLine(p0, p1, v, lim) end

---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:73
---@param p0 any
---@param p1 any
function editor_toolUtilities_render_lines.drawDropLineDull(p0, p1) end

---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:72
---@param p0 any
---@param p1 any
---@param v any
---@param lim any
function editor_toolUtilities_render_lines.drawDropLineThick(p0, p1, v, lim) end

--- Soft elev drop for selected nodes / junction centres (thin, translucent).
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:75
---@param p0 any
---@param p1 any
---@param v any
---@param lim any
function editor_toolUtilities_render_lines.drawElevDropLine(p0, p1, v, lim) end

---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:34
---@param p0 any
---@param p1 any
---@param col any
function editor_toolUtilities_render_lines.drawForegroundLine(p0, p1, col) end

---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:65
---@param p0 any
---@param p1 any
function editor_toolUtilities_render_lines.drawGroundLine(p0, p1) end

---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:68
---@param p0 any
---@param p1 any
function editor_toolUtilities_render_lines.drawGroundLineDull(p0, p1) end

--- Not culled.
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:99
---@param p0 any
---@param p1 any
function editor_toolUtilities_render_lines.drawJoinLine(p0, p1) end

---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:27
---@param p0 any
---@param p1 any
---@param thickness any
---@param col any
function editor_toolUtilities_render_lines.drawLineCulled(p0, p1, thickness, col) end

--- Public interface.
---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:25
---@param p0 any
---@param p1 any
---@param thickness any
---@param col any
function editor_toolUtilities_render_lines.drawLineImmediate(p0, p1, thickness, col) end

---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:84
---@param p0 any
---@param p1 any
function editor_toolUtilities_render_lines.drawNavLine(p0, p1) end

---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:82
---@param p0 any
---@param p1 any
function editor_toolUtilities_render_lines.drawNormalLine(p0, p1) end

---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:85
---@param p0 any
---@param p1 any
function editor_toolUtilities_render_lines.drawPathLine(p0, p1) end

---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:55
---@param p0 any
---@param p1 any
function editor_toolUtilities_render_lines.drawPreviewWireLine(p0, p1) end

---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:83
---@param p0 any
---@param p1 any
function editor_toolUtilities_render_lines.drawRefNormalLine(p0, p1) end

---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:58
---@param p0 any
---@param p1 any
function editor_toolUtilities_render_lines.drawRibLine(p0, p1) end

---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:94
---@param p0 any
---@param p1 any
function editor_toolUtilities_render_lines.drawSplineLine(p0, p1) end

---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:88
---@param p0 any
---@param p1 any
function editor_toolUtilities_render_lines.drawSplineLineDull(p0, p1) end

---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:38
---@param p0 any
---@param p1 any
function editor_toolUtilities_render_lines.drawSplineLineForeground(p0, p1) end

---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:87
---@param p0 any
---@param p1 any
function editor_toolUtilities_render_lines.drawSplineLineLinked(p0, p1) end

---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:91
---@param p0 any
---@param p1 any
function editor_toolUtilities_render_lines.drawSplineLineUnselected(p0, p1) end

---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:80
---@param p0 any
---@param p1 any
function editor_toolUtilities_render_lines.drawSquareCornerLine(p0, p1) end

---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:81
---@param p0 any
---@param p1 any
function editor_toolUtilities_render_lines.drawSquareCornerLineForeground(p0, p1) end

---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:42
---@param p0 any
---@param p1 any
function editor_toolUtilities_render_lines.drawWireFrameLine(p0, p1) end

---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:49
---@param p0 any
---@param p1 any
function editor_toolUtilities_render_lines.drawWireFrameLine2(p0, p1) end

---Source : lua/ge/extensions/editor/toolUtilities/render/lines.lua:52
---@param p0 any
---@param p1 any
function editor_toolUtilities_render_lines.drawWireFrameLine3(p0, p1) end

