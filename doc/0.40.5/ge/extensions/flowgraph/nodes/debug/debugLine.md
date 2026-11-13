# `flowgraph_nodes_debug_debugLine`

*Fichier : `lua/ge/extensions/flowgraph/nodes/debug/debugLine.lua` · VM : Game Engine (GE) · 39 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/debug/debugLine")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Debug Line » (catégorie repeat_instant, tags util/draw). Dessine chaque frame une ligne de débogage (debugDrawer:drawLine) de posA à posB. Entrées : posA, posB (vec3, requis), color (caché, rose {0.91,0.05,0.48,0.5} par défaut).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Vide. | 23 |
| `C:work()` | Si posA et posB sont définis, trace la ligne avec la couleur donnée. | 26 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/debug/debugLine.lua`.*
