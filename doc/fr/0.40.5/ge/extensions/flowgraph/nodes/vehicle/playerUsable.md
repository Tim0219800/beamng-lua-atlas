# `flowgraph_nodes_vehicle_playerUsable`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/playerUsable.lua` · VM : Game Engine (GE) · 44 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/playerUsable")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Player Usable » (catégorie `repeat_instant`). Fixe si un véhicule peut être contrôlé par le joueur : `source.obj.playerUsable = controllable`. Pins d'entrée : `vehId`, `controllable` (bool).

## Remarques

- `C.todo` : « PlayerUsable a des bugs et ne fonctionne que la première fois ».
- Bug : `vehId` nil ou 0 → `source` nil → erreur à l'accès `source.obj` ; pas de repli sur le joueur.
- `legacyPins` référence `vehiId` (faute de frappe).

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Constructeur vide. | 26 |
| `C:work()` | Écrit `controllable` dans `playerUsable` du véhicule. | 31 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/playerUsable.lua`.*
