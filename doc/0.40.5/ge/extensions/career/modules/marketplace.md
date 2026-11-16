# `career_modules_marketplace`

*File: `lua/ge/extensions/career/modules/marketplace.lua` · VM: Game Engine (GE) · 1183 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_marketplace`: `extensions.load("career_modules_marketplace")`, then the global `career_modules_marketplace`

Career vehicle marketplace, working in two directions. (1) The player lists vehicles from their inventory for sale (listVehicles); virtual buyers generate offers over time (base offer = market value, with noise and caps depending on the asking price / market value ratio), which expire after about 500 s. The player accepts, refuses or negotiates. (2) The player negotiates the price of a vehicle for sale at a seller (dealership or private seller). The negotiation engine simulates the patience, counteroffers and insults of a personality (file levels/west_coast_usa/facilities/negotiationPersonalities.json) and informs the UI via guihooks negotiationData. Saves to career/marketplace.json.

## Example

```lua
career_modules_marketplace.listVehicles({{inventoryId = 3}})
local listings = career_modules_marketplace.getListings()
```

## Notes

- Misleading naming: startNegotiateBuyingOffer = the player SELLS (buyer's offer, amISelling = true); startNegotiateSellingOffer = the player BUYS from a seller (amISelling = false).
- Constants: average interval between offers 95 s (multiplied by offerTimeMultiplier depending on the asking price: 1 between 0.98 and 1.1 of market value, down to 0.4 if cheaper, up to 4 if more expensive), offer lifetime 500 s ± 50%, maximum of 10 expired offers kept per listing.
- A listing is disabled in getListings if the vehicle's current value falls below 95% of its market value at the time it was listed (valueLossLimit).
- Offers are rounded to the nearest multiple of 50, minimum 50.
- Offer generation runs every 10 s of simulation time in onUpdate, unless the list is empty or the offers menu is open (expired offers are then purged on open/close, via menuOpened).
- In the negotiation, the status goes through initial, thinking, typing, then accepted, refused, counterOffer, counterOfferLastChance or failed. A proposed price is valid only if it improves the opponent's position without exceeding the player's previous offer (isOfferAllowed).
- The field negotiationState.opponentName calls _tr(opponentPersonality.name): crashes if getNegotiationState is called without a prior negotiation (opponentPersonality nil).
- generatePersonality reads a file specific to the west_coast_usa level; returns nil if the file is missing. generateOffer(inventoryId) without an id picks a random listing.
- An ImGui debug window (Negotiation Buying) is displayed outside shipping builds during a negotiation; its buttons only toggle negotiationActive off.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_marketplace.acceptOffer(inventoryId, offerId)` | Accepts an offer: removes it from the listing and sells the vehicle at the offer value (career_modules_inventory.sellVehicle). | 214 |
| `career_modules_marketplace.cancelNegotiation()` | Cancels the negotiation (status failed); if the player had already made an offer, prevents renegotiating that offer or vehicle. | 506 |
| `career_modules_marketplace.declineOffer(inventoryId, offerId)` | Refuses (deletes) an offer from the listing. | 225 |
| `career_modules_marketplace.finalizeNegotiationExit()` | On leaving the screen: takes the offer if the status is accepted and not yet taken, otherwise cancels the negotiation. | 871 |
| `career_modules_marketplace.findVehicleListing(inventoryId)` | Looks up the listing of an inventory vehicle. | 20 |
| `career_modules_marketplace.generateOffer(inventoryId)` | Creates an offer from a random buyer for a listing (the given one or a random listing): value = market value * multiplier * noise, capped according to the price ratio, rounded to 50. | 171 |
| `career_modules_marketplace.generatePersonality(buyer, _archetypes)` | Randomly picks a negotiation archetype (buyer or seller) from negotiationPersonalities.json and builds the personality: name, patience, acceptance/insult thresholds, price multiplier (1 - m for a buyer, 1 + m for a seller), delays, quotes. | 77 |
| `career_modules_marketplace.getListings()` | Returns a copy of the listings for the UI: translated name, listing disabled if the value dropped too much, expired offers marked disabled, offers sorted (active first, most recent first). | 935 |
| `career_modules_marketplace.getNegotiationState()` | Returns the negotiation state for the UI: active, direction (amISelling), starting price, patience, offers (myOffer/theirOffer), status, opponent name and quote, vehicle (name, thumbnail, mileage, actual value) and offer history. | 320 |
| `career_modules_marketplace.listVehicles(vehicles)` | Lists vehicles for sale (ignores unknown vehicles or those already for sale). Price = entry.value or computed value; sets marketRatio and offerTimeMultiplier. | 28 |
| `career_modules_marketplace.makeNegotiationOffer(price)` | Proposes a price (converted with tonumber): if valid, starts the opponent's response as a background task (simulated thinking then typing, patience decrease, acceptance, counteroffer, refusal or failure) and sends the states to the UI. | 849 |
| `career_modules_marketplace.menuOpened(open)` | Signals the offers menu opening/closing (the negotiation counts as an open menu) and updates the listings: purges expired offers if opened, generates new offers otherwise. | 1007 |
| `career_modules_marketplace.onExtensionLoaded()` | Hook: loads marketplace.json if the career is active (returns false otherwise). *(internal)* *(hook)* | 1024 |
| `career_modules_marketplace.onSaveCurrentProfile(currentSavePath, vehiclesThumbnailUpdate)` | Save hook: writes listedVehicles to <save>/career/marketplace.json. *(internal)* *(hook)* | 1018 |
| `career_modules_marketplace.onUpdate(dtReal, dtSim, dtRaw)` | Frame hook: displays the debug window during negotiation (outside shipping) and, every 10 s of simulation, generates new offers and expires old ones. *(internal)* *(hook)* | 881 |
| `career_modules_marketplace.onVehicleRemoved(inventoryId)` | Hook: removes the listing of a vehicle deleted from the inventory. *(internal)* *(hook)* | 931 |
| `career_modules_marketplace.openMenu(computerId)` | Opens the vehicle shop in "marketplace" mode from the given computer. | 1014 |
| `career_modules_marketplace.removeVehicleListing(inventoryId)` | Removes the vehicle's listing. | 69 |
| `career_modules_marketplace.startNegotiateBuyingOffer(inventoryId, offerId)` | Starts a negotiation where the player sells: initializes the buyer's personality, the quote, the prices (the player asks listing.value, the buyer offers offer.value), the history, and navigates to career.computer.vehicleShopping.negotiation. | 387 |
| `career_modules_marketplace.startNegotiateSellingOffer(_shopId)` | Starts a negotiation where the player buys a vehicle from the shop. Refused (warning toast) if the vehicle is on promotion or non-negotiable. Initializes patience, starting price (discounted if discountPercentage) and navigates to the purchase screen. | 439 |
| `career_modules_marketplace.takeTheirOffer()` | Accepts the opponent's offer. When selling: sets the offer value and sells the vehicle. When buying: sets the shop vehicle's price (originalSellValue if lowered) and blocks further negotiations. | 853 |

### Parameter details

#### `career_modules_marketplace.acceptOffer(inventoryId, offerId)`

Accepts an offer: removes it from the listing and sells the vehicle at the offer value (career_modules_inventory.sellVehicle).

- `inventoryId` (*integer*) : Inventory id.
- `offerId` (*integer*) : Offer id.

#### `career_modules_marketplace.declineOffer(inventoryId, offerId)`

Refuses (deletes) an offer from the listing.

- `inventoryId` (*integer*) : Inventory id.
- `offerId` (*integer*) : Offer id.

#### `career_modules_marketplace.findVehicleListing(inventoryId)`

Looks up the listing of an inventory vehicle.

- `inventoryId` (*integer*) : Inventory id.
- **returns**: table|nil Listing (id, value, marketValue, offers...).

#### `career_modules_marketplace.generateOffer(inventoryId)`

Creates an offer from a random buyer for a listing (the given one or a random listing): value = market value * multiplier * noise, capped according to the price ratio, rounded to 50.

- `inventoryId` (*integer|nil*) : Inventory id of the listing.
- **returns**: table Offer {id, timestamp, value, ttl, negotiationPossible, buyerPersonality}.

#### `career_modules_marketplace.generatePersonality(buyer, _archetypes)`

Randomly picks a negotiation archetype (buyer or seller) from negotiationPersonalities.json and builds the personality: name, patience, acceptance/insult thresholds, price multiplier (1 - m for a buyer, 1 + m for a seller), delays, quotes.

- `buyer` (*boolean|nil*) : true for a buyer.
- `_archetypes` (*string[]|nil*) : Forced list of archetypes (otherwise randomBuyerArchetypes / randomSellerArchetypes).
- **returns**: table|nil Personality, nil if the file is missing or the list is empty.

#### `career_modules_marketplace.getListings()`

Returns a copy of the listings for the UI: translated name, listing disabled if the value dropped too much, expired offers marked disabled, offers sorted (active first, most recent first).

- **returns**: table[] Listings.

#### `career_modules_marketplace.getNegotiationState()`

Returns the negotiation state for the UI: active, direction (amISelling), starting price, patience, offers (myOffer/theirOffer), status, opponent name and quote, vehicle (name, thumbnail, mileage, actual value) and offer history.

- **returns**: table Negotiation state.

#### `career_modules_marketplace.listVehicles(vehicles)`

Lists vehicles for sale (ignores unknown vehicles or those already for sale). Price = entry.value or computed value; sets marketRatio and offerTimeMultiplier.

- `vehicles` (*{inventoryId: integer, value: number|nil}[]*) : Vehicles to list, with optional asking price.

#### `career_modules_marketplace.makeNegotiationOffer(price)`

Proposes a price (converted with tonumber): if valid, starts the opponent's response as a background task (simulated thinking then typing, patience decrease, acceptance, counteroffer, refusal or failure) and sends the states to the UI.

- `price` (*number|string*) : Proposed price.
- **returns**: boolean false if the price is not allowed.

#### `career_modules_marketplace.menuOpened(open)`

Signals the offers menu opening/closing (the negotiation counts as an open menu) and updates the listings: purges expired offers if opened, generates new offers otherwise.

- `open` (*boolean*) : Whether the menu is open.

#### `career_modules_marketplace.onSaveCurrentProfile(currentSavePath, vehiclesThumbnailUpdate)`

Save hook: writes listedVehicles to <save>/career/marketplace.json.

- `currentSavePath` (*string*) : Save folder.
- `vehiclesThumbnailUpdate` (*integer[]|nil*) : Not used.

#### `career_modules_marketplace.onUpdate(dtReal, dtSim, dtRaw)`

Frame hook: displays the debug window during negotiation (outside shipping) and, every 10 s of simulation, generates new offers and expires old ones.

- `dtReal` (*number*) : Real time (s).
- `dtSim` (*number*) : Simulated time (s).
- `dtRaw` (*number*) : Raw time (s).

#### `career_modules_marketplace.onVehicleRemoved(inventoryId)`

Hook: removes the listing of a vehicle deleted from the inventory.

- `inventoryId` (*integer*) : Inventory id.

#### `career_modules_marketplace.openMenu(computerId)`

Opens the vehicle shop in "marketplace" mode from the given computer.

- `computerId` (*string*) : Computer id.

#### `career_modules_marketplace.removeVehicleListing(inventoryId)`

Removes the vehicle's listing.

- `inventoryId` (*integer*) : Inventory id.

#### `career_modules_marketplace.startNegotiateBuyingOffer(inventoryId, offerId)`

Starts a negotiation where the player sells: initializes the buyer's personality, the quote, the prices (the player asks listing.value, the buyer offers offer.value), the history, and navigates to career.computer.vehicleShopping.negotiation.

- `inventoryId` (*integer*) : Inventory id of the vehicle for sale.
- `offerId` (*integer*) : Id of the starting offer.
- **returns**: any Result of ui_router.navigate.

#### `career_modules_marketplace.startNegotiateSellingOffer(_shopId)`

Starts a negotiation where the player buys a vehicle from the shop. Refused (warning toast) if the vehicle is on promotion or non-negotiable. Initializes patience, starting price (discounted if discountPercentage) and navigates to the purchase screen.

- `_shopId` (*string|integer*) : Vehicle id in the shop (career_modules_vehicleShopping).
- **returns**: any Result of ui_router.navigate, or nil if refused.

## Fields

| Field | Type | Description |
|---|---|---|
| `dealershipBuyerQuotes` | string[] | 25 translation keys for dealership buyer phrases (ui.career.negotiation.dealershipBuyerQuotes.01..25). |
| `firstNameCount` | integer | Number of first names (#firstNames). |
| `firstNames` | string[] | List of first names used to generate private buyer/seller names. |
| `initialCount` | integer | Number of entries in initials. |
| `initialProbabilities` | table<string, number> | Relative frequency of each initial (A-Z) for last names. |
| `initials` | string[] | List of initials weighted by initialProbabilities (math.ceil(p*100) copies each). |
| `privateSellerQuotes` | string[] | 50 translation keys for private seller phrases (ui.career.negotiation.privateSellerQuotes.01..50). |

**UI events (guihooks.trigger):** `negotiationData`, `toastrMsg`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/marketplace.lua`.*
