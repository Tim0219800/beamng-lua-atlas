---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/render/lines.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Debug line drawing for the editor's spline editing tools (from the old monolithic render.lua). Each function draws a segment p0-p1 with the style (color, thickness) matching a use: spline, wireframe, elevation drop line, normal, navigation, etc. Leaf module: depends on utils/debugDraw, the shared style and util (blue-to-red color ramp).
--- Access: extension `editor_toolUtilities_render_lines`: `extensions.load("editor_toolUtilities_render_lines")`, then the global `editor_toolUtilities_render_lines`
---@class editor_toolUtilities_render_lines
editor_toolUtilities_render_lines = {}

--- Active segment (colourLayerWire, thickness 2).
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:62
---@param p0 vec3 Start.
---@param p1 vec3 End.
function editor_toolUtilities_render_lines.drawActiveSegLine(p0, p1) end

--- Arc segment (colourArcSeg, thickness arcSegThickness). Not filtered by distance.
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:98
---@param p0 vec3 Start.
---@param p1 vec3 End.
function editor_toolUtilities_render_lines.drawArcSegment(p0, p1) end

--- Bar ceiling line, colored according to v on the blue-to-red ramp.
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:86
---@param p0 vec3 Start.
---@param p1 vec3 End.
---@param v number Value.
---@param lim number Maximum of the ramp.
function editor_toolUtilities_render_lines.drawBarCeilingLine(p0, p1, v, lim) end

--- Elevation drop line colored according to value v on the blue-to-red ramp between 0 and lim.
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:71
---@param p0 vec3 Start.
---@param p1 vec3 End.
---@param v number Value to represent.
---@param lim number Maximum value of the ramp.
function editor_toolUtilities_render_lines.drawDropLine(p0, p1, v, lim) end

--- Dimmed drop line (colourDropDull).
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:73
---@param p0 vec3 Start.
---@param p1 vec3 End.
function editor_toolUtilities_render_lines.drawDropLineDull(p0, p1) end

--- Like drawDropLine with thickness dropThicknessThicker.
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:72
---@param p0 vec3 Start.
---@param p1 vec3 End.
---@param v number Value.
---@param lim number Maximum of the ramp.
function editor_toolUtilities_render_lines.drawDropLineThick(p0, p1, v, lim) end

--- Soft, thin, translucent drop line (alpha 110), for selected nodes or junction centers. Hue according to |v| / lim (lim is 100 by default).
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:75
---@param p0 vec3 Start.
---@param p1 vec3 End.
---@param v number Value (absolute value used).
---@param lim number|nil Maximum of the ramp, default 100.
function editor_toolUtilities_render_lines.drawElevDropLine(p0, p1, v, lim) end

--- Draws a line over the geometry (no depth test) via debugDrawer:drawLine.
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:34
---@param p0 vec3 Start.
---@param p1 vec3 End.
---@param col integer Packed color.
function editor_toolUtilities_render_lines.drawForegroundLine(p0, p1, col) end

--- Ground line (colourGround).
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:65
---@param p0 vec3 Start.
---@param p1 vec3 End.
function editor_toolUtilities_render_lines.drawGroundLine(p0, p1) end

--- Dimmed ground line (colourGroundDull).
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:68
---@param p0 vec3 Start.
---@param p1 vec3 End.
function editor_toolUtilities_render_lines.drawGroundLineDull(p0, p1) end

--- Junction/loop line with thickness pulsing over time (os.clock, loopPulseHz). Not filtered by distance.
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:99
---@param p0 vec3 Start.
---@param p1 vec3 End.
function editor_toolUtilities_render_lines.drawJoinLine(p0, p1) end

--- Draws a line only if both endpoints are within 600 m of the camera.
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:27
---@param p0 vec3 Start.
---@param p1 vec3 End.
---@param thickness number Thickness.
---@param col integer Packed color.
function editor_toolUtilities_render_lines.drawLineCulled(p0, p1, thickness, col) end

--- Draws a line without distance filtering (debugDraw.drawLineInstance_MinArg).
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:25
---@param p0 vec3 Start.
---@param p1 vec3 End.
---@param thickness number Thickness.
---@param col integer Packed color.
function editor_toolUtilities_render_lines.drawLineImmediate(p0, p1, thickness, col) end

--- Navigation graph line (colourNav).
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:84
---@param p0 vec3 Start.
---@param p1 vec3 End.
function editor_toolUtilities_render_lines.drawNavLine(p0, p1) end

--- Normal line (colourNormal).
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:82
---@param p0 vec3 Start.
---@param p1 vec3 End.
function editor_toolUtilities_render_lines.drawNormalLine(p0, p1) end

--- Path line (colourPath).
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:85
---@param p0 vec3 Start.
---@param p1 vec3 End.
function editor_toolUtilities_render_lines.drawPathLine(p0, p1) end

--- Preview wireframe (colourPreviewWire).
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:55
---@param p0 vec3 Start.
---@param p1 vec3 End.
function editor_toolUtilities_render_lines.drawPreviewWireLine(p0, p1) end

--- Reference normal line (colourRefNormal).
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:83
---@param p0 vec3 Start.
---@param p1 vec3 End.
function editor_toolUtilities_render_lines.drawRefNormalLine(p0, p1) end

--- Rib line: halo pass (colourRibGlow) then core pass (colourRibLine).
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:58
---@param p0 vec3 Start.
---@param p1 vec3 End.
function editor_toolUtilities_render_lines.drawRibLine(p0, p1) end

--- Selected spline line: halo (thickness 4) then core (thickness 2). Not filtered by distance.
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:94
---@param p0 vec3 Start.
---@param p1 vec3 End.
function editor_toolUtilities_render_lines.drawSplineLine(p0, p1) end

--- Dimmed spline line (colourSplineDull).
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:88
---@param p0 vec3 Start.
---@param p1 vec3 End.
function editor_toolUtilities_render_lines.drawSplineLineDull(p0, p1) end

--- Foreground spline line (color colourSplineForegroundF).
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:38
---@param p0 vec3 Start.
---@param p1 vec3 End.
function editor_toolUtilities_render_lines.drawSplineLineForeground(p0, p1) end

--- Spline line linked to another (colourSplineLinked).
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:87
---@param p0 vec3 Start.
---@param p1 vec3 End.
function editor_toolUtilities_render_lines.drawSplineLineLinked(p0, p1) end

--- Unselected spline line (colourSplineDull, thickness 2).
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:91
---@param p0 vec3 Start.
---@param p1 vec3 End.
function editor_toolUtilities_render_lines.drawSplineLineUnselected(p0, p1) end

--- Right-angle mark line (colourSquareCorner).
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:80
---@param p0 vec3 Start.
---@param p1 vec3 End.
function editor_toolUtilities_render_lines.drawSquareCornerLine(p0, p1) end

--- Foreground right-angle mark (colourSquareCornerF).
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:81
---@param p0 vec3 Start.
---@param p1 vec3 End.
function editor_toolUtilities_render_lines.drawSquareCornerLineForeground(p0, p1) end

--- Layer wireframe (colourLayerWire, thickness 2).
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:42
---@param p0 vec3 Start.
---@param p1 vec3 End.
function editor_toolUtilities_render_lines.drawWireFrameLine(p0, p1) end

--- Second layer wireframe (colourLayerWire2).
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:49
---@param p0 vec3 Start.
---@param p1 vec3 End.
function editor_toolUtilities_render_lines.drawWireFrameLine2(p0, p1) end

--- Third layer wireframe (colourLayerWire3).
---Source: lua/ge/extensions/editor/toolUtilities/render/lines.lua:52
---@param p0 vec3 Start.
---@param p1 vec3 End.
function editor_toolUtilities_render_lines.drawWireFrameLine3(p0, p1) end

