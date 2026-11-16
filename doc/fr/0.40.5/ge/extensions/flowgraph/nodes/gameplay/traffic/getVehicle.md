# `flowgraph_nodes_gameplay_traffic_getVehicle`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/getVehicle.lua` · VM : Game Engine (GE) · 34 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/getVehicle")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Vehicle Id From Table » (repeat_instant). Lit l'élément d'indice `index` d'un tableau d'ids de véhicules (vehicleIds) et le sort sur vehId s'il s'agit d'un nombre, sinon nil.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Écrit vehicleIds[index] sur vehId si c'est un nombre ; sinon nil. | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/getVehicle.lua`.*
