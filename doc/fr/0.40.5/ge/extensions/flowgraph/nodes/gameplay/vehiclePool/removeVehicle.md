# `flowgraph_nodes_gameplay_vehiclePool_removeVehicle`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/removeVehicle.lua` · VM : Game Engine (GE) · 29 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/vehiclePool/removeVehicle")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Remove Vehicle (Pool) » (once_instant). Retire un véhicule du pool (pool:removeVeh(vehId)). Nécessite le module core_vehicleActivePooling ; l'objet pool vient du nœud Create Vehicle Pool.

**Dépendances (chargées avant) :** `core_vehicleActivePooling`

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Appelle removeVeh(vehId) si pool et vehId sont définis. | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/removeVehicle.lua`.*
