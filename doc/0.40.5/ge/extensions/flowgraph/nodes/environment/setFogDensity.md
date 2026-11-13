# `flowgraph_nodes_environment_setFogDensity`

*Fichier : `lua/ge/extensions/flowgraph/nodes/environment/setFogDensity.lua` · VM : Game Engine (GE) · 70 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/environment/setFogDensity")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` |  | 40 |
| `C:_executionStopped()` |  | 46 |
| `C:init(mgr)` |  | 27 |
| `C:postInit()` |  | 31 |
| `C:setFogParameters()` |  | 64 |
| `C:work()` |  | 58 |
| `C:workOnce()` |  | 54 |

## Appels vers le moteur (C++)

- `core_environment.` `getFogAtmosphereHeight`, `getFogDensity`, `setFogAtmosphereHeight`, `setFogDensity`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/environment/setFogDensity.lua`.*
