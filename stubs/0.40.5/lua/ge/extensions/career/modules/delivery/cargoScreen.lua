---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/cargoScreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Back end of the career "Cargo Overview" screen (delivery of parcels, materials, vehicles and trailers). It formats for the UI the cargo cards (grouped parcels, fluid/bulk storages, vehicle offers, loaned vehicles), sends everything via guihooks 'cargoDataForUiReady', handles loading/unloading through transient moves (moveCargoFromUi, moveMaterialFromUi then commit/cancel), opening/closing the screen with the big map, computing the best route (setBestRoute), and route previews and marker highlights.
--- Access: extension `career_modules_delivery_cargoScreen`: `extensions.load("career_modules_delivery_cargoScreen")`, then the global `career_modules_delivery_cargoScreen`
---@class career_modules_delivery_cargoScreen
---@field dependencies string[] {"core_vehicleBridge"}.
career_modules_delivery_cargoScreen = {}

--- Abandons an accepted offer: fires the onGameplayActivityAborted hook then gives back the delivery vehicle (vehicleTasks.giveBackDeliveryVehicle).
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:582
---@param vehId integer Object id of the delivery vehicle.
function career_modules_delivery_cargoScreen.abandonAcceptedOffer(vehId) end

--- Fires onGameplayActivityAborted then applies all transient moves (dParcelManager.applyTransientMoves).
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1484
function career_modules_delivery_cargoScreen.applyTransientMoves() end

--- Cancels the delivery being configured: clears the transient moves, the spawn markings of offers and loaned vehicles, refreshes the nearby containers and shows a message.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1673
function career_modules_delivery_cargoScreen.cancelDeliveryConfiguration() end

--- Pass-through to career_modules_delivery_parcelManager.clearTransientMoveForCargo.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:2006
---@param ... any Arguments passed on (cargo id).
function career_modules_delivery_cargoScreen.clearTransientMoveForCargo(...) end

--- Deletes the cargos in transient move coming from the given material storage of the open screen's facility ('delete' location) and cancels their move.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:740
---@param materialType string Material type of the storage.
function career_modules_delivery_cargoScreen.clearTransientMovesForStorage(materialType) end

--- Validates the configuration: applies the transient moves to the current facility, starts delivery mode if cargo is loaded or remaining, updates the container weights (freeze then loading delay with popup), then spawns the marked offers and the loaned vehicles.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1595
function career_modules_delivery_cargoScreen.commitDeliveryConfiguration() end

--- Pass-through to career_modules_delivery_progress.confirmDropOffData.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:2005
---@param ... any Arguments passed on.
function career_modules_delivery_cargoScreen.confirmDropOffData(...) end

--- Marker click callback: highlights the cards and, if automatic route is disabled, navigates to it (freeroam_bigMapMode.navigateToMission).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1860
---@param poiId string Marker id.
function career_modules_delivery_cargoScreen.deliveryMarkerSelected(poiId) end

--- External buttons of the screen: 'openDeliveryProgress' opens career.branchPage (logistics-delivery) and 'openVehicleDeliveryProgress' (logistics-vehicleDelivery).
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:951
---@param id string Button id.
function career_modules_delivery_cargoScreen.deliveryScreenExternalButtonPressed(id) end

--- Called by the UI when a drop-off popup closes: mode 'results' fires onDeliveryRewardsPopupClosed, mode 'cargoSelection' fires onDeliveryDropOffCargoSelectionPopupClosed.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:2008
---@param mode string 'results' or 'cargoSelection'.
function career_modules_delivery_cargoScreen.dropOffPopupClosed(mode) end

--- Opens the screen: stores facility/parking spot, triggers the tutorial generators if needed, clears the POIs, enters the big map with custom POIs, navigates to the UI route 'career.cargoOverview' and fires onEnterCargoOverviewScreen.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1511
---@param facilityId string|nil Facility id (nil for "my cargo").
---@param parkingSpotPath string|nil Parking spot path.
function career_modules_delivery_cargoScreen.enterCargoOverviewScreen(facilityId, parkingSpotPath) end

--- Opens the screen without a facility (enterCargoOverviewScreen()).
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1567
function career_modules_delivery_cargoScreen.enterMyCargo() end

--- Called when the screen closes: marks it closed, re-enables movement, clears the POIs, leaves the big map, resumes the simulation, schedules the weight update and checks for leaving delivery mode.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1583
---@param facilityId string|nil Not used.
---@param parkingSpotPath string|nil Not used.
function career_modules_delivery_cargoScreen.exitCargoOverviewScreen(facilityId, parkingSpotPath) end

--- Leaves delivery mode (with the onGameplayActivityAborted hook if it was active) via career_modules_delivery_general.exitDeliveryMode.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1994
function career_modules_delivery_cargoScreen.exitDeliveryMode() end

--- Formats an accepted vehicle/trailer offer for the UI: name, brand, mileage, destination, current task (get in the vehicle, hitch the trailer, drop off…), thumbnail, reward, route, modifiers, abandon information (penalty = reward × abandon factor).
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:521
---@param offer table Vehicle offer (fields vehicle, task, data, rewards).
---@return table  Offer-type card for the UI.
function career_modules_delivery_cargoScreen.formatAcceptedOfferForUI(offer) end

--- Formats a group of "identical" cargos (same name, destination…) into a single UI entry: ids, short/long names of origin/location/destination, type, slots, distance, reward, weight, remaining offer time, modifiers, navgraph route, possible target locations, etc.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:90
---@param group table[] Cargos of the group (sorted by id in the function).
---@param playerCargoContainers table[] Player containers (getNearbyVehicleCargoContainers).
---@param showFirstSeen boolean|nil Handles the indicator for the first appearance of cargos (inferred from code).
---@return table  Entry formatted for the UI.
function career_modules_delivery_cargoScreen.formatCargoGroup(group, playerCargoContainers, showFirstSeen) end

--- Returns the current tab ('' on opening).
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:70
---@return string  Current tab.
function career_modules_delivery_cargoScreen.getCargoScreenTab() end

--- Sends to the UI (guihooks 'sendHighlightedCardIds') the ids of the cards linked to the given big map marker; empty table if unknown.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1841
---@param poiId string|nil Marker/POI id.
function career_modules_delivery_cargoScreen.highlightCargoInPoi(poiId) end

--- Indicates whether the cargo screen is open.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:46
---@return boolean  true if open.
function career_modules_delivery_cargoScreen.isCargoScreenOpen() end

--- Moves a cargo to another location as a transient move (dParcelManager.addTransientMoveCargo); applied only at commit.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1468
---@param cargoId any Cargo id.
---@param targetLocation table Target location (facility, vehicle/container…).
function career_modules_delivery_cargoScreen.moveCargoFromUi(cargoId, targetLocation) end

--- Loads a material (fluid or bulk) from the facility's storage into the player's containers: with targetLocation.type 'auto', picks compatible containers (already filled with the same material first, then empty ones); with 'vehicle', the specified container. Fills until the volume is exhausted, logs a warning if any remains, then notifies the UI ('requestCargoDataSimple').
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:751
---@param materialType string Material type.
---@param cargoType string Cargo type ('fluid' or 'dryBulk').
---@param amount number Volume to load (liters/slots).
---@param targetLocation table {type='auto'} or {type='vehicle', vehId, containerId}.
function career_modules_delivery_cargoScreen.moveMaterialFromUi(materialType, cargoType, amount, targetLocation) end

--- Hook: when hovering a marker, highlights the list entries (if the screen is open).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1871
---@param poiId string|nil Hovered marker.
function career_modules_delivery_cargoScreen.onBigmapHoveredPoiIdChanged(poiId) end

--- Hook: stores the delivery modules (parcelManager, cargoScreen, general, generator, progress, vehicleOfferManager, parcelMods, vehicleTasks, tutorial) and util_stepHandler.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:11
function career_modules_delivery_cargoScreen.onCareerActivated() end

--- Hook: if the screen is open on the origin facility of the generated cargo, notifies the UI ('newCargoAvailable') only once.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1450
---@param cargo table Generated cargo (field origin).
function career_modules_delivery_cargoScreen.onCargoGenerated(cargo) end

--- UI route hook: when leaving the cargoOverview route (except to a child), cancels the unvalidated moves then closes the screen.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1687
---@param context any UI router context.
---@param toRoute table|nil Destination route (field name).
---@param fromRoute table|nil Route being left.
---@param data any Navigation data.
function career_modules_delivery_cargoScreen.onCargoOverviewRouteLeave(context, toRoute, fromRoute, data) end

--- Hook: recomputes the best route (nearest destination) if automatic route is enabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1816
function career_modules_delivery_cargoScreen.onCargoPickedUp() end

--- Hook: on leaving the big map, in delivery mode with automatic route, shows only the route to the first destination.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1824
function career_modules_delivery_cargoScreen.onDeactivateBigMapCallback() end

--- Hook: after the rewards popup, recomputes the route (if automaticRoute) and, after 0.5 s, shows the 'delivery/cargoDelivered' intro popups and the taxi tip if the player is on foot.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1795
function career_modules_delivery_cargoScreen.onDeliveryRewardsPopupClosed() end

--- Builds all the screen data (player, vehicles, containers, accepted offers, cards, filters, sorts, groupings, confirmation button, facility panels) then sends it to the UI via guihooks 'cargoDataForUiReady'.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1095
---@param facId string|nil Id of the facility concerned.
---@param psPath string|nil Path of the parking spot concerned.
---@param updateMaxTimeTimestamp boolean|nil If not false, resets the maximum offer display timestamp.
function career_modules_delivery_cargoScreen.requestCargoDataForUi(facId, psPath, updateMaxTimeTimestamp) end

--- Pass-through to career_modules_delivery_progress.requestDropOffData.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:2004
---@param ... any Arguments passed on.
function career_modules_delivery_cargoScreen.requestDropOffData(...) end

--- Computes and displays the best route: vehicle tasks first, otherwise a chain of destinations (nearest neighbor) of the cargos in vehicles; clears the path if there is nothing to target.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1731
---@param onlyClosestTarget boolean|nil If true, keeps only the nearest destination.
function career_modules_delivery_cargoScreen.setBestRoute(onlyClosestTarget) end

--- Enables/disables big map movement through the bigMapMoveForwardBackward/LeftRight actions (action filter) and resets the camera to 0 when disabled.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1571
---@param enabled boolean true to allow movement.
function career_modules_delivery_cargoScreen.setBigMapPanEnabled(enabled) end

--- On clicking a cargo, sets the big map navigation focus on its origin or destination.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1959
---@param cargoId any|nil Cargo id.
---@param origin boolean|nil If true, targets the origin rather than the destination.
function career_modules_delivery_cargoScreen.setCargoRoute(cargoId, origin) end

--- Stores the current tab and leaves visible on the big map only the markers linked to cards with this filterTag (or 'myCargo'); clears the POIs and resets the markers.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:47
---@param tab string Filter/tab key (e.g. 'parcel', 'vehicle', 'all').
function career_modules_delivery_cargoScreen.setCargoScreenTab(tab) end

--- Rebuilds the mapping big map marker -> cards (via card.bigMapIds); only these markers are relevant.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1974
function career_modules_delivery_cargoScreen.setVisibleIdsForBigMap() end

--- Shows the 'cargoContainerHowTo' help popup.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:2000
function career_modules_delivery_cargoScreen.showCargoContainerHelpPopup() end

--- Route preview of a cargo (origin/location to destination, or several destinations).
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1902
---@param cargoId any|nil Cargo id; nil clears the preview.
function career_modules_delivery_cargoScreen.showCargoRoutePreview(cargoId) end

--- Route preview from the screen's parking spot to the given facility (pickup point if asProvider, otherwise drop-off).
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1944
---@param locationId string|nil Facility id; nil clears the preview.
---@param asProvider boolean|nil Use the first pickUpSpot instead of the first dropOffSpot.
function career_modules_delivery_cargoScreen.showLocationRoutePreview(locationId, asProvider) end

--- Shows on the big map a multi-point route preview (type 'navgraph', via gameplay/route/route) or clears it if the route is nil/invalid.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1878
---@param route table|nil {type='navgraph', locations={...}}.
function career_modules_delivery_cargoScreen.showRoutePreview(route) end

--- Route preview between the two locations of a vehicle offer.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1929
---@param offerId any|nil Offer id; nil clears the preview.
function career_modules_delivery_cargoScreen.showVehicleOfferRoutePreview(offerId) end

--- Pass-through to career_modules_delivery_vehicleOfferManager.spawnOffer.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1491
---@param ... any Arguments passed as is.
---@return any  Value returned by spawnOffer.
function career_modules_delivery_cargoScreen.spawnOffer(...) end

--- Toggles an offer's spawnWhenCommitingCargo flag (spawn when the configuration is committed).
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1493
---@param offerId any Offer id.
function career_modules_delivery_cargoScreen.toggleOfferForSpawning(offerId) end

--- Empty body in this version: does nothing.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:364
---@param ids any Not used.
function career_modules_delivery_cargoScreen.tryLoadAll(ids) end

--- Pass-through to career_modules_delivery_progress.unloadCargoPopupClosed.
---Source: lua/ge/extensions/career/modules/delivery/cargoScreen.lua:2003
function career_modules_delivery_cargoScreen.unloadCargoPopupClosed() end

