# `career_career`

*File: `lua/ge/extensions/career/career.lua` · VM: Game Engine (GE) · 790 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_career`: `extensions.load("career_career")`, then the global `career_career`

Entry point of career mode. It activates and deactivates the career: loads the level (west_coast_usa by default, or the one from the save), loads all modules in lua/ge/extensions/career/modules/ (except /tutorial/step), blocks certain input actions (vehicleTeleporting, vehicleMenues, physicsControls, aiControls…), shows an imgui debug menu, handles the starting modes (startingModes), the starter vehicle, interactions with organizations, the profile/save list sent to the UI and the saving of general.json (level, starting options, boughtStarterVehicle, organizationInteraction).

## Example

```lua
career_career.createOrLoadCareerAndStart('myProfile', nil, {startMode = 'apmOnboarding'})
if career_career.isActive() then print(career_career.getBeamXPLevel(250)) end
```

## Notes

- Activation: activateCareer requests the loading screen, emits the hook onBeforeCareerActivate, reads <save>/career/general.json; if the current level differs, launches freeroam_freeroam.startFreeroam and loads the modules at the end; otherwise removes the vehicles (core_vehicles.removeAll, or only those outside traffic/parking if removeVehicles is false) then emits onCareerActive(true, newSave).
- Deactivation: onCareerActive(false) is emitted to all modules (27 listen to it) and the input actions are unblocked.
- Tutorial: M.tutorialEnabled is true if startingOptions.startMode == "apmOnboarding" and the starter vehicle has not been bought yet; autosave is then disabled.
- BeamXP levels (beamXPLevels): thresholds 0, 100, 300, 600 and 1000.
- Bug: in toggleCareerModules, the call extensions.luaPathToExtName(modulePath) uses an undefined variable modulePath (nil) and its result is ignored.
- deactivateCareer and deactivateCareerAndReloadLevel accept saveCareer but do not use it.
- The debug menu (imgui) only exists if debugMenuEnabled, true by default outside the shipping_build version; it is linked to M.onUpdate only while the career is active.
- onSerialize deactivates the career and notes reactivate = true; onDeserialized reactivates it with removeVehicles = false (useful during a reload of the Lua extensions).
- onLoadingScreenFadeout navigates to "play" only once after an activation with a level load (flag playNavigationPendingAfterActivation).
- onClientEndMission deactivates the career if the level that is ending is west_coast_usa.

**Dependencies (loaded first):** `career_saveSystem`, `core_recoveryPrompt`, `gameplay_traffic`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_career.activateCareer(removeVehicles)` | Activates the career for the current profile (career_saveSystem.getCurrentProfile): no effect if already active or without a profile. Loads the level and the modules (see notes). | 257 |
| `career_career.closeAllMenus()` | Closes the menus by navigating to the "play" screen. | 715 |
| `career_career.createOrLoadCareerAndStart(name, specificAutosave, startingOptions)` | Selects (or creates) a save profile with career_saveSystem.setProfile then activates the career with the given starting options. | 342 |
| `career_career.deactivateCareer(saveCareer)` | Deactivates the career: unloads the modules, unblocks the actions, resets the freeroam recovery values and hides the task list. | 317 |
| `career_career.deactivateCareerAndReloadLevel(saveCareer)` | Deactivates the career then restarts the current level in freeroam. | 332 |
| `career_career.getAdditionalMenuButtons()` | Buttons added to the pause menu: map (or "my load" during delivery), progress (if the starter vehicle is bought and outside the tutorial), certification cancellation, road test cancellation. | 728 |
| `career_career.getAutosavesForProfile(profile)` | For each save folder of the profile, returns the content of playerAttributes.json with id and autosaveName. | 599 |
| `career_career.getBeamXPLevel(xp)` | Computes the BeamXP level: thresholds 0, 100, 300, 600, 1000. Returns -1 for the progress values if there is no next level. | 451 |
| `career_career.getCurrentStartingModeData()` | Returns the full definition of the current game's starting mode (startingOptions.startMode), or nil. | 398 |
| `career_career.getSaveFoldersForProfile(profile)` | Returns the list of a profile's save folders with what the UI needs to choose (name, dates, version, corrupted, isCurrent, incompatibleVersion, outdatedVersion, money, beamXP, vehicleCount), sorted from newest to oldest. | 614 |
| `career_career.getStartingModeOptions()` | Lists the starting modes (*.lua files of lua/ge/extensions/career/startingModes/ run by dofile, except those with ignore) and returns for the UI: id, order, tier, title, description, image, tag, sorted by order then id. | 359 |
| `career_career.hasBoughtStarterVehicle()` | Indicates whether the player has bought their starter vehicle. | 688 |
| `career_career.hasInteractedWithOrganization(id)` | Indicates whether the player has already interacted with an organization. | 692 |
| `career_career.interactWithOrganization(id)` | Notes that the player has interacted with an organization (saved in general.json). | 696 |
| `career_career.isActive()` | Indicates whether the career is active. | 338 |
| `career_career.isAutosaveEnabled()` | Indicates whether autosave is allowed. | 720 |
| `career_career.onAnyMissionChanged(state, mission)` | Challenge state change hook: blocks the input actions when it stops ("stopped") and unblocks them when it starts ("started"). *(internal)* *(hook)* | 677 |
| `career_career.onBeforeSetProfile(currentSavePath)` | Hook called before changing profile: deactivates the career if it is active. *(internal)* *(hook)* | 438 |
| `career_career.onCameraModeChanged(modeName)` | Camera mode change hook: updates the nodegrabber blocking if the career is active. *(internal)* *(hook)* | 69 |
| `career_career.onCareerActive(active)` | onCareerActive hook received by this module itself (emitted by initAfterLevelLoad and deactivateCareer). On activation: applies the career or tutorial recovery values, clears the task list and raw POIs, installs M.onUpdate (debug menu), blocks the input actions and sets the game state to "career". Does nothing if active is false. *(internal)* *(hook)* | 158 |
| `career_career.onClientEndMission(levelPath)` | End-of-level hook: deactivates the career if the level is west_coast_usa. *(internal)* *(hook)* | 654 |
| `career_career.onClientPostStartMission()` | Hook after a level starts: runs the career's deferred initialization (emits onCareerActive(true, newSave)). *(internal)* *(hook)* | 240 |
| `career_career.onDeserialized(v)` | Post-reload hook: reactivates the career (activateCareer(false)) if v.reactivate. *(internal)* *(hook)* | 671 |
| `career_career.onGlobalCameraSet(modeName)` | Global camera change hook: updates the nodegrabber blocking. *(internal)* *(hook)* | 74 |
| `career_career.onLoadingScreenFadeout()` | Navigates to "play" exactly once, at the end of the loading screen fade that follows the activation (the router resends the request until the UI confirms). *(internal)* *(hook)* | 250 |
| `career_career.onSaveCurrentProfile(currentSavePath)` | Profile save hook: writes career/general.json (level, startingOptions, boughtStarterVehicle, organizationInteraction, debug window states). *(internal)* *(hook)* | 417 |
| `career_career.onSerialize()` | Extension reload hook: deactivates the career and notes reactivate = true if it was active. *(internal)* *(hook)* | 662 |
| `career_career.onVehicleAddedToInventory(data)` | Hook for adding a vehicle to the inventory: marks the starter vehicle as bought (immediate save) and unlocks the FIRST_SET_OF_KEYS achievement for an instant purchase at apmStarterVehicles. *(internal)* *(hook)* | 701 |
| `career_career.sendAllCareerProfilesData()` | Builds the info of each profile (money, beamXP, vouchers, insurance score, "apm" branches, current vehicle, vehicle count, versions) and sends it to the UI via guihooks "allCareerProfiles"; sorts by creationDate. | 569 |
| `career_career.sendCurrentProfileData()` | Returns the info of the current profile (same format as a profile from sendAllCareerProfilesData). Nil if the career is not active. | 591 |
| `career_career.setAutosaveEnabled(enabled)` | Enables or disables autosave. | 724 |
| `career_career.setDebugMenuEnabled(enabled)` | Enables or disables the career's imgui debug menu. | 749 |

### Parameter details

#### `career_career.activateCareer(removeVehicles)`

Activates the career for the current profile (career_saveSystem.getCurrentProfile): no effect if already active or without a profile. Loads the level and the modules (see notes).

- `removeVehicles` (*boolean|nil*) : Remove all vehicles from the already loaded level; true by default.

#### `career_career.createOrLoadCareerAndStart(name, specificAutosave, startingOptions)`

Selects (or creates) a save profile with career_saveSystem.setProfile then activates the career with the given starting options.

- `name` (*string*) : Profile name.
- `specificAutosave` (*string|nil*) : Name of a specific autosave to load.
- `startingOptions` (*table|nil*) : Starting options (copied).
- **returns**: boolean false if the profile could not be selected.

#### `career_career.deactivateCareer(saveCareer)`

Deactivates the career: unloads the modules, unblocks the actions, resets the freeroam recovery values and hides the task list.

- `saveCareer` (*boolean|nil*) : Not used.

#### `career_career.deactivateCareerAndReloadLevel(saveCareer)`

Deactivates the career then restarts the current level in freeroam.

- `saveCareer` (*boolean|nil*) : Passed to deactivateCareer.

#### `career_career.getAdditionalMenuButtons()`

Buttons added to the pause menu: map (or "my load" during delivery), progress (if the starter vehicle is bought and outside the tutorial), certification cancellation, road test cancellation.

- **returns**: table[] Buttons {label, luaFun, showIndicator?}.

#### `career_career.getAutosavesForProfile(profile)`

For each save folder of the profile, returns the content of playerAttributes.json with id and autosaveName.

- `profile` (*string*) : Profile name.
- **returns**: table[] Attributes of each autosave.

#### `career_career.getBeamXPLevel(xp)`

Computes the BeamXP level: thresholds 0, 100, 300, 600, 1000. Returns -1 for the progress values if there is no next level.

- `xp` (*number*) : BeamXP value.
- **returns**: integer Level (1 to 5).
- **returns**: number Progress within the current level (-1 at the maximum).
- **returns**: number Threshold required for the next level (-1 at the maximum).

#### `career_career.getCurrentStartingModeData()`

Returns the full definition of the current game's starting mode (startingOptions.startMode), or nil.

- **returns**: table|nil Starting mode data.

#### `career_career.getSaveFoldersForProfile(profile)`

Returns the list of a profile's save folders with what the UI needs to choose (name, dates, version, corrupted, isCurrent, incompatibleVersion, outdatedVersion, money, beamXP, vehicleCount), sorted from newest to oldest.

- `profile` (*string|nil*) : Profile name; empty list if nil.
- **returns**: table[] Save folders.

#### `career_career.getStartingModeOptions()`

Lists the starting modes (*.lua files of lua/ge/extensions/career/startingModes/ run by dofile, except those with ignore) and returns for the UI: id, order, tier, title, description, image, tag, sorted by order then id.

- **returns**: table[] Starting modes.

#### `career_career.hasBoughtStarterVehicle()`

Indicates whether the player has bought their starter vehicle.

- **returns**: boolean|nil Result.

#### `career_career.hasInteractedWithOrganization(id)`

Indicates whether the player has already interacted with an organization.

- `id` (*string*) : Organization identifier.
- **returns**: boolean|nil true if already interacted.

#### `career_career.interactWithOrganization(id)`

Notes that the player has interacted with an organization (saved in general.json).

- `id` (*string*) : Organization identifier.

#### `career_career.isActive()`

Indicates whether the career is active.

- **returns**: boolean true if active.

#### `career_career.isAutosaveEnabled()`

Indicates whether autosave is allowed.

- **returns**: boolean State.

#### `career_career.onAnyMissionChanged(state, mission)`

Challenge state change hook: blocks the input actions when it stops ("stopped") and unblocks them when it starts ("started").

- `state` (*string*) : "started" or "stopped".
- `mission` (*table|nil*) : Challenge concerned.

#### `career_career.onBeforeSetProfile(currentSavePath)`

Hook called before changing profile: deactivates the career if it is active.

- `currentSavePath` (*string*) : Current save folder.

#### `career_career.onCameraModeChanged(modeName)`

Camera mode change hook: updates the nodegrabber blocking if the career is active.

- `modeName` (*string*) : Mode name.

#### `career_career.onCareerActive(active)`

onCareerActive hook received by this module itself (emitted by initAfterLevelLoad and deactivateCareer). On activation: applies the career or tutorial recovery values, clears the task list and raw POIs, installs M.onUpdate (debug menu), blocks the input actions and sets the game state to "career". Does nothing if active is false.

- `active` (*boolean*) : true on activation.

#### `career_career.onClientEndMission(levelPath)`

End-of-level hook: deactivates the career if the level is west_coast_usa.

- `levelPath` (*string*) : Path of the level that is ending.

#### `career_career.onDeserialized(v)`

Post-reload hook: reactivates the career (activateCareer(false)) if v.reactivate.

- `v` (*table*) : Data from onSerialize.

#### `career_career.onGlobalCameraSet(modeName)`

Global camera change hook: updates the nodegrabber blocking.

- `modeName` (*string*) : Mode name.

#### `career_career.onSaveCurrentProfile(currentSavePath)`

Profile save hook: writes career/general.json (level, startingOptions, boughtStarterVehicle, organizationInteraction, debug window states).

- `currentSavePath` (*string*) : Save folder.

#### `career_career.onSerialize()`

Extension reload hook: deactivates the career and notes reactivate = true if it was active.

- **returns**: table Data ({reactivate = true} if active).

#### `career_career.onVehicleAddedToInventory(data)`

Hook for adding a vehicle to the inventory: marks the starter vehicle as bought (immediate save) and unlocks the FIRST_SET_OF_KEYS achievement for an instant purchase at apmStarterVehicles.

- `data` (*table*) : Contains purchaseData and vehicleInfo.

#### `career_career.sendAllCareerProfilesData()`

Builds the info of each profile (money, beamXP, vouchers, insurance score, "apm" branches, current vehicle, vehicle count, versions) and sends it to the UI via guihooks "allCareerProfiles"; sorts by creationDate.

- **returns**: table[] Profile data.

#### `career_career.sendCurrentProfileData()`

Returns the info of the current profile (same format as a profile from sendAllCareerProfilesData). Nil if the career is not active.

- **returns**: table|nil Profile data.

#### `career_career.setAutosaveEnabled(enabled)`

Enables or disables autosave.

- `enabled` (*boolean*) : New state.

#### `career_career.setDebugMenuEnabled(enabled)`

Enables or disables the career's imgui debug menu.

- `enabled` (*boolean*) : New state.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | career_saveSystem, core_recoveryPrompt, gameplay_traffic. |
| `startingOptions` | table | Starting options of the game (e.g. startMode), coming from createOrLoadCareerAndStart or from the save. |
| `tutorialEnabled` | boolean | True during the career tutorial (see notes). |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onBeforeCareerActivate` — listened to by 1 module(s)
- `onCareerActive` — listened to by 27 module(s)

**UI events (guihooks.trigger):** `ClearTasklist`, `HideCareerTasklist`, `allCareerProfiles`

## Calls into the engine (C++)

- `FS:` `findFiles`
- `be:` `getObject`, `getObjectCount`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/career.lua`.*
