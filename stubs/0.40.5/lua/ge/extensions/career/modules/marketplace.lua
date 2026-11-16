---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/marketplace.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career vehicle marketplace, working in two directions. (1) The player lists vehicles from their inventory for sale (listVehicles); virtual buyers generate offers over time (base offer = market value, with noise and caps depending on the asking price / market value ratio), which expire after about 500 s. The player accepts, refuses or negotiates. (2) The player negotiates the price of a vehicle for sale at a seller (dealership or private seller). The negotiation engine simulates the patience, counteroffers and insults of a personality (file levels/west_coast_usa/facilities/negotiationPersonalities.json) and informs the UI via guihooks negotiationData. Saves to career/marketplace.json.
--- Access: extension `career_modules_marketplace`: `extensions.load("career_modules_marketplace")`, then the global `career_modules_marketplace`
---@class career_modules_marketplace
---@field dealershipBuyerQuotes string[] 25 translation keys for dealership buyer phrases (ui.career.negotiation.dealershipBuyerQuotes.01..25).
---@field firstNameCount integer Number of first names (#firstNames).
---@field firstNames string[] List of first names used to generate private buyer/seller names.
---@field initialCount integer Number of entries in initials.
---@field initialProbabilities table<string, number> Relative frequency of each initial (A-Z) for last names.
---@field initials string[] List of initials weighted by initialProbabilities (math.ceil(p*100) copies each).
---@field privateSellerQuotes string[] 50 translation keys for private seller phrases (ui.career.negotiation.privateSellerQuotes.01..50).
career_modules_marketplace = {}

--- Accepts an offer: removes it from the listing and sells the vehicle at the offer value (career_modules_inventory.sellVehicle).
---Source: lua/ge/extensions/career/modules/marketplace.lua:214
---@param inventoryId integer Inventory id.
---@param offerId integer Offer id.
function career_modules_marketplace.acceptOffer(inventoryId, offerId) end

--- Cancels the negotiation (status failed); if the player had already made an offer, prevents renegotiating that offer or vehicle.
---Source: lua/ge/extensions/career/modules/marketplace.lua:506
function career_modules_marketplace.cancelNegotiation() end

--- Refuses (deletes) an offer from the listing.
---Source: lua/ge/extensions/career/modules/marketplace.lua:225
---@param inventoryId integer Inventory id.
---@param offerId integer Offer id.
function career_modules_marketplace.declineOffer(inventoryId, offerId) end

--- On leaving the screen: takes the offer if the status is accepted and not yet taken, otherwise cancels the negotiation.
---Source: lua/ge/extensions/career/modules/marketplace.lua:871
function career_modules_marketplace.finalizeNegotiationExit() end

--- Looks up the listing of an inventory vehicle.
---Source: lua/ge/extensions/career/modules/marketplace.lua:20
---@param inventoryId integer Inventory id.
---@return table|nil  Listing (id, value, marketValue, offers...).
function career_modules_marketplace.findVehicleListing(inventoryId) end

--- Creates an offer from a random buyer for a listing (the given one or a random listing): value = market value * multiplier * noise, capped according to the price ratio, rounded to 50.
---Source: lua/ge/extensions/career/modules/marketplace.lua:171
---@param inventoryId integer|nil Inventory id of the listing.
---@return table  Offer {id, timestamp, value, ttl, negotiationPossible, buyerPersonality}.
function career_modules_marketplace.generateOffer(inventoryId) end

--- Randomly picks a negotiation archetype (buyer or seller) from negotiationPersonalities.json and builds the personality: name, patience, acceptance/insult thresholds, price multiplier (1 - m for a buyer, 1 + m for a seller), delays, quotes.
---Source: lua/ge/extensions/career/modules/marketplace.lua:77
---@param buyer boolean|nil true for a buyer.
---@param _archetypes string[]|nil Forced list of archetypes (otherwise randomBuyerArchetypes / randomSellerArchetypes).
---@return table|nil  Personality, nil if the file is missing or the list is empty.
function career_modules_marketplace.generatePersonality(buyer, _archetypes) end

--- Returns a copy of the listings for the UI: translated name, listing disabled if the value dropped too much, expired offers marked disabled, offers sorted (active first, most recent first).
---Source: lua/ge/extensions/career/modules/marketplace.lua:935
---@return table[]  Listings.
function career_modules_marketplace.getListings() end

--- Returns the negotiation state for the UI: active, direction (amISelling), starting price, patience, offers (myOffer/theirOffer), status, opponent name and quote, vehicle (name, thumbnail, mileage, actual value) and offer history.
---Source: lua/ge/extensions/career/modules/marketplace.lua:320
---@return table  Negotiation state.
function career_modules_marketplace.getNegotiationState() end

--- Lists vehicles for sale (ignores unknown vehicles or those already for sale). Price = entry.value or computed value; sets marketRatio and offerTimeMultiplier.
---Source: lua/ge/extensions/career/modules/marketplace.lua:28
---@param vehicles {inventoryId: integer, value: number|nil}[] Vehicles to list, with optional asking price.
function career_modules_marketplace.listVehicles(vehicles) end

--- Proposes a price (converted with tonumber): if valid, starts the opponent's response as a background task (simulated thinking then typing, patience decrease, acceptance, counteroffer, refusal or failure) and sends the states to the UI.
---Source: lua/ge/extensions/career/modules/marketplace.lua:849
---@param price number|string Proposed price.
---@return boolean  false if the price is not allowed.
function career_modules_marketplace.makeNegotiationOffer(price) end

--- Signals the offers menu opening/closing (the negotiation counts as an open menu) and updates the listings: purges expired offers if opened, generates new offers otherwise.
---Source: lua/ge/extensions/career/modules/marketplace.lua:1007
---@param open boolean Whether the menu is open.
function career_modules_marketplace.menuOpened(open) end

--- Hook: loads marketplace.json if the career is active (returns false otherwise).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/marketplace.lua:1024
function career_modules_marketplace.onExtensionLoaded() end

--- Save hook: writes listedVehicles to <save>/career/marketplace.json.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/marketplace.lua:1018
---@param currentSavePath string Save folder.
---@param vehiclesThumbnailUpdate integer[]|nil Not used.
function career_modules_marketplace.onSaveCurrentProfile(currentSavePath, vehiclesThumbnailUpdate) end

--- Frame hook: displays the debug window during negotiation (outside shipping) and, every 10 s of simulation, generates new offers and expires old ones.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/marketplace.lua:881
---@param dtReal number Real time (s).
---@param dtSim number Simulated time (s).
---@param dtRaw number Raw time (s).
function career_modules_marketplace.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook: removes the listing of a vehicle deleted from the inventory.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/marketplace.lua:931
---@param inventoryId integer Inventory id.
function career_modules_marketplace.onVehicleRemoved(inventoryId) end

--- Opens the vehicle shop in "marketplace" mode from the given computer.
---Source: lua/ge/extensions/career/modules/marketplace.lua:1014
---@param computerId string Computer id.
function career_modules_marketplace.openMenu(computerId) end

--- Removes the vehicle's listing.
---Source: lua/ge/extensions/career/modules/marketplace.lua:69
---@param inventoryId integer Inventory id.
function career_modules_marketplace.removeVehicleListing(inventoryId) end

--- Starts a negotiation where the player sells: initializes the buyer's personality, the quote, the prices (the player asks listing.value, the buyer offers offer.value), the history, and navigates to career.computer.vehicleShopping.negotiation.
---Source: lua/ge/extensions/career/modules/marketplace.lua:387
---@param inventoryId integer Inventory id of the vehicle for sale.
---@param offerId integer Id of the starting offer.
---@return any  Result of ui_router.navigate.
function career_modules_marketplace.startNegotiateBuyingOffer(inventoryId, offerId) end

--- Starts a negotiation where the player buys a vehicle from the shop. Refused (warning toast) if the vehicle is on promotion or non-negotiable. Initializes patience, starting price (discounted if discountPercentage) and navigates to the purchase screen.
---Source: lua/ge/extensions/career/modules/marketplace.lua:439
---@param _shopId string|integer Vehicle id in the shop (career_modules_vehicleShopping).
---@return any  Result of ui_router.navigate, or nil if refused.
function career_modules_marketplace.startNegotiateSellingOffer(_shopId) end

--- Accepts the opponent's offer. When selling: sets the offer value and sells the vehicle. When buying: sets the shop vehicle's price (originalSellValue if lowered) and blocks further negotiations.
---Source: lua/ge/extensions/career/modules/marketplace.lua:853
function career_modules_marketplace.takeTheirOffer() end

