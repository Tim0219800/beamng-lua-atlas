# `flowgraph_nodes_environment_setScatterSky`

*File: `lua/ge/extensions/flowgraph/nodes/environment/setScatterSky.lua` · VM: Game Engine (GE) · 81 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/environment/setScatterSky")` (file under extensions/ but not a regular extension)

Flowgraph node "Set ScatterSky" (category dynamic_instant). Sets the sky brightness (skyBrightness) and the ScatterSky gradient textures (colorize, sunScale, ambientScale, fogScale, night, nightFog; hidden string pins). The original values are stored at start and restored on stop (data.restoreScatterSky).

## Notes

- After applying, the node rereads then rewrites the time (getTimeOfDay/setTimeOfDay) to force the sky to update.
- The gradient pins are all applied even if empty (nil value).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Stores the current brightness and the six gradient files. | 30 |
| `C:_executionStopped()` | Restores the stored values if data.restoreScatterSky is true. | 42 |
| `C:init(mgr)` | Sets data.restoreScatterSky = true. | 26 |
| `C:setScatterSkyParameters()` | Calls the core_environment setters (setSkyBrightness, set*GradientFile) then reapplies the current time. | 65 |
| `C:work()` | In repeat mode, applies the parameters every frame. | 59 |
| `C:workOnce()` | Applies the parameters once. | 55 |

## Calls into the engine (C++)

- `core_environment.` `getAmbientScaleGradientFile`, `getColorizeGradientFile`, `getFogScaleGradientFile`, `getNightFogGradientFile`, `getNightGradientFile`, `getSkyBrightness`, `getSunScaleGradientFile`, `getTimeOfDay`, `setAmbientScaleGradientFile`, `setColorizeGradientFile`, `setFogScaleGradientFile`, `setNightFogGradientFile`, `setNightGradientFile`, `setSkyBrightness`, `setSunScaleGradientFile`, `setTimeOfDay`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/environment/setScatterSky.lua`.*
