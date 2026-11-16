# `flowgraph_nodes_util_closestRoad`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/closestRoad.lua` · VM : Game Engine (GE) · 115 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/closestRoad")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Closest Road » (repeat_instant). Trouve la route du navgraph la plus proche d'une position (map.findClosestRoad) et renvoie les deux nœuds de segment (le plus proche en premier), la distance, la largeur de route et le point projeté. Entrée : pos (vec3). Sorties : name_a, pos_a, name_b, pos_b, dist, et pins cachés roadId/roadIdx a/b, exists, width, projectedPoint. Ne recalcule que si pos change.

## Remarques

- Bug dans findDecalroad : le test « if not idId » utilise une variable inexistante (idId au lieu de rdId), donc la recherche par nom est toujours tentée même quand le nombre a été lu.
- findDecalroad ne renvoie rien (nil) quand le nom ne commence pas par « DecalRoad » : roadId/roadIdx valent alors nil.
- Si le nom existe dans scenetree, il renvoie -1,-1 (le test de la branche est inversé par rapport au commentaire).

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Oublie la dernière position (oldPos=nil). | 37 |
| `C:findDecalroad(name)` | Pour un nom de nœud composé « DecalRoad<id>_<index> », renvoie l'id de la DecalRoad et l'index du point ; renvoie -1,-1 si un objet de ce nom existe dans scenetree ; nil sinon. | 41 |
| `C:init(mgr)` | Ne fait rien. | 34 |
| `C:work()` | Si pos a changé, cherche la route la plus proche, ordonne les nœuds selon la proximité, remplit les pins (positions, ids de DecalRoad, distance, point projeté, largeur = 2 × rayon interpolé) et exists. Met exists à false si rien n'est trouvé. | 66 |

## Appels vers le moteur (C++)

- `obj:` `getId`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/closestRoad.lua`.*
