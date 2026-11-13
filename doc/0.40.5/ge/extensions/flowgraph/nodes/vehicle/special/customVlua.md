# `flowgraph_nodes_vehicle_special_customVlua`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/special/customVlua.lua` · VM : Game Engine (GE) · 59 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/special/customVlua")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Custom Vehicle Lua » (catégorie `repeat_p_duration`, tags lua/vlua/command/code). Exécute du code Lua dans la VM du véhicule avec `veh:queueLuaCommand(func)`. Pins d'entrée : `vehId` (défaut : joueur), `func` (string, code à exécuter). Sortie : `flow`, `vehId` (caché).

## Remarques

- Exécuté à chaque frame tant que le flux est actif.
- Le code est exécuté tel quel : c'est de l'exécution arbitraire, donc pas de source non fiable.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(data)` | Migration des anciens projets : déplace `data.func` vers un pin codé en dur `func`. | 49 |
| `C:drawMiddle(builder, style)` | Affichage central vide. | 45 |
| `C:work()` | Envoie `func` au véhicule et recopie `vehId` sur la sortie. | 31 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/special/customVlua.lua`.*
