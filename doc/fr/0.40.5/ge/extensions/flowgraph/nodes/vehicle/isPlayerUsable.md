# `flowgraph_nodes_vehicle_isPlayerUsable`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/isPlayerUsable.lua` · VM : Game Engine (GE) · 44 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/isPlayerUsable")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Is Player usable » (catégorie `repeat_instant`). Lit `playerUsable` d'un véhicule. Pin d'entrée : `vehId` ; sorties : flux `true` et flux `false`.

## Remarques

- Bug : si `vehId` est nil ou 0, le `else` est vide, donc `source` reste nil et `source.playerUsable` provoque une erreur (aucun repli sur le joueur).
- La table `legacyPins` fait référence à `vehiId` (faute de frappe).

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Constructeur vide. | 26 |
| `C:work()` | Met `true` = `source.playerUsable` et `false` = son contraire. | 31 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/isPlayerUsable.lua`.*
