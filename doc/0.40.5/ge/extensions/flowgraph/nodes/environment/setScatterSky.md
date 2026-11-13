# `flowgraph_nodes_environment_setScatterSky`

*Fichier : `lua/ge/extensions/flowgraph/nodes/environment/setScatterSky.lua` · VM : Game Engine (GE) · 81 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/environment/setScatterSky")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` |  | 30 |
| `C:_executionStopped()` |  | 42 |
| `C:init(mgr)` |  | 26 |
| `C:setScatterSkyParameters()` |  | 65 |
| `C:work()` |  | 59 |
| `C:workOnce()` |  | 55 |

## Appels vers le moteur (C++)

- `core_environment.` `getAmbientScaleGradientFile`, `getColorizeGradientFile`, `getFogScaleGradientFile`, `getNightFogGradientFile`, `getNightGradientFile`, `getSkyBrightness`, `getSunScaleGradientFile`, `getTimeOfDay`, `setAmbientScaleGradientFile`, `setColorizeGradientFile`, `setFogScaleGradientFile`, `setNightFogGradientFile`, `setNightGradientFile`, `setSkyBrightness`, `setSunScaleGradientFile`, `setTimeOfDay`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/environment/setScatterSky.lua`.*
