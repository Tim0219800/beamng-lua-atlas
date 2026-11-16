# `flowgraph_nodes_debug_debugCylinder`

*Fichier : `lua/ge/extensions/flowgraph/nodes/debug/debugCylinder.lua` · VM : Game Engine (GE) · 51 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/debug/debugCylinder")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Debug Cylinder » (catégorie repeat_instant, tags util/draw). Dessine chaque frame un cylindre de débogage (debugDrawer:drawCylinder) entre posA et posB. Entrées : radius (number, 1 par défaut), posA et posB (vec3, requis), color (caché, {r,g,b,a} 0-1, rose {0.91,0.05,0.48,0.5} par défaut).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Vide. | 24 |
| `C:work()` | Si posA et posB sont définis, convertit la couleur (alpha 0.5 si absent) et dessine le cylindre. | 31 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/debug/debugCylinder.lua`.*
