---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/cargoCards.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Helper for presenting the cargo screen (delivery): prepares for the UI the filters (parcel, vehicle, trailer, material, all, loaner), the groupings (by type, destination, player container, task) and the sorts of cargo/offer "cards". Called by career_modules_delivery_cargoScreen; does not modify the game, it annotates the card tables (groupTags, filterTags, sortValues).
--- Access: extension `career_modules_delivery_cargoCards`: `extensions.load("career_modules_delivery_cargoCards")`, then the global `career_modules_delivery_cargoCards`
---@class career_modules_delivery_cargoCards
career_modules_delivery_cargoCards = {}

--- Sets filter.noContainers for the 'parcel', 'material' and 'all' filters when the player has no suitable container (parcel, fluid, dryBulk).
---Source: lua/ge/extensions/career/modules/delivery/cargoCards.lua:531
---@param filterSets table[] Filters from getFilterSets.
---@param playerGroupSets table Not used in the function.
---@param playerCargoContainers table[] Player containers with cargoTypesLookup.
function career_modules_delivery_cargoCards.addFilterPlayerData(filterSets, playerGroupSets, playerCargoContainers) end

--- Gives each group sortValues (cardId, rewardMoney, weight, distance) equal to the minimum of the values of its cards.
---Source: lua/ge/extensions/career/modules/delivery/cargoCards.lua:473
---@param cardsById table<any, table> Cards with sortValues.
---@param groupSets table<string, table> Sets produced by getCardGroupSetsByKey.
function career_modules_delivery_cargoCards.addSortingValuesToGroups(cardsById, groupSets) end

--- Builds the grouping sets ('ungrouped', by cargo type, by destination, by player container/storage, by task): fills card.groupTags and card.filterTags for each card, creates the groups with their list of card ids and their filterTags, and updates the filter counters.
---Source: lua/ge/extensions/career/modules/delivery/cargoCards.lua:84
---@param cardsById table<any, table> Cards (parcelGroup, storage, vehicleOffer, loaner) keyed by id.
---@param usePlayerCards boolean true: only process the player's cards; false: those of the facility.
---@param playerCargoContainers table[]|nil Player containers (see career_modules_delivery_general.getNearbyVehicleCargoContainers), used for the container groups and total storage.
---@return table<string, table>  Grouping sets by key, each with key, label and groups.
function career_modules_delivery_cargoCards.getCardGroupSetsByKey(cardsById, usePlayerCards, playerCargoContainers) end

--- Computes sort ranks (card.sortValues) for cardId, rewardMoney, weight, distance and availablilty (order: limit, no more room, locked, tutorial, expired) and returns the description of the sorts.
---Source: lua/ge/extensions/career/modules/delivery/cargoCards.lua:360
---@param cardsById table<any, table> Cards to sort.
---@return table<string, {label: string, key: string}>  Available sorts by key.
function career_modules_delivery_cargoCards.getCardSortingSetsByKey(cardsById) end

--- Counts the items to confirm (player cards with transient moves or spawnWhenCommitingCargo; a non-material parcelGroup counts as #ids) for the UI confirmation button.
---Source: lua/ge/extensions/career/modules/delivery/cargoCards.lua:556
---@param cardsById table<any, table> Cards.
---@return {itemCount: integer}  Number of items to confirm.
function career_modules_delivery_cargoCards.getConfirmButtonFromPlayerCards(cardsById) end

--- Returns the list of filters for the UI: hasAvailableOffers if cards exist, lockedInfo (minimum logistics-delivery level for 'trailer' and 'material') and order.
---Source: lua/ge/extensions/career/modules/delivery/cargoCards.lua:489
---@param cardsById table Not used in the function.
---@return table[]  Filters.
function career_modules_delivery_cargoCards.getFilterSets(cardsById) end

--- Hook: stores the delivery modules (parcelManager, cargoScreen, general, generator, progress, vehicleOfferManager, parcelMods, vehicleTasks, tutorial).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/cargoCards.lua:8
function career_modules_delivery_cargoCards.onCareerActivated() end

--- Hook: clears the cached filters to regenerate the labels in the new language.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/cargoCards.lua:575
function career_modules_delivery_cargoCards.onLanguageChanged() end

--- Resets the facilityCards and playerCards counters of all filters to 0 and rebuilds their key index.
---Source: lua/ge/extensions/career/modules/delivery/cargoCards.lua:70
function career_modules_delivery_cargoCards.resetFilterCounters() end

