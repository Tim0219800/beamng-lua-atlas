# `editor_toolUtilities_noise`

*Fichier : `lua/ge/extensions/editor/toolUtilities/noise.lua` · VM : Game Engine (GE) · 63 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_noise` : `extensions.load("editor_toolUtilities_noise")`, puis la globale `editor_toolUtilities_noise`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_noise.fbm(x, y, octaves, lacunarity, gain)` | Fractal Brownian Motion at world point (x, y). Returns a normalised value in ~[-1, 1]. | 20 |
| `editor_toolUtilities_noise.mapNoiseParameters(roughness, scale)` | Maps user roughness/scale in [0,1] to low-level fbm parameters, tuned for LARGE terrain undulations (terraforming).<br> Returns: noiseFreq, noiseStrength (metres), fbmOctaves, fbmLacunarity, fbmGain. | 33 |
| `editor_toolUtilities_noise.mapRoadNoiseParameters(roughness, scale)` | Same fbm field, but mapped for a ROAD SURFACE (rally bumpiness): a much finer, higher-frequency band and a much lower,<br> drivable amplitude, so it reads as bumps/ruts rather than the big rolling dunes the terrain mapping above produces.<br> Base wavelength ~16 m (rolling) at scale 0 down to ~2 m (choppy) at scale 1. fbm returns ~[-1,1], so noiseStrength is a<br> PEAK height: caps ~0.18 m (so ~0.35 m peak-to-trough at full roughness) -- a rough dirt road, not driveable-over whoops.<br> Octaves kept modest so the fine detail stays near the mesh vertex spacing instead of aliasing into per-vertex grain. | 46 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultFbmGain` | number |  |
| `defaultFbmLacunarity` | number | Public interface. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/noise.lua`.*
