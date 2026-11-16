# `flowgraph_nodes_util_perlinNoise`

*File: `lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua` · VM: Game Engine (GE) · 238 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/perlinNoise")` (file under extensions/ but not a regular extension)

Node "Perlin Noise" (repeat_instant). Produces a coherent pseudo-random number (octave Perlin noise) as a function of an input value, for example time. Inputs: flow, value (seed/abscissa), octaves (6), amplitude (128), frequency (4), normalize (false), randomStartSeed (true, randomly offsets the abscissa at each start). Outputs: flow, value. "Smooth" and "Natural" preset buttons in the inspector; a debug graph is drawn in the node (data.debug). Implementation adapted from a gist by kymckay.

## Notes

- The OctavePerlin loop goes from 0 to octaves inclusive: there are octaves+1 passes.
- In _executionStarted, amplitude.value is read for the graph scale; without a value the line would fail.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:OctavePerlin(x, y, z, octaves, amplitude, frequency)` | Sums the noise over several octaves (frequency ×2 and amplitude ÷2 at each octave); divides by the sum of the amplitudes if normalize. | 145 |
| `C:_executionStarted()` | Clears the graph, sets the scale, fills the permutation table (doubled) and draws the random seed if randomStartSeed. | 103 |
| `C:drawCustomProperties()` | Draws the "Smooth preset" and "Natural preset" buttons that set frequency/amplitude/octaves. | 76 |
| `C:drawMiddle(builder, style)` | Draws the curve of the latest values if data.debug. | 94 |
| `C.fade(t)` | Smoothing curve 6t^5 - 15t^4 + 10t^3 (called without self). | 228 |
| `C:grad(hash, x, y, z)` | Pseudo-random gradient chosen according to the 4 low bits of the hash. | 223 |
| `C:init()` | Initializes the graph buffer, the seed, data.debug=true and data.graphDataCount=1000. | 67 |
| `C.lerp(t, a, b)` | Linear interpolation a + t(b-a) (called without self). | 232 |
| `C:noise(x, y, z)` | Basic 3D Perlin noise (interpolation of the 8 corners of the unit cube). | 162 |
| `C:work()` | If flow is active, computes OctavePerlin(randomStartSeed + value, 0, 0, ...), feeds the graph and writes value and flow. | 127 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/perlinNoise.lua`.*
