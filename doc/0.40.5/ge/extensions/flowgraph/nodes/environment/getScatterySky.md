# `flowgraph_nodes_environment_getScatterySky`

*File: `lua/ge/extensions/flowgraph/nodes/environment/getScatterySky.lua` · VM: Game Engine (GE) · 46 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/environment/getScatterySky")` (file under extensions/ but not a regular extension)

Flowgraph node "Get ScatterSky" (category provider, tags environment/tod). Reads the current parameters of the ScatterSky sky via core_environment. Outputs: skyBrightness (global brightness) and, hidden, the gradient files (string): colorizeGradientFile (sky color), sunScaleGradientFile (sun), ambientScaleGradientFile (ambient), fogScaleGradientFile (fog), nightGradientFile (night ambient), nightFogGradientFile (night fog).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Every frame, reads the seven values from core_environment and writes them to the outputs. | 26 |

## Calls into the engine (C++)

- `core_environment.` `getAmbientScaleGradientFile`, `getColorizeGradientFile`, `getFogScaleGradientFile`, `getNightFogGradientFile`, `getNightGradientFile`, `getSkyBrightness`, `getSunScaleGradientFile`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/environment/getScatterySky.lua`.*
