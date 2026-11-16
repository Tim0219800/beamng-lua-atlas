# `career_modules_tutorialPopups`

*File: `lua/ge/extensions/career/modules/tutorialPopups.lua` · VM: Game Engine (GE) · 304 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_tutorialPopups`: `extensions.load("career_modules_tutorialPopups")`, then the global `career_modules_tutorialPopups`

Manages the career's introduction popups (tutorial and contextual help): remembers which ones have already been seen (flags saved in <profile>/career/tutorialData.json), opens them via ui_popup from /gameplay/tutorials/pages/, and queues those that would arrive during a tutorial "damaged vehicle" popup. Also exposes named functions (showWelcomeSplashscreen, onCareerTuningStarted, onEnterCargoOverviewScreen...) that serve as hooks or direct calls to display the associated popup only once.

## Example

```lua
career_modules_tutorialPopups.introPopup("tuning")        -- only once
career_modules_tutorialPopups.introPopup("tuning", true)  -- forced
```

## Notes

- Functions are dynamically generated from the internal introPopupTable table: showWelcomeSplashscreen (welcome), showBeforeDrivingSplashscreen (driving), showCrashRecoverSplashScreen (crashRecover), onRefuelingStartTransaction (refueling), onAvailableMissionsSentToUi (missions), showPostMissionSplash (postMission), onCareerTuningStarted (tuning), garageModeStartStep (garage), showLogbookSplash (logbook), showTutorialOverSplash (finishing, logbook, leagues, performanceIndex), onEnterCargoOverviewScreen (delivery/cargoScreen), onComputerInsurance (insurance), onVehiclePaintingUiOpened (vehiclePainting). Other entries (addWalkingModeLogbookEntry, addCamerasLogbookEntry, showTraversalSplashScreen, showBasicTutorialComplete, onVehicleBought) exist but open no popup (empty list). These functions do not appear in the automatic page list.
- introPopup marks the flag as seen before opening, then calls ui_popup.openPopupById with root /gameplay/tutorials/pages/.
- If the tutorial is active, a crash occurred and the damage popup (v2/damagedVehicle, v2/damagedVehicleTimeTrial, v2/damagedVehicleCareer) is not yet closed, the requested popup is queued and reopened when the next one closes.
- The allTutorialFlags field is defined at the end of the file; showAllSplashscreensAndLogbookEntries resets all these flags to false before redisplaying everything.

**Dependencies (loaded first):** `ui_popup`, `gameplay_tutorial_damageTracker`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_tutorialPopups.drawDebugFunctions()` | Draws the "Intro Popups" debug imgui menu: review all, mark all unseen, per-popup checkboxes, content edit button. *(internal)* | 236 |
| `career_modules_tutorialPopups.getTutorialFlag(key)` | Reads a popup's flag (true if seen). | 24 |
| `career_modules_tutorialPopups.introPopup(id, force)` | Opens an intro popup. Without force, does nothing if it has already been seen. May be queued after a tutorial damage popup. | 83 |
| `career_modules_tutorialPopups.introPopupSequence(ids, force)` | Opens several popups in sequence (ui_popup.openPopupsByIds) and marks all ids as seen. | 105 |
| `career_modules_tutorialPopups.onExtensionLoaded()` | Load hook: reads the flags from tutorialData.json of the current profile. *(internal)* *(hook)* | 41 |
| `career_modules_tutorialPopups.onIntroPopupCareerClosed(id)` | Hook emitted when a popup closes: if it is a damage popup, marks the closing, then reopens the first queued popup. *(internal)* *(hook)* | 71 |
| `career_modules_tutorialPopups.onSaveCurrentProfile(currentSavePath)` | Profile save hook: writes the flags to tutorialData.json. *(internal)* *(hook)* | 47 |
| `career_modules_tutorialPopups.setFlagsTable(flagsTable)` | Replaces the whole "popup seen" flags table. | 20 |
| `career_modules_tutorialPopups.setTutorialFlag(key, value)` | Updates a popup's flag. | 28 |
| `career_modules_tutorialPopups.showAllSplashscreensAndLogbookEntries()` | Resets all flags to false then redisplays all the welcome popups and all the popups of the internal table (useful to review the help). | 186 |
| `career_modules_tutorialPopups.showNonTutorialWelcomeSplashscreen()` | Displays (forced) the welcome popups without tutorial: welcomeNoTutorial, leagues, performanceIndex, logbook. | 171 |
| `career_modules_tutorialPopups.wasIntroPopupsSeen(pages)` | Indicates whether all the listed popups have already been seen. | 32 |

### Parameter details

#### `career_modules_tutorialPopups.getTutorialFlag(key)`

Reads a popup's flag (true if seen).

- `key` (*string*) : Popup id.
- **returns**: boolean|nil Flag value.

#### `career_modules_tutorialPopups.introPopup(id, force)`

Opens an intro popup. Without force, does nothing if it has already been seen. May be queued after a tutorial damage popup.

- `id` (*string*) : Page id (e.g. "v2/basicControls").
- `force` (*boolean|nil*) : If true, ignores the "already seen" flag.

#### `career_modules_tutorialPopups.introPopupSequence(ids, force)`

Opens several popups in sequence (ui_popup.openPopupsByIds) and marks all ids as seen.

- `ids` (*string[]*) : Page ids.
- `force` (*boolean|nil*) : If false or nil, only marks the pages not yet seen; the sequence is opened in all cases.

#### `career_modules_tutorialPopups.onIntroPopupCareerClosed(id)`

Hook emitted when a popup closes: if it is a damage popup, marks the closing, then reopens the first queued popup.

- `id` (*string*) : Id of the closed popup.

#### `career_modules_tutorialPopups.onSaveCurrentProfile(currentSavePath)`

Profile save hook: writes the flags to tutorialData.json.

- `currentSavePath` (*string*) : Profile save folder.

#### `career_modules_tutorialPopups.setFlagsTable(flagsTable)`

Replaces the whole "popup seen" flags table.

- `flagsTable` (*table<string, boolean>|nil*) : New table; nil gives an empty table.

#### `career_modules_tutorialPopups.setTutorialFlag(key, value)`

Updates a popup's flag.

- `key` (*string*) : Popup id.
- `value` (*boolean*) : Seen or not.

#### `career_modules_tutorialPopups.wasIntroPopupsSeen(pages)`

Indicates whether all the listed popups have already been seen.

- `pages` (*string[]|nil*) : Popup ids.
- **returns**: boolean true if all have their flag (also true for an empty list).

## Fields

| Field | Type | Description |
|---|---|---|
| `allTutorialFlags` | string[] | List of known popup ids (welcome, driving, crashRecover, bigmap, refueling, missions, tuning, insurance, leagues, etc.). |
| `dependencies` | string[] | {'ui_popup', 'gameplay_tutorial_damageTracker'}. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/tutorialPopups.lua`.*
