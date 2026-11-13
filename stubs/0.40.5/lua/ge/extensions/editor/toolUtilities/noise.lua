---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/noise.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_noise` : `extensions.load("editor_toolUtilities_noise")`, puis la globale `editor_toolUtilities_noise`
---@class editor_toolUtilities_noise
---@field defaultFbmGain number
---@field defaultFbmLacunarity number
editor_toolUtilities_noise = {}

--- Fractal Brownian Motion at world point (x, y). Returns a normalised value in ~[-1, 1].
---Source : lua/ge/extensions/editor/toolUtilities/noise.lua:20
---@param x any
---@param y any
---@param octaves any
---@param lacunarity any
---@param gain any
function editor_toolUtilities_noise.fbm(x, y, octaves, lacunarity, gain) end

--- Maps user roughness/scale in [0,1] to low-level fbm parameters, tuned for LARGE terrain undulations (terraforming).
---  Returns: noiseFreq, noiseStrength (metres), fbmOctaves, fbmLacunarity, fbmGain.
---Source : lua/ge/extensions/editor/toolUtilities/noise.lua:33
---@param roughness any
---@param scale any
function editor_toolUtilities_noise.mapNoiseParameters(roughness, scale) end

--- Same fbm field, but mapped for a ROAD SURFACE (rally bumpiness): a much finer, higher-frequency band and a much lower,
---  drivable amplitude, so it reads as bumps/ruts rather than the big rolling dunes the terrain mapping above produces.
---  Base wavelength ~16 m (rolling) at scale 0 down to ~2 m (choppy) at scale 1. fbm returns ~[-1,1], so noiseStrength is a
---  PEAK height: caps ~0.18 m (so ~0.35 m peak-to-trough at full roughness) -- a rough dirt road, not driveable-over whoops.
---  Octaves kept modest so the fine detail stays near the mesh vertex spacing instead of aliasing into per-vertex grain.
---Source : lua/ge/extensions/editor/toolUtilities/noise.lua:46
---@param roughness any
---@param scale any
function editor_toolUtilities_noise.mapRoadNoiseParameters(roughness, scale) end

