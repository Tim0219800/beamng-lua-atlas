# `flowgraph_nodes_gameplay_traffic_trafficScatter`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficScatter.lua` · VM : Game Engine (GE) · 25 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/trafficScatter")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Scatter Traffic » (once_instant). Téléporte tous les véhicules de trafic loin du joueur ou de la caméra avec gameplay_traffic.scatterTraffic(nil, minDist, maxDist) ; minDist et maxDist sont optionnels.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Appelle gameplay_traffic.scatterTraffic(nil, minDist, maxDist). | 21 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficScatter.lua`.*
