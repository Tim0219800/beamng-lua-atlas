# `career_modules_delivery_cargoCards`

*File: `lua/ge/extensions/career/modules/delivery/cargoCards.lua` · VM: Game Engine (GE) · 588 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_delivery_cargoCards`: `extensions.load("career_modules_delivery_cargoCards")`, then the global `career_modules_delivery_cargoCards`

Helper for presenting the cargo screen (delivery): prepares for the UI the filters (parcel, vehicle, trailer, material, all, loaner), the groupings (by type, destination, player container, task) and the sorts of cargo/offer "cards". Called by career_modules_delivery_cargoScreen; does not modify the game, it annotates the card tables (groupTags, filterTags, sortValues).

## Notes

- The filters are built lazily (ensureFilterTags) with translated labels; onLanguageChanged resets them.
- Locking: the 'trailer' filter requires level 3 and 'material' level 5 of the 'logistics-delivery' branch.
- Each filter counts facilityCards and playerCards (reset to zero by resetFilterCounters, incremented by getCardGroupSetsByKey with usePlayerCards false).
- Probable bug: in getFilterSets, 'filter.order = i' uses an undefined variable i (the loop is 'for _, filter'), so order is nil.
- Inconsistency: in the 'distance' sort, the fallback test compares a.weight/b.weight instead of the distances; the comments say 'high to low' for rewardMoney and weight while the comparators sort in ascending order.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_delivery_cargoCards.addFilterPlayerData(filterSets, playerGroupSets, playerCargoContainers)` | Sets filter.noContainers for the 'parcel', 'material' and 'all' filters when the player has no suitable container (parcel, fluid, dryBulk). | 531 |
| `career_modules_delivery_cargoCards.addSortingValuesToGroups(cardsById, groupSets)` | Gives each group sortValues (cardId, rewardMoney, weight, distance) equal to the minimum of the values of its cards. | 473 |
| `career_modules_delivery_cargoCards.getCardGroupSetsByKey(cardsById, usePlayerCards, playerCargoContainers)` | Builds the grouping sets ('ungrouped', by cargo type, by destination, by player container/storage, by task): fills card.groupTags and card.filterTags for each card, creates the groups with their list of card ids and their filterTags, and updates the filter counters. | 84 |
| `career_modules_delivery_cargoCards.getCardSortingSetsByKey(cardsById)` | Computes sort ranks (card.sortValues) for cardId, rewardMoney, weight, distance and availablilty (order: limit, no more room, locked, tutorial, expired) and returns the description of the sorts. | 360 |
| `career_modules_delivery_cargoCards.getConfirmButtonFromPlayerCards(cardsById)` | Counts the items to confirm (player cards with transient moves or spawnWhenCommitingCargo; a non-material parcelGroup counts as #ids) for the UI confirmation button. | 556 |
| `career_modules_delivery_cargoCards.getFilterSets(cardsById)` | Returns the list of filters for the UI: hasAvailableOffers if cards exist, lockedInfo (minimum logistics-delivery level for 'trailer' and 'material') and order. | 489 |
| `career_modules_delivery_cargoCards.onCareerActivated()` | Hook: stores the delivery modules (parcelManager, cargoScreen, general, generator, progress, vehicleOfferManager, parcelMods, vehicleTasks, tutorial). *(internal)* *(hook)* | 8 |
| `career_modules_delivery_cargoCards.onLanguageChanged()` | Hook: clears the cached filters to regenerate the labels in the new language. *(internal)* *(hook)* | 575 |
| `career_modules_delivery_cargoCards.resetFilterCounters()` | Resets the facilityCards and playerCards counters of all filters to 0 and rebuilds their key index. | 70 |

### Parameter details

#### `career_modules_delivery_cargoCards.addFilterPlayerData(filterSets, playerGroupSets, playerCargoContainers)`

Sets filter.noContainers for the 'parcel', 'material' and 'all' filters when the player has no suitable container (parcel, fluid, dryBulk).

- `filterSets` (*table[]*) : Filters from getFilterSets.
- `playerGroupSets` (*table*) : Not used in the function.
- `playerCargoContainers` (*table[]*) : Player containers with cargoTypesLookup.

#### `career_modules_delivery_cargoCards.addSortingValuesToGroups(cardsById, groupSets)`

Gives each group sortValues (cardId, rewardMoney, weight, distance) equal to the minimum of the values of its cards.

- `cardsById` (*table<any, table>*) : Cards with sortValues.
- `groupSets` (*table<string, table>*) : Sets produced by getCardGroupSetsByKey.

#### `career_modules_delivery_cargoCards.getCardGroupSetsByKey(cardsById, usePlayerCards, playerCargoContainers)`

Builds the grouping sets ('ungrouped', by cargo type, by destination, by player container/storage, by task): fills card.groupTags and card.filterTags for each card, creates the groups with their list of card ids and their filterTags, and updates the filter counters.

- `cardsById` (*table<any, table>*) : Cards (parcelGroup, storage, vehicleOffer, loaner) keyed by id.
- `usePlayerCards` (*boolean*) : true: only process the player's cards; false: those of the facility.
- `playerCargoContainers` (*table[]|nil*) : Player containers (see career_modules_delivery_general.getNearbyVehicleCargoContainers), used for the container groups and total storage.
- **returns**: table<string, table> Grouping sets by key, each with key, label and groups.

#### `career_modules_delivery_cargoCards.getCardSortingSetsByKey(cardsById)`

Computes sort ranks (card.sortValues) for cardId, rewardMoney, weight, distance and availablilty (order: limit, no more room, locked, tutorial, expired) and returns the description of the sorts.

- `cardsById` (*table<any, table>*) : Cards to sort.
- **returns**: table<string, {label: string, key: string}> Available sorts by key.

#### `career_modules_delivery_cargoCards.getConfirmButtonFromPlayerCards(cardsById)`

Counts the items to confirm (player cards with transient moves or spawnWhenCommitingCargo; a non-material parcelGroup counts as #ids) for the UI confirmation button.

- `cardsById` (*table<any, table>*) : Cards.
- **returns**: {itemCount: integer} Number of items to confirm.

#### `career_modules_delivery_cargoCards.getFilterSets(cardsById)`

Returns the list of filters for the UI: hasAvailableOffers if cards exist, lockedInfo (minimum logistics-delivery level for 'trailer' and 'material') and order.

- `cardsById` (*table*) : Not used in the function.
- **returns**: table[] Filters.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/delivery/cargoCards.lua`.*
