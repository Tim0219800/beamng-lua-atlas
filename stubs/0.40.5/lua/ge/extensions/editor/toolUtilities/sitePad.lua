---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/sitePad.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- A flat terrain platform ("pad") on which a site tool can draw, and the site's own ground carved into it. enter flattens a 300 m square at 50 m altitude (the site's reference level) while remembering the real ground; leave puts it back as it was; carve carves the site's ground plan into it (terrace, ramp, steps, basement) so that it can be seen while drawing; suspend/resume remove it for the duration of a level save. Only one pad at a time (only one tool holds the screen).
--- Access: extension `editor_toolUtilities_sitePad`: `extensions.load("editor_toolUtilities_sitePad")`, then the global `editor_toolUtilities_sitePad`
---@class editor_toolUtilities_sitePad
editor_toolUtilities_sitePad = {}

--- Carves the site's ground plan into the pad, so that a sunken square, a terrace or a staircase are VISIBLE during drawing. features is the same list as the one baked for the placer. The last cut is first undone (a cut blends into the ground around it, and blending into an already lowered ground would nibble the pad each time); without features, that is all the call does.
---Source: lua/ge/extensions/editor/toolUtilities/sitePad.lua:150
---@param features table|nil List of features { quad } or { rings, z } with mode and band.
---@param prio number|nil On real ground, the site's priority band; what takes precedence nearby enters the same pass at its own priority.
---@return boolean  false if there is no pad.
function editor_toolUtilities_sitePad.carve(features, prio) end

--- Original height of a cell of the pad's height grid (before placement), in grid units (from the base of the block); nil outside the pad.
---Source: lua/ge/extensions/editor/toolUtilities/sitePad.lua:206
---@param gx integer Grid column.
---@param gy integer Grid row.
---@return number|nil  Height in grid frame.
function editor_toolUtilities_sitePad.cellZ(gx, gy) end

--- Where a tool should center its pad according to the bounds of what it already holds (center of the points' bounding box). Without points, the camera's aim (util.lookAtGround), where the tools place a starting shape.
---Source: lua/ge/extensions/editor/toolUtilities/sitePad.lua:126
---@param ring table|nil List of {x,y} points.
---@return number  x of the center.
---@return number  y of the center.
function editor_toolUtilities_sitePad.centreFor(ring) end

--- How far the pad's ground is below the reference level; nil without a pad.
---Source: lua/ge/extensions/editor/toolUtilities/sitePad.lua:229
---@return number|nil  Lowering in meters.
function editor_toolUtilities_sitePad.drop() end

--- Flattens the square centered on (cx, cy) while remembering what was there, so that leave puts it back. A pad already in place is first put back (two overlapping pads would lose the real ground). Calls beforeEnterFn first if there was no pad.
---Source: lua/ge/extensions/editor/toolUtilities/sitePad.lua:89
---@param cx number x of the center.
---@param cy number y of the center.
---@param drop number|nil Lowers the ground by this distance BELOW the reference level (a tool whose site has its own ground below, basement or sunken courtyard, can thus see inside). The site stays at level(): the reference level and the carved surface separate.
---@param real boolean|nil Leaves the ground as is and only remembers it: a site drawn around its plot is designed on the ground where it will stand. Such a pad has no reference level; level is not for it.
---@return boolean  true if the pad is placed.
function editor_toolUtilities_sitePad.enter(cx, cy, drop, real) end

--- The ground at (x, y) as it was before the pad was placed or any cut; nil outside the pad. What a level is measured from: measured on the cut, each cut would shift the level of the next.
---Source: lua/ge/extensions/editor/toolUtilities/sitePad.lua:219
---@param x number World x.
---@param y number World y.
---@return number|nil  World z height.
function editor_toolUtilities_sitePad.groundZ(x, y) end

--- True if a pad is placed.
---Source: lua/ge/extensions/editor/toolUtilities/sitePad.lua:203
---@return boolean  true if pad placed.
function editor_toolUtilities_sitePad.isDown() end

--- Puts the ground back as it was. Only the heights: what the tool built on the pad goes away through its own teardown. Everything carved INTO the pad goes with it.
---Source: lua/ge/extensions/editor/toolUtilities/sitePad.lua:61
---@return boolean  false if there was no pad.
function editor_toolUtilities_sitePad.leave() end

--- The world level (50 m) against which a site placed on the pad is DRAWN. To be used for everything that stands on the drawing board instead of sampling the ground, which is no longer flat once the site has carved its shapes into it.
---Source: lua/ge/extensions/editor/toolUtilities/sitePad.lua:239
---@return number  Reference level (PAD_Z = 50).
function editor_toolUtilities_sitePad.level() end

--- Recuts the pad at a different lowering, where it stands. Its cut falls with it: it had been carved into the old ground. Returns false without a pad or if the lowering is unchanged.
---Source: lua/ge/extensions/editor/toolUtilities/sitePad.lua:232
---@param d number New lowering in meters.
---@return boolean  true if the pad was redone.
function editor_toolUtilities_sitePad.redrop(d) end

--- Puts the pad back in place after suspend, with the same cut size.
---Source: lua/ge/extensions/editor/toolUtilities/sitePad.lua:195
---@return boolean  true if the pad and its cut are restored.
function editor_toolUtilities_sitePad.resume() end

--- Registers who restores the real ground one last time before a pad remembers it: fn() runs on entering an editor (only if there was no pad already).
---Source: lua/ge/extensions/editor/toolUtilities/sitePad.lua:215
---@param fn function fn() with no argument.
function editor_toolUtilities_sitePad.setBeforeEnter(fn) end

--- Registers who answers for what takes precedence over a site on real ground: fn(x0, y0, x1, y1) returns those features, each with its band.
---Source: lua/ge/extensions/editor/toolUtilities/sitePad.lua:212
---@param fn function fn(x0, y0, x1, y1) -> list of features.
function editor_toolUtilities_sitePad.setHeld(fn) end

--- Removes the pad from the ground for the duration of a level save, retaining its position and what was carved into it. A save writes the terrain as it finds it: a drawing board left there would be written as real ground.
---Source: lua/ge/extensions/editor/toolUtilities/sitePad.lua:186
---@return boolean  false if there was no pad.
function editor_toolUtilities_sitePad.suspend() end

