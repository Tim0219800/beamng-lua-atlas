---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua
---@class flowgraph_nodes_util_perlinNoise_C
local flowgraph_nodes_util_perlinNoise_C = {}

---Source : lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:145
---@param x any
---@param y any
---@param z any
---@param octaves any
---@param amplitude any
---@param frequency any
function flowgraph_nodes_util_perlinNoise_C:OctavePerlin(x, y, z, octaves, amplitude, frequency) end

---Source : lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:103
function flowgraph_nodes_util_perlinNoise_C:_executionStarted() end

---Source : lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:76
function flowgraph_nodes_util_perlinNoise_C:drawCustomProperties() end

---Source : lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:94
---@param builder any
---@param style any
function flowgraph_nodes_util_perlinNoise_C:drawMiddle(builder, style) end

--- Fade function is used to smooth final output
---Source : lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:228
---@param t any
function flowgraph_nodes_util_perlinNoise_C.fade(t) end

---Source : lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:223
---@param hash any
---@param x any
---@param y any
---@param z any
function flowgraph_nodes_util_perlinNoise_C:grad(hash, x, y, z) end

---Source : lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:67
function flowgraph_nodes_util_perlinNoise_C:init() end

---Source : lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:232
---@param t any
---@param a any
---@param b any
function flowgraph_nodes_util_perlinNoise_C.lerp(t, a, b) end

---Source : lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:162
---@param x any
---@param y any
---@param z any
function flowgraph_nodes_util_perlinNoise_C:noise(x, y, z) end

---Source : lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:127
function flowgraph_nodes_util_perlinNoise_C:work() end

