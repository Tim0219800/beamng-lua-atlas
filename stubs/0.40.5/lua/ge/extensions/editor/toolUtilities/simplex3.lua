---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/simplex3.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 3D simplex noise (Ken Perlin's simplicial grid, after Stefan Gustavson's reference). Deterministic, continuous with continuous first derivative. The gradient indices (perm % 12 + 1) are precomputed to speed up massive calls.
--- Access: extension `editor_toolUtilities_simplex3`: `extensions.load("editor_toolUtilities_simplex3")`, then the global `editor_toolUtilities_simplex3`
---@class editor_toolUtilities_simplex3
editor_toolUtilities_simplex3 = {}

--- 3D simplex noise at point (xin, yin, zin).
---Source: lua/ge/extensions/editor/toolUtilities/simplex3.lua:55
---@param xin number x coordinate.
---@param yin number y coordinate.
---@param zin number z coordinate.
---@return number  Noise value, roughly [-1, 1].
function editor_toolUtilities_simplex3.noise(xin, yin, zin) end

---@type number
i = nil
