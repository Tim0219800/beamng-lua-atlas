# `util_asyncBulkLoader`

*File: `lua/ge/extensions/util/asyncBulkLoader.lua` · VM: Game Engine (GE) · 333 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_asyncBulkLoader`: `extensions.load("util_asyncBulkLoader")`, then the global `util_asyncBulkLoader`

Asynchronous loader for large datasets (vehicles, missions, gameplay selector, levels, career save profiles). Each loadXxx starts a job (core_jobsystem, 1/30 s interval) that runs the heavy loading while yielding between steps, publishes progress in the 'asyncBulkLoaderProgress' stream and signals completion via guihooks and extensions.hook. The xxxDirect variants load synchronously with time measurement.

## Example

```lua
local r = util_asyncBulkLoader.loadVehicles()
-- r is 'alreadyLoaded', 'alreadyLoading' or 'startLoading'
-- completion is announced by the asyncVehicleLoadComplete hook
```

## Notes

- Return values of the loadXxx functions: 'alreadyLoaded' (data already loaded), 'alreadyLoading' (another load is in progress, error logged with trace) or 'startLoading'. Only one load at a time (isLoading).
- 'asyncBulkLoaderProgress' stream: {count, total, inProgress, percent}. percent: 0 to 100 = determinate, -1 = indeterminate. Only loadVehicles resets percent to -1.
- End of load: loadVehicles emits guihooks 'asyncVehicleLoadComplete' and the hook of the same name; loadMissions emits only the guihook 'asyncMissionLoadComplete' (no extensions hook); loadGameplaySelector emits 'asyncGameplaySelectorLoadComplete' (guihook and hook); loadLevels emits 'asyncLevelLoadComplete' (guihook and hook).
- The profiling threshold tooLongLoadingThreshold is math.huge: profiling (startProfiling, profileLow, profileHigh, stopProfiling) is replaced by nop. Lowering it writes an asyncBulkLoader_report.json report for loads that take too long.
- Probable bug: loadLevels sets M.yield to nil at the end; any later call to M.yield without a new setupYield would cause an error (the other loads reset nop or a new yield).
- sendAllCareerSaveSlotsDataAsync loads nothing itself (the test code is commented out): it starts a job then calls career_career.sendAllCareerProfilesData() and returns only 'startLoading'.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_asyncBulkLoader.addCount(count)` | Adds to the number of items already processed and publishes the progress. | 30 |
| `util_asyncBulkLoader.addTotal(total)` | Adds to the total number of items to load and publishes the progress. | 23 |
| `util_asyncBulkLoader.isGameplaySelectorLoaded()` | Returns whether the gameplay selector data is loaded. | 102 |
| `util_asyncBulkLoader.isLevelsLoaded()` | Returns whether the level list is loaded (core_levels.isListLoaded). | 106 |
| `util_asyncBulkLoader.isLoading()` | Returns whether an asynchronous load is in progress. | 135 |
| `util_asyncBulkLoader.isMissionsLoaded()` | Returns whether all missions are loaded. | 98 |
| `util_asyncBulkLoader.isVehiclesLoaded()` | Returns whether the vehicle model data is loaded (core_vehicles.isModelsDataLoaded). | 94 |
| `util_asyncBulkLoader.loadGameplaySelector()` | Builds the gameplay selector data asynchronously, then emits 'asyncGameplaySelectorLoadComplete'. | 228 |
| `util_asyncBulkLoader.loadGameplaySelectorDirect()` | Builds the gameplay selector tiles synchronously and prints the time. | 122 |
| `util_asyncBulkLoader.loadLevels()` | Loads the level list asynchronously, then emits 'asyncLevelLoadComplete'. | 268 |
| `util_asyncBulkLoader.loadLevelsDirect()` | Loads the level list synchronously and prints the time. | 128 |
| `util_asyncBulkLoader.loadMissions()` | Loads all missions asynchronously, then emits the guihook 'asyncMissionLoadComplete'. | 193 |
| `util_asyncBulkLoader.loadMissionsDirect()` | Loads all missions synchronously and prints the time. | 116 |
| `util_asyncBulkLoader.loadVehicles()` | Loads the vehicle model data asynchronously, then emits 'asyncVehicleLoadComplete' (UI and extensions). Used by the vehicle selector. | 155 |
| `util_asyncBulkLoader.loadVehiclesDirect()` | Loads the vehicle model list synchronously (core_vehicles.loadModelListNoGarbage) and prints the time. | 110 |
| `util_asyncBulkLoader.reportScanPercent(percent)` | Updates the percentage of file parsing (decoding of vehicles) and publishes the progress. | 18 |
| `util_asyncBulkLoader.reportStream()` | Sends the current progress state in the 'asyncBulkLoaderProgress' stream. | 13 |
| `util_asyncBulkLoader.sendAllCareerSaveSlotsDataAsync()` | In a job, sends the UI the data of all career save slots (career_career.sendAllCareerProfilesData). | 304 |
| `util_asyncBulkLoader.setupYield(job)` | Prepares M.yield from a job: job.yield, or a profiled version if the threshold is lowered. *(internal)* | 139 |

### Parameter details

#### `util_asyncBulkLoader.addCount(count)`

Adds to the number of items already processed and publishes the progress.

- `count` (*number*) : Processed items to add.

#### `util_asyncBulkLoader.addTotal(total)`

Adds to the total number of items to load and publishes the progress.

- `total` (*number*) : Items to add to the total.

#### `util_asyncBulkLoader.isGameplaySelectorLoaded()`

Returns whether the gameplay selector data is loaded.

- **returns**: boolean true if loaded.

#### `util_asyncBulkLoader.isLevelsLoaded()`

Returns whether the level list is loaded (core_levels.isListLoaded).

- **returns**: boolean true if loaded.

#### `util_asyncBulkLoader.isLoading()`

Returns whether an asynchronous load is in progress.

- **returns**: boolean true if in progress.

#### `util_asyncBulkLoader.isMissionsLoaded()`

Returns whether all missions are loaded.

- **returns**: boolean true if loaded.

#### `util_asyncBulkLoader.isVehiclesLoaded()`

Returns whether the vehicle model data is loaded (core_vehicles.isModelsDataLoaded).

- **returns**: boolean true if loaded.

#### `util_asyncBulkLoader.loadGameplaySelector()`

Builds the gameplay selector data asynchronously, then emits 'asyncGameplaySelectorLoadComplete'.

- **returns**: string 'alreadyLoaded', 'alreadyLoading' or 'startLoading'.

#### `util_asyncBulkLoader.loadLevels()`

Loads the level list asynchronously, then emits 'asyncLevelLoadComplete'.

- **returns**: string 'alreadyLoaded', 'alreadyLoading' or 'startLoading'.

#### `util_asyncBulkLoader.loadMissions()`

Loads all missions asynchronously, then emits the guihook 'asyncMissionLoadComplete'.

- **returns**: string 'alreadyLoaded', 'alreadyLoading' or 'startLoading'.

#### `util_asyncBulkLoader.loadVehicles()`

Loads the vehicle model data asynchronously, then emits 'asyncVehicleLoadComplete' (UI and extensions). Used by the vehicle selector.

- **returns**: string 'alreadyLoaded', 'alreadyLoading' or 'startLoading'.

#### `util_asyncBulkLoader.reportScanPercent(percent)`

Updates the percentage of file parsing (decoding of vehicles) and publishes the progress.

- `percent` (*number*) : 0 to 100 determinate, -1 indeterminate.

#### `util_asyncBulkLoader.sendAllCareerSaveSlotsDataAsync()`

In a job, sends the UI the data of all career save slots (career_career.sendAllCareerProfilesData).

- **returns**: string 'startLoading'.

#### `util_asyncBulkLoader.setupYield(job)`

Prepares M.yield from a job: job.yield, or a profiled version if the threshold is lowered.

- `job` (*table*) : core_jobsystem job.

## Fields

| Field | Type | Description |
|---|---|---|
| `yield` | function|nil | Yield function (job.yield) set by setupYield; nop at start. Called by the loading code to let the game breathe. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `asyncGameplaySelectorLoadComplete`
- `asyncLevelLoadComplete`
- `asyncVehicleLoadComplete`

**UI events (guihooks.trigger):** `asyncGameplaySelectorLoadComplete`, `asyncLevelLoadComplete`, `asyncMissionLoadComplete`, `asyncVehicleLoadComplete`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/asyncBulkLoader.lua`.*
