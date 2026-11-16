---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/perlin.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classic 2D Perlin noise (fixed 256-entry permutation table, Perlin's improved fade curve), deterministic. Used by editor tools to generate reproducible pseudo-random variations.
--- Access: extension `editor_toolUtilities_perlin`: `extensions.load("editor_toolUtilities_perlin")`, then the global `editor_toolUtilities_perlin`
---@class editor_toolUtilities_perlin
editor_toolUtilities_perlin = {}

--- Returns 2D Perlin noise at point (x, y). Continuous value, zero at integer coordinates, with amplitude around [-1, 1] approximately.
---Source: lua/ge/extensions/editor/toolUtilities/perlin.lua:49
---@param x number x coordinate.
---@param y number y coordinate.
---@return number  Noise value.
function editor_toolUtilities_perlin.noise(x, y) end

---@type number
i = nil
