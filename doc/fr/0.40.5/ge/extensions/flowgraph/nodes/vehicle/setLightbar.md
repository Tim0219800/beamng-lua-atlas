# `flowgraph_nodes_vehicle_setLightbar`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/setLightbar.lua` · VM : Game Engine (GE) · 45 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/setLightbar")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Set Lightbar » (catégorie `repeat_instant`). Règle le mode de la barre lumineuse : `core_vehicleBridge.executeAction(veh,'setLightbarMode', mode)`. `mode` : 0 éteint, 1 allumé, 2 sirène. Pins d'entrée : `vehId`, `mode`.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Constructeur vide. | 24 |
| `C:postInit()` | Définit les modèles de `mode` (Off, On, Siren). | 27 |
| `C:work()` | Envoie `setLightbarMode` au véhicule. | 31 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/setLightbar.lua`.*
