# `flowgraph_nodes_career_addToInventory`

*Fichier : `lua/ge/extensions/flowgraph/nodes/career/addToInventory.lua` · VM : Game Engine (GE) · 39 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/career/addToInventory")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Add To Inventory » (catégorie once_instant, couleur/icône career). Ajoute le véhicule d'id donné à l'inventaire du joueur via career_modules_inventory.addVehicle. Entrée : vehId (number). Positionne une erreur de nœud si le module carrière n'est pas chargé ou si aucun id n'est donné. Recopie le flux d'entrée sur la sortie.

## Remarques

- Le module d'inventaire n'existe qu'en mode carrière.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Vide. | 22 |
| `C:workOnce()` | Ajoute le véhicule à l'inventaire ou signale une erreur, puis copie flow vers la sortie. | 26 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/career/addToInventory.lua`.*
