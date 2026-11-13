# `flowgraph_nodes_vehicle_keep`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/keep.lua` · VM : Game Engine (GE) · 38 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/keep")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Keep Vehicle » (catégorie `once_instant`). Marque un véhicule à conserver à l'arrêt du flowgraph (par défaut les véhicules créés pendant l'exécution sont supprimés) via `mgr.modules.vehicle:setKeepVehicle(vehId, keep)`. Pins d'entrée : `vehId`, `keep` (bool).

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Constructeur vide. | 24 |
| `C:workOnce()` | Appelle `setKeepVehicle` si `vehId` est défini et recopie le flux d'entrée sur la sortie. | 28 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/keep.lua`.*
