# `flowgraph_nodes_util_routePosition`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/routePosition.lua` · VM : Game Engine (GE) · 52 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/routePosition")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Route Position » (once_instant). Donne la position le long d'un itinéraire à une distance donnée en avant. Entrées : navgraphRoute (type navgraphPath), distance. Sorties : pos (vec3), dirVec (direction du segment), n1 et n2 (nœuds du segment). Utilise gameplay/route/route.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle onNodeReset. | 29 |
| `C:init()` | Appelle onNodeReset (crée la route). | 25 |
| `C:onNodeReset()` | Crée un nouvel objet route (variable locale du fichier, partagée entre instances). | 33 |
| `C:workOnce()` | Initialise la route avec route:setupPathMultiWaypoints, avance de distance avec route:stepAhead et écrit n1, n2, pos et dirVec (direction normalisée de n1 vers n2). | 37 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/routePosition.lua`.*
