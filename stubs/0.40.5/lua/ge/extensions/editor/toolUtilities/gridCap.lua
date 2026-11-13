---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/gridCap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_gridCap` : `extensions.load("editor_toolUtilities_gridCap")`, puis la globale `editor_toolUtilities_gridCap`
---@class editor_toolUtilities_gridCap
editor_toolUtilities_gridCap = {}

--- The cap over `rings` (the outline, then its holes; open or closed) in world space, as the flat `mesh` (see above), or nil.
--- `cf` is the grain (`ax, ay` along it, `inX, inY` across), `zAt(x, y)` the field, `cell` the grid's pitch. A point on a
--- ring whose nodes carry heights keeps the straight line between them, since that is where its edging is swept; a ring
--- given without heights takes the field's along it.
---Source : lua/ge/extensions/editor/toolUtilities/gridCap.lua:206
---@param rings any
---@param cf any
---@param zAt any
---@param cell any
function editor_toolUtilities_gridCap.build(rings, cf, zAt, cell) end

--- Those of `rings` that can reach a cell of the grid a cap over `outer` is laid on. Any other is never clipped into a cell
--- and never holds a cell's centre, so the cap comes out the same without it.
---Source : lua/ge/extensions/editor/toolUtilities/gridCap.lua:330
---@param outer any
---@param rings any
---@param cf any
---@param cell any
function editor_toolUtilities_gridCap.reaching(outer, rings, cf, cell) end

