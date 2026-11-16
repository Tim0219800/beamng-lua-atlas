# `flowgraph_nodes_vehicle_touchingProps`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/touchingProps.lua` · VM : Game Engine (GE) · 49 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/touchingProps")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Props Touch » (catégorie `repeat_instant`, tags collision/collide/hit). Indique si un véhicule touche un objet (prop) d'une liste d'ids, via `map.objects[vehId].objectCollisions`. Pins d'entrée : `flow`, `vehId`, `propsIds` (table d'ids). Sorties : `flow` (true), `touching` (flux), `isTouching` (bool, caché).

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(mgr, ...)` | Constructeur vide. | 26 |
| `C:work()` | Parcourt `propsIds` et active `touching` / `isTouching` au premier objet en collision. | 30 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/touchingProps.lua`.*
