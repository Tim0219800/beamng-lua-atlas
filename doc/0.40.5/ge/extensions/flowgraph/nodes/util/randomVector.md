# `flowgraph_nodes_util_randomVector`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/randomVector.lua` · VM : Game Engine (GE) · 33 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/randomVector")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Random Vector » (repeat_instant, icône casino). Fournit un vecteur aléatoire non normalisé. Entrées : xMin/xMax, yMin/yMax, zMin/zMax (par défaut -1 et 1). Sortie : vector ({x, y, z}).

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Tire chaque composante uniformément entre son min et son max et écrit {x, y, z}. | 25 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/randomVector.lua`.*
