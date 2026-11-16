# `career_modules_delivery_progress`

*File: `lua/ge/extensions/career/modules/delivery/progress.lua` · VM: Game Engine (GE) · 651 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_delivery_progress`: `extensions.load("career_modules_delivery_progress")`, then the global `career_modules_delivery_progress`

Progress tracking and drop-off screen of career delivery. Counts deliveries per type (parcel, vehicle, trailer, fluid, dryBulk) globally and per facility (deliveredFromHere / deliveredToHere), prepares the drop-off screen data (cargos of nearby vehicles, vehicle tasks), applies the confirmation (cargo moves, rewards, weight update, autosave) and sends the result to the UI. Also handles the visibility and unlocking of facilities and the progress sounds.

## Notes

- Drop-off flow: requestDropOffData -> (asynchronous, getNearbyVehicleCargoContainers) -> openDropOffScreenGatheringComplete -> either the material selection screen (SetDeliveryDropOffCargoSelection), or confirmDropOffData directly -> confirmDropOffCheckComplete -> SetDeliveryDropOffRewardResult.
- requestDropOffData and confirmDropOffData use local state variables (dropOffDataStatus, confirmedDropOffData): a second call while a first is in progress logs a warning; confirmDropOffData then aborts without doing anything.
- aggregateAfter is a skeleton: the unlock computation is commented out ("TODO: reimplement"); always returns an empty table.
- isFacilityVisible reads fac.unlockCondition.target in the visibleCondition 'minItemCount' branch (and not visibleCondition.target): crashes if unlockCondition is nil.
- isFacilityUnlocked only handles unlockCondition.type == 'minItemCount'; the 'branchLevel' type is empty, so unlocked by default. The reason texts are in English, not translated.
- getMoneyMultiplerForSkill ignores its parameters and returns the multiplier of the 'logistics' branch.
- unloadMaterialsManualStart is obsolete (prints "No longer used!").
- In confirmDropOffCheckComplete, the loop `for key, _ in ipairs(branchInfo)` runs over a table with string keys: it never executes (dead code for aggregateChange).
- onBranchTierReached is defined locally and exported at the end of the file: if skill == 'delivery' and tier > 1, unlocks the vehicleDelivery branch.
- onVehicleTasksFinished increments progress.cargoDeliveredByType[offer.data.type] with no default value: crashes if the type is not in the table (expected types: vehicle, trailer).

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_delivery_progress.activateSound(soundLabel, active)` | Plays in a loop the 'money' or 'progressBar' progress sound (audio sources created on demand); with active=false, stops all these sounds. | 629 |
| `career_modules_delivery_progress.aggregateAfter()` | Was supposed to return the unlocks obtained since aggregateBefore; currently returns an empty table and forgets the stored state. | 107 |
| `career_modules_delivery_progress.aggregateBefore()` | Stores the level of each career branch before a delivery. | 98 |
| `career_modules_delivery_progress.confirmDropOffCheckComplete()` | Finishes the drop-off when all vehicle tasks are finished and the weight update is done: sums the rewards, adds them to the player via career_modules_playerAttributes.addAttributes (tags gameplay, reward, delivery), prepares the branch/reputation info for the animation, sends 'SetDeliveryDropOffRewardResult', plays a sound, updates the statistics, leaves delivery mode if necessary and triggers an autosave if enabled. | 366 |
| `career_modules_delivery_progress.confirmDropOffData(confirmedDropOffs, facId, psPath)` | Applies the confirmed drop-off: splits the material cargos if a partial quantity is chosen, moves the cargos to the spot, finalizes the material distances/rewards, computes the rewards, finishes the vehicle tasks, updates the container weights (vehicles frozen during the update) then moves on to confirmDropOffCheckComplete. | 300 |
| `career_modules_delivery_progress.getFacilityCountForCargoCount(direction)` | Counts the facilities with at least one delivery in the given direction. | 599 |
| `career_modules_delivery_progress.getMoneyMultiplerForSkill(skill, tier)` | Returns the reward multiplier of the 'logistics' branch (parameters ignored). | 612 |
| `career_modules_delivery_progress.getProgress()` | Returns the global progress table (cargoDeliveredByType). | 37 |
| `career_modules_delivery_progress.isFacilityUnlocked(facId)` | Indicates whether the facility is unlocked ('minItemCount' condition on the number of items delivered here). | 550 |
| `career_modules_delivery_progress.isFacilityVisible(facId, isCargoDeliveryTutorialActive)` | Indicates whether the facility is visible: during the delivery tutorial only the isTutorialForCargoDelivery facilities are, then the visibleCondition 'minItemCount' condition is tested. | 574 |
| `career_modules_delivery_progress.onBranchTierReached(skill, tier)` | Branch level reached hook: for the delivery skill beyond tier 1, unlocks the vehicleDelivery branch. *(hook)* | 617 |
| `career_modules_delivery_progress.onCareerActivated()` | Hook called on career activation: stores the delivery extensions used and util_stepHandler. *(internal)* *(hook)* | 7 |
| `career_modules_delivery_progress.onCargoDelivered(cargoItems)` | Internal hook called after the confirmed delivery of cargos: updates the global counters, the statistics of the origin and destination facilities (count per type and money sum), the modifier statistics, then emits onDeliveryFacilityProgressStatsChanged(affectedFacilities). For a material, the counted quantity is cargo.slots, otherwise 1. *(hook)* | 41 |
| `career_modules_delivery_progress.onVehicleTasksFinished(offers)` | Same for completed vehicle/trailer deliveries (offers); emits onDeliveryFacilityProgressStatsChanged. *(hook)* | 77 |
| `career_modules_delivery_progress.openDropOffScreenGatheringComplete()` | Called when the data is gathered (and all vehicle tasks are finished): separates automatic and manual drop-offs (materials with a custom quantity). If there are materials to choose, opens the screen via guihooks 'SetDeliveryDropOffCargoSelection'; otherwise confirms everything directly. | 199 |
| `career_modules_delivery_progress.requestDropOffData(facId, psPath)` | Starts preparing the drop-off screen at a facility spot: requests the containers of nearby vehicles, keeps the cargos whose destination (or one of the possible destinations) is this spot, computes their rewards, adds the vehicle tasks to finish, then calls openDropOffScreenGatheringComplete. | 124 |
| `career_modules_delivery_progress.setProgress(data)` | Replaces the progress table (save loading), or resets it (cargoDeliveredByType to zero for parcel, vehicle, trailer, fluid, dryBulk) if data is nil. | 33 |
| `career_modules_delivery_progress.unloadCargoPopupClosed()` | Called by the UI when the unloading popup closes: plays a sound, shows the intro popups (cargoDelivered and any "<key>Unlocked") and forces the marker prompt to be re-evaluated. | 537 |
| `career_modules_delivery_progress.unloadMaterialsManualStart(cargoId, destination)` | Obsolete: prints "No longer used!". | 193 |

### Parameter details

#### `career_modules_delivery_progress.activateSound(soundLabel, active)`

Plays in a loop the 'money' or 'progressBar' progress sound (audio sources created on demand); with active=false, stops all these sounds.

- `soundLabel` (*string*) : 'money' or 'progressBar'.
- `active` (*boolean*) : true to play, false to stop everything.

#### `career_modules_delivery_progress.aggregateAfter()`

Was supposed to return the unlocks obtained since aggregateBefore; currently returns an empty table and forgets the stored state.

- **returns**: table Empty table.

#### `career_modules_delivery_progress.confirmDropOffData(confirmedDropOffs, facId, psPath)`

Applies the confirmed drop-off: splits the material cargos if a partial quantity is chosen, moves the cargos to the spot, finalizes the material distances/rewards, computes the rewards, finishes the vehicle tasks, updates the container weights (vehicles frozen during the update) then moves on to confirmDropOffCheckComplete.

- `confirmedDropOffs` (*table*) : Table {confirmedCargoIds = {{id=, amount=?}}, confirmedOfferIds = {...}}.
- `facId` (*string*) : Facility.
- `psPath` (*string*) : Parking spot path.

#### `career_modules_delivery_progress.getFacilityCountForCargoCount(direction)`

Counts the facilities with at least one delivery in the given direction.

- `direction` (*string*) : 'deliveredFromHere' or 'deliveredToHere' (key of facility.progress).
- **returns**: integer Number of facilities.

#### `career_modules_delivery_progress.getMoneyMultiplerForSkill(skill, tier)`

Returns the reward multiplier of the 'logistics' branch (parameters ignored).

- `skill` (*string*) : Ignored.
- `tier` (*integer*) : Ignored.
- **returns**: number Multiplier.

#### `career_modules_delivery_progress.getProgress()`

Returns the global progress table (cargoDeliveredByType).

- **returns**: table Progress.

#### `career_modules_delivery_progress.isFacilityUnlocked(facId)`

Indicates whether the facility is unlocked ('minItemCount' condition on the number of items delivered here).

- `facId` (*string*) : Facility identifier.
- **returns**: boolean true if unlocked.
- **returns**: table|nil If locked: disabledReasonHeader, disabledReasonContent and a progress bar.

#### `career_modules_delivery_progress.isFacilityVisible(facId, isCargoDeliveryTutorialActive)`

Indicates whether the facility is visible: during the delivery tutorial only the isTutorialForCargoDelivery facilities are, then the visibleCondition 'minItemCount' condition is tested.

- `facId` (*string*) : Facility identifier.
- `isCargoDeliveryTutorialActive` (*boolean*) : Delivery tutorial in progress.
- **returns**: boolean true if visible.

#### `career_modules_delivery_progress.onBranchTierReached(skill, tier)`

Branch level reached hook: for the delivery skill beyond tier 1, unlocks the vehicleDelivery branch.

- `skill` (*string*) : Skill identifier.
- `tier` (*integer*) : Tier reached.

#### `career_modules_delivery_progress.onCargoDelivered(cargoItems)`

Internal hook called after the confirmed delivery of cargos: updates the global counters, the statistics of the origin and destination facilities (count per type and money sum), the modifier statistics, then emits onDeliveryFacilityProgressStatsChanged(affectedFacilities). For a material, the counted quantity is cargo.slots, otherwise 1.

- `cargoItems` (*table|nil*) : List of delivered cargos.

#### `career_modules_delivery_progress.onVehicleTasksFinished(offers)`

Same for completed vehicle/trailer deliveries (offers); emits onDeliveryFacilityProgressStatsChanged.

- `offers` (*table|nil*) : List of items {offer=...}.

#### `career_modules_delivery_progress.requestDropOffData(facId, psPath)`

Starts preparing the drop-off screen at a facility spot: requests the containers of nearby vehicles, keeps the cargos whose destination (or one of the possible destinations) is this spot, computes their rewards, adds the vehicle tasks to finish, then calls openDropOffScreenGatheringComplete.

- `facId` (*string*) : Facility identifier.
- `psPath` (*string*) : Path of the drop-off parking spot.

#### `career_modules_delivery_progress.setProgress(data)`

Replaces the progress table (save loading), or resets it (cargoDeliveredByType to zero for parcel, vehicle, trailer, fluid, dryBulk) if data is nil.

- `data` (*table|nil*) : Saved progress.

#### `career_modules_delivery_progress.unloadMaterialsManualStart(cargoId, destination)`

Obsolete: prints "No longer used!".

- `cargoId` (*integer*) : Unused.
- `destination` (*table*) : Unused.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onDeliveryFacilityProgressStatsChanged` — listened to by 1 module(s)

**UI events (guihooks.trigger):** `SetDeliveryDropOffCargoSelection`, `SetDeliveryDropOffRewardResult`

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/delivery/progress.lua`.*
