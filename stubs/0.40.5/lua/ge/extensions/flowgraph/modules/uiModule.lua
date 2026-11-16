---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/uiModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- UI module class (one instance per flowgraph manager, accessible via mgr.modules.ui). Keeps the current layout in self.uiLayout.
---@class flowgraph_modules_uiModule_C
local flowgraph_modules_uiModule_C = {}

--- Registers a callback function and returns the button's meta table (with mgrId and funId). Does not add it to the screen.
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:275
---@param fun function called on click
---@param meta table|nil button properties (label, focus, main, keepLayout...)
---@return table  completed meta
function flowgraph_modules_uiModule_C:addButton(fun, meta) end

--- Adds a "crashTestStepDetails" panel with the points of a crash test step.
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:484
---@param stepDetails table contains stepScoreData
function flowgraph_modules_uiModule_C:addCrashAnalysisStepDetails(stepDetails) end

--- Adds three text panels (performance statistics, tiers, drift events) on the drift page, with a total line.
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:506
---@param driftStats table perfStats, tiersStats, driftEvents
function flowgraph_modules_uiModule_C:addDriftStats(driftStats) end

--- Sets the screen header.
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:267
---@param header table header data
function flowgraph_modules_uiModule_C:addHeader(header) end

--- Adds a "Lap Times" panel (lapTimes page) with each lap, its time and the gap to the best ("Best" for the best one).
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:614
---@param state table contains historicTimes = list of {lapTime}
---@param attempt any not used in the code
function flowgraph_modules_uiModule_C:addLaptimesForVehicle(state, attempt) end

--- Adds the "objectives" element (the mission's stars) computed from the user settings and, if change is provided, the unlocked stars and rewards. No effect if there is no activity or if no star is visible.
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:301
---@param change table|nil progression result (unlockedStarsAttempt, starRewards...)
---@param pages table|nil target pages, {main = true} by default
function flowgraph_modules_uiModule_C:addObjectives(change, pages) end

--- Adds the ranking elements ("ratings" on the leaderboards page), then "rewards" (career, if there are rewards) and "unlocks" (unlocked missions/leagues) when change is provided.
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:397
---@param change table|nil attempt progression change
function flowgraph_modules_uiModule_C:addRatings(change) end

--- Adds the "Replay Recording" panel (the mission's replay files) if the activity supports replay and the menu is not simple.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:204
function flowgraph_modules_uiModule_C:addReplayPanelAndSupportsReplay() end

--- Like addButton, but adds the button to the screen's button list. Those added before finishUIBuilding appear above the Start button.
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:291
---@param fun function called on click
---@param meta table|nil button properties
---@return table  button meta
function flowgraph_modules_uiModule_C:addScreenButton(fun, meta) end

--- Adds an element (table with type, header, pages...) to the current layout.
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:259
---@param element table interface element; element.pages = {pageName = true}
function flowgraph_modules_uiModule_C:addUIElement(element) end

--- Turns a list of items into a table of HTML <ul><li>...</li></ul> fragments (to be concatenated).
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:235
---@param items string[] bullet texts
---@return string[]  HTML fragments
function flowgraph_modules_uiModule_C:buildListText(items) end

--- Resets the state: fade, build in progress, layout and app context.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:18
function flowgraph_modules_uiModule_C:clear() end

--- Clears the table of button callback functions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:40
function flowgraph_modules_uiModule_C:clearButtonFunctions() end

--- Called when the graph starts: saves the state of the recovery prompt and the game state, disables the prompt, loads ui_apps_genericMissionData and ui_apps_pointsBar, clears the tasklist if an activity exists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:669
function flowgraph_modules_uiModule_C:executionStarted() end

--- Called when the graph stops: cleans up the data apps, resets the topCenter context, restores the recovery prompt and (unless keepGameState) the initial game state, clears the tasklist.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:684
function flowgraph_modules_uiModule_C:executionStopped() end

--- Finishes the build. In startScreen adds the Start button (which calls the node's startFromUi); in startScreen/endScreen adds the replay panel, prepares the pages, navigates to 'mission.control' and triggers the guihook onRequestMissionScreenDataReady.
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:166
function flowgraph_modules_uiModule_C:finishUIBuilding() end

--- Increments and returns a unique identifier, used for the buildId.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:9
---@return integer  new identifier
function flowgraph_modules_uiModule_C:getFreeId() end

--- Called when the module is created; calls clear().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:14
function flowgraph_modules_uiModule_C:init() end

--- Indicates whether to keep the game state when the graph stops (otherwise it is restored to the state at the start).
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:36
---@param keep boolean true to keep the current game state
function flowgraph_modules_uiModule_C:keepGameState(keep) end

--- Inserts an empty page into the layout (intended for startPage).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:664
function flowgraph_modules_uiModule_C:nextPage() end

--- Hook: adds the active screen's mode to the provided list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:229
---@param screensActive string[] list to complete
function flowgraph_modules_uiModule_C:onGetIsMissionStartOrEndScreenActive(screensActive) end

--- Hook called when a screen button is clicked. Ignores buttons from another manager (mgrId), runs the registered function, then clears the layout unless button.keepLayout.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:246
---@param button table button meta (mgrId, funId, keepLayout)
function flowgraph_modules_uiModule_C:onMissionScreenButtonClicked(button) end

--- Hook called when the UI requests the mission screen data. Returns the layout (guihook onRequestMissionScreenDataReady), emits the onMissionScreenReady hook and calls activity:onMissionScreenReady(mode). Ignored if the mode contains "test".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:219
---@param mode string requested screen mode
function flowgraph_modules_uiModule_C:onRequestMissionScreenData(mode) end

--- Changes the context of the 'topCenter' app container if the context is not empty and ui_appContainers_topCenter exists, and stores it.
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:29
---@param context string context name
function flowgraph_modules_uiModule_C:setAppContainerContext(context) end

--- Relay to core_gamestate.setGameState with the same arguments.
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:25
---@param ... any arguments of core_gamestate.setGameState
function flowgraph_modules_uiModule_C:setGameState(...) end

--- Replaces a page's icon during the build.
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:56
---@param pageName string page name
---@param icon string icon name
function flowgraph_modules_uiModule_C:setPageIcon(pageName, icon) end

--- Sets the Start button label (translation key or text).
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:393
---@param text string label
function flowgraph_modules_uiModule_C:setStartButtonText(text) end

--- Marks the start screen as simple (no replay panel).
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:200
function flowgraph_modules_uiModule_C:setStartScreenAsSimple() end

--- Computes the table of pages (order, icon, label, mandatory) from the layout elements and puts it in uiLayout.pages. Adds a text panel "No layout elements found" if the layout is empty. 'mandatory' pages are mandatory only in endScreen; 'rewards' is hidden outside career.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:61
function flowgraph_modules_uiModule_C:setupPages() end

--- Starts building a screen: creates self.uiLayout (mode, header, layout, buttons, originating node, buildId). Refuses if a build is already in progress.
---Source: lua/ge/extensions/flowgraph/modules/uiModule.lua:44
---@param uiMode string 'startScreen' or 'endScreen'
---@param node table calling flowgraph node (uses node.id and node.graph.id)
function flowgraph_modules_uiModule_C:startUIBuilding(uiMode, node) end

