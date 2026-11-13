---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/cargoScreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_delivery_cargoScreen` : `extensions.load("career_modules_delivery_cargoScreen")`, puis la globale `career_modules_delivery_cargoScreen`
---@class career_modules_delivery_cargoScreen
---@field dependencies table
career_modules_delivery_cargoScreen = {}

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:582
---@param vehId any
function career_modules_delivery_cargoScreen.abandonAcceptedOffer(vehId) end

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1484
function career_modules_delivery_cargoScreen.applyTransientMoves() end

--- call this function to cancel the delivery - all cargo will be placed back.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1673
function career_modules_delivery_cargoScreen.cancelDeliveryConfiguration() end

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:2006
---@param ... any
function career_modules_delivery_cargoScreen.clearTransientMoveForCargo(...) end

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:740
---@param materialType any
function career_modules_delivery_cargoScreen.clearTransientMovesForStorage(materialType) end

--- call this function to commit the configuration and clear all transient flags.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1595
function career_modules_delivery_cargoScreen.commitDeliveryConfiguration() end

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:2005
---@param ... any
function career_modules_delivery_cargoScreen.confirmDropOffData(...) end

--- when a marker is clicked, set route there
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1860
---@param poiId any
function career_modules_delivery_cargoScreen.deliveryMarkerSelected(poiId) end

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:951
---@param id any
function career_modules_delivery_cargoScreen.deliveryScreenExternalButtonPressed(id) end

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:2008
---@param mode any
function career_modules_delivery_cargoScreen.dropOffPopupClosed(mode) end

--- called by activity accept or from the career menu to enter the cargo screen.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1511
---@param facilityId any
---@param parkingSpotPath any
function career_modules_delivery_cargoScreen.enterCargoOverviewScreen(facilityId, parkingSpotPath) end

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1567
function career_modules_delivery_cargoScreen.enterMyCargo() end

--- called whenever the cargo screen is closed for any reason.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1583
---@param facilityId any
---@param parkingSpotPath any
function career_modules_delivery_cargoScreen.exitCargoOverviewScreen(facilityId, parkingSpotPath) end

--- other/utility functions
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1994
function career_modules_delivery_cargoScreen.exitDeliveryMode() end

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:521
---@param offer any
function career_modules_delivery_cargoScreen.formatAcceptedOfferForUI(offer) end

--- formats a group of "identical" cargo (ie same name, destination, etc)
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:90
---@param group any
---@param playerCargoContainers any
---@param showFirstSeen any
function career_modules_delivery_cargoScreen.formatCargoGroup(group, playerCargoContainers, showFirstSeen) end

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:70
function career_modules_delivery_cargoScreen.getCargoScreenTab() end

--- highlight entries in list
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1841
---@param poiId any
function career_modules_delivery_cargoScreen.highlightCargoInPoi(poiId) end

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:46
function career_modules_delivery_cargoScreen.isCargoScreenOpen() end

--- call this function to move the cargo to a different location. if moved to the player, a transient flag will be added. if moved back to facility, transient flag will be removed.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1468
---@param cargoId any
---@param targetLocation any
function career_modules_delivery_cargoScreen.moveCargoFromUi(cargoId, targetLocation) end

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:751
---@param materialType any
---@param cargoType any
---@param amount any
---@param targetLocation any
function career_modules_delivery_cargoScreen.moveMaterialFromUi(materialType, cargoType, amount, targetLocation) end

--- when a marker is hovered, highlight entries in list
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1871
---@param poiId any
function career_modules_delivery_cargoScreen.onBigmapHoveredPoiIdChanged(poiId) end

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:11
function career_modules_delivery_cargoScreen.onCareerActivated() end

--- update for the screen
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1450
---@param cargo any
function career_modules_delivery_cargoScreen.onCargoGenerated(cargo) end

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1687
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function career_modules_delivery_cargoScreen.onCargoOverviewRouteLeave(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1816
function career_modules_delivery_cargoScreen.onCargoPickedUp() end

--- Show only the route up until the first destination in gameplay
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1824
function career_modules_delivery_cargoScreen.onDeactivateBigMapCallback() end

--- recalculate route after closing the popup with the rewards
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1795
function career_modules_delivery_cargoScreen.onDeliveryRewardsPopupClosed() end

--- gets all offers and player cargo, depending on supplied facId and psPath.
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1095
---@param facId any
---@param psPath any
---@param updateMaxTimeTimestamp any
function career_modules_delivery_cargoScreen.requestCargoDataForUi(facId, psPath, updateMaxTimeTimestamp) end

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:2004
---@param ... any
function career_modules_delivery_cargoScreen.requestDropOffData(...) end

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1731
---@param onlyClosestTarget any
function career_modules_delivery_cargoScreen.setBestRoute(onlyClosestTarget) end

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1571
---@param enabled any
function career_modules_delivery_cargoScreen.setBigMapPanEnabled(enabled) end

--- when a cargo list element ist clicked, set the bigMap route there
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1959
---@param cargoId any
---@param origin any
function career_modules_delivery_cargoScreen.setCargoRoute(cargoId, origin) end

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:47
---@param tab any
function career_modules_delivery_cargoScreen.setCargoScreenTab(tab) end

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1974
function career_modules_delivery_cargoScreen.setVisibleIdsForBigMap() end

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:2000
function career_modules_delivery_cargoScreen.showCargoContainerHelpPopup() end

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1902
---@param cargoId any
function career_modules_delivery_cargoScreen.showCargoRoutePreview(cargoId) end

--- when a parcel list entry is hovered, preview the route on bigMap
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1944
---@param locationId any
---@param asProvider any
function career_modules_delivery_cargoScreen.showLocationRoutePreview(locationId, asProvider) end

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1878
---@param route any
function career_modules_delivery_cargoScreen.showRoutePreview(route) end

--- when a vehicle offer list entry is hovered, preview route on bigMap
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1929
---@param offerId any
function career_modules_delivery_cargoScreen.showVehicleOfferRoutePreview(offerId) end

--- offer spawning is handled in vehOffermanager
---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1491
---@param ... any
function career_modules_delivery_cargoScreen.spawnOffer(...) end

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:1493
---@param offerId any
function career_modules_delivery_cargoScreen.toggleOfferForSpawning(offerId) end

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:364
---@param ids any
function career_modules_delivery_cargoScreen.tryLoadAll(ids) end

---Source : lua/ge/extensions/career/modules/delivery/cargoScreen.lua:2003
function career_modules_delivery_cargoScreen.unloadCargoPopupClosed() end

