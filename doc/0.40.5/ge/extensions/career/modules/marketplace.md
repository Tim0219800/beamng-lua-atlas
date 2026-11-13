# `career_modules_marketplace`

*Fichier : `lua/ge/extensions/career/modules/marketplace.lua` · VM : Game Engine (GE) · 1183 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_marketplace` : `extensions.load("career_modules_marketplace")`, puis la globale `career_modules_marketplace`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_marketplace.acceptOffer(inventoryId, offerId)` |  | 214 |
| `career_modules_marketplace.cancelNegotiation()` |  | 506 |
| `career_modules_marketplace.declineOffer(inventoryId, offerId)` |  | 225 |
| `career_modules_marketplace.finalizeNegotiationExit()` |  | 871 |
| `career_modules_marketplace.findVehicleListing(inventoryId)` |  | 20 |
| `career_modules_marketplace.generateOffer(inventoryId)` |  | 171 |
| `career_modules_marketplace.generatePersonality(buyer, _archetypes)` |  | 77 |
| `career_modules_marketplace.getListings()` |  | 935 |
| `career_modules_marketplace.getNegotiationState()` | UI bridge helpers for negotiation ----------------------------------------- | 320 |
| `career_modules_marketplace.listVehicles(vehicles)` |  | 28 |
| `career_modules_marketplace.makeNegotiationOffer(price)` |  | 849 |
| `career_modules_marketplace.menuOpened(open)` |  | 1007 |
| `career_modules_marketplace.onExtensionLoaded()` | *(hook)* | 1024 |
| `career_modules_marketplace.onSaveCurrentProfile(currentSavePath, vehiclesThumbnailUpdate)` | *(hook)* | 1018 |
| `career_modules_marketplace.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 881 |
| `career_modules_marketplace.onVehicleRemoved(inventoryId)` | *(hook)* | 931 |
| `career_modules_marketplace.openMenu(computerId)` |  | 1014 |
| `career_modules_marketplace.removeVehicleListing(inventoryId)` |  | 69 |
| `career_modules_marketplace.startNegotiateBuyingOffer(inventoryId, offerId)` |  | 387 |
| `career_modules_marketplace.startNegotiateSellingOffer(_shopId)` |  | 439 |
| `career_modules_marketplace.takeTheirOffer()` |  | 853 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dealershipBuyerQuotes` | table |  |
| `firstNameCount` | any |  |
| `firstNames` | table |  |
| `initialCount` | any |  |
| `initialProbabilities` | table |  |
| `initials` | table |  |
| `privateSellerQuotes` | table |  |

**Évènements UI (guihooks.trigger) :** `negotiationData`, `toastrMsg`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/marketplace.lua`.*
