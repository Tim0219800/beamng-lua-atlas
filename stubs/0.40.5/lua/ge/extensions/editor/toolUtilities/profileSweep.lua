---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/profileSweep.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_profileSweep` : `extensions.load("editor_toolUtilities_profileSweep")`, puis la globale `editor_toolUtilities_profileSweep`
---@class editor_toolUtilities_profileSweep
editor_toolUtilities_profileSweep = {}

--- World point of section point (y, z) at station a.
---Source : lua/ge/extensions/editor/toolUtilities/profileSweep.lua:22
---@param a any
---@param y any
---@param z any
function editor_toolUtilities_profileSweep.at(a, y, z) end

--- Sweep `strips` along the stations `st` ({ x, y, z, bx, by, bz (across), nx, ny, nz (up), s (arc) } each).
---  strip = { pts = { { y, z }, ... }, nrm = { { ny, nz }, ... } (unit, toward the visible side), mat }
---  opts  = { tol, tolZ, maxSeg (the decimation, as deckSweep), keyL, keyR (the section points it watches, { y, z }) }
---  Returns the parts (one per material) and the kept station indices, or nil for fewer than two stations.
---Source : lua/ge/extensions/editor/toolUtilities/profileSweep.lua:45
---@param st any
---@param strips any
---@param opts any
function editor_toolUtilities_profileSweep.build(st, strips, opts) end

