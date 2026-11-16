# `career_modules_delivery_tutorial`

*File: `lua/ge/extensions/career/modules/delivery/tutorial.lua` · VM: Game Engine (GE) · 225 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_delivery_tutorial`: `extensions.load("career_modules_delivery_tutorial")`, then the global `career_modules_delivery_tutorial`

Determines whether the delivery tutorials (parcels, vehicles, materials) are still active and provides the tutorial task lists for the career progress page. A tutorial is active as long as the XP of the corresponding branch (logistics-delivery, logistics-vehicleDelivery, logistics-materials) is 0; the result is cached and invalidated when this XP changes, which also unlocks an achievement.

## Notes

- The cache (tutorialStatusCache) is cleared in onPlayerAttributesChanged; the achievements DELIVERY_TUTORIAL_COMPLETED, VEHICLE_DELIVERY_COMPLETED and MATERIALS_DELIVERY_COMPLETED are unlocked on each change of the corresponding attribute, not only the first time.
- currentVehicleHasDryBulkContainer and currentVehicleHasTutorialMaterials always return false: the "load materials" step of the materials tutorial is therefore never checked before the end of the tutorial.
- tutorialVehicleTakenOutOfFacility tests any vehicle task with isTutorialVehicle, not only that of the current vehicle.
- currentOrNearbyVehicleHasContainer considers a container attached within 20 m of the player (or the current vehicle).
- getTutorialInfo only fills in 'parcel' and 'vehicle'; the 'materials-introduction' tutorial exists in onCareerProgressPageGetTasklistData but is not included.
- The titles 'Delivery Introduction', 'Vehicle Delivery Introduction' and 'Materials Introduction' are in English, not translated.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_delivery_tutorial.getTutorialInfo()` | Returns the state of the parcel and vehicle tutorials: unlocked, isActive and the task list, for the UI. | 114 |
| `career_modules_delivery_tutorial.isCargoDeliveryTutorialActive()` | True as long as the logistics-delivery XP is 0 (result cached). | 25 |
| `career_modules_delivery_tutorial.isMaterialsDeliveryTutorialActive()` | True as long as the logistics-materials XP is 0 (cached). | 39 |
| `career_modules_delivery_tutorial.isVehicleDeliveryTutorialActive()` | True as long as the logistics-vehicleDelivery XP is 0 (cached). | 32 |
| `career_modules_delivery_tutorial.onCareerActivated()` | Hook called on career activation: stores the delivery extensions used. *(internal)* *(hook)* | 8 |
| `career_modules_delivery_tutorial.onCareerProgressPageGetTasklistData(tasklistData, tasklistId)` | Progress page hook: fills tasklistData.headerLabel and tasklistData.tasks ({label, description, done}) for 'delivery-introduction' (install a container, load a tutorial parcel, deliver), 'vehicle-delivery-introduction' (pick up the vehicle, deliver) or 'materials-introduction'. If the tutorial is finished, a single "finished" task is returned. *(hook)* | 132 |
| `career_modules_delivery_tutorial.onPlayerAttributesChanged(change, reason)` | Hook called when player attributes change: invalidates the cache of the tutorial concerned and unlocks the associated achievement. *(internal)* *(hook)* | 46 |

### Parameter details

#### `career_modules_delivery_tutorial.getTutorialInfo()`

Returns the state of the parcel and vehicle tutorials: unlocked, isActive and the task list, for the UI.

- **returns**: table {parcel = {unlocked, isActive, tasks, headerLabel}, vehicle = {…}}.

#### `career_modules_delivery_tutorial.isCargoDeliveryTutorialActive()`

True as long as the logistics-delivery XP is 0 (result cached).

- **returns**: boolean Parcel tutorial active.

#### `career_modules_delivery_tutorial.isMaterialsDeliveryTutorialActive()`

True as long as the logistics-materials XP is 0 (cached).

- **returns**: boolean Materials tutorial active.

#### `career_modules_delivery_tutorial.isVehicleDeliveryTutorialActive()`

True as long as the logistics-vehicleDelivery XP is 0 (cached).

- **returns**: boolean Vehicle delivery tutorial active.

#### `career_modules_delivery_tutorial.onCareerProgressPageGetTasklistData(tasklistData, tasklistId)`

Progress page hook: fills tasklistData.headerLabel and tasklistData.tasks ({label, description, done}) for 'delivery-introduction' (install a container, load a tutorial parcel, deliver), 'vehicle-delivery-introduction' (pick up the vehicle, deliver) or 'materials-introduction'. If the tutorial is finished, a single "finished" task is returned.

- `tasklistData` (*table*) : Table to fill.
- `tasklistId` (*string*) : 'delivery-introduction', 'vehicle-delivery-introduction' or 'materials-introduction'.

#### `career_modules_delivery_tutorial.onPlayerAttributesChanged(change, reason)`

Hook called when player attributes change: invalidates the cache of the tutorial concerned and unlocks the associated achievement.

- `change` (*table<string, number>*) : Modified attributes (keys logistics-delivery, logistics-vehicleDelivery, logistics-materials).
- `reason` (*any*) : Reason for the change (unused).

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/delivery/tutorial.lua`.*
