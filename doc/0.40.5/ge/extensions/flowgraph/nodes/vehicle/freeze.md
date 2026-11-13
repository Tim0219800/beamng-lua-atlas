# `flowgraph_nodes_vehicle_freeze`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/freeze.lua` · VM : Game Engine (GE) · 47 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/freeze")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Freeze Vehicle » (catégorie `repeat_instant`). Gèle ou dégèle un véhicule via `core_vehicleBridge.executeAction(veh,'setFreeze', freeze)`. Pins d'entrée : `vehId`, `freeze` (bool). Si `vehId` est absent, véhicule joueur.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Constructeur vide. | 28 |
| `C:work()` | Envoie l'action `setFreeze` avec la valeur du pin `freeze`. | 32 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/freeze.lua`.*
