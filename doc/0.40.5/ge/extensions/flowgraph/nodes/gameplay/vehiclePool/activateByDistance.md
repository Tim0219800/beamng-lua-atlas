# `flowgraph_nodes_gameplay_vehiclePool_activateByDistance`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/activateByDistance.lua` · VM : Game Engine (GE) · 36 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/vehiclePool/activateByDistance")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Activate Vehicles By Distance » (repeat_instant). Chaque frame, active les véhicules du pool proches d'un point et désactive les autres (pool:activateByDistanceTo(pos, distance)). pos par défaut : position de la caméra (core_camera.getPositionXYZ). Nécessite le module core_vehicleActivePooling ; l'objet pool vient du nœud Create Vehicle Pool.

**Dépendances (chargées avant) :** `core_vehicleActivePooling`

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Détermine le point de focus et appelle activateByDistanceTo. | 25 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/vehiclePool/activateByDistance.lua`.*
