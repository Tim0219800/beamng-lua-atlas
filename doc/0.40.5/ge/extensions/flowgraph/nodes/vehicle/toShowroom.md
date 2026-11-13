# `flowgraph_nodes_vehicle_toShowroom`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/toShowroom.lua` · VM : Game Engine (GE) · 38 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/toShowroom")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Move To Showroom » (catégorie `repeat_instant`, dépend de `util_showroom`). Remet à zéro et déplace un véhicule dans le showroom (`util_showroom.moveInside(veh)`). Pin d'entrée : `vehId` (défaut : joueur).

**Dépendances (chargées avant) :** `util_showroom`

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Constructeur vide. | 22 |
| `C:work()` | Appelle `util_showroom.moveInside` sur le véhicule. | 24 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/toShowroom.lua`.*
