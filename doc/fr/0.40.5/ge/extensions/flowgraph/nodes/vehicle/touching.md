# `flowgraph_nodes_vehicle_touching`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/touching.lua` · VM : Game Engine (GE) · 75 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/touching")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Vehicle Touch » (catégorie `repeat_instant`, tags collision/collide/hit). Détecte via `map.objects[vehIdA].objectCollisions` si un véhicule en touche un autre. Pins d'entrée : `flow`, `vehIdA`, `vehIdB` (optionnel). Sorties : `flow` (toujours true), `touching` (flux), `touchingb` (bool), et `vehId1` à `vehId5` (cachés : jusqu'à 5 ids touchés, triés, -1 si aucun). Sans `vehIdB`, teste toute collision.

## Remarques

- Avec `vehIdB`, les sorties `vehId1..5` restent à -1.
- Les descriptions de `vehId1..5` sont identiques (« lowest-id-ed vehicle »).

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(mgr, ...)` | Constructeur vide. | 31 |
| `C:work()` | Réinitialise les sorties puis les remplit selon la table de collisions du véhicule A. | 35 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/touching.lua`.*
