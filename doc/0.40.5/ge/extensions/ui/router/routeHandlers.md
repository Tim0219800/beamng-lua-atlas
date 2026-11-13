# `ui_router_routeHandlers`

*Fichier : `lua/ge/extensions/ui/router/routeHandlers.lua` · VM : Game Engine (GE) · 40 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routeHandlers` : `extensions.load("ui_router_routeHandlers")`, puis la globale `ui_router_routeHandlers`

Registre des gestionnaires de retour/sortie nommés des routes. Une route dont le retour est en mode « handler » désigne un nom (par exemple garageExitHandler) ; router.back() le récupère via getHandler et l'appelle. La plupart des gestionnaires sont définis dans routeHandlers/*ExitHandlers.lua ou délèguent à des modules de gameplay (carrière, inventaire, achat de véhicules, garde de configuration de véhicule).

## Remarques

- Gestionnaires enregistrés : firstDriveLockedHandler (échec first_drive_locked), previousRouteBackHandler (retour à l'entrée précédente avec restoreLastScope, sinon « menu »), garageExitHandler, mainmenuExitHandler, missionDetailsExitHandler, pauseExitHandler, vehicleConfigurationBackHandler, missionVehicleSelectorBackHandler, careerProfilesExitHandler, careerBranchPageBackHandler, radialBackHandler, partShoppingExitHandler, partInventoryExitHandler, vehicleShoppingExitHandler, vehicleShoppingVehicleListExitHandler, vehiclePurchaseExitHandler, negotiationExitHandler, vehicleInventoryExitHandler.
- Les gestionnaires qui délèguent à un module (vehicleConfigurationBackHandler, part/vehicle Shopping, partInventory, vehicleInventory) sont des fonctions enveloppes qui résolvent le module au moment de l'appel ; les autres sont lus dans extensions.ui_router_routeHandlers_* au chargement du fichier.
- Ce module n'exporte que getHandler ; la table de gestionnaires est locale.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_routeHandlers.getHandler(handlerName)` | Renvoie le gestionnaire enregistré sous ce nom. | 36 |

### Détail des paramètres

#### `ui_router_routeHandlers.getHandler(handlerName)`

Renvoie le gestionnaire enregistré sous ce nom.

- `handlerName` (*string*) : Nom du gestionnaire déclaré dans la route (back.handler).
- **renvoie** : function|nil Gestionnaire, ou nil si le nom est inconnu.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routeHandlers.lua`.*
