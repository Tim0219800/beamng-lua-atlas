# `flowgraph_nodes_vehicle_bus_registerBusData`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/bus/registerBusData.lua` · VM : Game Engine (GE) · 32 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/bus/registerBusData")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Register Bus Data » (catégorie `once_instant`). Enregistre le callback de notification de changement de valeurs d'un bus (agenouillement, portes) via `mgr.modules.vehicle:registerBusChangeNotification(vehId)`. À appeler après le spawn du bus ; nécessaire pour « Bus Controls Detection ». Pins : entrées `flow`, `vehId` (défaut 0) ; sortie `flow`.

## Remarques

- L'enregistrement est différé avec `mgr.modules.level:delayOrInstantFunction` (attend que le niveau soit prêt).
- Le véhicule trouvé (`veh`) dans la closure n'est pas utilisé.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Programme (ou exécute tout de suite) l'enregistrement de la notification bus, puis active le flux de sortie. | 20 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/bus/registerBusData.lua`.*
