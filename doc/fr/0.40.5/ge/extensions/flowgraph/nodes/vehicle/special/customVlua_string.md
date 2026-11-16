# `flowgraph_nodes_vehicle_special_customVlua_string`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/special/customVlua_string.lua` · VM : Game Engine (GE) · 55 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/special/customVlua_string")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Custom vlua - deprecated » (catégorie `repeat_p_duration`). Ancienne version de « Custom Vehicle Lua » : envoie la chaîne du pin `customLUA` au véhicule `vehId` avec `queueLuaCommand`. Obsolète : remplacé par « Custom vlua ».

## Remarques

- Le pin `customLUA` est décrit « The message that will be displayed. Bug: can not start directly with a number. »
- `init` lit `self.pinIn.customLUAString` qui n'existe pas (le pin s'appelle `customLUA`) : erreur potentielle.
- Pas de repli sur le véhicule joueur.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Affichage central vide. | 48 |
| `C:init()` | Constructeur ; tente de copier `pinIn.customLUAString.value` dans `data.func` (pin inexistant). | 27 |
| `C:work()` | Envoie `customLUA` au véhicule. | 33 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/special/customVlua_string.lua`.*
