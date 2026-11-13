# `flowgraph_nodes_vehicle_special_wheelDistance`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/special/wheelDistance.lua` · VM : Game Engine (GE) · 140 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/special/wheelDistance")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:calculateDistanceFromStart(vehicle, target)` |  | 64 |
| `C:drawMiddle(builder, style)` |  | 135 |
| `C:init()` |  | 32 |
| `C:work()` |  | 122 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/special/wheelDistance.lua`.*
