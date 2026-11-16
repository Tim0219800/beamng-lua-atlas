# `career_modules_testDrive`

*File: `lua/ge/extensions/career/modules/testDrive.lua` · VM: Game Engine (GE) · 364 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_testDrive`: `extensions.load("career_modules_testDrive")`, then the global `career_modules_testDrive`

Test drive of a vehicle at a dealership in career. start() puts the player in the vehicle, creates a snapshot of the part conditions (key "beforeTestDrive"), disables autosave and activates the test drive. Each frame, onUpdate counts down the time limit (timeLimit), checks that the player stays within 10 m of the vehicle (otherwise abandon with fees) and detects damage every 2 s. stop() brings the vehicle back to the starting point with a fade and puts the player back on foot.

## Example

```lua
career_modules_testDrive.start(vehId, {timeLimit = 120, abandonFees = 50, dealershipName = "x", route = "y"})
if career_modules_testDrive.isActive() then print(career_modules_testDrive.getTimeLeft()) end
```

## Notes

- testDriveInfo fields used in the code: timeLimit (s), abandonFees, endParkingSpot, endParkingSpotCreated, dealershipName, route, dealershipPreview.
- The time limit is counted down in simulation time (dtSim). When it runs out, stop(false) is called (without the onGameplayActivityAborted hook).
- abandonTestDrive: if abandonFees > 0, pays the fees (canBeNegative = true); private sales have no fees. Then calls career_modules_inspectVehicle.onTestDriveAbandoned().
- stop(userAborted) emits onGameplayActivityAborted unless userAborted == false; it re-enables autosave and launches the end job (teleport to the starting point, time speed 0.5 then 1, navigation to the play screen, onTestDriveEndedAfterFade hook).
- Emitted hooks: onTestDriveStarted (at start), onTestDriveEndedAfterFade (at end).
- The test drive end POI (type testDriveEnd) is added to the raw POI list and a "stopTestDrive" action is added to the radial menu (level /root/sandbox/career/) on first opening.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_testDrive.abandonTestDrive()` | Abandons the test drive (no effect if inactive): deactivates the test drive, re-enables autosave, then after 0.2 s displays and pays any abandon fees, resets the data and notifies inspectVehicle. | 217 |
| `career_modules_testDrive.formatTestDriveToRawPoi(elements)` | Adds to elements the test drive end POI (id testDrive-<dealership>-<route>-parkingEnd, parking marker and big map marker) if an end spot exists and was created. | 279 |
| `career_modules_testDrive.getTimeLeft()` | Remaining test drive time in seconds (nil if there is no test drive or no limit). | 266 |
| `career_modules_testDrive.isActive()` | Indicates whether a test drive is in progress. | 270 |
| `career_modules_testDrive.isDamageDetected()` | Indicates whether damage was detected on the vehicle during the test drive (detection by career_modules_insurance_insurance.genericVehNeedsRepair). | 274 |
| `career_modules_testDrive.onBeforeRadialOpened()` | Hook before the radial menu opens: once only, adds a "stop the test drive" entry (visible only during a test drive) to the quick menu. *(internal)* *(hook)* | 322 |
| `career_modules_testDrive.onCareerActive(active)` | Hook: resets the test drive data when the career is activated. *(internal)* *(hook)* | 316 |
| `career_modules_testDrive.onGetRawPoiListForLevel(levelIdentifier, elements)` | POI list hook: adds the test drive end POI via formatTestDriveToRawPoi. *(internal)* *(hook)* | 294 |
| `career_modules_testDrive.onPoiDetailPromptOpening(elemData, promptData)` | POI detail open hook: if it is the testDriveEnd POI, adds a "stop the test drive" button calling stop(false). *(internal)* *(hook)* | 298 |
| `career_modules_testDrive.onUpdate(dtReal, dtSim, dtRaw)` | Frame hook: if a test drive is active, handles the time limit, the player moving away and damage detection. *(internal)* *(hook)* | 252 |
| `career_modules_testDrive.onVehicleRepairedByInsurance(amount)` | Hook called after an insurance repair: displays the repair cost after 1.8 s (real-time message and purchase sound). *(internal)* *(hook)* | 203 |
| `career_modules_testDrive.resetData()` | Deactivates the test drive and clears the raw POIs. | 55 |
| `career_modules_testDrive.start(_vehicleId, testDriveInfo)` | Starts the test drive: copies testDriveInfo, puts the player in the vehicle, remembers its starting position/rotation, creates and selects the beforeTestDrive parts snapshot, unfreezes the vehicle, emits onTestDriveStarted, clears the raw POIs and disables autosave. | 111 |
| `career_modules_testDrive.stop(userAborted)` | Ends the test drive normally (no effect if inactive): re-enables autosave and launches the end job that teleports the vehicle to the start with a fade. | 207 |

### Parameter details

#### `career_modules_testDrive.formatTestDriveToRawPoi(elements)`

Adds to elements the test drive end POI (id testDrive-<dealership>-<route>-parkingEnd, parking marker and big map marker) if an end spot exists and was created.

- `elements` (*table[]*) : List of raw POIs to fill.

#### `career_modules_testDrive.getTimeLeft()`

Remaining test drive time in seconds (nil if there is no test drive or no limit).

- **returns**: number|nil Remaining seconds.

#### `career_modules_testDrive.isActive()`

Indicates whether a test drive is in progress.

- **returns**: boolean|nil true if active.

#### `career_modules_testDrive.isDamageDetected()`

Indicates whether damage was detected on the vehicle during the test drive (detection by career_modules_insurance_insurance.genericVehNeedsRepair).

- **returns**: boolean true if damage detected.

#### `career_modules_testDrive.onCareerActive(active)`

Hook: resets the test drive data when the career is activated.

- `active` (*boolean*) : Nothing if false.

#### `career_modules_testDrive.onGetRawPoiListForLevel(levelIdentifier, elements)`

POI list hook: adds the test drive end POI via formatTestDriveToRawPoi.

- `levelIdentifier` (*string*) : Level (unused).
- `elements` (*table[]*) : POI list to complete.

#### `career_modules_testDrive.onPoiDetailPromptOpening(elemData, promptData)`

POI detail open hook: if it is the testDriveEnd POI, adds a "stop the test drive" button calling stop(false).

- `elemData` (*table[]*) : POI elements.
- `promptData` (*table[]*) : Buttons to fill.

#### `career_modules_testDrive.onUpdate(dtReal, dtSim, dtRaw)`

Frame hook: if a test drive is active, handles the time limit, the player moving away and damage detection.

- `dtReal` (*number*) : Real time (s).
- `dtSim` (*number*) : Simulation time (s).
- `dtRaw` (*number*) : Raw time (s).

#### `career_modules_testDrive.onVehicleRepairedByInsurance(amount)`

Hook called after an insurance repair: displays the repair cost after 1.8 s (real-time message and purchase sound).

- `amount` (*number*) : Repair amount.

#### `career_modules_testDrive.start(_vehicleId, testDriveInfo)`

Starts the test drive: copies testDriveInfo, puts the player in the vehicle, remembers its starting position/rotation, creates and selects the beforeTestDrive parts snapshot, unfreezes the vehicle, emits onTestDriveStarted, clears the raw POIs and disables autosave.

- `_vehicleId` (*integer*) : Object id of the test drive vehicle.
- `testDriveInfo` (*table*) : Test drive parameters (timeLimit, abandonFees, endParkingSpot, dealershipName, route...).

#### `career_modules_testDrive.stop(userAborted)`

Ends the test drive normally (no effect if inactive): re-enables autosave and launches the end job that teleports the vehicle to the start with a fade.

- `userAborted` (*boolean|nil*) : Emits onGameplayActivityAborted unless false.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table | Empty table: no dependency. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onGameplayActivityAborted`
- `onTestDriveEndedAfterFade` — listened to by 1 module(s)
- `onTestDriveStarted` — listened to by 1 module(s)

**UI events (guihooks.trigger):** `Message`, `ScenarioRealtimeDisplay`

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/testDrive.lua`.*
