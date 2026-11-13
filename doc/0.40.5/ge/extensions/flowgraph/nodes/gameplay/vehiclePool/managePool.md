# `flowgraph_nodes_gameplay_vehiclePool_managePool`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/managePool.lua` · VM : Game Engine (GE) · 50 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/vehiclePool/managePool")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Manage Vehicle Pool » (once_instant). Règle et lit un pool de véhicules : maxActive (nombre max de véhicules actifs ; -1 ou nil = illimité), globalPoolingMode (useSceneVehiclesCap : limite les véhicules actifs de toute la scène). Sorties : vehicleIds, activeVehIds, inactiveVehIds, activeAmount, inactiveAmount. Nécessite le module core_vehicleActivePooling ; l'objet pool vient du nœud Create Vehicle Pool.

**Dépendances (chargées avant) :** `core_vehicleActivePooling`

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Applique les réglages au pool puis publie ses listes de véhicules et leurs effectifs. | 30 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/managePool.lua`.*
