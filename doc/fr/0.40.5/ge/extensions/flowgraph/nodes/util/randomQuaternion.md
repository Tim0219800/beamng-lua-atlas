# `flowgraph_nodes_util_randomQuaternion`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/randomQuaternion.lua` · VM : Game Engine (GE) · 38 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/randomQuaternion")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Random Quaternion » (repeat_instant, icône casino). Fournit un quaternion aléatoire à chaque frame. Entrées (degrés, cachées/fixes) : xMin/xMaxAngle (0, 0), yMin/yMaxAngle (0, 0), zMin/zMaxAngle (0, 360). Sortie : quaternion (table {x,y,z,w}). Par défaut : rotation aléatoire autour de l'axe Z seulement.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Tire un angle aléatoire par axe entre min et max (converti en radians), compose les rotations X puis Y puis Z via quatFromEuler et écrit le quaternion. | 25 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/randomQuaternion.lua`.*
