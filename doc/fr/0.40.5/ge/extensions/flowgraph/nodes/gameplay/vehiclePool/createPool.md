# `flowgraph_nodes_gameplay_vehiclePool_createPool`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/createPool.lua` · VM : Game Engine (GE) · 52 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/vehiclePool/createPool")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Create Vehicle Pool » (once_instant). Crée un pool de véhicules (core_vehicleActivePooling.createPool({name})) pour gérer l'activation/désactivation des objets véhicule ; sortie vehPool. Option data.keepVehicles (« Keep Inactive Vehicles ») : à la suppression du pool, garde les véhicules inactifs (deletePool(keepVehicles)).

**Dépendances (chargées avant) :** `core_vehicleActivePooling`

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle onNodeReset(). | 27 |
| `C:drawCustomProperties()` | Affiche la case « Keep Inactive Vehicles » (data.keepVehicles). | 38 |
| `C:init()` | Appelle onNodeReset(). | 23 |
| `C:onNodeReset()` | Supprime le pool créé (deletePool) et l'oublie. | 31 |
| `C:workOnce()` | Crée le pool s'il n'existe pas et le publie sur vehPool. | 45 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/createPool.lua`.*
