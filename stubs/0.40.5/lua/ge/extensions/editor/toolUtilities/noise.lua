---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/noise.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fractal noise shared in world coordinates for the editor's terrain and meshing tools (terraform, hero road editor). Single source so that a road's mesh and the terrain around it sample the same field with the same roughness/scale mapping and match bump for bump along their shared edge. No per-tool seed: the coordinates are the raw world XY.
--- Access: extension `editor_toolUtilities_noise`: `extensions.load("editor_toolUtilities_noise")`, then the global `editor_toolUtilities_noise`
---@class editor_toolUtilities_noise
---@field defaultFbmGain number Amplitude multiplier per octave (0.5).
---@field defaultFbmLacunarity number Frequency multiplier per octave (2.0).
editor_toolUtilities_noise = {}

--- Fractional Brownian motion at world point (x, y): a sum of simplex noise over several octaves, normalized by the total amplitude.
---Source: lua/ge/extensions/editor/toolUtilities/noise.lua:20
---@param x number World X (already multiplied by the base frequency if desired).
---@param y number World Y.
---@param octaves integer Number of octaves.
---@param lacunarity number Frequency multiplier per octave.
---@param gain number Amplitude multiplier per octave.
---@return number  Normalized value of about [-1, 1].
function editor_toolUtilities_noise.fbm(x, y, octaves, lacunarity, gain) end

--- Converts user roughness and scale ([0,1], clamped) into fbm parameters for LARGE terrain undulations: strength 0 to 1 m, frequency 0.02 (bumps of about 50 m) to 0.2 (about 5 m), octaves 3 to 6.
---Source: lua/ge/extensions/editor/toolUtilities/noise.lua:33
---@param roughness number Roughness 0 to 1 (amplitude).
---@param scale number Scale 0 to 1 (0 = large bumps, 1 = small).
---@return number  noiseFreq.
---@return number  noiseStrength (m).
---@return integer  fbmOctaves.
---@return number  fbmLacunarity (2.0).
---@return number  fbmGain (0.5).
function editor_toolUtilities_noise.mapNoiseParameters(roughness, scale) end

--- Same field, but tuned for a ROAD SURFACE (rally bumps): finer band and lower amplitude, strength 0 to 0.18 m crest height, frequency 0.06 (about 16 m) to 0.5 (about 2 m), octaves 3 to 5.
---Source: lua/ge/extensions/editor/toolUtilities/noise.lua:46
---@param roughness number Roughness 0 to 1.
---@param scale number Scale 0 to 1.
---@return number  noiseFreq.
---@return number  noiseStrength (m).
---@return integer  fbmOctaves.
---@return number  fbmLacunarity.
---@return number  fbmGain.
function editor_toolUtilities_noise.mapRoadNoiseParameters(roughness, scale) end

