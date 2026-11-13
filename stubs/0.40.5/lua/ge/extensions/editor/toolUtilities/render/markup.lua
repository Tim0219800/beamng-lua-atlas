---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/render/markup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_render_markup` : `extensions.load("editor_toolUtilities_render_markup")`, puis la globale `editor_toolUtilities_render_markup`
---@class editor_toolUtilities_render_markup
editor_toolUtilities_render_markup = {}

--- Labels that repeat (names, lengths, per-node values) cull at a shorter distance (250 m; 250*250 squared) than
---  geometry, so a zoomed-out view doesn't flood. Cursor prompts are only ever one at a time and draw unculled, so they
---  still read from high above while planning.
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:22
---@param pos any
---@param text any
function editor_toolUtilities_render_markup.drawMarkupCulled(pos, text) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:27
---@param pos any
---@param text any
function editor_toolUtilities_render_markup.drawMarkupCulledAlwaysShow(pos, text) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:36
---@param pos any
---@param text any
function editor_toolUtilities_render_markup.drawMarkupCulledInvertedCols(pos, text) end

--- Drawn WITHOUT the distance cull, for the one or two labels that must stay readable however far the camera pulls back.
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:33
---@param pos any
---@param text any
function editor_toolUtilities_render_markup.drawMarkupUnculled(pos, text) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:79
---@param pos any
function editor_toolUtilities_render_markup.markupActiveSurf(pos) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:59
---@param pos any
function editor_toolUtilities_render_markup.markupAddNode(pos) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:70
---@param pos any
function editor_toolUtilities_render_markup.markupAddPairLeft(pos) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:67
---@param pos any
function editor_toolUtilities_render_markup.markupAddPolygonNode(pos) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:63
---@param pos any
function editor_toolUtilities_render_markup.markupAdjustBar(pos) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:64
---@param pos any
function editor_toolUtilities_render_markup.markupAdjustDepth(pos) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:62
---@param pos any
function editor_toolUtilities_render_markup.markupAdjustWidth(pos) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:96
---@param pos any
---@param dist any
---@param angleRad any
function editor_toolUtilities_render_markup.markupAngleAndDistance(pos, dist, angleRad) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:97
---@param pos any
---@param dist any
---@param angleRad any
---@param elevDiff any
function editor_toolUtilities_render_markup.markupAngleDistanceWithElevation(pos, dist, angleRad, elevDiff) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:66
---@param pos any
---@param d any
function editor_toolUtilities_render_markup.markupDepthDisplay(pos, d) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:54
---@param pos any
function editor_toolUtilities_render_markup.markupDrag(pos) end

--- Elevation is drawn WITHOUT the distance cull (there's only ever one, on the selected node) so it stays readable when zoomed out.
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:82
---@param pos any
---@param elev any
function editor_toolUtilities_render_markup.markupElevation(pos, elev) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:69
---@param pos any
function editor_toolUtilities_render_markup.markupEnd(pos) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:86
---@param pos any
function editor_toolUtilities_render_markup.markupGraphFreeSpace(pos) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:85
---@param pos any
function editor_toolUtilities_render_markup.markupGraphNodeHover(pos) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:60
---@param pos any
function editor_toolUtilities_render_markup.markupInsertNode(pos) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:91
---@param pos any
function editor_toolUtilities_render_markup.markupJoin(pos) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:44
---@param pos any
---@param lines any
function editor_toolUtilities_render_markup.markupLines(pos, lines) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:92
---@param pos any
function editor_toolUtilities_render_markup.markupLinkedSplineCannotAdd(pos) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:55
---@param pos any
function editor_toolUtilities_render_markup.markupLinkedTip(pos) end

--- The whole masterSpline suite gates joins/loops on CTRL (see splineInput): the preview shows whenever a candidate
---  exists, and the release only commits while CTRL is held.
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:90
---@param pos any
function editor_toolUtilities_render_markup.markupLoop(pos) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:93
---@param pos any
function editor_toolUtilities_render_markup.markupLoopedSplineCannotAdd(pos) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:73
---@param pos any
function editor_toolUtilities_render_markup.markupNode1(pos) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:74
---@param pos any
function editor_toolUtilities_render_markup.markupNode2(pos) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:75
---@param pos any
function editor_toolUtilities_render_markup.markupNode3(pos) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:94
---@param pos any
---@param dist any
function editor_toolUtilities_render_markup.markupObstacleDistance(pos, dist) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:95
---@param pos any
---@param dist any
---@param elevDiff any
function editor_toolUtilities_render_markup.markupObstacleDistanceWithElevation(pos, dist, elevDiff) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:71
---@param pos any
function editor_toolUtilities_render_markup.markupPairFirstNode(pos) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:72
---@param pos any
function editor_toolUtilities_render_markup.markupPairSecondNode(pos) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:87
---@param pos any
---@param i any
function editor_toolUtilities_render_markup.markupPathNode(pos, i) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:43
---@param pos any
---@param text any
function editor_toolUtilities_render_markup.markupPrompt(pos, text) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:61
---@param pos any
---@param l any
function editor_toolUtilities_render_markup.markupRoadLength(pos, l) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:58
---@param pos any
function editor_toolUtilities_render_markup.markupSelectOrAdd(pos) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:56
---@param pos any
function editor_toolUtilities_render_markup.markupSelectSpline(pos) end

--- The same label for the one thing being worked on, which stays legible from any distance.
---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:78
---@param pos any
---@param str any
function editor_toolUtilities_render_markup.markupSelectedName(pos, str) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:57
---@param pos any
function editor_toolUtilities_render_markup.markupSelectedSplineDisabled(pos) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:76
---@param pos any
---@param str any
function editor_toolUtilities_render_markup.markupSplineName(pos, str) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:48
---@param pos any
---@param lines any
function editor_toolUtilities_render_markup.markupStack(pos, lines) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:68
---@param pos any
function editor_toolUtilities_render_markup.markupStart(pos) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:42
---@param pos any
---@param text any
function editor_toolUtilities_render_markup.markupText(pos, text) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:83
---@param pos any
---@param angleDeg any
function editor_toolUtilities_render_markup.markupTwistAngle(pos, angleDeg) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:84
---@param pos any
---@param vel any
---@param isBarsLimit any
---@param unitsStr any
function editor_toolUtilities_render_markup.markupVelocity(pos, vel, isBarsLimit, unitsStr) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:80
---@param pos any
function editor_toolUtilities_render_markup.markupVolume(pos) end

---Source : lua/ge/extensions/editor/toolUtilities/render/markup.lua:65
---@param pos any
---@param w any
function editor_toolUtilities_render_markup.markupWidthDisplay(pos, w) end

