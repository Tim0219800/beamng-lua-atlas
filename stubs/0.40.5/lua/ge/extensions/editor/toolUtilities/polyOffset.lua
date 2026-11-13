---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/polyOffset.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_polyOffset` : `extensions.load("editor_toolUtilities_polyOffset")`, puis la globale `editor_toolUtilities_polyOffset`
---@class editor_toolUtilities_polyOffset
---@field MITER_LIMIT number
editor_toolUtilities_polyOffset = {}

---Source : lua/ge/extensions/editor/toolUtilities/polyOffset.lua:15
---@param px any
---@param py any
---@param dx any
---@param dy any
---@param qx any
---@param qy any
---@param ex any
---@param ey any
function editor_toolUtilities_polyOffset.lineIntersect(px, py, dx, dy, qx, qy, ex, ey) end

--- One offset point for a vertex turning between two edge normals: the mitre, clamped back along its own bisector where the
---  corner is too sharp to cut.
---Source : lua/ge/extensions/editor/toolUtilities/polyOffset.lua:24
---@param cx any
---@param cy any
---@param n1 any
---@param n2 any
---@param d any
function editor_toolUtilities_polyOffset.mitrePt(cx, cy, n1, n2, d) end

--- Offset a polyline sideways by signed distance d.
---Source : lua/ge/extensions/editor/toolUtilities/polyOffset.lua:37
---@param pts any
---@param nrm any
---@param d any
---@param join any
function editor_toolUtilities_polyOffset.polyline(pts, nrm, d, join) end

--- A closed ribbon from the line out to its offset. `overlap` is how far the base is sunk into the mass behind it.
---Source : lua/ge/extensions/editor/toolUtilities/polyOffset.lua:75
---@param pts any
---@param nrm any
---@param d any
---@param join any
---@param overlap any
function editor_toolUtilities_polyOffset.run(pts, nrm, d, join, overlap) end

