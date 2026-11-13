# `flowgraph_nodes_math_vector_split`

*Fichier : `lua/ge/extensions/flowgraph/nodes/math/vector/split.lua` · VM : Game Engine (GE) · 37 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/math/vector/split")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Split' (categorie simple). Decompose une table (vec3, color ou quat, 4 elements max) en nombres x, y, z, w.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Vide. | 25 |
| `C:work()` | Ecrit table[1..4] sur x, y, z, w (table vide si l'entree est nil). | 28 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/math/vector/split.lua`.*
