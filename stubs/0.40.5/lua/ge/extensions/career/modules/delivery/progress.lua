---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/delivery/progress.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Progress tracking and drop-off screen of career delivery. Counts deliveries per type (parcel, vehicle, trailer, fluid, dryBulk) globally and per facility (deliveredFromHere / deliveredToHere), prepares the drop-off screen data (cargos of nearby vehicles, vehicle tasks), applies the confirmation (cargo moves, rewards, weight update, autosave) and sends the result to the UI. Also handles the visibility and unlocking of facilities and the progress sounds.
--- Access: extension `career_modules_delivery_progress`: `extensions.load("career_modules_delivery_progress")`, then the global `career_modules_delivery_progress`
---@class career_modules_delivery_progress
career_modules_delivery_progress = {}

--- Plays in a loop the 'money' or 'progressBar' progress sound (audio sources created on demand); with active=false, stops all these sounds.
---Source: lua/ge/extensions/career/modules/delivery/progress.lua:629
---@param soundLabel string 'money' or 'progressBar'.
---@param active boolean true to play, false to stop everything.
function career_modules_delivery_progress.activateSound(soundLabel, active) end

--- Was supposed to return the unlocks obtained since aggregateBefore; currently returns an empty table and forgets the stored state.
---Source: lua/ge/extensions/career/modules/delivery/progress.lua:107
---@return table  Empty table.
function career_modules_delivery_progress.aggregateAfter() end

--- Stores the level of each career branch before a delivery.
---Source: lua/ge/extensions/career/modules/delivery/progress.lua:98
function career_modules_delivery_progress.aggregateBefore() end

--- Finishes the drop-off when all vehicle tasks are finished and the weight update is done: sums the rewards, adds them to the player via career_modules_playerAttributes.addAttributes (tags gameplay, reward, delivery), prepares the branch/reputation info for the animation, sends 'SetDeliveryDropOffRewardResult', plays a sound, updates the statistics, leaves delivery mode if necessary and triggers an autosave if enabled.
---Source: lua/ge/extensions/career/modules/delivery/progress.lua:366
function career_modules_delivery_progress.confirmDropOffCheckComplete() end

--- Applies the confirmed drop-off: splits the material cargos if a partial quantity is chosen, moves the cargos to the spot, finalizes the material distances/rewards, computes the rewards, finishes the vehicle tasks, updates the container weights (vehicles frozen during the update) then moves on to confirmDropOffCheckComplete.
---Source: lua/ge/extensions/career/modules/delivery/progress.lua:300
---@param confirmedDropOffs table Table {confirmedCargoIds = {{id=, amount=?}}, confirmedOfferIds = {...}}.
---@param facId string Facility.
---@param psPath string Parking spot path.
function career_modules_delivery_progress.confirmDropOffData(confirmedDropOffs, facId, psPath) end

--- Counts the facilities with at least one delivery in the given direction.
---Source: lua/ge/extensions/career/modules/delivery/progress.lua:599
---@param direction string 'deliveredFromHere' or 'deliveredToHere' (key of facility.progress).
---@return integer  Number of facilities.
function career_modules_delivery_progress.getFacilityCountForCargoCount(direction) end

--- Returns the reward multiplier of the 'logistics' branch (parameters ignored).
---Source: lua/ge/extensions/career/modules/delivery/progress.lua:612
---@param skill string Ignored.
---@param tier integer Ignored.
---@return number  Multiplier.
function career_modules_delivery_progress.getMoneyMultiplerForSkill(skill, tier) end

--- Returns the global progress table (cargoDeliveredByType).
---Source: lua/ge/extensions/career/modules/delivery/progress.lua:37
---@return table  Progress.
function career_modules_delivery_progress.getProgress() end

--- Indicates whether the facility is unlocked ('minItemCount' condition on the number of items delivered here).
---Source: lua/ge/extensions/career/modules/delivery/progress.lua:550
---@param facId string Facility identifier.
---@return boolean  true if unlocked.
---@return table|nil  If locked: disabledReasonHeader, disabledReasonContent and a progress bar.
function career_modules_delivery_progress.isFacilityUnlocked(facId) end

--- Indicates whether the facility is visible: during the delivery tutorial only the isTutorialForCargoDelivery facilities are, then the visibleCondition 'minItemCount' condition is tested.
---Source: lua/ge/extensions/career/modules/delivery/progress.lua:574
---@param facId string Facility identifier.
---@param isCargoDeliveryTutorialActive boolean Delivery tutorial in progress.
---@return boolean  true if visible.
function career_modules_delivery_progress.isFacilityVisible(facId, isCargoDeliveryTutorialActive) end

--- Branch level reached hook: for the delivery skill beyond tier 1, unlocks the vehicleDelivery branch.
---Source: lua/ge/extensions/career/modules/delivery/progress.lua:617
---@param skill string Skill identifier.
---@param tier integer Tier reached.
function career_modules_delivery_progress.onBranchTierReached(skill, tier) end

--- Hook called on career activation: stores the delivery extensions used and util_stepHandler.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/delivery/progress.lua:7
function career_modules_delivery_progress.onCareerActivated() end

--- Internal hook called after the confirmed delivery of cargos: updates the global counters, the statistics of the origin and destination facilities (count per type and money sum), the modifier statistics, then emits onDeliveryFacilityProgressStatsChanged(affectedFacilities). For a material, the counted quantity is cargo.slots, otherwise 1.
---Source: lua/ge/extensions/career/modules/delivery/progress.lua:41
---@param cargoItems table|nil List of delivered cargos.
function career_modules_delivery_progress.onCargoDelivered(cargoItems) end

--- Same for completed vehicle/trailer deliveries (offers); emits onDeliveryFacilityProgressStatsChanged.
---Source: lua/ge/extensions/career/modules/delivery/progress.lua:77
---@param offers table|nil List of items {offer=...}.
function career_modules_delivery_progress.onVehicleTasksFinished(offers) end

--- Called when the data is gathered (and all vehicle tasks are finished): separates automatic and manual drop-offs (materials with a custom quantity). If there are materials to choose, opens the screen via guihooks 'SetDeliveryDropOffCargoSelection'; otherwise confirms everything directly.
---Source: lua/ge/extensions/career/modules/delivery/progress.lua:199
function career_modules_delivery_progress.openDropOffScreenGatheringComplete() end

--- Starts preparing the drop-off screen at a facility spot: requests the containers of nearby vehicles, keeps the cargos whose destination (or one of the possible destinations) is this spot, computes their rewards, adds the vehicle tasks to finish, then calls openDropOffScreenGatheringComplete.
---Source: lua/ge/extensions/career/modules/delivery/progress.lua:124
---@param facId string Facility identifier.
---@param psPath string Path of the drop-off parking spot.
function career_modules_delivery_progress.requestDropOffData(facId, psPath) end

--- Replaces the progress table (save loading), or resets it (cargoDeliveredByType to zero for parcel, vehicle, trailer, fluid, dryBulk) if data is nil.
---Source: lua/ge/extensions/career/modules/delivery/progress.lua:33
---@param data table|nil Saved progress.
function career_modules_delivery_progress.setProgress(data) end

--- Called by the UI when the unloading popup closes: plays a sound, shows the intro popups (cargoDelivered and any "<key>Unlocked") and forces the marker prompt to be re-evaluated.
---Source: lua/ge/extensions/career/modules/delivery/progress.lua:537
function career_modules_delivery_progress.unloadCargoPopupClosed() end

--- Obsolete: prints "No longer used!".
---Source: lua/ge/extensions/career/modules/delivery/progress.lua:193
---@param cargoId integer Unused.
---@param destination table Unused.
function career_modules_delivery_progress.unloadMaterialsManualStart(cargoId, destination) end

