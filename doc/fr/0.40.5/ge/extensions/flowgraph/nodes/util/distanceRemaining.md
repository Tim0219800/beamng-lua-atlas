# `flowgraph_nodes_util_distanceRemaining`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/distanceRemaining.lua` · VM : Game Engine (GE) · 72 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/distanceRemaining")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Waypoints Distance » (repeat_instant). Calcule la distance restante le long d'une liste de waypoints pour un véhicule et indique s'il roule dans le bon sens. Entrées : alwaysUpdate (flow caché), vehId, waypoints (table de vec3). Sorties : distLeft, rightWay (bool), goingRightWay et goingWrongWay (flow). Sans alwaysUpdate, la distance n'est mise à jour que si le véhicule roule à plus de 0,5 m/s.

## Remarques

- Bug : le code écrit self.pinOut.goingRigthWay (faute de frappe) alors que le pin s'appelle goingRightWay : cet accès vaut nil et lève une erreur dès que le calcul est atteint.
- Seuil de vitesse 0,5 m/s ; sous ce seuil le sens est considéré correct.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Trouve le segment le plus proche du véhicule (map.objects), somme la distance jusqu'à la fin, compare la vitesse à la direction du segment pour le sens de marche et écrit les pins. | 32 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/distanceRemaining.lua`.*
