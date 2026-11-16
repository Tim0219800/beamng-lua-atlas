# `flowgraph_nodes_vehicle_recoverInPlace`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/recoverInPlace.lua` · VM : Game Engine (GE) · 47 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/recoverInPlace")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Recover In Place » (catégorie `once_instant`). Récupère un véhicule sur place : `veh:resetBrokenFlexMesh()` puis `spawn.safeTeleport` à la position actuelle avec la direction/haut actuels, pour qu'il ne soit pas dans un obstacle (il peut être un peu déplacé). Pin d'entrée : `vehId` (défaut : joueur).

## Remarques

- La description du pin `vehId` dit « to freeze » (copier-coller).

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Constructeur vide. | 27 |
| `C:workOnce()` | Remet à zéro les flexmeshes cassés puis téléporte le véhicule en sécurité sur place. | 31 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/recoverInPlace.lua`.*
