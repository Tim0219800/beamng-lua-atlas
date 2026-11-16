# `editor_toolUtilities_noise`

*File: `lua/ge/extensions/editor/toolUtilities/noise.lua` · VM: Game Engine (GE) · 63 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_noise`: `extensions.load("editor_toolUtilities_noise")`, then the global `editor_toolUtilities_noise`

Fractal noise shared in world coordinates for the editor's terrain and meshing tools (terraform, hero road editor). Single source so that a road's mesh and the terrain around it sample the same field with the same roughness/scale mapping and match bump for bump along their shared edge. No per-tool seed: the coordinates are the raw world XY.

## Example

```lua
local noise = require('editor/toolUtilities/noise')
local f, s, oct, lac, gain = noise.mapNoiseParameters(0.5, 0.5)
local h = s * noise.fbm(x * f, y * f, oct, lac, gain)
```

## Notes

- Uses editor/toolUtilities/simplex (simplex.noise(x, y)); clamp and lerp are globals from common/mathlib.lua.
- The two mapping functions return the frequency (1/m), strength (m, crest height), octaves, lacunarity and gain, in that order.
- fbm applies the frequency per octave; passing x*freq and y*freq as input gives the desired base wavelength.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_noise.fbm(x, y, octaves, lacunarity, gain)` | Fractional Brownian motion at world point (x, y): a sum of simplex noise over several octaves, normalized by the total amplitude. | 20 |
| `editor_toolUtilities_noise.mapNoiseParameters(roughness, scale)` | Converts user roughness and scale ([0,1], clamped) into fbm parameters for LARGE terrain undulations: strength 0 to 1 m, frequency 0.02 (bumps of about 50 m) to 0.2 (about 5 m), octaves 3 to 6. | 33 |
| `editor_toolUtilities_noise.mapRoadNoiseParameters(roughness, scale)` | Same field, but tuned for a ROAD SURFACE (rally bumps): finer band and lower amplitude, strength 0 to 0.18 m crest height, frequency 0.06 (about 16 m) to 0.5 (about 2 m), octaves 3 to 5. | 46 |

### Parameter details

#### `editor_toolUtilities_noise.fbm(x, y, octaves, lacunarity, gain)`

Fractional Brownian motion at world point (x, y): a sum of simplex noise over several octaves, normalized by the total amplitude.

- `x` (*number*) : World X (already multiplied by the base frequency if desired).
- `y` (*number*) : World Y.
- `octaves` (*integer*) : Number of octaves.
- `lacunarity` (*number*) : Frequency multiplier per octave.
- `gain` (*number*) : Amplitude multiplier per octave.
- **returns**: number Normalized value of about [-1, 1].

#### `editor_toolUtilities_noise.mapNoiseParameters(roughness, scale)`

Converts user roughness and scale ([0,1], clamped) into fbm parameters for LARGE terrain undulations: strength 0 to 1 m, frequency 0.02 (bumps of about 50 m) to 0.2 (about 5 m), octaves 3 to 6.

- `roughness` (*number*) : Roughness 0 to 1 (amplitude).
- `scale` (*number*) : Scale 0 to 1 (0 = large bumps, 1 = small).
- **returns**: number noiseFreq.
- **returns**: number noiseStrength (m).
- **returns**: integer fbmOctaves.
- **returns**: number fbmLacunarity (2.0).
- **returns**: number fbmGain (0.5).

#### `editor_toolUtilities_noise.mapRoadNoiseParameters(roughness, scale)`

Same field, but tuned for a ROAD SURFACE (rally bumps): finer band and lower amplitude, strength 0 to 0.18 m crest height, frequency 0.06 (about 16 m) to 0.5 (about 2 m), octaves 3 to 5.

- `roughness` (*number*) : Roughness 0 to 1.
- `scale` (*number*) : Scale 0 to 1.
- **returns**: number noiseFreq.
- **returns**: number noiseStrength (m).
- **returns**: integer fbmOctaves.
- **returns**: number fbmLacunarity.
- **returns**: number fbmGain.

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultFbmGain` | number | Amplitude multiplier per octave (0.5). |
| `defaultFbmLacunarity` | number | Frequency multiplier per octave (2.0). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/noise.lua`.*
