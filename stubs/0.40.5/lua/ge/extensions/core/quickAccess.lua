---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/quickAccess.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_quickAccess`: the game's radial menu (quick menu). It keeps a menu tree (paths like '/root/sandbox/other/'), assembles it on opening (static entries, generators, entries requested from the player vehicle), positions it on the 8 slots of the circle then sends it to the UI (guihooks 'radialMenuUpdated', UI route 'radial'). It slows down time while the menu is open, remembers recent actions and the dynamic slot configuration (settings/radialRecentActions.json and settings/radialDynamicSlotSettings.json). A mod adds its own buttons with core_quickAccess.addEntry, preferably in the onRegisterQuickAccessMenus hook.
--- Access: extension `core_quickAccess`: `extensions.load("core_quickAccess")`, then the global `core_quickAccess`
---@class core_quickAccess
---@field dependencies string[] { 'core_vehicleTriggers', 'core_funstuff' }, loaded before this extension.
core_quickAccess = {}

--- Adds (or replaces, if same uniqueID at the same level) an entry in the radial menu tree. See notes for all fields. Returns false only if `level` is not a string; a warning is logged if the entry has neither generator, nor title with onSelect/goto, but the entry is still added.
---Source: lua/ge/extensions/core/quickAccess.lua:619
---@param _args table { level, generator | (title, onSelect|goto, icon, desc, uniqueID, priority, startSlot, endSlot, ... ) }
---@return boolean  true if added, false if level is invalid.
function core_quickAccess.addEntry(_args) end

--- UI callback: asks the player vehicle to adjust the cruise control speed (vehicle-side extension).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/quickAccess.lua:2480
---@param direction number Positive = increase, negative = decrease; 0 or non-number ignored.
function core_quickAccess.adjustCruiseSpeed(direction) end

--- Goes back to the previous level (history), or to the parent level according to the path if the history is empty.
---Source: lua/ge/extensions/core/quickAccess.lua:2182
---@return boolean  true if the level changed, false otherwise (menu closed or already at the top).
function core_quickAccess.back() end

--- Marks the transition from the radial menu to a child screen (e.g. radial.mirrors) without a real close, and temporarily hides the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/quickAccess.lua:2219
function core_quickAccess.beginRouteHandoff() end

--- Clears the recent actions history and emits onQuickAccessClearRecentActions.
---Source: lua/ge/extensions/core/quickAccess.lua:2279
function core_quickAccess.clearRecentActions() end

--- Called by the UI for a button's context action (e.g. opening the configuration of a dynamic slot).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/quickAccess.lua:2499
---@param id integer Item index.
---@param buttonDown boolean Unused (inferred from code).
---@param actionIndex integer|nil Unused (inferred from code).
function core_quickAccess.contextAction(id, buttonDown, actionIndex) end

--- Ends the handoff and shows the menu again (time slowed down again).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/quickAccess.lua:2224
function core_quickAccess.endRouteHandoff() end

--- Cleans up the radial state when a child screen returns directly to the game, without navigating back to 'play'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/quickAccess.lua:2237
function core_quickAccess.finishRouteHandoffExit() end

--- Prepares for the UI the configuration data of the slot opened by openDynamicSlotConfigurator (menu tree and current setting). Crashes if no slot has been opened.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/quickAccess.lua:467
---@return table  Data for the UI.
function core_quickAccess.getDynamicSlotConfigurationData() end

--- Returns the recent actions (of the given category) still available in the menu, excluding those already assigned to a 'uniqueAction' slot, limited to `limit`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/quickAccess.lua:1897
---@param category string Category (e.g. 'all').
---@param limit integer|nil Max number; nil or 0 returns {}.
---@param dynamicItems table[]|nil dynamicSlot-type items of the current level.
---@return table[]  Records { uniqueID, level, title, timestamp, icon }.
function core_quickAccess.getMostRecentAvailableActions(category, limit, dynamicItems) end

--- Returns the time (system ms) of the last call to moved().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/quickAccess.lua:2537
---@return number  Milliseconds (0 if never).
function core_quickAccess.getMovedRadialLastTimeMs() end

--- Returns the data sent to the menu UI: canGoBack, items, categories, pathBeforeCategory, selectedCategory, backButtonIndex, currentLevel, breadcrumbs, menuIcon, hasLRShoulderButtons, tutorialHighlightTargets.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/quickAccess.lua:1765
---@return table|nil  uiData, nil before the first opening.
function core_quickAccess.getUiData() end

--- Builds a readable vehicle name: brand, name and configuration from core_vehicles.getModel; otherwise the JBeam name.
---Source: lua/ge/extensions/core/quickAccess.lua:2660
---@param veh userdata|nil Vehicle object; nil returns the translation key 'ui.radialmenu2.noVehicle'.
---@return string  Vehicle name.
function core_quickAccess.getVehicleName(veh) end

--- Goes to another menu level, pushing the current level onto the history (for back).
---Source: lua/ge/extensions/core/quickAccess.lua:2138
---@param level string Path of the target level.
function core_quickAccess.gotoLevel(level) end

--- Indicates whether the radial menu is currently displayed.
---Source: lua/ge/extensions/core/quickAccess.lua:275
---@return boolean  true if the radial UI is visible.
function core_quickAccess.isEnabled() end

--- Indicates whether a handoff to a child screen is in progress.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/quickAccess.lua:2230
---@return boolean  true if active.
function core_quickAccess.isRouteHandoffActive() end

--- Records the current time as the last movement of the radial cursor (called by the UI).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/quickAccess.lua:2541
function core_quickAccess.moved() end

--- Before the big map opens: closes the radial menu.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/quickAccess.lua:2656
function core_quickAccess.onBeforeBigMapActivated() end

--- At the end of a level: saves the recent actions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/quickAccess.lua:2632
function core_quickAccess.onClientEndMission() end

--- When the game closes: saves the recent actions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/quickAccess.lua:2628
function core_quickAccess.onExit() end

--- On load: emits onQuickAccessLoaded, reads the recent actions and the dynamic slot settings.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/quickAccess.lua:2618
function core_quickAccess.onExtensionLoaded() end

--- On unload: saves the recent actions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/quickAccess.lua:2624
function core_quickAccess.onExtensionUnloaded() end

--- Extension initialization hook: on the first call registers the default menus (then emits onRegisterQuickAccessMenus), then closes the menu.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/quickAccess.lua:2471
function core_quickAccess.onInit() end

--- Before a Lua reload: closes the menu and saves recent actions and dynamic slots.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/quickAccess.lua:2650
function core_quickAccess.onSerialize() end

--- When the UI route changes: if another route takes over while the menu is visible, closes it without navigating; also ends a handoff when the state becomes 'play'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/quickAccess.lua:2640
---@param toState string New UI state/route.
function core_quickAccess.onUiChangedState(toState) end

--- Called every GFX frame: handles the wait delay for the vehicle's entries (4 frames) and forces assembly if the vehicle does not respond.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/quickAccess.lua:2590
function core_quickAccess.onUpdate() end

--- When a vehicle spawns: saves the recent actions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/quickAccess.lua:2636
function core_quickAccess.onVehicleSpawned() end

--- When the player vehicle changes: reloads the menu if it is open.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/quickAccess.lua:2611
function core_quickAccess.onVehicleSwitched() end

--- Opens the configuration screen of a dynamic slot (guihooks 'OpenDynamicSlotConfigurator', hook onOpenDynamicSlotConfigurator).
---Source: lua/ge/extensions/core/quickAccess.lua:460
---@param dynamicSlotKey string Slot id (e.g. 'root_up').
function core_quickAccess.openDynamicSlotConfigurator(dynamicSlotKey) end

--- Deprecated: logs an error asking to use addEntry, does nothing else.
---Source: lua/ge/extensions/core/quickAccess.lua:2754
function core_quickAccess.registerMenu() end

--- Rebuilds and redisplays the current level (if the menu is open).
---Source: lua/ge/extensions/core/quickAccess.lua:2178
function core_quickAccess.reload() end

--- Restores the default configuration of the dynamic slots, saves it and emits onQuickAccessResetDynamicSlotSettings.
---Source: lua/ge/extensions/core/quickAccess.lua:347
function core_quickAccess.resetDynamicSlotSettings() end

--- Resets the slow-motion factor to its original value (0.01).
---Source: lua/ge/extensions/core/quickAccess.lua:26
function core_quickAccess.resetSlowMoFactor() end

--- Called by the UI when the player presses/releases a button: runs the action of the item with index id in the current menu.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/quickAccess.lua:2488
---@param id integer Index (1-based) of the item in currentMenuItems.
---@param buttonDown boolean true on press, false on release.
---@param actionIndex integer|nil 1 = primary, 2 = secondary, 3 = tertiary (default 1).
function core_quickAccess.selectItem(id, buttonDown, actionIndex) end

--- Saves the player's choice for a dynamic slot (modes uniqueAction, recentActions or empty), emits the hooks onQuickAccessSetUniqueAction / SetRecentActions / SetEmpty then onQuickAccessSetDynamicSlotConfiguration, saves and reloads the menu.
---Source: lua/ge/extensions/core/quickAccess.lua:534
---@param dynamicSlotKey string Slot id.
---@param data table { mode, uniqueID, level } or { mode, category }.
function core_quickAccess.setDynamicSlotConfiguration(dynamicSlotKey, data) end

--- Opens or closes the menu. Opening only happens if the UI state is 'play' or unknown, or if the menu is already visible, or if force. Emits the onQuickAccessOpened(level) hook. Closing is ignored during a route handoff.
---Source: lua/ge/extensions/core/quickAccess.lua:2511
---@param enabled boolean true to open, false to close.
---@param level string|nil Level to open (e.g. '/root/sandbox/other/'); nil = '/root/'.
---@param force boolean|nil Opens even if another screen is active.
function core_quickAccess.setEnabled(enabled, level, force) end

--- Sets the time factor (simTimeAuthority) applied while the radial menu is open. 0.01 by default.
---Source: lua/ge/extensions/core/quickAccess.lua:25
---@param factor number Simulation speed factor (1 = real time).
function core_quickAccess.setSlowMoFactor(factor) end

--- Sets the list of identifiers to highlight in the menu (tutorial). Non-string, empty or duplicate values are filtered out. Refreshes the UI if visible.
---Source: lua/ge/extensions/core/quickAccess.lua:1769
---@param targets string[] Target identifiers.
function core_quickAccess.setTutorialHighlightTargets(targets) end

--- Turns an identifier into a readable name: '_' becomes a space, a space before each capital stuck to a lowercase letter, first letter of each word capitalized, the rest lowercase.
---Source: lua/ge/extensions/core/quickAccess.lua:562
---@param str string Identifier, e.g. 'funStuff'.
---@return string  E.g. 'Fun Stuff'.
function core_quickAccess.toNiceName(str) end

--- Opens the menu if it is closed, closes it otherwise. Used by the 'toggleRadialMenuMulti' action.
---Source: lua/ge/extensions/core/quickAccess.lua:2528
---@param level string|nil Level to open.
function core_quickAccess.toggle(level) end

--- Runs an action tied to the menu keys among: toggleBigMap, toggleRadialMenuMulti, recoverVehicle, resetVehicle, activateStarterMotor. Ignored if core_input_actionFilter blocks it; an unknown action is logged as an error.
---Source: lua/ge/extensions/core/quickAccess.lua:2719
---@param action string Name of the action.
function core_quickAccess.tryAction(action) end

--- Callback from the vehicle after an item action has run: processes the returned command ({'hide'}, {'goto', ...}, etc.).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/quickAccess.lua:2605
---@param objID integer Vehicle id (unused).
---@param args table Command to run, same format as the return of onSelect.
function core_quickAccess.vehicleItemSelectCallback(objID, args) end

--- Callback from the player vehicle with its menu entries for a level: stores them and displays the menu.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/quickAccess.lua:2125
---@param objID integer Vehicle id.
---@param level string Requested level.
---@param vehicleMenuTree table Table level -> list of entries.
function core_quickAccess.vehicleItemsCallback(objID, level, vehicleMenuTree) end

