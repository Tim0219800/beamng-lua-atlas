# `flowgraph_nodes_gameplay_traffic_trafficActivate`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficActivate.lua` · VM : Game Engine (GE) · 60 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/trafficActivate")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Activate Traffic » (once_instant). Active le mode trafic pour une liste d'ids (vehicleIds, typiquement du nœud Spawn Vehicle Group) via traffic:activateTraffic. Sorties : activated (impulsion), vehicleIds (gameplay_traffic.getTrafficList()), total (caché). Au reset ou à l'arrêt : traffic:deactivateTraffic(). Ancien pin « data » renommé vehicleIds (legacyPins).

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle onNodeReset(). | 34 |
| `C:init()` | Appelle onNodeReset(). | 30 |
| `C:onNodeReset()` | Désactive le trafic et remet les flags à zéro. | 38 |
| `C:work()` | Publie le nombre total de véhicules IA et l'impulsion activated. | 54 |
| `C:workOnce()` | Active le trafic pour vehicleIds (si défini) et publie la liste de trafic validée. | 44 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficActivate.lua`.*
