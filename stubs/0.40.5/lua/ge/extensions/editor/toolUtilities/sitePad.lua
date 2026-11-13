---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/sitePad.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_sitePad` : `extensions.load("editor_toolUtilities_sitePad")`, puis la globale `editor_toolUtilities_sitePad`
---@class editor_toolUtilities_sitePad
editor_toolUtilities_sitePad = {}

--- Cut the site's own ground plan into the pad, so a sunk square, a terrace or a flight of steps can be SEEN while it is
--- being drawn instead of only once the site is placed. `features` is the same list the site bakes for the placer, so the
--- ground here and the ground there are cut from one answer.
--- The last cut is handed back first: a carve blends into the ground around it, and blending into ground the previous carve
--- already pulled down would eat further into the pad every time. Called with nothing, that hand-back is all it does.
--- On real ground `prio` is the site's band, and whatever outranks it nearby goes into the same pass at its own: the cut
--- gives way to a road's verge here exactly as the level's grade will make it.
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:150
---@param features any
---@param prio any
function editor_toolUtilities_sitePad.carve(features, prio) end

--- The same, by heightmap cell, in the grid's own units; nil off the pad.
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:206
---@param gx any
---@param gy any
function editor_toolUtilities_sitePad.cellZ(gx, gy) end

--- Where a tool should centre its pad, given the bounds of what it already holds. The camera's aim when it holds nothing,
--- which is where the tools seed a starter shape, so a fresh site and its pad arrive in the same place.
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:126
---@param ring any
function editor_toolUtilities_sitePad.centreFor(ring) end

--- How far the pad's ground sits below the set-out level, nil with no pad down.
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:229
function editor_toolUtilities_sitePad.drop() end

--- Take the square centred on (cx, cy) flat, remembering what was there so `leave` can put it back. A pad already down goes
--- back first: two overlapping pads would each remember the other's level as the original ground and lose the real one.
--- `drop` takes the ground that far BELOW the set-out level instead of level with it, which is how a tool whose site has
--- ground of its own under it -- a basement, an areaway -- gets to see into it. The site keeps standing at `level()`: the
--- two come apart, and everything that sets something out on the pad wants the set-out level and not the cut surface.
--- `real` leaves the ground as it is and only remembers it: a site drawn round its own plot is designed on the ground it
--- will stand on, and the carve and `leave` work the same. Such a pad has no set-out level; `level` is not for it.
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:89
---@param cx any
---@param cy any
---@param drop any
---@param real any
function editor_toolUtilities_sitePad.enter(cx, cy, drop, real) end

--- The ground at (x, y) as it was before the pad went down or anything was cut into it; nil off the pad. What a level is
--- measured from: measured off the cut instead, each cut moves the level the next one is cut to.
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:219
---@param x any
---@param y any
function editor_toolUtilities_sitePad.groundZ(x, y) end

---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:203
function editor_toolUtilities_sitePad.isDown() end

--- The ground back as it was. Only heights: whatever the tool built on the pad comes down by its own teardown, and has to,
--- or it would be left standing at the pad's level over ground that is no longer there.
--- Anything carved INTO the pad goes with it: the pad remembers the real ground, which is older than any cut made in it.
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:61
function editor_toolUtilities_sitePad.leave() end

--- The world level a site on the pad is SET OUT against. What anything standing on the drawing board should use in place of
--- sampling the ground, which once a site has cut its own shapes into the pad is not flat.
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:239
function editor_toolUtilities_sitePad.level() end

--- The pad cut again at another drop, where it stands. Its carve is dropped with it: that was cut into the old ground.
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:232
---@param d any
function editor_toolUtilities_sitePad.redrop(d) end

---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:195
function editor_toolUtilities_sitePad.resume() end

--- Who gets the real ground once more before a pad remembers it: `fn()` runs as an editor comes in.
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:215
---@param fn any
function editor_toolUtilities_sitePad.setBeforeEnter(fn) end

--- Who answers what outranks a site on real ground: `fn(x0, y0, x1, y1)` returns those features, each carrying its band.
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:212
---@param fn any
function editor_toolUtilities_sitePad.setHeld(fn) end

--- The pad off the ground for the duration of a level save, and back down again afterwards. A save writes the terrain as it
--- finds it, so a drawing board left lying there would go into the level as real ground - a 300 m plateau where the map had
--- a hillside, saved because a tool happened to be open at the time.
---Source : lua/ge/extensions/editor/toolUtilities/sitePad.lua:186
function editor_toolUtilities_sitePad.suspend() end

