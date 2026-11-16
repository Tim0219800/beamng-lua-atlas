# `flowgraph_nodes_util_linePointFromXnorm`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/linePointFromXnorm.lua` · VM : Game Engine (GE) · 32 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/linePointFromXnorm")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Line Point From Xnorm » (repeat_instant). Renvoie la position située entre deux points d'une ligne selon un ratio xnorm (0 = posA, 1 = posB ; 0,5 par défaut si non fourni). Entrées : posA, posB (vec3), xnorm. Sortie : pos (vec3 en table).

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Si posA et posB sont connectés, appelle la fonction globale linePointFromXnorm et écrit le résultat dans pos. | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/linePointFromXnorm.lua`.*
