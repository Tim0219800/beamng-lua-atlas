# `flowgraph_nodes_gameplay_vehiclePool_activateVehicle`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/activateVehicle.lua` · VM : Game Engine (GE) · 30 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/vehiclePool/activateVehicle")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Activate Vehicle » (once_instant). Active ou désactive un véhicule du pool (pool:setVeh(vehId, activate), défaut true). Nécessite le module core_vehicleActivePooling ; l'objet pool vient du nœud Create Vehicle Pool.

**Dépendances (chargées avant) :** `core_vehicleActivePooling`

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Appelle setVeh(vehId, activate) si pool et vehId sont définis. | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/activateVehicle.lua`.*
