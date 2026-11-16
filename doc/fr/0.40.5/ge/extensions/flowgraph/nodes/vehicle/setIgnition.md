# `flowgraph_nodes_vehicle_setIgnition`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/setIgnition.lua` · VM : Game Engine (GE) · 51 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/setIgnition")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Set Ignition » (catégorie `repeat_instant`). Règle le niveau d'allumage : `core_vehicleBridge.executeAction(veh,'setIgnitionLevel', mode)`. `mode` : 0 arrêt, 1 accessoires, 2 contact mis, 3 démarreur. Pins d'entrée : `vehId`, `mode`. Pour lire le niveau, utiliser « Get Electrics Value ».

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Constructeur vide. | 24 |
| `C:postInit()` | Définit les modèles de `mode` (Off, Accessory Mode, Ignition On, Starter On). | 27 |
| `C:work()` | Envoie `setIgnitionLevel` au véhicule. | 36 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/setIgnition.lua`.*
