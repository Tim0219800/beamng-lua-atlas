---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/render/markup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 3D text labels for the spline editing tools (from the old render.lua). Provides the text primitives (filtered or not by distance, normal or inverted colors, via debugDraw.drawTextAdvanced) and all the ready-made labels: cursor prompts ("Click To Add Node"), names, lengths, widths, elevations, speeds, obstacle distances. The texts are in English in the code.
--- Access: extension `editor_toolUtilities_render_markup`: `extensions.load("editor_toolUtilities_render_markup")`, then the global `editor_toolUtilities_render_markup`
---@class editor_toolUtilities_render_markup
editor_toolUtilities_render_markup = {}

--- Text at pos, displayed only within 250 m of the camera.
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:22
---@param pos vec3 Position.
---@param text string Text.
function editor_toolUtilities_render_markup.drawMarkupCulled(pos, text) end

--- Same behavior as drawMarkupCulled (250 m filter).
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:27
---@param pos vec3 Position.
---@param text string Text.
function editor_toolUtilities_render_markup.drawMarkupCulledAlwaysShow(pos, text) end

--- Text filtered at 250 m with inverted text and background colors.
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:36
---@param pos vec3 Position.
---@param text string Text.
function editor_toolUtilities_render_markup.drawMarkupCulledInvertedCols(pos, text) end

--- Text without distance filter, for labels to keep readable at any distance.
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:33
---@param pos vec3 Position.
---@param text string Text.
function editor_toolUtilities_render_markup.drawMarkupUnculled(pos, text) end

--- Label "[Active Surface (2D)]".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:79
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupActiveSurf(pos) end

--- Prompt "[Click To Add Node]".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:59
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupAddNode(pos) end

--- Prompt "[Add Pair: Click 1st Node]".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:70
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupAddPairLeft(pos) end

--- Prompt "[Click To Add Node. Double-Click To Finish]".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:67
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupAddPolygonNode(pos) end

--- Height adjustment prompt (drag, SHIFT for precision).
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:63
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupAdjustBar(pos) end

--- Depth adjustment prompt (drag, SHIFT for precision).
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:64
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupAdjustDepth(pos) end

--- Width adjustment prompt (drag, SHIFT for precision).
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:62
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupAdjustWidth(pos) end

--- Displays distance (m) and angle (converted from radians to degrees).
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:96
---@param pos vec3 Position.
---@param dist number Distance in meters.
---@param angleRad number Angle in radians.
function editor_toolUtilities_render_markup.markupAngleAndDistance(pos, dist, angleRad) end

--- Displays distance, angle (degrees) and altitude difference dZ.
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:97
---@param pos vec3 Position.
---@param dist number Distance in meters.
---@param angleRad number Angle in radians.
---@param elevDiff number Altitude difference in meters.
function editor_toolUtilities_render_markup.markupAngleDistanceWithElevation(pos, dist, angleRad, elevDiff) end

--- Displays "[d = x.xx m]".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:66
---@param pos vec3 Position.
---@param d number Depth in meters.
function editor_toolUtilities_render_markup.markupDepthDisplay(pos, d) end

--- Prompt "[Click To Select, Drag To Move]".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:54
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupDrag(pos) end

--- Displays "[Elevation = x.xx m]" without distance filter (only one, on the selected node).
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:82
---@param pos vec3 Position.
---@param elev number Elevation in meters.
function editor_toolUtilities_render_markup.markupElevation(pos, elev) end

--- Label "[End]" in inverted colors.
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:69
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupEnd(pos) end

--- Prompt "[Click NavGraph Node To Add To Path]".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:86
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupGraphFreeSpace(pos) end

--- Prompt "[Click To Add/Remove From Path]".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:85
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupGraphNodeHover(pos) end

--- Prompt "[Click To Insert Node]".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:60
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupInsertNode(pos) end

--- Prompt "[Hold CTRL + Drop To Join]".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:91
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupJoin(pos) end

--- Several lines joined by line breaks into a single filtered label. No effect if the list is empty.
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:44
---@param pos vec3 Position.
---@param lines string[] Lines of text.
function editor_toolUtilities_render_markup.markupLines(pos, lines) end

--- Message "[Linked Spline - Cannot Add Nodes]".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:92
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupLinkedSplineCannotAdd(pos) end

--- Prompt "[Linked — Drag Away Or Use Detach Button]".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:55
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupLinkedTip(pos) end

--- Prompt "[Hold CTRL + Drop To Form Loop]". The masterSpline sequence conditions junctions and loops on CTRL: the preview appears as soon as a candidate exists, but releasing only validates with CTRL held.
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:90
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupLoop(pos) end

--- Message "[Looped Spline - Cannot Add Here]".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:93
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupLoopedSplineCannotAdd(pos) end

--- Label "Node [1]".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:73
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupNode1(pos) end

--- Label "Node [2]".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:74
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupNode2(pos) end

--- Label "Node [3]".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:75
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupNode3(pos) end

--- Displays "[Obstacle: x.x m]".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:94
---@param pos vec3 Position.
---@param dist number Distance in meters.
function editor_toolUtilities_render_markup.markupObstacleDistance(pos, dist) end

--- Displays the distance to the obstacle and the altitude difference dZ.
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:95
---@param pos vec3 Position.
---@param dist number Distance in meters.
---@param elevDiff number Altitude difference in meters.
function editor_toolUtilities_render_markup.markupObstacleDistanceWithElevation(pos, dist, elevDiff) end

--- Label "[Pair: First Node]".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:71
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupPairFirstNode(pos) end

--- Prompt: left click adds the 2nd node, right click cancels the pair.
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:72
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupPairSecondNode(pos) end

--- Label "Path Node [i]".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:87
---@param pos vec3 Position.
---@param i integer Node number.
function editor_toolUtilities_render_markup.markupPathNode(pos, i) end

--- Cursor prompt: unfiltered text.
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:43
---@param pos vec3 Position.
---@param text string Text.
function editor_toolUtilities_render_markup.markupPrompt(pos, text) end

--- Label "[Length = x.xx m]" in inverted colors.
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:61
---@param pos vec3 Position.
---@param l number Length in meters.
function editor_toolUtilities_render_markup.markupRoadLength(pos, l) end

--- Prompt "[Select A Spline Or Click 'Add']".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:58
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupSelectOrAdd(pos) end

--- Prompt "[Click To Select Spline]".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:56
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupSelectSpline(pos) end

--- Same label for the item being edited, unfiltered.
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:78
---@param pos vec3 Position.
---@param str string Name.
function editor_toolUtilities_render_markup.markupSelectedName(pos, str) end

--- Prompt "[Spline Disabled. Cannot Edit]".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:57
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupSelectedSplineDisabled(pos) end

--- Spline name in brackets, filtered at 250 m.
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:76
---@param pos vec3 Position.
---@param str string Name.
function editor_toolUtilities_render_markup.markupSplineName(pos, str) end

--- Draws each line as a separate label at the same position (they overlap).
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:48
---@param pos vec3 Position.
---@param lines string[] Lines of text.
function editor_toolUtilities_render_markup.markupStack(pos, lines) end

--- Label "[Start]" in inverted colors.
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:68
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupStart(pos) end

--- Simple filtered text.
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:42
---@param pos vec3 Position.
---@param text string Text.
function editor_toolUtilities_render_markup.markupText(pos, text) end

--- Displays "[Twist Angle = x.xx deg]".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:83
---@param pos vec3 Position.
---@param angleDeg number Angle in degrees.
function editor_toolUtilities_render_markup.markupTwistAngle(pos, angleDeg) end

--- Displays "[Limit|Velocity = x.xx unit]".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:84
---@param pos vec3 Position.
---@param vel number Value.
---@param isBarsLimit boolean true: Limit label, false: Velocity.
---@param unitsStr string Displayed unit.
function editor_toolUtilities_render_markup.markupVelocity(pos, vel, isBarsLimit, unitsStr) end

--- Label "[Active Volume (3D)]".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:80
---@param pos vec3 Position.
function editor_toolUtilities_render_markup.markupVolume(pos) end

--- Displays "[Width = x.xx m]".
---Source: lua/ge/extensions/editor/toolUtilities/render/markup.lua:65
---@param pos vec3 Position.
---@param w number Width in meters.
function editor_toolUtilities_render_markup.markupWidthDisplay(pos, w) end

