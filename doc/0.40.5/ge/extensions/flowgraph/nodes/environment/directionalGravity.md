# `flowgraph_nodes_environment_directionalGravity`

*Fichier : `lua/ge/extensions/flowgraph/nodes/environment/directionalGravity.lua` · VM : Game Engine (GE) · 115 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/environment/directionalGravity")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` |  | 37 |
| `C:drawMiddle(builder, style)` |  | 82 |
| `C:init()` | (m3,s-2,kg-1) | 31 |
| `C:setDirectionalGravity()` |  | 55 |
| `C:work()` |  | 49 |
| `C:workOnce()` |  | 45 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawText`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/environment/directionalGravity.lua`.*
