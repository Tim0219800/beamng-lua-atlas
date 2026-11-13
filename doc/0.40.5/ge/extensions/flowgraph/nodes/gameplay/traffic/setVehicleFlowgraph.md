# `flowgraph_nodes_gameplay_traffic_setVehicleFlowgraph`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setVehicleFlowgraph.lua` · VM : Game Engine (GE) · 73 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/setVehicleFlowgraph")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set Vehicle Flowgraph » (once_instant). Lance un flowgraph personnalisé (fgFile) pour un véhicule du trafic via veh.role:setupFlowgraph(fgFile, varData). Les pins d'entrée personnalisés (types string, number, bool, any, table, vec3, quat, color ; pas flow) sont sauvegardés et transmis comme variables au flowgraph. Idéal pour des rôles et actions d'IA sur mesure. Au reset, le flowgraph du rôle est supprimé (role:clearFlowgraph).

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle onNodeReset(). | 41 |
| `C:init()` | Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph). | 35 |
| `C:onNodeReset()` | Supprime le flowgraph du rôle du véhicule mémorisé (clearFlowgraph) et oublie vehId. | 45 |
| `C:workOnce()` | Copie les valeurs de tous les pins d'entrée non fixes dans varData et appelle veh.role:setupFlowgraph(fgFile, varData) pour le véhicule vehId. | 55 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setVehicleFlowgraph.lua`.*
