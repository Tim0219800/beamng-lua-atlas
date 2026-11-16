# `flowgraph_nodes_vehicle_isCoupled`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/isCoupled.lua` · VM : Game Engine (GE) · 34 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/isCoupled")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Is Coupled » (catégorie `repeat_instant`, tags event/attach/detach). Teste si deux véhicules sont attelés (`mgr.modules.vehicle:isCoupledTo(vehA, vehB)`). Pins d'entrée : `vehA`, `vehB`. Sorties : flux `coupled`, flux `decoupled`, bool `isCoupled`.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work(args)` | Remplit `coupled`, `decoupled` et `isCoupled` depuis le résultat de `isCoupledTo`. Paramètre `args` non utilisé. | 27 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/isCoupled.lua`.*
