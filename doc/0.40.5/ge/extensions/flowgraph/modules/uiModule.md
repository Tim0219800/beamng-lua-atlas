# `flowgraph_modules_uiModule`

*File: `lua/ge/extensions/flowgraph/modules/uiModule.lua` · VM: Game Engine (GE) · 711 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/modules/uiModule")` (file under extensions/ but not a regular extension)

Flowgraph module (moduleOrder 1000) that builds the mission start and end screens ("mission.control"). Flowgraph nodes call startUIBuilding, add elements (addUIElement, addObjectives, addRatings, addDriftStats...) and buttons, then finishUIBuilding sends the layout to the interface via guihooks. It also manages the context of the apps at the top of the screen, the game state and the recovery prompt while the graph runs. Depends on ui_appContainers_topCenter.

## Example

```lua
local ui = mgr.modules.ui
ui:startUIBuilding('startScreen', node)
ui:addHeader({label = 'Ma mission'})
ui:addObjectives(nil, {main = true})
ui:finishUIBuilding()
```

## Notes

- Hooks listened to (C.hooks): onRequestMissionScreenData, onMissionScreenButtonClicked, onGetIsMissionStartOrEndScreenActive.
- The add* functions refuse to act (log E) if called outside startUIBuilding and finishUIBuilding.
- Screen modes handled by finishUIBuilding: 'startScreen' (adds the Start button) and 'endScreen'. Any other mode does not navigate to mission.control.
- Possible bug: in setupPages, `pageConfig[pageName].hideInCareer` crashes if an element declares a page absent from pageConfig (known pages: timeslip, main, rewards, unlocks, leaderboards, aiCompetitors, drift, lapTimes, rules, recording, crashAnalysisStep).
- Possible bug: nextPage uses self.pageCounter, which is never initialized in this file (arithmetic error on nil if called).
- Possible bug: formatMission (local) sets `order = i` with `i` undefined (so nil).
- In addRatings, when dnq is true, the value newBestKeysByKey['highscore'] is forced to 6 ("hack" noted in the code).
- Lap times (addLaptimesForVehicle) are displayed in the m:ss:mmm format.

**Dependencies (loaded first):** `ui_appContainers_topCenter`

## Class `C`

UI module class (one instance per flowgraph manager, accessible via mgr.modules.ui). Keeps the current layout in self.uiLayout.

| Method | Description | Line |
|---|---|---|
| `C:addButton(fun, meta)` | Registers a callback function and returns the button's meta table (with mgrId and funId). Does not add it to the screen. | 275 |
| `C:addCrashAnalysisStepDetails(stepDetails)` | Adds a "crashTestStepDetails" panel with the points of a crash test step. | 484 |
| `C:addDriftStats(driftStats)` | Adds three text panels (performance statistics, tiers, drift events) on the drift page, with a total line. | 506 |
| `C:addHeader(header)` | Sets the screen header. | 267 |
| `C:addLaptimesForVehicle(state, attempt)` | Adds a "Lap Times" panel (lapTimes page) with each lap, its time and the gap to the best ("Best" for the best one). | 614 |
| `C:addObjectives(change, pages)` | Adds the "objectives" element (the mission's stars) computed from the user settings and, if change is provided, the unlocked stars and rewards. No effect if there is no activity or if no star is visible. | 301 |
| `C:addRatings(change)` | Adds the ranking elements ("ratings" on the leaderboards page), then "rewards" (career, if there are rewards) and "unlocks" (unlocked missions/leagues) when change is provided. | 397 |
| `C:addReplayPanelAndSupportsReplay()` | Adds the "Replay Recording" panel (the mission's replay files) if the activity supports replay and the menu is not simple. | 204 |
| `C:addScreenButton(fun, meta)` | Like addButton, but adds the button to the screen's button list. Those added before finishUIBuilding appear above the Start button. | 291 |
| `C:addUIElement(element)` | Adds an element (table with type, header, pages...) to the current layout. | 259 |
| `C:buildListText(items)` | Turns a list of items into a table of HTML <ul><li>...</li></ul> fragments (to be concatenated). | 235 |
| `C:clear()` | Resets the state: fade, build in progress, layout and app context. | 18 |
| `C:clearButtonFunctions()` | Clears the table of button callback functions. | 40 |
| `C:executionStarted()` | Called when the graph starts: saves the state of the recovery prompt and the game state, disables the prompt, loads ui_apps_genericMissionData and ui_apps_pointsBar, clears the tasklist if an activity exists. | 669 |
| `C:executionStopped()` | Called when the graph stops: cleans up the data apps, resets the topCenter context, restores the recovery prompt and (unless keepGameState) the initial game state, clears the tasklist. | 684 |
| `C:finishUIBuilding()` | Finishes the build. In startScreen adds the Start button (which calls the node's startFromUi); in startScreen/endScreen adds the replay panel, prepares the pages, navigates to 'mission.control' and triggers the guihook onRequestMissionScreenDataReady. | 166 |
| `C:getFreeId()` | Increments and returns a unique identifier, used for the buildId. | 9 |
| `C:init()` | Called when the module is created; calls clear(). | 14 |
| `C:keepGameState(keep)` | Indicates whether to keep the game state when the graph stops (otherwise it is restored to the state at the start). | 36 |
| `C:nextPage()` | Inserts an empty page into the layout (intended for startPage). | 664 |
| `C:onGetIsMissionStartOrEndScreenActive(screensActive)` | Hook: adds the active screen's mode to the provided list. | 229 |
| `C:onMissionScreenButtonClicked(button)` | Hook called when a screen button is clicked. Ignores buttons from another manager (mgrId), runs the registered function, then clears the layout unless button.keepLayout. | 246 |
| `C:onRequestMissionScreenData(mode)` | Hook called when the UI requests the mission screen data. Returns the layout (guihook onRequestMissionScreenDataReady), emits the onMissionScreenReady hook and calls activity:onMissionScreenReady(mode). Ignored if the mode contains "test". | 219 |
| `C:setAppContainerContext(context)` | Changes the context of the 'topCenter' app container if the context is not empty and ui_appContainers_topCenter exists, and stores it. | 29 |
| `C:setGameState(...)` | Relay to core_gamestate.setGameState with the same arguments. | 25 |
| `C:setPageIcon(pageName, icon)` | Replaces a page's icon during the build. | 56 |
| `C:setStartButtonText(text)` | Sets the Start button label (translation key or text). | 393 |
| `C:setStartScreenAsSimple()` | Marks the start screen as simple (no replay panel). | 200 |
| `C:setupPages()` | Computes the table of pages (order, icon, label, mandatory) from the layout elements and puts it in uiLayout.pages. Adds a text panel "No layout elements found" if the layout is empty. 'mandatory' pages are mandatory only in endScreen; 'rewards' is hidden outside career. | 61 |
| `C:startUIBuilding(uiMode, node)` | Starts building a screen: creates self.uiLayout (mode, header, layout, buttons, originating node, buildId). Refuses if a build is already in progress. | 44 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onMissionScreenReady` — listened to by 1 module(s)

**UI events (guihooks.trigger):** `ClearTasklist`, `onRequestMissionScreenDataReady`

**Loads extensions:** `ui_apps_genericMissionData`, `ui_apps_pointsBar`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/modules/uiModule.lua`.*
