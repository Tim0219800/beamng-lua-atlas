# `career_modules_delivery_cargoScreen`

*Fichier : `lua/ge/extensions/career/modules/delivery/cargoScreen.lua` · VM : Game Engine (GE) · 2017 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_delivery_cargoScreen` : `extensions.load("career_modules_delivery_cargoScreen")`, puis la globale `career_modules_delivery_cargoScreen`

**Dépendances (chargées avant) :** `core_vehicleBridge`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_delivery_cargoScreen.abandonAcceptedOffer(vehId)` |  | 582 |
| `career_modules_delivery_cargoScreen.applyTransientMoves()` |  | 1484 |
| `career_modules_delivery_cargoScreen.cancelDeliveryConfiguration()` | call this function to cancel the delivery - all cargo will be placed back. | 1673 |
| `career_modules_delivery_cargoScreen.clearTransientMoveForCargo(...)` |  | 2006 |
| `career_modules_delivery_cargoScreen.clearTransientMovesForStorage(materialType)` |  | 740 |
| `career_modules_delivery_cargoScreen.commitDeliveryConfiguration()` | call this function to commit the configuration and clear all transient flags. | 1595 |
| `career_modules_delivery_cargoScreen.confirmDropOffData(...)` |  | 2005 |
| `career_modules_delivery_cargoScreen.deliveryMarkerSelected(poiId)` | when a marker is clicked, set route there | 1860 |
| `career_modules_delivery_cargoScreen.deliveryScreenExternalButtonPressed(id)` |  | 951 |
| `career_modules_delivery_cargoScreen.dropOffPopupClosed(mode)` |  | 2008 |
| `career_modules_delivery_cargoScreen.enterCargoOverviewScreen(facilityId, parkingSpotPath)` | called by activity accept or from the career menu to enter the cargo screen. | 1511 |
| `career_modules_delivery_cargoScreen.enterMyCargo()` |  | 1567 |
| `career_modules_delivery_cargoScreen.exitCargoOverviewScreen(facilityId, parkingSpotPath)` | called whenever the cargo screen is closed for any reason. | 1583 |
| `career_modules_delivery_cargoScreen.exitDeliveryMode()` | other/utility functions | 1994 |
| `career_modules_delivery_cargoScreen.formatAcceptedOfferForUI(offer)` |  | 521 |
| `career_modules_delivery_cargoScreen.formatCargoGroup(group, playerCargoContainers, showFirstSeen)` | formats a group of "identical" cargo (ie same name, destination, etc) | 90 |
| `career_modules_delivery_cargoScreen.getCargoScreenTab()` |  | 70 |
| `career_modules_delivery_cargoScreen.highlightCargoInPoi(poiId)` | highlight entries in list | 1841 |
| `career_modules_delivery_cargoScreen.isCargoScreenOpen()` |  | 46 |
| `career_modules_delivery_cargoScreen.moveCargoFromUi(cargoId, targetLocation)` | call this function to move the cargo to a different location. if moved to the player, a transient flag will be added. if moved back to facility, transient flag will be removed. | 1468 |
| `career_modules_delivery_cargoScreen.moveMaterialFromUi(materialType, cargoType, amount, targetLocation)` |  | 751 |
| `career_modules_delivery_cargoScreen.onBigmapHoveredPoiIdChanged(poiId)` | when a marker is hovered, highlight entries in list *(hook)* | 1871 |
| `career_modules_delivery_cargoScreen.onCareerActivated()` | *(hook)* | 11 |
| `career_modules_delivery_cargoScreen.onCargoGenerated(cargo)` | update for the screen *(hook)* | 1450 |
| `career_modules_delivery_cargoScreen.onCargoOverviewRouteLeave(context, toRoute, fromRoute, data)` | *(hook)* | 1687 |
| `career_modules_delivery_cargoScreen.onCargoPickedUp()` | *(hook)* | 1816 |
| `career_modules_delivery_cargoScreen.onDeactivateBigMapCallback()` | Show only the route up until the first destination in gameplay *(hook)* | 1824 |
| `career_modules_delivery_cargoScreen.onDeliveryRewardsPopupClosed()` | recalculate route after closing the popup with the rewards *(hook)* | 1795 |
| `career_modules_delivery_cargoScreen.requestCargoDataForUi(facId, psPath, updateMaxTimeTimestamp)` | gets all offers and player cargo, depending on supplied facId and psPath. | 1095 |
| `career_modules_delivery_cargoScreen.requestDropOffData(...)` |  | 2004 |
| `career_modules_delivery_cargoScreen.setBestRoute(onlyClosestTarget)` |  | 1731 |
| `career_modules_delivery_cargoScreen.setBigMapPanEnabled(enabled)` |  | 1571 |
| `career_modules_delivery_cargoScreen.setCargoRoute(cargoId, origin)` | when a cargo list element ist clicked, set the bigMap route there | 1959 |
| `career_modules_delivery_cargoScreen.setCargoScreenTab(tab)` |  | 47 |
| `career_modules_delivery_cargoScreen.setVisibleIdsForBigMap()` |  | 1974 |
| `career_modules_delivery_cargoScreen.showCargoContainerHelpPopup()` |  | 2000 |
| `career_modules_delivery_cargoScreen.showCargoRoutePreview(cargoId)` |  | 1902 |
| `career_modules_delivery_cargoScreen.showLocationRoutePreview(locationId, asProvider)` | when a parcel list entry is hovered, preview the route on bigMap | 1944 |
| `career_modules_delivery_cargoScreen.showRoutePreview(route)` |  | 1878 |
| `career_modules_delivery_cargoScreen.showVehicleOfferRoutePreview(offerId)` | when a vehicle offer list entry is hovered, preview route on bigMap | 1929 |
| `career_modules_delivery_cargoScreen.spawnOffer(...)` | offer spawning is handled in vehOffermanager | 1491 |
| `career_modules_delivery_cargoScreen.toggleOfferForSpawning(offerId)` |  | 1493 |
| `career_modules_delivery_cargoScreen.tryLoadAll(ids)` |  | 364 |
| `career_modules_delivery_cargoScreen.unloadCargoPopupClosed()` |  | 2003 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onDeliveryDropOffCargoSelectionPopupClosed`
- `onDeliveryRewardsPopupClosed` — écouté par 1 module(s)
- `onEnterCargoOverviewScreen`
- `onGameplayActivityAborted`

**Évènements UI (guihooks.trigger) :** `OpenSimpleDelayPopup`, `cargoDataForUiReady`, `newCargoAvailable`, `requestCargoDataSimple`, `sendHighlightedCardIds`

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/delivery/cargoScreen.lua`.*
