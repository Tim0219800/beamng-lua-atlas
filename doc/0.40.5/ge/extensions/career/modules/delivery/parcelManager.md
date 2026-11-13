# `career_modules_delivery_parcelManager`

*Fichier : `lua/ge/extensions/career/modules/delivery/parcelManager.lua` · VM : Game Engine (GE) · 709 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_delivery_parcelManager` : `extensions.load("career_modules_delivery_parcelManager")`, puis la globale `career_modules_delivery_parcelManager`

**Dépendances (chargées avant) :** `freeroam_facilities`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_delivery_parcelManager.addCargo(cargo, silent)` |  | 40 |
| `career_modules_delivery_parcelManager.addParcelRewardsSummary(cargo)` |  | 578 |
| `career_modules_delivery_parcelManager.addTransientMoveCargo(cargoId, targetLocation)` |  | 79 |
| `career_modules_delivery_parcelManager.applyTransientMoves(currentLocation)` |  | 134 |
| `career_modules_delivery_parcelManager.changeCargoLocation(cargoId, newLocation)` |  | 47 |
| `career_modules_delivery_parcelManager.cleanUpCargo()` |  | 670 |
| `career_modules_delivery_parcelManager.clearAllTransientMoves()` |  | 125 |
| `career_modules_delivery_parcelManager.clearTransientFlags()` |  | 210 |
| `career_modules_delivery_parcelManager.clearTransientMoveForCargo(cargoId)` |  | 108 |
| `career_modules_delivery_parcelManager.getAllCargoAtFacilityUnexpired(facId)` |  | 341 |
| `career_modules_delivery_parcelManager.getAllCargoCustomFilter(filter, ...)` |  | 257 |
| `career_modules_delivery_parcelManager.getAllCargoForDestinationFacilityStillAtOriginUnexpired(facId)` |  | 328 |
| `career_modules_delivery_parcelManager.getAllCargoForFacilityUnexpiredUndelivered(facId, timeExpire, timeGenerated)` |  | 312 |
| `career_modules_delivery_parcelManager.getAllCargoForLocation(loc)` |  | 268 |
| `career_modules_delivery_parcelManager.getAllCargoForLocationUnexpired(loc)` |  | 282 |
| `career_modules_delivery_parcelManager.getAllCargoForLocationUnexpiredUndelivered(loc, timeExpire, timeGenerated)` |  | 296 |
| `career_modules_delivery_parcelManager.getAllCargoInVehicles(includeTransient)` |  | 354 |
| `career_modules_delivery_parcelManager.getCargoById(cargoId)` |  | 423 |
| `career_modules_delivery_parcelManager.getLocationLabelLong(loc)` |  | 396 |
| `career_modules_delivery_parcelManager.getLocationLabelShort(loc)` |  | 374 |
| `career_modules_delivery_parcelManager.getRewardsWithBreakdown(cargo)` |  | 436 |
| `career_modules_delivery_parcelManager.getTransientMoveCargo()` |  | 97 |
| `career_modules_delivery_parcelManager.getTransientMovesForTargetLocationWithCargo(targetLocation)` |  | 197 |
| `career_modules_delivery_parcelManager.hasUncommittedTransientMoves()` |  | 95 |
| `career_modules_delivery_parcelManager.onCareerActivated()` | *(hook)* | 14 |
| `career_modules_delivery_parcelManager.onTrailerAttached(objId1, objId2)` | *(hook)* | 214 |
| `career_modules_delivery_parcelManager.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 652 |
| `career_modules_delivery_parcelManager.sameLocation(a, b)` |  | 249 |
| `career_modules_delivery_parcelManager.sameLocationCargo(cargo, otherLoc)` |  | 245 |
| `career_modules_delivery_parcelManager.undoTransientCargo()` |  | 223 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `addParcelRewards` | any |  ⚠ référence `addParcelRewards` non définie dans le fichier (vaut probablement nil) |
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onCargoGenerated` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `Message`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/delivery/parcelManager.lua`.*
