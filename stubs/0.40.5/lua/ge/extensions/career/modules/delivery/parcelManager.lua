---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/parcelManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Central manager of the cargos (parcels and materials) of delivery in career mode. It holds the allCargo list (each cargo has an id, a location, an origin, a destination, slots, a weight, modifiers, rewards…), moves cargos between locations (facility, vehicle, player avatar), handles "transient moves" (transientMoves) that are then validated in bulk, provides lookup queries, computes rewards with a breakdown (lateness, loaner, branch level, parking precision), sends lateness messages and cleans up outdated cargos.
--- Access: extension `career_modules_delivery_parcelManager`: `extensions.load("career_modules_delivery_parcelManager")`, then the global `career_modules_delivery_parcelManager`
---@class career_modules_delivery_parcelManager
---@field addParcelRewards nil Exported but always nil (reference not defined in the file).
---@field dependencies table<integer, string> Extensions loaded before: freeroam_facilities.
career_modules_delivery_parcelManager = {}

--- Adds a cargo to the global list and emits the onCargoGenerated(cargo) hook unless silent.
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:40
---@param cargo table Complete cargo (id, location, origin, destination, slots…).
---@param silent boolean|nil true to not emit onCargoGenerated.
function career_modules_delivery_parcelManager.addCargo(cargo, silent) end

--- Computes originalRewards/breakdown/adjustedRewards of each cargo, groups by groupId and loading time, formats each group via cargoScreen.formatCargoGroup and sorts by smallest id.
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:578
---@param cargo table List of cargos at the same current location.
---@return table|nil  List of groups formatted for the UI (nil if the list is empty).
function career_modules_delivery_parcelManager.addParcelRewardsSummary(cargo) end

--- Records a pending move for the cargo (cargo._transientMove). Refused with a logged error if it already has one.
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:79
---@param cargoId integer Cargo identifier.
---@param targetLocation table Target location.
function career_modules_delivery_parcelManager.addTransientMoveCargo(cargoId, targetLocation) end

--- Applies the transient moves whose cargo is at the location currentLocation (or all if currentLocation is nil), updates the loaner organizations of the target vehicles, merges mergeable cargos of the same material at the same location, and keeps the other moves for later.
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:134
---@param currentLocation table|nil Current location; nil to apply everything.
---@return table  Cargos moved.
---@return table  Cargos whose move remains pending.
function career_modules_delivery_parcelManager.applyTransientMoves(currentLocation) end

--- Immediately moves the cargo to newLocation. Adjusts the facility's material stock (removes from the old location, adds to the new one), timestamps loadedAtTimeStamp on the first load into a vehicle, and sets cargo.data.delivered = true if the new location is the destination.
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:47
---@param cargoId integer Cargo identifier.
---@param newLocation table New location (an error is logged if nil or empty).
function career_modules_delivery_parcelManager.changeCargoLocation(cargoId, newLocation) end

--- Deletes the cargos with location 'delete' and those that stayed at their origin, expired for more than 120 s and without a transient move. Resets the cleanup timer to zero.
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:670
function career_modules_delivery_parcelManager.cleanUpCargo() end

--- Cancels all transient moves and resets the "unvalidated" flag to false.
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:125
function career_modules_delivery_parcelManager.clearAllTransientMoves() end

--- Obsolete: only logs a "no longer needed" error.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:210
function career_modules_delivery_parcelManager.clearTransientFlags() end

--- Cancels a cargo's transient move (no effect if none).
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:108
---@param cargoId integer Cargo identifier.
function career_modules_delivery_parcelManager.clearTransientMoveForCargo(cargoId) end

--- Non-expired cargos still at their origin, located in the facility facId.
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:341
---@param facId string Origin facility.
---@return table  List of cargos.
function career_modules_delivery_parcelManager.getAllCargoAtFacilityUnexpired(facId) end

--- Returns the cargos for which filter(cargo, ...) is true, after triggering all generators.
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:257
---@param filter function function(cargo, ...) -> boolean.
---@param ... any Extra arguments passed to filter.
---@return table  List of cargos.
function career_modules_delivery_parcelManager.getAllCargoCustomFilter(filter, ...) end

--- Non-expired cargos still at their origin and whose destination is the facility facId.
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:328
---@param facId string Destination facility.
---@return table  List of cargos.
function career_modules_delivery_parcelManager.getAllCargoForDestinationFacilityStillAtOriginUnexpired(facId) end

--- Same filter but over all the spots of a facility (facId).
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:312
---@param facId string Facility identifier.
---@param timeExpire number|nil Expiration threshold.
---@param timeGenerated number|nil Maximum generation timestamp.
---@return table  List of cargos.
function career_modules_delivery_parcelManager.getAllCargoForFacilityUnexpiredUndelivered(facId, timeExpire, timeGenerated) end

--- All the cargos currently at this location (triggers the generators if the location is a facility spot).
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:268
---@param loc table Location.
---@return table  List of cargos.
function career_modules_delivery_parcelManager.getAllCargoForLocation(loc) end

--- Like getAllCargoForLocation but only the cargos whose offer has not expired (offerExpiresAt > delivery time).
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:282
---@param loc table Location.
---@return table  List of cargos.
function career_modules_delivery_parcelManager.getAllCargoForLocationUnexpired(loc) end

--- Cargos at this location, not expired, not already at their destination and generated no later than timeGenerated.
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:296
---@param loc table Location.
---@param timeExpire number|nil Expiration threshold; default: current time.
---@param timeGenerated number|nil Maximum generation timestamp; default: infinity.
---@return table  List of cargos.
function career_modules_delivery_parcelManager.getAllCargoForLocationUnexpiredUndelivered(loc, timeExpire, timeGenerated) end

--- Cargos currently in a vehicle, and optionally those with a pending transient move.
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:354
---@param includeTransient boolean|nil Include the cargos with _transientMove.
---@return table  List of cargos.
function career_modules_delivery_parcelManager.getAllCargoInVehicles(includeTransient) end

--- Looks up a cargo by id.
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:423
---@param cargoId integer Identifier.
---@return table|nil  Cargo or nil.
function career_modules_delivery_parcelManager.getCargoById(cargoId) end

--- Long label: for a facility spot, "Facility - spot name" if the spot has a custom field name; otherwise same as the short label.
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:396
---@param loc table Location.
---@return string  Label.
function career_modules_delivery_parcelManager.getLocationLabelLong(loc) end

--- Short label of a location: translated facility name, "Current Vehicle (id)" / "Other Vehicle (id)", "Player Avatar", "N possible locations" (or the label of the single destination), "Unknown". The vehicle/avatar texts are not translated.
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:374
---@param loc table Location.
---@return string  Label.
function career_modules_delivery_parcelManager.getLocationLabelShort(loc) end

--- Computes the rewards of a delivered cargo with a breakdown: effect of the timed modifier (on time, delayed, late), share of the vehicle loaner organizations, multiplier of the logistics branch level, parking precision bonus or penalty. Can unlock the ON_SCHEDULE achievement.
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:436
---@param cargo table Cargo (rewards, modifiers, loadedAtTimeStamp, organization, destination, location…).
---@return table  originalRewards: copy of the base rewards.
---@return table  breakdown: list of items {label, rewards, simpleBreakdownType}.
---@return table  adjustedRewards: final rewards (base + sum of the items).
function career_modules_delivery_parcelManager.getRewardsWithBreakdown(cargo) end

--- Lists the cargos that have a pending transient move.
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:97
---@return table  List of cargos.
function career_modules_delivery_parcelManager.getTransientMoveCargo() end

--- Lists the cargos whose transient move targets the given location.
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:197
---@param targetLocation table Target location.
---@return table  List of cargos.
function career_modules_delivery_parcelManager.getTransientMovesForTargetLocationWithCargo(targetLocation) end

--- Indicates whether transient moves have been added but not yet applied.
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:95
---@return boolean  true if pending.
function career_modules_delivery_parcelManager.hasUncommittedTransientMoves() end

--- Hook called on career activation: stores the other delivery extensions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:14
function career_modules_delivery_parcelManager.onCareerActivated() end

--- Hook called when a trailer is coupled: recomputes the loaner organizations of the cargos located in vehicles.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:214
---@param objId1 integer First vehicle.
---@param objId2 integer Second vehicle.
function career_modules_delivery_parcelManager.onTrailerAttached(objId1, objId2) end

--- Per-frame hook: sends the "delayed" and "late" UI messages for timed cargos in vehicles, updates the tasklist every second, restarts the tasklist and the cleanup if locations changed, and cleans up every 10 s. Inactive outside delivery mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:652
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation time delta (s).
---@param dtRaw number Raw time delta (s).
function career_modules_delivery_parcelManager.onUpdate(dtReal, dtSim, dtRaw) end

--- Tests the equality of two locations by comparing each key of a with the same key of b (asymmetric comparison).
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:249
---@param a table Reference location.
---@param b table Compared location (must not be nil).
---@return boolean  true if all keys of a equal those of b.
function career_modules_delivery_parcelManager.sameLocation(a, b) end

--- Compares a cargo's current position with a location via sameLocation.
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:245
---@param cargo table Cargo.
---@param otherLoc table Location to compare.
---@return boolean  true if identical.
function career_modules_delivery_parcelManager.sameLocationCargo(cargo, otherLoc) end

--- Obsolete: only logs an error (cancellation code commented out, marked TODO).
---Source: lua/ge/extensions/career/modules/delivery/parcelManager.lua:223
function career_modules_delivery_parcelManager.undoTransientCargo() end

