# `flowgraph_nodes_environment_setCloud`

*Fichier : `lua/ge/extensions/flowgraph/nodes/environment/setCloud.lua` · VM : Game Engine (GE) · 79 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/environment/setCloud")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` |  | 37 |
| `C:_executionStopped()` |  | 45 |
| `C:init(mgr)` |  | 24 |
| `C:postInit()` |  | 28 |
| `C:setCloudParameters()` |  | 64 |
| `C:work()` |  | 58 |
| `C:workOnce()` |  | 54 |

## Appels vers le moteur (C++)

- `core_environment.` `setCloudCover`, `setCloudCoverByID`, `setCloudExposureByID`, `setCloudHeightByID`, `setCloudWindByID`, `setWindSpeed`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/environment/setCloud.lua`.*
