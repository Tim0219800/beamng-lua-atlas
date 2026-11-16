---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_util_perlinNoise_C
local flowgraph_nodes_util_perlinNoise_C = {}

--- Sums the noise over several octaves (frequency ×2 and amplitude ÷2 at each octave); divides by the sum of the amplitudes if normalize.
---Source: lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:145
---@param x number X coordinate.
---@param y number Y coordinate.
---@param z number Z coordinate.
---@param octaves integer Number of octaves.
---@param amplitude number Initial amplitude.
---@param frequency number Initial frequency.
function flowgraph_nodes_util_perlinNoise_C:OctavePerlin(x, y, z, octaves, amplitude, frequency) end

--- Clears the graph, sets the scale, fills the permutation table (doubled) and draws the random seed if randomStartSeed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:103
function flowgraph_nodes_util_perlinNoise_C:_executionStarted() end

--- Draws the "Smooth preset" and "Natural preset" buttons that set frequency/amplitude/octaves.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:76
function flowgraph_nodes_util_perlinNoise_C:drawCustomProperties() end

--- Draws the curve of the latest values if data.debug.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:94
---@param builder table Node constructor.
---@param style table Node style.
function flowgraph_nodes_util_perlinNoise_C:drawMiddle(builder, style) end

--- Smoothing curve 6t^5 - 15t^4 + 10t^3 (called without self).
---Source: lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:228
---@param t number Value in [0,1].
function flowgraph_nodes_util_perlinNoise_C.fade(t) end

--- Pseudo-random gradient chosen according to the 4 low bits of the hash.
---Source: lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:223
---@param hash integer Hash value.
---@param x number x.
---@param y number y.
---@param z number z.
function flowgraph_nodes_util_perlinNoise_C:grad(hash, x, y, z) end

--- Initializes the graph buffer, the seed, data.debug=true and data.graphDataCount=1000.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:67
function flowgraph_nodes_util_perlinNoise_C:init() end

--- Linear interpolation a + t(b-a) (called without self).
---Source: lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:232
---@param t number Ratio.
---@param a number Start.
---@param b number End.
function flowgraph_nodes_util_perlinNoise_C.lerp(t, a, b) end

--- Basic 3D Perlin noise (interpolation of the 8 corners of the unit cube).
---Source: lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:162
---@param x number X coordinate.
---@param y number|nil Y coordinate (0 by default).
---@param z number|nil Z coordinate (0 by default).
function flowgraph_nodes_util_perlinNoise_C:noise(x, y, z) end

--- If flow is active, computes OctavePerlin(randomStartSeed + value, 0, 0, ...), feeds the graph and writes value and flow.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua:127
function flowgraph_nodes_util_perlinNoise_C:work() end

