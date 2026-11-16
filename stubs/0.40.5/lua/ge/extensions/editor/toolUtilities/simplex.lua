---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/simplex.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 2D simplex noise (Perlin's simplicial grid) with a fixed permutation table, hence deterministic. Optimized for millions of samples (precomputed skew factors, gradients in two flat arrays, precomputed gradient indices). Used by editor tools for reproducible pseudo-random variations.
--- Access: extension `editor_toolUtilities_simplex`: `extensions.load("editor_toolUtilities_simplex")`, then the global `editor_toolUtilities_simplex`
---@class editor_toolUtilities_simplex
editor_toolUtilities_simplex = {}

--- 2D simplex noise at point (xin, yin).
---Source: lua/ge/extensions/editor/toolUtilities/simplex.lua:54
---@param xin number x coordinate.
---@param yin number y coordinate.
---@return number  Noise value, roughly [-1, 1].
function editor_toolUtilities_simplex.noise(xin, yin) end

---@type number
i = nil
