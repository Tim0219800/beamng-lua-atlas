# `flowgraph_nodes_vehicle_toggleVehicleControls`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/toggleVehicleControls.lua` · VM : Game Engine (GE) · 38 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/toggleVehicleControls")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Toggle Vehicle Controls » (catégorie `repeat_instant`). Active ou désactive l'action map `VehicleCommonActionMap` (`setEnabled(controllable)`), donc les contrôles du véhicule pour le joueur. Pin d'entrée : `controllable` (bool). À l'arrêt, les contrôles sont réactivés.

## Remarques

- `C.todo` : « PlayerUsable a des bugs et ne fonctionne que la première fois » (texte copié de Player Usable).

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Réactive l'action map à l'arrêt du projet. | 30 |
| `C:init()` | Constructeur vide. | 20 |
| `C:work()` | Active/désactive l'action map `VehicleCommonActionMap`. | 25 |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/toggleVehicleControls.lua`.*
