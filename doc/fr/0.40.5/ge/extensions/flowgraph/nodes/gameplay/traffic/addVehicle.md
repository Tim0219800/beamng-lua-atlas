# `flowgraph_nodes_gameplay_traffic_addVehicle`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/addVehicle.lua` · VM : Game Engine (GE) · 27 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/addVehicle")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Add Vehicle (Traffic) » (once_instant). Ajoute le véhicule vehId à la table du trafic via self.mgr.modules.traffic:insertTraffic.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Appelle insertTraffic(vehId) si vehId est défini. | 21 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/addVehicle.lua`.*
