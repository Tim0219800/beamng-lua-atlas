# `flowgraph_nodes_vehicle_getActive`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/getActive.lua` · VM : Game Engine (GE) · 39 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/getActive")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Get Vehicle Active » (catégorie `repeat_instant`). Lit l'état actif (visible) d'un véhicule avec `obj:getActive()`. Pin d'entrée : `vehId` (défaut : joueur). Sorties : flux `true` (actif), flux `false` (inactif), bool `isActive`.

## Remarques

- La description du pin dit « set visibility » (copier-coller depuis Set Vehicle Active) ; ce nœud ne fait que lire.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Met à jour les sorties `true`, `false` et `isActive` selon `getActive()`. | 22 |

## Appels vers le moteur (C++)

- `obj:` `getActive`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/getActive.lua`.*
