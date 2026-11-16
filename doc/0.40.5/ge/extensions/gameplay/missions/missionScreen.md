# `gameplay_missions_missionScreen`

*File: `lua/ge/extensions/gameplay/missions/missionScreen.lua` · VM: Game Engine (GE) · 1412 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_missions_missionScreen`: `extensions.load("gameplay_missions_missionScreen")`, then the global `gameplay_missions_missionScreen`

Bridge between the mission system and the UI (Vue): prepares the mission screen data (missions at the current marker, ongoing mission, list tiles, active stars according to settings, starting options, entry fee, repair, required vehicle class), starts or stops a mission from the UI, handles navigation to a mission on the big map and the end screen sounds. Almost all its functions are called by the interface via Lua commands (e.g. gameplay_missions_missionScreen.startMissionById); results are sent back via guihooks.trigger.

## Example

```lua
-- start a mission like the UI does
local settings = {{key='setupModuleTraffic', value=false}}
gameplay_missions_missionScreen.startMissionById('gridmap_v2/timeTrial/x', settings, {})
```

## Notes

- User settings coming from the UI are a list {{key, value, ...}}; startMissionById, startFromWithinMission flatten them into a key -> value table before passing them to the missionManager.
- startMissionById refuses (logged error) a mission that is not startable (gameplay_missions_unlocks.isMissionStartable) unless startingOptions.skipUnlockCheck is true; startingOptions.startedFrom is "missionScreen" by default. It returns nothing.
- Starting repair costs are fixed: 1000 (money) or 1 voucher.
- Bug: in formatMission, `m.missionTypeLabel or mission.missionType` uses the global `mission` (nil) instead of `m`; if missionTypeLabel is absent, an error is raised.
- Bug: in openVehicleSelectorForMissionBySetting, `settingIdx = i` uses an undefined variable `i` (the loop uses `_`): settingIdx is always nil.
- Bug: in getMissionScreenData, the hook onAvailableMissionsSentToUi is emitted with `context`, a variable undefined at this point (nil).
- openAPMChallenges fills openMenuWithCustomMissionList with {mode='leagues'} then adds ids to it: the table mixes the "mode" key and sequential elements (only the sequential elements are read afterwards).
- enableDebug(true) replaces M.onUpdate with debugOnUpdate ("Mission Start Screen History" imgui window with the last 20 layouts); M.onUpdate is nil otherwise.
- The savedLayouts and testLayout fields are nil by default: savedLayouts is filled by discoverLayouts, testLayout is a test field never assigned in this file.
- activateSoundBlur calls core_sounds.setAudioBlur(1 or 0); the previous 3D sound code is commented out. activateSound creates three AudioGui sources (money, xp, vouchers) and never destroys them (tryDeleteSoundObject is empty).

**Dependencies (loaded first):** `gameplay_missions_missions`, `gameplay_markerInteraction`, `gameplay_playmodeMarkers`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_missions_missionScreen.abandonCurrentMission()` | Abandons the current mission as if the player had pressed the abandon button. | 822 |
| `gameplay_missions_missionScreen.activateSound(soundLabel, active, pitch)` | Plays (with the given pitch) or stops the counting sounds of the end screen (money, xp, vouchers). | 1012 |
| `gameplay_missions_missionScreen.activateSoundBlur(active)` | Enables or disables the audio blur (core_sounds.setAudioBlur) during the mission screen. | 894 |
| `gameplay_missions_missionScreen.changeUserSettings(id, settings)` | Called when the player changes a setting: determines the corresponding progress key (mission:getProgressKeyForUserSetting) and sends to the UI, via the guihook "missionProgressKeyChanged", {progressKey, translation, progress} with the reformatted aggregates. Uses the parent mission if missionIdForAttempt is set. Despite its name, it does not modify any setting. | 824 |
| `gameplay_missions_missionScreen.debugOnUpdate(dt)` | Imgui debug window, used as onUpdate when enableDebug(true). *(internal)* | 1291 |
| `gameplay_missions_missionScreen.discoverLayouts()` | Debug tool: reads the JSON layouts of /gameplay/testing into M.savedLayouts. | 1269 |
| `gameplay_missions_missionScreen.enableDebug(enable)` | Debug tool: enables/disables the imgui window of the layout history (affects M.onUpdate). | 1281 |
| `gameplay_missions_missionScreen.formatMission(m)` | Puts a mission in the format expected by the UI (id, translated name, icon, description, preview, type label, stars, settings, required class, career leagues, etc.). | 111 |
| `gameplay_missions_missionScreen.getActiveStarsForUserSettings(id, userSettings)` | Determines which stars are active, visible and enabled for given settings (after recomputing dynamic rewards, ignoring the keys of ignoreUserSettingsKeyForActiveStars). Stores the settings in m._lastUserSettingsOutsideOfMission. | 599 |
| `gameplay_missions_missionScreen.getMissionScreenData()` | Mission screen data: if a mission is in progress, returns the "ongoingMission" context (ongoing mission, recovery options, buttons hidden during the tutorial or looping rally); otherwise the "availableMissions" context (marker missions or custom list, tiles, preselected mission/page, ongoing delivery warning) or "empty". | 308 |
| `gameplay_missions_missionScreen.getMissionTiles(ids)` | Builds the tiles of the current level's mission list (filters, groups by difficulty and "all", sorting). Without ids, keeps only the missions visible in freeroam; with ids, only those. | 1096 |
| `gameplay_missions_missionScreen.getMissionsAtCurrentLocationFormatted()` | List of the missions of the marker where the player is, already formatted and sorted by unlock depth; nil if the game state has no playmode markers. | 258 |
| `gameplay_missions_missionScreen.getPauseMissionObjectivesData()` | Pause menu data (Vue component MissionObjectives): merges the unlocked stars with the active star rules for the settings of the current mission. | 713 |
| `gameplay_missions_missionScreen.getRepairCostForStartingRepairType(type)` | Cost of the repair offered at the start of a career mission: "moneyRepair" -> {money=1000}, "voucherRepair" -> {vouchers=1}, otherwise nil. | 13 |
| `gameplay_missions_missionScreen.isAnyMissionActive()` | Returns whether a foreground mission is in progress. | 1405 |
| `gameplay_missions_missionScreen.isMissionStartOrEndScreenActive()` | Broadcasts the hook onGetIsMissionStartOrEndScreenActive; a module that displays the mission start/end screen answers it by adding a value. | 1406 |
| `gameplay_missions_missionScreen.navigateToMission(id, routeTarget, routeParams)` | Opens the big map centered on a mission (freeroam_bigMapMode.enterBigMap, instant); POI selection and navigation are then done by onBigMapActivated. | 972 |
| `gameplay_missions_missionScreen.onBigMapActivated()` | Hook called when the big map opens: if a navigation to a mission is pending (and older than 3 s), selects the POI and starts the navigation. *(internal)* *(hook)* | 991 |
| `gameplay_missions_missionScreen.onClientEndMission(levelPath)` | Hook at level end; does nothing (commented-out code). *(internal)* *(hook)* | 927 |
| `gameplay_missions_missionScreen.onExtensionUnloaded()` | Hook on extension unload; does nothing (commented-out code). *(internal)* *(hook)* | 923 |
| `gameplay_missions_missionScreen.onMissionScreenReady(mode, uiLayout)` | Hook sent when the mission screen is displayed: stores the received UI layout (last 20). *(internal)* *(hook)* | 1380 |
| `gameplay_missions_missionScreen.onRequestMissionScreenData(mode)` | Test ("Todo: Remove"): if the mode contains "test", returns to the UI a copy of M.testLayout via the guihook "onRequestMissionScreenDataReady". *(internal)* *(hook)* | 1393 |
| `gameplay_missions_missionScreen.openAPMChallenges(branch, skill, routeTarget, routeParams)` | Opens the career challenges screen (starting "league" missions of the current level, filtered by branch and skill) via ui_router.navigate ("mission.details" by default). | 937 |
| `gameplay_missions_missionScreen.openVehicleSelectorForMissionBySetting(mId, settingKey)` | Opens the vehicle selector for a mission's "custom vehicle" setting, then returns to the mission's "settings" page with the chosen model and config. | 1038 |
| `gameplay_missions_missionScreen.requestStartingOptionsForUserSettings(id, userSettings)` | Computes the starting options for the given settings and sends them to the UI via the guihook "missionStartingOptionsForUserSettingsReady" ({missionId, options, entryFee}). Checks: mission startable, personal vehicle chosen, starting on foot impossible, entry fee payable, vehicle class, and offers the paid repair in career if the vehicle is damaged. | 421 |
| `gameplay_missions_missionScreen.resolveDefaultMissionVehicleClass(m)` | Class of the vehicle the mission would use by default (preselected option in its settings). The selection rules are in gameplay_vehiclePerformance.getDefaultMissionVehicleSpec; for an imposed vehicle (preset) the class comes from getClassFromConfig, otherwise it falls back to the player's. | 42 |
| `gameplay_missions_missionScreen.resolveMissionVehicleClassRequirement(m)` | Returns the vehicle class required by the mission (missionTypeData.vehicleGroupByClassActive and vehicleGroupByClass), built with gameplay_vehiclePerformance.buildClassRequirement; "auto" takes the player's class (B by default), "userSetting" gives nil (choice in the settings). | 73 |
| `gameplay_missions_missionScreen.resolvePlayerVehicleClass()` | Performance class of the player's vehicle as {class={name, description, minPI}, performanceIndex}: active inventory vehicle in career, otherwise the current player vehicle via gameplay_vehiclePerformance.getClassFromVehId. | 22 |
| `gameplay_missions_missionScreen.resolveRequirementState(currentClass, requiredClass)` | Compares the current class and the required class by name: "met" if identical, "unmet" if different, "unknown" if one is missing. | 60 |
| `gameplay_missions_missionScreen.setPreselectedMissionId(mId)` | Sets the mission preselected when the mission screen opens. | 882 |
| `gameplay_missions_missionScreen.setPreselectedPage(page)` | Sets the mission screen page to open (used only once by getMissionScreenData). | 877 |
| `gameplay_missions_missionScreen.startFromWithinMission(id, settings)` | Restarts/reconfigures a mission from within a running mission (flattens the settings then calls missionManager.startFromWithinMission). | 1250 |
| `gameplay_missions_missionScreen.startMissionById(id, userSettings, startingOptions)` | Starts a mission with a fade (gameplay_missions_missionManager.startWithFade) after flattening the settings. Logs an error if the id is invalid or if the mission is not startable. | 790 |
| `gameplay_missions_missionScreen.stopMissionById(id, force, abandonButtonPressed)` | Requests the abandonment (with fade) of the mission with the given id, or of the foreground mission if id is nil. | 813 |

### Parameter details

#### `gameplay_missions_missionScreen.activateSound(soundLabel, active, pitch)`

Plays (with the given pitch) or stops the counting sounds of the end screen (money, xp, vouchers).

- `soundLabel` (*string*) : money, xp or vouchers.
- `active` (*boolean*) : true to play; false stops all counting sounds.
- `pitch` (*number|nil*) : "pitch" parameter (1 by default).

#### `gameplay_missions_missionScreen.activateSoundBlur(active)`

Enables or disables the audio blur (core_sounds.setAudioBlur) during the mission screen.

- `active` (*boolean*) : true to enable.

#### `gameplay_missions_missionScreen.changeUserSettings(id, settings)`

Called when the player changes a setting: determines the corresponding progress key (mission:getProgressKeyForUserSetting) and sends to the UI, via the guihook "missionProgressKeyChanged", {progressKey, translation, progress} with the reformatted aggregates. Uses the parent mission if missionIdForAttempt is set. Despite its name, it does not modify any setting.

- `id` (*string*) : Mission id.
- `settings` (*table[]*) : List {key, value}.

#### `gameplay_missions_missionScreen.debugOnUpdate(dt)`

Imgui debug window, used as onUpdate when enableDebug(true).

- `dt` (*number*) : Elapsed time (s).

#### `gameplay_missions_missionScreen.enableDebug(enable)`

Debug tool: enables/disables the imgui window of the layout history (affects M.onUpdate).

- `enable` (*boolean*) : true to enable.

#### `gameplay_missions_missionScreen.formatMission(m)`

Puts a mission in the format expected by the UI (id, translated name, icon, description, preview, type label, stars, settings, required class, career leagues, etc.).

- `m` (*table*) : Built mission.
- **returns**: table Data formatted for the interface.

#### `gameplay_missions_missionScreen.getActiveStarsForUserSettings(id, userSettings)`

Determines which stars are active, visible and enabled for given settings (after recomputing dynamic rewards, ignoring the keys of ignoreUserSettingsKeyForActiveStars). Stores the settings in m._lastUserSettingsOutsideOfMission.

- `id` (*string*) : Mission id.
- `userSettings` (*table*) : List {key, value} or flat key -> value table.
- **returns**: table Table containing notably starInfo per star key; empty table if the mission does not exist.

#### `gameplay_missions_missionScreen.getMissionScreenData()`

Mission screen data: if a mission is in progress, returns the "ongoingMission" context (ongoing mission, recovery options, buttons hidden during the tutorial or looping rally); otherwise the "availableMissions" context (marker missions or custom list, tiles, preselected mission/page, ongoing delivery warning) or "empty".

- **returns**: table Table with the context field and the associated data.

#### `gameplay_missions_missionScreen.getMissionTiles(ids)`

Builds the tiles of the current level's mission list (filters, groups by difficulty and "all", sorting). Without ids, keeps only the missions visible in freeroam; with ids, only those.

- `ids` (*table<string, boolean>|nil*) : Set of ids to include.
- **returns**: table Table including tilesById, and the sorted groups (details in the code).

#### `gameplay_missions_missionScreen.getMissionsAtCurrentLocationFormatted()`

List of the missions of the marker where the player is, already formatted and sorted by unlock depth; nil if the game state has no playmode markers.

- **returns**: table[]|nil Formatted missions.

#### `gameplay_missions_missionScreen.getPauseMissionObjectivesData()`

Pause menu data (Vue component MissionObjectives): merges the unlocked stars with the active star rules for the settings of the current mission.

- **returns**: table {stars, message, showMessage}; stars is empty if there is no mission or no stars.

#### `gameplay_missions_missionScreen.getRepairCostForStartingRepairType(type)`

Cost of the repair offered at the start of a career mission: "moneyRepair" -> {money=1000}, "voucherRepair" -> {vouchers=1}, otherwise nil.

- `type` (*string*) : moneyRepair or voucherRepair.
- **returns**: table<string, number>|nil Cost per attribute.

#### `gameplay_missions_missionScreen.isAnyMissionActive()`

Returns whether a foreground mission is in progress.

- **returns**: boolean true if a mission is active.

#### `gameplay_missions_missionScreen.isMissionStartOrEndScreenActive()`

Broadcasts the hook onGetIsMissionStartOrEndScreenActive; a module that displays the mission start/end screen answers it by adding a value.

- **returns**: any First value added by a listener, or false.

#### `gameplay_missions_missionScreen.navigateToMission(id, routeTarget, routeParams)`

Opens the big map centered on a mission (freeroam_bigMapMode.enterBigMap, instant); POI selection and navigation are then done by onBigMapActivated.

- `id` (*string*) : Mission id.
- `routeTarget` (*string|nil*) : Target UI route.
- `routeParams` (*table|nil*) : Route parameters (autoSelectPoiId = id by default).

#### `gameplay_missions_missionScreen.onClientEndMission(levelPath)`

Hook at level end; does nothing (commented-out code).

- `levelPath` (*string*) : Level path.

#### `gameplay_missions_missionScreen.onMissionScreenReady(mode, uiLayout)`

Hook sent when the mission screen is displayed: stores the received UI layout (last 20).

- `mode` (*string*) : Screen mode.
- `uiLayout` (*table*) : Layout sent by the UI (receives recordedAt).

#### `gameplay_missions_missionScreen.onRequestMissionScreenData(mode)`

Test ("Todo: Remove"): if the mode contains "test", returns to the UI a copy of M.testLayout via the guihook "onRequestMissionScreenDataReady".

- `mode` (*string*) : Requested mode.

#### `gameplay_missions_missionScreen.openAPMChallenges(branch, skill, routeTarget, routeParams)`

Opens the career challenges screen (starting "league" missions of the current level, filtered by branch and skill) via ui_router.navigate ("mission.details" by default).

- `branch` (*string|nil*) : Branch; "undefined" = nil.
- `skill` (*string|nil*) : Skill; "undefined" or "all" = nil.
- `routeTarget` (*string|nil*) : Target UI route.
- `routeParams` (*table|nil*) : Route parameters (pathId = branch by default).

#### `gameplay_missions_missionScreen.openVehicleSelectorForMissionBySetting(mId, settingKey)`

Opens the vehicle selector for a mission's "custom vehicle" setting, then returns to the mission's "settings" page with the chosen model and config.

- `mId` (*string*) : Mission id.
- `settingKey` (*string*) : Key of the vehicle selection setting.

#### `gameplay_missions_missionScreen.requestStartingOptionsForUserSettings(id, userSettings)`

Computes the starting options for the given settings and sends them to the UI via the guihook "missionStartingOptionsForUserSettingsReady" ({missionId, options, entryFee}). Checks: mission startable, personal vehicle chosen, starting on foot impossible, entry fee payable, vehicle class, and offers the paid repair in career if the vehicle is damaged.

- `id` (*string*) : Mission id.
- `userSettings` (*table[]*) : List of settings {key, value}.

#### `gameplay_missions_missionScreen.resolveDefaultMissionVehicleClass(m)`

Class of the vehicle the mission would use by default (preselected option in its settings). The selection rules are in gameplay_vehiclePerformance.getDefaultMissionVehicleSpec; for an imposed vehicle (preset) the class comes from getClassFromConfig, otherwise it falls back to the player's.

- `m` (*table*) : Built mission.
- **returns**: table|nil Class data.

#### `gameplay_missions_missionScreen.resolveMissionVehicleClassRequirement(m)`

Returns the vehicle class required by the mission (missionTypeData.vehicleGroupByClassActive and vehicleGroupByClass), built with gameplay_vehiclePerformance.buildClassRequirement; "auto" takes the player's class (B by default), "userSetting" gives nil (choice in the settings).

- `m` (*table*) : Built mission.
- **returns**: table|nil Class requirement, or nil if there is none.

#### `gameplay_missions_missionScreen.resolvePlayerVehicleClass()`

Performance class of the player's vehicle as {class={name, description, minPI}, performanceIndex}: active inventory vehicle in career, otherwise the current player vehicle via gameplay_vehiclePerformance.getClassFromVehId.

- **returns**: table|nil Class data, or nil if unavailable.

#### `gameplay_missions_missionScreen.resolveRequirementState(currentClass, requiredClass)`

Compares the current class and the required class by name: "met" if identical, "unmet" if different, "unknown" if one is missing.

- `currentClass` (*table|nil*) : Current class {class={name}}.
- `requiredClass` (*table|nil*) : Required class.
- **returns**: string met, unmet or unknown.

#### `gameplay_missions_missionScreen.setPreselectedMissionId(mId)`

Sets the mission preselected when the mission screen opens.

- `mId` (*string|nil*) : Mission id.

#### `gameplay_missions_missionScreen.setPreselectedPage(page)`

Sets the mission screen page to open (used only once by getMissionScreenData).

- `page` (*string|nil*) : Page name, e.g. "settings".

#### `gameplay_missions_missionScreen.startFromWithinMission(id, settings)`

Restarts/reconfigures a mission from within a running mission (flattens the settings then calls missionManager.startFromWithinMission).

- `id` (*string*) : Id of the mission to start.
- `settings` (*table[]|nil*) : List {key, value}.

#### `gameplay_missions_missionScreen.startMissionById(id, userSettings, startingOptions)`

Starts a mission with a fade (gameplay_missions_missionManager.startWithFade) after flattening the settings. Logs an error if the id is invalid or if the mission is not startable.

- `id` (*string*) : Mission id.
- `userSettings` (*table[]|nil*) : List {key, value}.
- `startingOptions` (*table|nil*) : Options (startedFrom, skipUnlockCheck, skipPartConditionSnapshot...).

#### `gameplay_missions_missionScreen.stopMissionById(id, force, abandonButtonPressed)`

Requests the abandonment (with fade) of the mission with the given id, or of the foreground mission if id is nil.

- `id` (*string|nil*) : Mission id.
- `force` (*boolean|nil*) : Passed to attemptAbandonMissionWithFade (unused there).
- `abandonButtonPressed` (*boolean|nil*) : true if the player is the one abandoning.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded beforehand: gameplay_missions_missions, gameplay_markerInteraction, gameplay_playmodeMarkers. |
| `savedLayouts` | table[]|nil | Test layouts read from /gameplay/testing/*.json by discoverLayouts; nil before the first call. |
| `testLayout` | table|nil | Test layout returned by onRequestMissionScreenData when the mode contains "test"; nil by default. |
| `uiLayoutHistory` | table[] | The last 20 mission screen layouts received by onMissionScreenReady (with recordedAt and recordedAtFormatted). |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onAvailableMissionsSentToUi` — listened to by 1 module(s)
- `onGetIsMissionStartOrEndScreenActive` — listened to by 1 module(s)
- `onUpdate` — listened to by 186 module(s)

**UI events (guihooks.trigger):** `MenuOpenModule`, `missionProgressKeyChanged`, `missionStartingOptionsForUserSettingsReady`, `onRequestMissionScreenDataReady`

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`, `removeFile`
- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

**Loads extensions:** `gameplay_vehiclePerformance`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/missions/missionScreen.lua`.*
