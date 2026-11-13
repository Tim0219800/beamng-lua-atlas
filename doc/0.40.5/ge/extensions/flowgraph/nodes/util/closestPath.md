# `flowgraph_nodes_util_closestPath`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/closestPath.lua` · VM : Game Engine (GE) · 93 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/closestPath")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Route Distance » (repeat_instant). Calcule la distance approximative restante le long du navgraph entre une position suivie et la fin d'un itinéraire. L'itinéraire est défini soit par deux positions posA/posB, soit par une liste de waypoints (case « Waypoints » dans l'inspecteur). Entrées : setRoute (impulsion), trackedPos (vec3), posA, posB (ou waypoints). Sortie : dist (number, -1 si invalide). Utilise gameplay/route/route.

## Remarques

- La route est stockée dans une variable locale du fichier (partagée par toutes les instances du nœud).
- Avec posA/posB, la route est construite dans l'ordre {posB, posA}.
- La comparaison trackedPos ~= lastTrackedPosValue compare des tables : elle est quasi toujours vraie.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Initialise lastTrackedPosValue à vec3(). | 28 |
| `C:_onDeserialized(nodeData)` | Restaure la case Waypoints et met à jour les pins. | 36 |
| `C:_onSerialize(res)` | Sauvegarde l'état de la case Waypoints. | 32 |
| `C:drawCustomProperties()` | Dessine la case « Waypoints » ; la modifier appelle updatePins. | 41 |
| `C:init()` | Crée la case à cocher « Waypoints » (BoolPtr false). | 24 |
| `C:updatePins()` | Remplace les pins posA/posB par un pin table « waypoints » (ou l'inverse) selon la case, en ne créant que les pins manquants. | 47 |
| `C:work()` | Met dist à -1 ; sur setRoute, crée la route (route:setupPathMulti) à partir des points ; suit la position (route:trackPosition) quand flow est actif et trackedPos a changé ; renvoie route.path[1].distToTarget. | 68 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/closestPath.lua`.*
