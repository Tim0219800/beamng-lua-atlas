# `flowgraph_nodes_vehicle_bus_isBus`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/bus/isBus.lua` · VM : Game Engine (GE) · 31 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/bus/isBus")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Is Bus » (catégorie `repeat_instant`). Teste si un véhicule est un bus via `mgr.modules.vehicle:isBus(vehId)`. Pin d'entrée : `vehId`. Sorties : flux `isBus`, flux `isNotBus`, bool `isBusBool`.

## Remarques

- La description du pin d'entrée dit « Id of vehicle A » (copier-coller) ; c'est bien le véhicule testé.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work(args)` | Remplit `isBus`, `isNotBus` et `isBusBool` selon le résultat de `isBus`. Paramètre `args` non utilisé. | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/bus/isBus.lua`.*
