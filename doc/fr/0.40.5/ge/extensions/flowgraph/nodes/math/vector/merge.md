# `flowgraph_nodes_math_vector_merge`

*Fichier : `lua/ge/extensions/flowgraph/nodes/math/vector/merge.lua` · VM : Game Engine (GE) · 38 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/math/vector/merge")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Merge' (categorie simple). Regroupe jusqu'a 4 nombres x, y, z, w dans une table {x, y, z, w} (type vec3, color ou quat) sur la sortie 'value'.

## Remarques

- Les entrees nil laissent des trous dans la table ; un w manquant donne une table de 3 elements (vec3).

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Vide. | 25 |
| `C:work()` | Construit {x, y, z, w} depuis les entrees et l'ecrit sur la sortie. | 28 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/math/vector/merge.lua`.*
