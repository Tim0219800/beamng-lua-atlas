---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/loanerVehicles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vehicles loaned (loaners) by the career delivery organizations. It builds the offers displayed in the UI (formatLoanerOfferForUi), handles the selection then the spawning of loaned vehicles via a util_stepHandler sequence (fade, spawn, placement on a parking spot, adding to the inventory with owned = false, fade back in), returning the vehicles and a monitoring: a "work" vehicle left more than 100 m away for 300 s is returned automatically.
--- Access: extension `career_modules_loanerVehicles`: `extensions.load("career_modules_loanerVehicles")`, then the global `career_modules_loanerVehicles`
---@class career_modules_loanerVehicles
---@field dependencies table<integer, string> Extensions loaded before: util_stepHandler.
---@field spawnAndLoanVehicle nil Always nil: variable that does not exist in the file (bug).
career_modules_loanerVehicles = {}

--- Prepares for the UI a facility's loan offers: availability (enabled), reason for unavailability, unlock info, mileage, capacity, thumbnail.
---Source: lua/ge/extensions/career/modules/loanerVehicles.lua:288
---@param facility table Delivery facility (associatedOrganization, loanerTrailerSpots, loanerNonTrailerSpots, id).
---@return table[]|nil  Offers, nil if the organization is unknown.
function career_modules_loanerVehicles.formatLoanerOfferForUi(facility) end

--- Prepares for the UI the list of loaners already in the inventory: organization share (loanerCut), name, mileage, vehicle/trailer type, fluid capacity.
---Source: lua/ge/extensions/career/modules/loanerVehicles.lua:254
---@return table[]  UI entries (isSpawnedLoaner = true).
function career_modules_loanerVehicles.formatSpawnedLoanersForUi() end

--- Lists (deep copies with thumbnail) the inventory vehicles loaned by the given organization.
---Source: lua/ge/extensions/career/modules/loanerVehicles.lua:139
---@param organizationId string Organization id.
---@return table[]  Vehicle info.
function career_modules_loanerVehicles.getLoanedVehiclesByOrg(organizationId) end

--- Returns the organizations that own the vehicle and, if it is coupled, the non-trailer towing vehicle.
---Source: lua/ge/extensions/career/modules/loanerVehicles.lua:210
---@param vehId integer Vehicle object id.
---@return table<string, boolean>  Set of organization ids.
function career_modules_loanerVehicles.getLoaningOrgsOfVehicle(vehId) end

--- Toggles the selection of an offer: adds it to the list of loaners to spawn, or removes it if it was already there.
---Source: lua/ge/extensions/career/modules/loanerVehicles.lua:18
---@param offer table Offer (id, model, config, sourceFacility, loanType, vehMileage).
function career_modules_loanerVehicles.markForSpawning(offer) end

--- Frame hook: monitors work vehicles moving away (warning, then automatic return after the delay).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/loanerVehicles.lua:151
---@param dtReal number Real time (s).
---@param dtSim number Simulation time (s).
---@param dtRaw number Raw time (s).
function career_modules_loanerVehicles.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook called when a vehicle is added to the inventory: unblocks the waiting step of the spawn sequence.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/loanerVehicles.lua:33
---@param id integer Vehicle id.
function career_modules_loanerVehicles.onVehicleAdded(id) end

--- Returns a loaned vehicle: updates the part conditions if it is present in the world, applies the reputation penalty if the work vehicle is damaged, then removes it from the inventory and calls callback.
---Source: lua/ge/extensions/career/modules/loanerVehicles.lua:114
---@param inventoryId integer Inventory id of the vehicle.
---@param callback function|nil Called once the vehicle is removed.
function career_modules_loanerVehicles.returnVehicle(inventoryId, callback) end

--- Spawns all the selected offers with a fade: spawn, initialization of the part conditions (mileage), placement on the best parking spot (trailers or not), adding to the inventory. Does nothing if nothing is selected.
---Source: lua/ge/extensions/career/modules/loanerVehicles.lua:37
function career_modules_loanerVehicles.spawnAllOffers() end

--- Empties the list of selected offers.
---Source: lua/ge/extensions/career/modules/loanerVehicles.lua:27
function career_modules_loanerVehicles.unmarkAllForSpawning() end

