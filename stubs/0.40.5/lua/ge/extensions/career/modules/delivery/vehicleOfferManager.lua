---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages vehicle and trailer delivery offers in career mode (the allOffers list): adding, lookup (by location, by facility, non-expired), vehicle category labels (junkerVeh, smallVeh, largeVeh, fleetVeh, exoticVeh, empty/loaded small, medium, large trailers) with their unlock flag, and spawning an offer vehicle in the world via a util_stepHandler sequence. Also used to build the label of a vehicle task for the UI.
--- Access: extension `career_modules_delivery_vehicleOfferManager`: `extensions.load("career_modules_delivery_vehicleOfferManager")`, then the global `career_modules_delivery_vehicleOfferManager`
---@class career_modules_delivery_vehicleOfferManager
---@field dependencies table<integer, string> Extensions loaded before: util_stepHandler.
career_modules_delivery_vehicleOfferManager = {}

--- Adds an offer to the global list.
---Source: lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:206
---@param offer table Offer (id, origin, offerExpiresAt, vehicle, task, rewards…).
function career_modules_delivery_vehicleOfferManager.addOffer(offer) end

--- Non-expired, non-spawned offers whose origin is the facility facId.
---Source: lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:250
---@param facId string Facility identifier.
---@param psPath string|nil Ignored.
---@return table  List of offers.
function career_modules_delivery_vehicleOfferManager.getAllOfferAtFacilityUnexpired(facId, psPath) end

--- Returns the offers for which filter(offer, ...) is true, after triggering the generators.
---Source: lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:222
---@param filter function function(offer, ...) -> boolean.
---@param ... any Extra arguments for filter.
---@return table  List of offers.
function career_modules_delivery_vehicleOfferManager.getAllOfferCustomFilter(filter, ...) end

--- Offers whose origin is the given location.
---Source: lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:233
---@param loc table Location.
---@return table  List of offers.
function career_modules_delivery_vehicleOfferManager.getAllOfferForLocation(loc) end

--- Non-expired offers not yet spawned (spawned false).
---Source: lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:237
---@return table  List of offers.
function career_modules_delivery_vehicleOfferManager.getAllOfferUnexpired() end

--- Returns the two modifiers displayed by default for a vehicle offer: 'route' (follow the route) and 'damage', with translated icon, label and description.
---Source: lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:141
---@return table  List of {type, icon, active, label, description}.
function career_modules_delivery_vehicleOfferManager.getDefaultVehicleModifiersForUI() end

--- Looks up an offer by id.
---Source: lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:268
---@param id integer Offer identifier.
---@return table|nil  Offer or nil.
function career_modules_delivery_vehicleOfferManager.getOfferById(id) end

--- Translated plural label of the category (or "noCategory" if unknown).
---Source: lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:135
---@param tag string Category.
---@return string  Label.
function career_modules_delivery_vehicleOfferManager.getVehicleTagLabelPlural(tag) end

--- Translated singular label of the category (or "noCategory" if unknown).
---Source: lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:130
---@param tag string Category.
---@return string  Label.
function career_modules_delivery_vehicleOfferManager.getVehicleTagLabelSingular(tag) end

--- Unlock state of all vehicle categories.
---Source: lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:121
---@return table<string, boolean>  tag -> unlocked.
function career_modules_delivery_vehicleOfferManager.getVehicleTagUnlockedSimple() end

--- Indicates whether the category's unlock flag is active in career_modules_unlockFlags. An unknown category is considered unlocked.
---Source: lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:110
---@param tag string Vehicle category (e.g. 'smallVeh', 'loadedLargeTrailers').
---@return boolean  true if unlocked.
---@return table|nil  Flag definition (absent for an unknown category).
function career_modules_delivery_vehicleOfferManager.isVehicleTagUnlocked(tag) end

--- Builds the translated label of an offer task: vehicleDropOff according to lookupType (repair, private home, return after repair, truck, default "bringTo"), trailerDropOff ("towTo"), or "dropOffAt" if the task has a destination; otherwise "unknown".
---Source: lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:21
---@param task table Offer task (type, lookupType, destination).
---@return string  Translated label.
function career_modules_delivery_vehicleOfferManager.makeTaskLabel(task) end

--- Hook called on career activation: stores the other delivery extensions and util_stepHandler.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:8
function career_modules_delivery_vehicleOfferManager.onCareerActivated() end

--- Tests the equality of two locations by comparing each key of a with that of b.
---Source: lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:214
---@param a table Reference location.
---@param b table Compared location.
---@return boolean  true if equal.
function career_modules_delivery_vehicleOfferManager.sameLocation(a, b) end

--- Compares an offer's origin with a location via sameLocation.
---Source: lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:210
---@param offer table Offer.
---@param otherLoc table Location.
---@return boolean  true if identical.
function career_modules_delivery_vehicleOfferManager.sameLocationOffer(offer, otherLoc) end

--- Spawns an offer's vehicle (see notes), registers it as a vehicle task and starts delivery mode. Logs an error and stops if the offer is not found.
---Source: lua/ge/extensions/career/modules/delivery/vehicleOfferManager.lua:277
---@param offerId integer Offer identifier.
---@param fadeToBlack boolean|nil Fade to black around the spawn; true by default.
---@param callback function|nil Called at the end of the step sequence.
function career_modules_delivery_vehicleOfferManager.spawnOffer(offerId, fadeToBlack, callback) end

