# `flowgraph_nodes_gameplay_traffic_removeVehicle`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/removeVehicle.lua` · VM : Game Engine (GE) · 27 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/removeVehicle")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Remove Vehicle (Traffic) » (once_instant). Retire le véhicule vehId de la table du trafic via self.mgr.modules.traffic:removeTraffic.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Appelle removeTraffic(vehId) si vehId est défini. | 21 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/removeVehicle.lua`.*
