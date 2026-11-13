# `flowgraph_nodes_util_routePointToPoint`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/routePointToPoint.lua` · VM : Game Engine (GE) · 44 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/routePointToPoint")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Get Navgraph Route » (once_instant). Calcule un itinéraire sur le navgraph entre une position de départ et une d'arrivée. Entrées : posA, posB (vec3), legalRoute (caché, true : respecte les sens de circulation). Sortie : navgraphRoute (liste de waypoints, type navgraphPath).

## Remarques

- Le 4e argument de map.getPath vaut 1000 si legalRoute (pénalité pour les sens interdits) et 1 sinon (déduit du code).

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Pour chaque position, trouve la route la plus proche (map.findClosestRoad) et retient le nœud le plus proche ; si l'une échoue, ne fait rien. Puis calcule map.getPath(depart, arrivee, nil, 1000 ou 1) et l'écrit sur la sortie. | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/routePointToPoint.lua`.*
