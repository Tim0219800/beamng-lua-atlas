# `flowgraph_nodes_vehicle_setLights`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/setLights.lua` · VM : Game Engine (GE) · 45 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/setLights")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Set Lights » (catégorie `repeat_instant`). Règle l'état des phares avant : `core_vehicleBridge.executeAction(veh,'setLightMode', mode)`. `mode` : 0 éteint, 1 allumé, 2 pleins phares. Pins d'entrée : `vehId`, `mode`.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Constructeur vide. | 24 |
| `C:postInit()` | Définit les modèles de `mode` (Off, On, Highbeams). | 27 |
| `C:work()` | Envoie `setLightMode` au véhicule. | 31 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/setLights.lua`.*
