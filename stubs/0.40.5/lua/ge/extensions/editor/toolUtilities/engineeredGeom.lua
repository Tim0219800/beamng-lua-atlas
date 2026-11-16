---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 'Engineer' road geometry for the editor's spline editing tools: transforms the polyline of a spline's nodes into a line - clothoid - arc - clothoid - line axis (rounded turns with adaptive radius, smoothed vertical profile, widening in tight turns). The tools call it via sampleInto according to group.geometryMode ('engineered' or 'spline'). It fills the spline's divPoints, divWidths, normals, divCurv and discMap, then computes the Frenet frame via geom.computeFrenetFrame.
--- Access: extension `editor_toolUtilities_engineeredGeom`: `extensions.load("editor_toolUtilities_engineeredGeom")`, then the global `editor_toolUtilities_engineeredGeom`
---@class editor_toolUtilities_engineeredGeom
---@field CONTROLS table Metadata for the inspector, so that all tools display the same sliders: radius, transition, vertical, widthTaper, widenAmount (each with key, default, min, max, fmt, label, tooltip) and the tooltips toggleTooltip, modeEngTip, modeSmoothTip.
---@field DEFAULT_MIN_R number Floor radius of a turn (8.0 m).
editor_toolUtilities_engineeredGeom = {}

--- Completes a group with the engineered mode fields only if they are nil (geometryMode = 'spline', engRadiusM, engTransM, engVertLenM, curveWidenMaxM, curveWidenRunoffM, corners = {}). To be called when a group is created and when deserializing old sessions.
---Source: lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:574
---@param group table Group modified in place.
function editor_toolUtilities_engineeredGeom.applyDefaults(group) end

--- Builds the spline's plan axis from its nodes (turns with clothoids), then the vertical profile according to zMode, and updates spline.divPoints, divWidths, normals, divCurv, discMap before calling geom.computeFrenetFrame. Returns nothing (except for the Catmull-Rom fallback).
---Source: lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:290
---@param spline table Spline with nodes, widths, nmls, divPoints, divWidths, normals, discMap (and optionally isLoop, corners).
---@param p table|nil { R, Ls, minR, minAngleDeg, stepM, lonRes, vertLen, deckZ, maxStep, levelStart, levelFinish, zMode = 'free'|'raycast'|'conform' }.
function editor_toolUtilities_engineeredGeom.buildCenterline(spline, p) end

--- Wrapper of buildCenterline with zMode = 'conform' (axis conforming to the terrain).
---Source: lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:556
---@param spline table Spline.
---@param p table|nil Parameters (see buildCenterline); p.zMode is overwritten.
function editor_toolUtilities_engineeredGeom.buildCenterlineConform(spline, p) end

--- Wrapper of buildCenterline with zMode = 'free' (free node heights).
---Source: lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:548
---@param spline table Spline.
---@param p table|nil Parameters (see buildCenterline); p.zMode is overwritten.
function editor_toolUtilities_engineeredGeom.buildCenterlineFree(spline, p) end

--- Wrapper of buildCenterline with zMode = 'raycast' (axis placed on the terrain by raycast).
---Source: lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:552
---@param spline table Spline.
---@param p table|nil Parameters (see buildCenterline); p.zMode is overwritten.
function editor_toolUtilities_engineeredGeom.buildCenterlineRaycast(spline, p) end

--- Draws in debugDrawer, for a group in engineered mode: the node polygon (thin guide), a sphere on each inner node and the resulting axis colored by curvature (turquoise on a straight line, amber at the tightest turn). Fades with camera distance (full below 90 m, invisible beyond 550 m). No effect outside 'engineered' mode or with fewer than 2 nodes.
---Source: lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:603
---@param group table|nil Group/spline to draw.
function editor_toolUtilities_engineeredGeom.drawControlPolygon(group) end

--- Single sampling entry point according to group.geometryMode. In 'engineered' mode, calls buildCenterline with the group's eng* fields and returns true. Otherwise, sets group.divCurv to nil and returns false so that the tool runs its own geom.catmullRom* sampler.
---Source: lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:591
---@param group table Group/spline with geometryMode, engRadiusM, engTransM, engVertLenM.
---@param opts table|nil { zMode = 'free'|'raycast'|'conform' (default 'free'), lonRes, deckZ, maxStep, minR, levelStart, levelFinish }. levelStart/levelFinish: in free mode, this end joins a flat platform, the profile arrives flat.
---@return boolean  true if the engineered mode sampled, false if the caller must do it.
function editor_toolUtilities_engineeredGeom.sampleInto(group, opts) end

--- Manual self-test: builds a 90 degree turn (R 30, Ls 20) and logs the number of points, the max gap between points and the max bend per step.
---Source: lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:657
---@return integer  Number of generated axis points.
function editor_toolUtilities_engineeredGeom.selfTest() end

--- Resolves the geometry of a turn at node pI: signed deviation, radius, spiral length (reduced to R*|delta| if too long), spiral angle, arc angle and tangent distance T absorbed on each neighboring straight line. Works in plan (x, y). Returns { through = true, T = 0 } if a segment is nearly zero or if the deviation is below minAngle.
---Source: lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:62
---@param pPrev vec3 Previous node.
---@param pI vec3 Turn node (intersection point).
---@param pNext vec3 Next node.
---@param R number Desired arc radius (m).
---@param Ls number Desired spiral length (m).
---@param minAngle number Minimum deviation (rad) below which no rounding is done.
---@return table  { through, delta, absD, turn (+1 left, -1 right), R, Ls, thetaS, arc, T }.
function editor_toolUtilities_engineeredGeom.solveCorner(pPrev, pI, pNext, R, Ls, minAngle) end

