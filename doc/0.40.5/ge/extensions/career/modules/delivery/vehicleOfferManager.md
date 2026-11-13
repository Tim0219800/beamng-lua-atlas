# `career_modules_delivery_vehicleOfferManager`

*Fichier : `lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua` · VM : Game Engine (GE) · 405 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_delivery_vehicleOfferManager` : `extensions.load("career_modules_delivery_vehicleOfferManager")`, puis la globale `career_modules_delivery_vehicleOfferManager`

**Dépendances (chargées avant) :** `util_stepHandler`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_delivery_vehicleOfferManager.addOffer(offer)` |  | 206 |
| `career_modules_delivery_vehicleOfferManager.getAllOfferAtFacilityUnexpired(facId, psPath)` |  | 250 |
| `career_modules_delivery_vehicleOfferManager.getAllOfferCustomFilter(filter, ...)` |  | 222 |
| `career_modules_delivery_vehicleOfferManager.getAllOfferForLocation(loc)` |  | 233 |
| `career_modules_delivery_vehicleOfferManager.getAllOfferUnexpired()` |  | 237 |
| `career_modules_delivery_vehicleOfferManager.getDefaultVehicleModifiersForUI()` |  | 141 |
| `career_modules_delivery_vehicleOfferManager.getOfferById(id)` |  | 268 |
| `career_modules_delivery_vehicleOfferManager.getVehicleTagLabelPlural(tag)` |  | 135 |
| `career_modules_delivery_vehicleOfferManager.getVehicleTagLabelSingular(tag)` |  | 130 |
| `career_modules_delivery_vehicleOfferManager.getVehicleTagUnlockedSimple()` |  | 121 |
| `career_modules_delivery_vehicleOfferManager.isVehicleTagUnlocked(tag)` |  | 110 |
| `career_modules_delivery_vehicleOfferManager.makeTaskLabel(task)` |  | 21 |
| `career_modules_delivery_vehicleOfferManager.onCareerActivated()` | *(hook)* | 8 |
| `career_modules_delivery_vehicleOfferManager.sameLocation(a, b)` |  | 214 |
| `career_modules_delivery_vehicleOfferManager.sameLocationOffer(offer, otherLoc)` |  | 210 |
| `career_modules_delivery_vehicleOfferManager.spawnOffer(offerId, fadeToBlack, callback)` |  | 277 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

**Évènements UI (guihooks.trigger) :** `updateCargoData`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua`.*
