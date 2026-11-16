# `flowgraph_nodes_debug_debugSphere`

*Fichier : `lua/ge/extensions/flowgraph/nodes/debug/debugSphere.lua` · VM : Game Engine (GE) · 39 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/debug/debugSphere")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Debug Sphere » (catégorie repeat_instant, tags util/draw). Dessine chaque frame une sphère de débogage (debugDrawer:drawSphere). Entrées : pos (vec3, requis), radius (caché, 1 sur le pin, 0.25 si nil), color (caché, rose {0.91,0.05,0.48,0.5} par défaut).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Vide. | 23 |
| `C:work()` | Si pos est défini, dessine la sphère. | 26 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/debug/debugSphere.lua`.*
