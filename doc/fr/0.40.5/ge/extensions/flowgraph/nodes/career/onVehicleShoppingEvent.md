# `flowgraph_nodes_career_onVehicleShoppingEvent`

*Fichier : `lua/ge/extensions/flowgraph/nodes/career/onVehicleShoppingEvent.lua` · VM : Game Engine (GE) · 71 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/career/onVehicleShoppingEvent")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « On Vehicle Shopping Event » (catégorie repeat_instant, couleur/icône ui). Détecte les évènements d'achat de véhicule en carrière. Sorties en impulsion : openedMenu, closedMenu (aussi levé au retour en jeu), vehicleSpawned (véhicule généré pour inspection), openedDetail (menu d'achat détaillé), vehicleBought ; plus vehId (number, id du véhicule acheté) et testDriveActive (bool, career_modules_testDrive.isActive).

## Remarques

- Utilise career_modules_testDrive et career_modules_inventory : nécessite la carrière.
- Les descriptions de vehicleBought et vehId contiennent des fautes de frappe dans le jeu (« buyign »).
- vehId garde sa dernière valeur après l'impulsion.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Crée la table de drapeaux. | 26 |
| `C:onUIPlayStateChanged(enteredPlay)` | Hook : lève closedMenu quand le joueur revient en jeu. | 64 |
| `C:onVehicleAddedToInventory(data)` | Hook : lève vehicleBought et convertit data.inventoryId en id de véhicule (vehId). | 55 |
| `C:onVehicleShoppingMenuClosed()` | Hook : lève closedMenu. | 60 |
| `C:onVehicleShoppingMenuOpened(data)` | Hook : lève openedMenu. | 43 |
| `C:onVehicleShoppingPurchaseMenuOpened(data)` | Hook : lève openedDetail. | 51 |
| `C:onVehicleShoppingVehicleShown(data)` | Hook : lève vehicleSpawned. | 47 |
| `C:work(args)` | Chaque frame : remet à faux cinq sorties flow, applique et efface les drapeaux, met à jour testDriveActive. | 30 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/career/onVehicleShoppingEvent.lua`.*
