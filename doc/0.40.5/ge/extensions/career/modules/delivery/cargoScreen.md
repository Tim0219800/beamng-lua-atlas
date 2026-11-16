# `career_modules_delivery_cargoScreen`

*File: `lua/ge/extensions/career/modules/delivery/cargoScreen.lua` · VM: Game Engine (GE) · 2017 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_delivery_cargoScreen`: `extensions.load("career_modules_delivery_cargoScreen")`, then the global `career_modules_delivery_cargoScreen`

Back end of the career "Cargo Overview" screen (delivery of parcels, materials, vehicles and trailers). It formats for the UI the cargo cards (grouped parcels, fluid/bulk storages, vehicle offers, loaned vehicles), sends everything via guihooks 'cargoDataForUiReady', handles loading/unloading through transient moves (moveCargoFromUi, moveMaterialFromUi then commit/cancel), opening/closing the screen with the big map, computing the best route (setBestRoute), and route previews and marker highlights.

## Example

```lua
-- open the player's cargo screen (outside a facility)
career_modules_delivery_cargoScreen.enterMyCargo()
```

## Notes

- Depends on core_vehicleBridge; the other delivery modules are referenced in onCareerActivated.
- Cards are stored in a local table cardsById with prefixed ids: 'F-' (facility) or 'P-' (player) then 'pg-' (parcelGroup), 'st-' (storage), 'vo-' (vehicleOffer) or 'lo-' (loaner).
- requestCargoDataForUi is asynchronous (goes through getNearbyVehicleCargoContainers) and replies with guihooks.trigger('cargoDataForUiReady', uiData); cargo updates trigger 'newCargoAvailable' (only once per opening).
- A cargo move is first 'transient': it is only applied at commitDeliveryConfiguration; cancelDeliveryConfiguration (or leaving the UI route) cancels it.
- commitDeliveryConfiguration starts delivery mode if needed, updates the container weights, then spawns the marked vehicle offers and the loaned vehicles.
- Probable bug: in commitDeliveryConfiguration, step.startStepSequence(sequence, callback) uses 'callback', an undefined variable (nil); a debug print(data) is also left in there.
- setBestRoute: greedy nearest neighbor over the destinations (distances via gameplay/route/route and dGenerator.getDistanceBetweenFacilities); if there are vehicle tasks, delegates to vehicleTasks.navigateToNextTask. The target.type == 'multi' case is not handled (empty block).
- setCargoScreenTab(tab) filters the big map markers according to the cards' filterTags (or 'myCargo').
- Several functions are only pass-throughs to other modules: spawnOffer, requestDropOffData, confirmDropOffData, unloadCargoPopupClosed, clearTransientMoveForCargo.

**Dependencies (loaded first):** `core_vehicleBridge`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_delivery_cargoScreen.abandonAcceptedOffer(vehId)` | Abandons an accepted offer: fires the onGameplayActivityAborted hook then gives back the delivery vehicle (vehicleTasks.giveBackDeliveryVehicle). | 582 |
| `career_modules_delivery_cargoScreen.applyTransientMoves()` | Fires onGameplayActivityAborted then applies all transient moves (dParcelManager.applyTransientMoves). | 1484 |
| `career_modules_delivery_cargoScreen.cancelDeliveryConfiguration()` | Cancels the delivery being configured: clears the transient moves, the spawn markings of offers and loaned vehicles, refreshes the nearby containers and shows a message. | 1673 |
| `career_modules_delivery_cargoScreen.clearTransientMoveForCargo(...)` | Pass-through to career_modules_delivery_parcelManager.clearTransientMoveForCargo. | 2006 |
| `career_modules_delivery_cargoScreen.clearTransientMovesForStorage(materialType)` | Deletes the cargos in transient move coming from the given material storage of the open screen's facility ('delete' location) and cancels their move. | 740 |
| `career_modules_delivery_cargoScreen.commitDeliveryConfiguration()` | Validates the configuration: applies the transient moves to the current facility, starts delivery mode if cargo is loaded or remaining, updates the container weights (freeze then loading delay with popup), then spawns the marked offers and the loaned vehicles. | 1595 |
| `career_modules_delivery_cargoScreen.confirmDropOffData(...)` | Pass-through to career_modules_delivery_progress.confirmDropOffData. | 2005 |
| `career_modules_delivery_cargoScreen.deliveryMarkerSelected(poiId)` | Marker click callback: highlights the cards and, if automatic route is disabled, navigates to it (freeroam_bigMapMode.navigateToMission). *(internal)* | 1860 |
| `career_modules_delivery_cargoScreen.deliveryScreenExternalButtonPressed(id)` | External buttons of the screen: 'openDeliveryProgress' opens career.branchPage (logistics-delivery) and 'openVehicleDeliveryProgress' (logistics-vehicleDelivery). | 951 |
| `career_modules_delivery_cargoScreen.dropOffPopupClosed(mode)` | Called by the UI when a drop-off popup closes: mode 'results' fires onDeliveryRewardsPopupClosed, mode 'cargoSelection' fires onDeliveryDropOffCargoSelectionPopupClosed. | 2008 |
| `career_modules_delivery_cargoScreen.enterCargoOverviewScreen(facilityId, parkingSpotPath)` | Opens the screen: stores facility/parking spot, triggers the tutorial generators if needed, clears the POIs, enters the big map with custom POIs, navigates to the UI route 'career.cargoOverview' and fires onEnterCargoOverviewScreen. | 1511 |
| `career_modules_delivery_cargoScreen.enterMyCargo()` | Opens the screen without a facility (enterCargoOverviewScreen()). | 1567 |
| `career_modules_delivery_cargoScreen.exitCargoOverviewScreen(facilityId, parkingSpotPath)` | Called when the screen closes: marks it closed, re-enables movement, clears the POIs, leaves the big map, resumes the simulation, schedules the weight update and checks for leaving delivery mode. | 1583 |
| `career_modules_delivery_cargoScreen.exitDeliveryMode()` | Leaves delivery mode (with the onGameplayActivityAborted hook if it was active) via career_modules_delivery_general.exitDeliveryMode. | 1994 |
| `career_modules_delivery_cargoScreen.formatAcceptedOfferForUI(offer)` | Formats an accepted vehicle/trailer offer for the UI: name, brand, mileage, destination, current task (get in the vehicle, hitch the trailer, drop off…), thumbnail, reward, route, modifiers, abandon information (penalty = reward × abandon factor). | 521 |
| `career_modules_delivery_cargoScreen.formatCargoGroup(group, playerCargoContainers, showFirstSeen)` | Formats a group of "identical" cargos (same name, destination…) into a single UI entry: ids, short/long names of origin/location/destination, type, slots, distance, reward, weight, remaining offer time, modifiers, navgraph route, possible target locations, etc. | 90 |
| `career_modules_delivery_cargoScreen.getCargoScreenTab()` | Returns the current tab ('' on opening). | 70 |
| `career_modules_delivery_cargoScreen.highlightCargoInPoi(poiId)` | Sends to the UI (guihooks 'sendHighlightedCardIds') the ids of the cards linked to the given big map marker; empty table if unknown. | 1841 |
| `career_modules_delivery_cargoScreen.isCargoScreenOpen()` | Indicates whether the cargo screen is open. | 46 |
| `career_modules_delivery_cargoScreen.moveCargoFromUi(cargoId, targetLocation)` | Moves a cargo to another location as a transient move (dParcelManager.addTransientMoveCargo); applied only at commit. | 1468 |
| `career_modules_delivery_cargoScreen.moveMaterialFromUi(materialType, cargoType, amount, targetLocation)` | Loads a material (fluid or bulk) from the facility's storage into the player's containers: with targetLocation.type 'auto', picks compatible containers (already filled with the same material first, then empty ones); with 'vehicle', the specified container. Fills until the volume is exhausted, logs a warning if any remains, then notifies the UI ('requestCargoDataSimple'). | 751 |
| `career_modules_delivery_cargoScreen.onBigmapHoveredPoiIdChanged(poiId)` | Hook: when hovering a marker, highlights the list entries (if the screen is open). *(internal)* *(hook)* | 1871 |
| `career_modules_delivery_cargoScreen.onCareerActivated()` | Hook: stores the delivery modules (parcelManager, cargoScreen, general, generator, progress, vehicleOfferManager, parcelMods, vehicleTasks, tutorial) and util_stepHandler. *(internal)* *(hook)* | 11 |
| `career_modules_delivery_cargoScreen.onCargoGenerated(cargo)` | Hook: if the screen is open on the origin facility of the generated cargo, notifies the UI ('newCargoAvailable') only once. *(internal)* *(hook)* | 1450 |
| `career_modules_delivery_cargoScreen.onCargoOverviewRouteLeave(context, toRoute, fromRoute, data)` | UI route hook: when leaving the cargoOverview route (except to a child), cancels the unvalidated moves then closes the screen. *(internal)* *(hook)* | 1687 |
| `career_modules_delivery_cargoScreen.onCargoPickedUp()` | Hook: recomputes the best route (nearest destination) if automatic route is enabled. *(internal)* *(hook)* | 1816 |
| `career_modules_delivery_cargoScreen.onDeactivateBigMapCallback()` | Hook: on leaving the big map, in delivery mode with automatic route, shows only the route to the first destination. *(internal)* *(hook)* | 1824 |
| `career_modules_delivery_cargoScreen.onDeliveryRewardsPopupClosed()` | Hook: after the rewards popup, recomputes the route (if automaticRoute) and, after 0.5 s, shows the 'delivery/cargoDelivered' intro popups and the taxi tip if the player is on foot. *(internal)* *(hook)* | 1795 |
| `career_modules_delivery_cargoScreen.requestCargoDataForUi(facId, psPath, updateMaxTimeTimestamp)` | Builds all the screen data (player, vehicles, containers, accepted offers, cards, filters, sorts, groupings, confirmation button, facility panels) then sends it to the UI via guihooks 'cargoDataForUiReady'. | 1095 |
| `career_modules_delivery_cargoScreen.requestDropOffData(...)` | Pass-through to career_modules_delivery_progress.requestDropOffData. | 2004 |
| `career_modules_delivery_cargoScreen.setBestRoute(onlyClosestTarget)` | Computes and displays the best route: vehicle tasks first, otherwise a chain of destinations (nearest neighbor) of the cargos in vehicles; clears the path if there is nothing to target. | 1731 |
| `career_modules_delivery_cargoScreen.setBigMapPanEnabled(enabled)` | Enables/disables big map movement through the bigMapMoveForwardBackward/LeftRight actions (action filter) and resets the camera to 0 when disabled. | 1571 |
| `career_modules_delivery_cargoScreen.setCargoRoute(cargoId, origin)` | On clicking a cargo, sets the big map navigation focus on its origin or destination. | 1959 |
| `career_modules_delivery_cargoScreen.setCargoScreenTab(tab)` | Stores the current tab and leaves visible on the big map only the markers linked to cards with this filterTag (or 'myCargo'); clears the POIs and resets the markers. | 47 |
| `career_modules_delivery_cargoScreen.setVisibleIdsForBigMap()` | Rebuilds the mapping big map marker -> cards (via card.bigMapIds); only these markers are relevant. | 1974 |
| `career_modules_delivery_cargoScreen.showCargoContainerHelpPopup()` | Shows the 'cargoContainerHowTo' help popup. | 2000 |
| `career_modules_delivery_cargoScreen.showCargoRoutePreview(cargoId)` | Route preview of a cargo (origin/location to destination, or several destinations). | 1902 |
| `career_modules_delivery_cargoScreen.showLocationRoutePreview(locationId, asProvider)` | Route preview from the screen's parking spot to the given facility (pickup point if asProvider, otherwise drop-off). | 1944 |
| `career_modules_delivery_cargoScreen.showRoutePreview(route)` | Shows on the big map a multi-point route preview (type 'navgraph', via gameplay/route/route) or clears it if the route is nil/invalid. | 1878 |
| `career_modules_delivery_cargoScreen.showVehicleOfferRoutePreview(offerId)` | Route preview between the two locations of a vehicle offer. | 1929 |
| `career_modules_delivery_cargoScreen.spawnOffer(...)` | Pass-through to career_modules_delivery_vehicleOfferManager.spawnOffer. | 1491 |
| `career_modules_delivery_cargoScreen.toggleOfferForSpawning(offerId)` | Toggles an offer's spawnWhenCommitingCargo flag (spawn when the configuration is committed). | 1493 |
| `career_modules_delivery_cargoScreen.tryLoadAll(ids)` | Empty body in this version: does nothing. | 364 |
| `career_modules_delivery_cargoScreen.unloadCargoPopupClosed()` | Pass-through to career_modules_delivery_progress.unloadCargoPopupClosed. | 2003 |

### Parameter details

#### `career_modules_delivery_cargoScreen.abandonAcceptedOffer(vehId)`

Abandons an accepted offer: fires the onGameplayActivityAborted hook then gives back the delivery vehicle (vehicleTasks.giveBackDeliveryVehicle).

- `vehId` (*integer*) : Object id of the delivery vehicle.

#### `career_modules_delivery_cargoScreen.clearTransientMoveForCargo(...)`

Pass-through to career_modules_delivery_parcelManager.clearTransientMoveForCargo.

- `...` (*any*) : Arguments passed on (cargo id).

#### `career_modules_delivery_cargoScreen.clearTransientMovesForStorage(materialType)`

Deletes the cargos in transient move coming from the given material storage of the open screen's facility ('delete' location) and cancels their move.

- `materialType` (*string*) : Material type of the storage.

#### `career_modules_delivery_cargoScreen.confirmDropOffData(...)`

Pass-through to career_modules_delivery_progress.confirmDropOffData.

- `...` (*any*) : Arguments passed on.

#### `career_modules_delivery_cargoScreen.deliveryMarkerSelected(poiId)`

Marker click callback: highlights the cards and, if automatic route is disabled, navigates to it (freeroam_bigMapMode.navigateToMission).

- `poiId` (*string*) : Marker id.

#### `career_modules_delivery_cargoScreen.deliveryScreenExternalButtonPressed(id)`

External buttons of the screen: 'openDeliveryProgress' opens career.branchPage (logistics-delivery) and 'openVehicleDeliveryProgress' (logistics-vehicleDelivery).

- `id` (*string*) : Button id.

#### `career_modules_delivery_cargoScreen.dropOffPopupClosed(mode)`

Called by the UI when a drop-off popup closes: mode 'results' fires onDeliveryRewardsPopupClosed, mode 'cargoSelection' fires onDeliveryDropOffCargoSelectionPopupClosed.

- `mode` (*string*) : 'results' or 'cargoSelection'.

#### `career_modules_delivery_cargoScreen.enterCargoOverviewScreen(facilityId, parkingSpotPath)`

Opens the screen: stores facility/parking spot, triggers the tutorial generators if needed, clears the POIs, enters the big map with custom POIs, navigates to the UI route 'career.cargoOverview' and fires onEnterCargoOverviewScreen.

- `facilityId` (*string|nil*) : Facility id (nil for "my cargo").
- `parkingSpotPath` (*string|nil*) : Parking spot path.

#### `career_modules_delivery_cargoScreen.exitCargoOverviewScreen(facilityId, parkingSpotPath)`

Called when the screen closes: marks it closed, re-enables movement, clears the POIs, leaves the big map, resumes the simulation, schedules the weight update and checks for leaving delivery mode.

- `facilityId` (*string|nil*) : Not used.
- `parkingSpotPath` (*string|nil*) : Not used.

#### `career_modules_delivery_cargoScreen.formatAcceptedOfferForUI(offer)`

Formats an accepted vehicle/trailer offer for the UI: name, brand, mileage, destination, current task (get in the vehicle, hitch the trailer, drop off…), thumbnail, reward, route, modifiers, abandon information (penalty = reward × abandon factor).

- `offer` (*table*) : Vehicle offer (fields vehicle, task, data, rewards).
- **returns**: table Offer-type card for the UI.

#### `career_modules_delivery_cargoScreen.formatCargoGroup(group, playerCargoContainers, showFirstSeen)`

Formats a group of "identical" cargos (same name, destination…) into a single UI entry: ids, short/long names of origin/location/destination, type, slots, distance, reward, weight, remaining offer time, modifiers, navgraph route, possible target locations, etc.

- `group` (*table[]*) : Cargos of the group (sorted by id in the function).
- `playerCargoContainers` (*table[]*) : Player containers (getNearbyVehicleCargoContainers).
- `showFirstSeen` (*boolean|nil*) : Handles the indicator for the first appearance of cargos (inferred from code).
- **returns**: table Entry formatted for the UI.

#### `career_modules_delivery_cargoScreen.getCargoScreenTab()`

Returns the current tab ('' on opening).

- **returns**: string Current tab.

#### `career_modules_delivery_cargoScreen.highlightCargoInPoi(poiId)`

Sends to the UI (guihooks 'sendHighlightedCardIds') the ids of the cards linked to the given big map marker; empty table if unknown.

- `poiId` (*string|nil*) : Marker/POI id.

#### `career_modules_delivery_cargoScreen.isCargoScreenOpen()`

Indicates whether the cargo screen is open.

- **returns**: boolean true if open.

#### `career_modules_delivery_cargoScreen.moveCargoFromUi(cargoId, targetLocation)`

Moves a cargo to another location as a transient move (dParcelManager.addTransientMoveCargo); applied only at commit.

- `cargoId` (*any*) : Cargo id.
- `targetLocation` (*table*) : Target location (facility, vehicle/container…).

#### `career_modules_delivery_cargoScreen.moveMaterialFromUi(materialType, cargoType, amount, targetLocation)`

Loads a material (fluid or bulk) from the facility's storage into the player's containers: with targetLocation.type 'auto', picks compatible containers (already filled with the same material first, then empty ones); with 'vehicle', the specified container. Fills until the volume is exhausted, logs a warning if any remains, then notifies the UI ('requestCargoDataSimple').

- `materialType` (*string*) : Material type.
- `cargoType` (*string*) : Cargo type ('fluid' or 'dryBulk').
- `amount` (*number*) : Volume to load (liters/slots).
- `targetLocation` (*table*) : {type='auto'} or {type='vehicle', vehId, containerId}.

#### `career_modules_delivery_cargoScreen.onBigmapHoveredPoiIdChanged(poiId)`

Hook: when hovering a marker, highlights the list entries (if the screen is open).

- `poiId` (*string|nil*) : Hovered marker.

#### `career_modules_delivery_cargoScreen.onCargoGenerated(cargo)`

Hook: if the screen is open on the origin facility of the generated cargo, notifies the UI ('newCargoAvailable') only once.

- `cargo` (*table*) : Generated cargo (field origin).

#### `career_modules_delivery_cargoScreen.onCargoOverviewRouteLeave(context, toRoute, fromRoute, data)`

UI route hook: when leaving the cargoOverview route (except to a child), cancels the unvalidated moves then closes the screen.

- `context` (*any*) : UI router context.
- `toRoute` (*table|nil*) : Destination route (field name).
- `fromRoute` (*table|nil*) : Route being left.
- `data` (*any*) : Navigation data.

#### `career_modules_delivery_cargoScreen.requestCargoDataForUi(facId, psPath, updateMaxTimeTimestamp)`

Builds all the screen data (player, vehicles, containers, accepted offers, cards, filters, sorts, groupings, confirmation button, facility panels) then sends it to the UI via guihooks 'cargoDataForUiReady'.

- `facId` (*string|nil*) : Id of the facility concerned.
- `psPath` (*string|nil*) : Path of the parking spot concerned.
- `updateMaxTimeTimestamp` (*boolean|nil*) : If not false, resets the maximum offer display timestamp.

#### `career_modules_delivery_cargoScreen.requestDropOffData(...)`

Pass-through to career_modules_delivery_progress.requestDropOffData.

- `...` (*any*) : Arguments passed on.

#### `career_modules_delivery_cargoScreen.setBestRoute(onlyClosestTarget)`

Computes and displays the best route: vehicle tasks first, otherwise a chain of destinations (nearest neighbor) of the cargos in vehicles; clears the path if there is nothing to target.

- `onlyClosestTarget` (*boolean|nil*) : If true, keeps only the nearest destination.

#### `career_modules_delivery_cargoScreen.setBigMapPanEnabled(enabled)`

Enables/disables big map movement through the bigMapMoveForwardBackward/LeftRight actions (action filter) and resets the camera to 0 when disabled.

- `enabled` (*boolean*) : true to allow movement.

#### `career_modules_delivery_cargoScreen.setCargoRoute(cargoId, origin)`

On clicking a cargo, sets the big map navigation focus on its origin or destination.

- `cargoId` (*any|nil*) : Cargo id.
- `origin` (*boolean|nil*) : If true, targets the origin rather than the destination.

#### `career_modules_delivery_cargoScreen.setCargoScreenTab(tab)`

Stores the current tab and leaves visible on the big map only the markers linked to cards with this filterTag (or 'myCargo'); clears the POIs and resets the markers.

- `tab` (*string*) : Filter/tab key (e.g. 'parcel', 'vehicle', 'all').

#### `career_modules_delivery_cargoScreen.showCargoRoutePreview(cargoId)`

Route preview of a cargo (origin/location to destination, or several destinations).

- `cargoId` (*any|nil*) : Cargo id; nil clears the preview.

#### `career_modules_delivery_cargoScreen.showLocationRoutePreview(locationId, asProvider)`

Route preview from the screen's parking spot to the given facility (pickup point if asProvider, otherwise drop-off).

- `locationId` (*string|nil*) : Facility id; nil clears the preview.
- `asProvider` (*boolean|nil*) : Use the first pickUpSpot instead of the first dropOffSpot.

#### `career_modules_delivery_cargoScreen.showRoutePreview(route)`

Shows on the big map a multi-point route preview (type 'navgraph', via gameplay/route/route) or clears it if the route is nil/invalid.

- `route` (*table|nil*) : {type='navgraph', locations={...}}.

#### `career_modules_delivery_cargoScreen.showVehicleOfferRoutePreview(offerId)`

Route preview between the two locations of a vehicle offer.

- `offerId` (*any|nil*) : Offer id; nil clears the preview.

#### `career_modules_delivery_cargoScreen.spawnOffer(...)`

Pass-through to career_modules_delivery_vehicleOfferManager.spawnOffer.

- `...` (*any*) : Arguments passed as is.
- **returns**: any Value returned by spawnOffer.

#### `career_modules_delivery_cargoScreen.toggleOfferForSpawning(offerId)`

Toggles an offer's spawnWhenCommitingCargo flag (spawn when the configuration is committed).

- `offerId` (*any*) : Offer id.

#### `career_modules_delivery_cargoScreen.tryLoadAll(ids)`

Empty body in this version: does nothing.

- `ids` (*any*) : Not used.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"core_vehicleBridge"}. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onDeliveryDropOffCargoSelectionPopupClosed`
- `onDeliveryRewardsPopupClosed` — listened to by 1 module(s)
- `onEnterCargoOverviewScreen`
- `onGameplayActivityAborted`

**UI events (guihooks.trigger):** `OpenSimpleDelayPopup`, `cargoDataForUiReady`, `newCargoAvailable`, `requestCargoDataSimple`, `sendHighlightedCardIds`

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/delivery/cargoScreen.lua`.*
