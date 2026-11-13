# `flowgraph_nodes_gameplay_vehiclePool_addGroup`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/addGroup.lua` · VM : Game Engine (GE) · 31 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/vehiclePool/addGroup")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Add Vehicle Group To Pool » (once_instant). Insère dans le pool tous les ids de la table vehGroup (pool:insertVeh pour chacun). Nécessite le module core_vehicleActivePooling ; l'objet pool vient du nœud Create Vehicle Pool.

## Remarques

- La description du nœud (« Activates or deactivates a vehicle object in the pool ») ne correspond pas au code, qui ajoute un groupe au pool.

**Dépendances (chargées avant) :** `core_vehicleActivePooling`

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Appelle insertVeh pour chaque id du groupe. | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/addGroup.lua`.*
